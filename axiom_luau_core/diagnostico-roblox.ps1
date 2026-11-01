$ErrorActionPreference = 'Stop'

# Leitura apenas: nao altera permissoes nem escreve na memoria do processo.
if (-not ('AxiomRbxReadOnlyProbeV2' -as [type])) {
    Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class AxiomRbxReadOnlyProbeV2
{
    private const uint QueryLimitedInformation = 0x1000;
    private const uint VmRead = 0x0010;

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern IntPtr OpenProcess(uint access, bool inherit, uint processId);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static extern bool ReadProcessMemory(IntPtr process, IntPtr address,
        [Out] byte[] buffer, UIntPtr length, out UIntPtr bytesRead);

    [DllImport("kernel32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static extern bool CloseHandle(IntPtr handle);

    private static bool Read(IntPtr process, long address, byte[] buffer, out int error)
    {
        UIntPtr count;
        bool ok = ReadProcessMemory(process, new IntPtr(address), buffer,
            new UIntPtr((uint)buffer.Length), out count);
        error = ok ? 0 : Marshal.GetLastWin32Error();
        return ok && count.ToUInt64() == (ulong)buffer.Length;
    }

    public static string InspectHeader(int processId, long imageBase)
    {
        IntPtr h = OpenProcess(QueryLimitedInformation | VmRead, false, (uint)processId);
        if (h == IntPtr.Zero)
            return "OpenProcess falhou; codigo " + Marshal.GetLastWin32Error();
        try {
            if (imageBase == 0)
                return "OpenProcess OK; endereco base indisponivel.";
            int error;
            byte[] dos = new byte[64];
            if (!Read(h, imageBase, dos, out error))
                return "OpenProcess OK; leitura do cabecalho falhou; codigo " + error;
            if (dos[0] != 'M' || dos[1] != 'Z')
                return "OpenProcess OK; cabecalho MZ nao encontrado.";
            uint peOffset = BitConverter.ToUInt32(dos, 0x3c);
            if (peOffset < 0x40 || peOffset > 0x1000000)
                return "OpenProcess OK; local do cabecalho PE invalido.";
            byte[] pe = new byte[84];
            if (!Read(h, imageBase + peOffset, pe, out error))
                return "OpenProcess OK; leitura do PE falhou; codigo " + error;
            if (pe[0] != 'P' || pe[1] != 'E' || pe[2] != 0 || pe[3] != 0)
                return "OpenProcess OK; assinatura PE nao encontrada.";
            ushort machine = BitConverter.ToUInt16(pe, 4);
            ushort optionalMagic = BitConverter.ToUInt16(pe, 24);
            if (machine != 0x8664 || optionalMagic != 0x20b)
                return "OpenProcess OK; imagem nao e PE x64.";
            uint timestamp = BitConverter.ToUInt32(pe, 8);
            uint imageSize = BitConverter.ToUInt32(pe, 80);
            return "OpenProcess OK; PE x64 OK; timestamp=0x" + timestamp.ToString("x8") +
                   "; tamanho_imagem=0x" + imageSize.ToString("x8");
        }
        finally { CloseHandle(h); }
    }

    public static string Compare(int processId, long imageBase, long rva, string diskHex)
    {
        IntPtr h = OpenProcess(QueryLimitedInformation | VmRead, false, (uint)processId);
        if (h == IntPtr.Zero)
            return "OpenProcess falhou; codigo " + Marshal.GetLastWin32Error();
        try {
            byte[] data = new byte[diskHex.Length / 2];
            int error;
            if (!Read(h, imageBase + rva, data, out error))
                return "ReadProcessMemory falhou; codigo " + error;
            string actual = BitConverter.ToString(data).Replace("-", "").ToLowerInvariant();
            return actual == diskHex ? "igual ao arquivo" : "diferente do arquivo";
        }
        finally { CloseHandle(h); }
    }
}
'@
}

$expectedHash = 'a5a13a9e4f578fce0675e0dfc3edcdaad639dcb3e306badeb9df597010ca6229'
$clients = @(Get-Process -Name RobloxPlayerBeta -ErrorAction SilentlyContinue)
Write-Host 'AXIOM - diagnostico Roblox v2 (somente leitura)'
if ($clients.Count -eq 0) {
    Write-Host 'STATUS: RobloxPlayerBeta nao encontrado. Abra um jogo Roblox e rode novamente.'
    exit 1
}

if (Get-Command Get-AppxPackage -ErrorAction SilentlyContinue) {
    try {
        $packages = @(Get-AppxPackage -Name 'ROBLOXCorporation.RobloxGDK' -ErrorAction Stop)
        foreach ($package in $packages) {
            Write-Host ('PACOTE STORE: ' + $package.Name + ' | versao ' + $package.Version)
        }
    } catch {
        Write-Host 'PACOTE STORE: nao foi possivel consultar.'
    }
}

foreach ($client in $clients) {
    Write-Host ("`nPID: " + $client.Id)
    $path = $null
    $imageBase = [long]0
    $hash = $null
    try {
        $path = $client.MainModule.FileName
        $imageBase = $client.MainModule.BaseAddress.ToInt64()
    } catch {
        Write-Host 'MODULO: caminho ou endereco base indisponivel.'
    }

    if ($path -and $path -match '(?i)\\WindowsApps\\') {
        Write-Host 'TIPO: aplicativo da Microsoft Store (RobloxGDK).'
    } elseif ($path) {
        Write-Host 'TIPO: aplicativo desktop fora de WindowsApps.'
    } else {
        Write-Host 'TIPO: nao identificado.'
    }

    if ($path) {
        try {
            $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256 -ErrorAction Stop).Hash.ToLowerInvariant()
            Write-Host ('SHA256: ' + $hash)
        } catch {
            Write-Host 'SHA256: nao foi possivel ler o executavel; verificacao de memoria continuara.'
        }
    } else {
        Write-Host 'SHA256: caminho do executavel indisponivel.'
    }

    $result = [AxiomRbxReadOnlyProbeV2]::InspectHeader($client.Id, $imageBase)
    Write-Host ('MEMORIA: ' + $result)

    if (-not $hash) {
        Write-Host 'OFFSETS: nao consultados porque o executavel nao foi verificado por SHA256.'
        continue
    }
    if ($hash -ne $expectedHash) {
        Write-Host 'OFFSETS: nao consultados; executavel diferente do cliente desktop analisado.'
        continue
    }
    if ($imageBase -eq 0) {
        Write-Host 'OFFSETS: nao consultados; endereco base indisponivel.'
        continue
    }

    $checks = @(
        @{ Name = 'Candidato_GetGlobalState'; Rva = 0x41d0080; Bytes = '257c3c0fb98b3934fc95b39d6e2f24a3' },
        @{ Name = 'Candidato_Carregamento'; Rva = 0x265b4d0; Bytes = 'b1416a9b2da193bbcc81689e9b9204ee' },
        @{ Name = 'Candidato_Retomada'; Rva = 0x5996a10; Bytes = '0fb1e590d4fe27184aea6649f35e97b1' },
        @{ Name = 'TabelaOpcodes_16bytes'; Rva = 0x71cfba0; Bytes = '8d19e81013da075b3b112bf61753095d' }
    )
    foreach ($check in $checks) {
        $result = [AxiomRbxReadOnlyProbeV2]::Compare($client.Id, $imageBase, $check.Rva, $check.Bytes)
        Write-Host ($check.Name + ': ' + $result)
    }
    Write-Host 'NOTA: cada comparacao usa 16 bytes; ela nao confirma a identidade das funcoes nem a execucao no Roblox.'
}
