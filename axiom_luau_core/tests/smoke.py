import pathlib
import os
import subprocess
import struct
import sys
import tempfile
import time

binary = pathlib.Path(sys.argv[1]).resolve()

def call(*args, timeout=4):
    return subprocess.run([str(binary), *map(str, args)], capture_output=True, text=True, timeout=timeout)

with tempfile.TemporaryDirectory() as directory:
    root = pathlib.Path(directory)
    good = root / 'good.luau'
    good.write_text('local x: number = 21\nprint("resultado", x * 2)\n', encoding='utf-8')
    result = call('run', good)
    assert result.returncode == 0 and 'resultado\t42' in result.stdout, result

    result = call('check', good)
    assert result.returncode == 0, result.stderr

    # The editor sends the unsaved buffer through stdin; no temporary script is created.
    def from_stdin(command, source):
        return subprocess.run([str(binary), command, '-'], input=source, capture_output=True, timeout=4)

    result = from_stdin('run', b'-- \x1a\r\nprint("from-stdin")\r\n')
    assert result.returncode == 0 and b'from-stdin' in result.stdout, result
    result = from_stdin('check', b'local x: number = 1')
    assert result.returncode == 0, result
    result = from_stdin('check', b'local x = (')
    assert result.returncode != 0 and b'sintaxe' in result.stderr.lower(), result
    result = from_stdin('check', b'a' * (4 * 1024 * 1024 + 1))
    assert result.returncode != 0 and b'4 MiB' in result.stderr, result

    broken = root / 'broken.luau'
    broken.write_text('local x = (', encoding='utf-8')
    result = call('check', broken)
    assert result.returncode != 0 and 'sintaxe' in result.stderr.lower(), result

    failure = root / 'failure.luau'
    failure.write_text('error("erro de teste")', encoding='utf-8')
    result = call('run', failure)
    assert result.returncode != 0 and 'erro de teste' in result.stderr, result

    loop = root / 'loop.luau'
    loop.write_text('while true do end', encoding='utf-8')
    started = time.monotonic()
    result = call('run', loop, '--timeout-ms', '30')
    assert result.returncode != 0 and 'limite' in result.stderr.lower(), result
    assert time.monotonic() - started < 2

    memory = root / 'memory.luau'
    memory.write_text('local a = string.rep("x", 100000000)\nprint(#a)', encoding='utf-8')
    result = call('run', memory)
    assert result.returncode != 0, result

    ordinary, experimental = root / 'ordinary.luac', root / 'experimental.luac'
    result = call('compile', good, '--output', ordinary)
    assert result.returncode == 0 and ordinary.read_bytes()[0] != 0, result
    result = call('compile', good, '--output', experimental, '--experimental-opcodes')
    assert result.returncode == 0 and 'experimental' in result.stderr.lower(), result
    assert experimental.read_bytes() != ordinary.read_bytes()

    original = good.read_bytes()
    result = call('compile', good, '--output', good)
    assert result.returncode != 0 and good.read_bytes() == original, result

    wrong_client = root / 'wrong.exe'
    wrong_client.write_bytes(b'MZ')
    result = call('compile', good, '--output', ordinary, '--roblox-client', wrong_client)
    assert result.returncode != 0, result

    # A correctly sized, structurally plausible PE with the wrong table must
    # still be rejected. The sparse file does not contain a Roblox binary.
    mock_client = root / 'mock.exe'
    with mock_client.open('wb') as mock:
        mock.truncate(142680528)
        mock.seek(0)
        mock.write(b'MZ')
        mock.seek(0x3c)
        mock.write(struct.pack('<I', 0x80))
        mock.seek(0x80)
        mock.write(b'PE\0\0')
        mock.write(struct.pack('<HHIIIHH', 0x8664, 1, 0x884cd255, 0, 0, 0xf0, 0))
        mock.seek(0x80 + 24)
        optional = bytearray(0xf0)
        struct.pack_into('<H', optional, 0, 0x20b)
        struct.pack_into('<I', optional, 56, 0x0922a000)
        mock.write(optional)
        section = bytearray(40)
        struct.pack_into('<IIII', section, 8, 256, 0x071cfba0, 256, 0x1000)
        mock.write(section)
        mock.seek(0x1000)
        mock.write(bytes(range(256)))
    result = call('compile', good, '--output', ordinary, '--roblox-client', mock_client)
    assert result.returncode != 0 and 'opcodes desconhecida' in result.stderr, result

    client = os.environ.get('AXIOM_TEST_ROBLOX_CLIENT')
    if client:
        output = root / 'roblox.luac'
        result = call('compile', good, '--output', output, '--roblox-client', client)
        assert result.returncode == 0 and 'nao foi validada' in result.stderr, result
        assert output.read_bytes() != ordinary.read_bytes()
        assert output.read_bytes() != experimental.read_bytes()
        result = call('compile', good, '--output', good, '--roblox-client', client)
        assert result.returncode != 0 and good.read_bytes() == original, result

    result = call('run', good, '--timeout-ms', '0')
    assert result.returncode != 0, result

print('OK: execucao local, sintaxe, erro, prazo, memoria e compilacao')
