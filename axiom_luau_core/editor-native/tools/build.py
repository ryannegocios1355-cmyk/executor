#!/usr/bin/env python3
"""Cross-build a small freestanding Win64 executable with GCC + GNU binutils.

Uses Windows system DLLs at runtime. No stub DLL is shipped. The PE relocations
are checked against the original ELF relocations instead of trusting objcopy's
ELF-to-COFF conversion of PC-relative references.
"""
import pathlib
import re
import struct
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
BUILD = ROOT / 'build'
BUILD.mkdir(exist_ok=True)

DLLS = {
 'KERNEL32': ['GetProcessHeap','HeapAlloc','HeapFree','GetModuleHandleW','GetModuleFileNameW','LoadLibraryW','FreeLibrary','GetProcAddress','ExitProcess','CreateThread','CloseHandle','GetCurrentProcessId','GetTempPathW','WaitForSingleObject','GetExitCodeProcess','CreatePipe','SetHandleInformation','CreateProcessW','TerminateProcess','WideCharToMultiByte','MultiByteToWideChar','CreateFileW','GetFileSize','ReadFile','WriteFile','FlushFileBuffers','DeleteFileW','MoveFileExW','CreateToolhelp32Snapshot','Process32FirstW','Process32NextW','Module32FirstW','OpenProcess','QueryFullProcessImageNameW','ReadProcessMemory','GetEnvironmentVariableW','GetFileAttributesW','SetFileAttributesW','GetLastError','CreateDirectoryW','RemoveDirectoryW','FindFirstFileW','FindNextFileW','FindClose','CopyFileW','MoveFileW'],
 'ADVAPI32': ['CryptAcquireContextW','CryptCreateHash','CryptHashData','CryptGetHashParam','CryptDestroyHash','CryptReleaseContext'],
 'USER32': ['RegisterClassW','CreateWindowExW','DefWindowProcW','ShowWindow','UpdateWindow','GetMessageW','TranslateMessage','DispatchMessageW','PostQuitMessage','PostMessageW','DestroyWindow','GetClientRect','MoveWindow','SendMessageW','SetWindowTextW','GetWindowTextW','GetWindowTextLengthW','EnableWindow','LoadCursorW','MessageBoxW','FillRect','DrawTextW','SetTimer','KillTimer'],
 'GDI32': ['GetStockObject','CreateFontW','CreateSolidBrush','DeleteObject','SelectObject','SetTextColor','SetBkColor','SetBkMode'],
 'COMDLG32': ['GetOpenFileNameW','GetSaveFileNameW'],
 'WINHTTP': ['WinHttpOpen','WinHttpConnect','WinHttpOpenRequest','WinHttpSetTimeouts','WinHttpSetOption','WinHttpSendRequest','WinHttpReceiveResponse','WinHttpQueryHeaders','WinHttpReadData','WinHttpCloseHandle'],
 'WINTRUST': ['WinVerifyTrust'],
 'CRYPT32': ['CertGetNameStringW'],
 'SHELL32': ['ShellExecuteExW'],
}

def run(*cmd):
    print('+', ' '.join(str(x) for x in cmd), flush=True)
    subprocess.run([str(x) for x in cmd],check=True,cwd=ROOT)

def cstr(blob, offset):
    return bytes(blob[offset:blob.index(0,offset)]).decode('utf-8')

def fix_relocations(elf_path, coff_path):
    elf = elf_path.read_bytes(); coff = bytearray(coff_path.read_bytes())
    eh = struct.unpack_from('<16sHHIQQQIHHHHHH', elf)
    if eh[0][:4] != b'\x7fELF' or eh[2] != 62: raise ValueError('Expected ELF x64')
    section_header_off, section_header_size, section_count, shstridx = eh[6],eh[11],eh[12],eh[13]
    sections = [struct.unpack_from('<IIQQQQIIQQ', elf, section_header_off+i*section_header_size) for i in range(section_count)]
    shstr = sections[shstridx]; names = elf[shstr[4]:shstr[4]+shstr[5]]
    elf_sections = {i:cstr(names, sh[0]) for i,sh in enumerate(sections)}

    machine, count, _, symoff, symcount, opts, _ = struct.unpack_from('<HHIIIHH',coff)
    if machine != 0x8664 or opts != 0: raise ValueError('Expected COFF x64 object')
    strstart = symoff + symcount*18
    strsize = struct.unpack_from('<I',coff,strstart)[0]
    strtab = coff[strstart:strstart+strsize]
    coff_sections = {}
    for i in range(count):
        sh = struct.unpack_from('<8sIIIIIIHHI',coff,20+i*40)
        rawname=sh[0].split(b'\0',1)[0].decode('ascii')
        name=cstr(strtab,int(rawname[1:])) if rawname.startswith('/') else rawname
        coff_sections[name]=sh
    def coffsym(i):
        raw=coff[symoff+i*18:symoff+i*18+8]
        a,b=struct.unpack('<II',raw)
        return cstr(strtab,b) if a==0 else bytes(raw).split(b'\0',1)[0].decode('ascii')

    fixed=0
    for relsec in sections:
        if relsec[1] != 4: continue
        target = elf_sections[relsec[7]]
        if target not in coff_sections: raise ValueError('Missing COFF section '+target)
        sh=coff_sections[target]; rawoff, reloff, nrel=sh[4],sh[5],sh[7]
        syms=sections[relsec[6]]; st=sections[syms[6]]; strings=elf[st[4]:st[4]+st[5]]
        lookup={}
        for i in range(nrel):
            loc, si, typ=struct.unpack_from('<IIH',coff,reloff+10*i)
            lookup[loc]=(si,typ,reloff+10*i)
        for i in range(relsec[5]//24):
            off,info,addend=struct.unpack_from('<QQq',elf,relsec[4]+24*i)
            symidx,typ=info>>32,info&0xffffffff
            nameoff,inf,_,shindex,_,_=struct.unpack_from('<IBBHQQ',elf,syms[4]+24*symidx)
            if inf & 15 == 3: raise ValueError(f'Unexpected section relocation in {target}+{off:x}')
            name=cstr(strings,nameoff)
            if off not in lookup: raise ValueError(f'Missing relocation {target}+{off:x} ({name})')
            coffidx,_,relpos=lookup[off]
            if coffsym(coffidx)!=name: raise ValueError(f'Wrong relocation symbol: {name} vs {coffsym(coffidx)}')
            if typ in (2,4): # ELF PC32 and PLT32 -> COFF REL32; PE uses P+4
                struct.pack_into('<H',coff,relpos+8,4)
                struct.pack_into('<i',coff,rawoff+off,addend+4)
            elif typ==1: # absolute 64
                struct.pack_into('<H',coff,relpos+8,1)
                struct.pack_into('<q',coff,rawoff+off,addend)
            else:
                raise ValueError(f'Unsupported ELF relocation {typ} at {target}+{off:x} {name}')
            fixed+=1
    coff_path.write_bytes(coff)
    print(f'checked and fixed {fixed} relocations in {coff_path.name}',flush=True)

def compile_unit(stem):
    src=ROOT/'src'/(stem+'.c'); asm=BUILD/(stem+'.s'); elf=BUILD/(stem+'.elf.o'); obj=BUILD/(stem+'.o')
    run('gcc','-S','-O1','-fno-jump-tables','-fno-tree-switch-conversion','-mabi=ms','-mno-red-zone','-fno-stack-protector','-fno-asynchronous-unwind-tables',
        '-fno-unwind-tables','-fno-ident','-fno-builtin','-fcf-protection=none','-ffreestanding','-fPIE',
        '-fshort-wchar','-Wall','-Wextra','-Werror',src,'-o',asm)
    text=asm.read_text()
    constants=sorted(set(re.findall(r'\.LC\d+',text)),key=len,reverse=True)
    for name in constants:
        name2='__const_'+stem+'_'+name[1:]
        text=re.sub(re.escape(name)+r'(?![\w.])',name2,text)
        text='.globl '+name2+'\n'+text
    text=re.sub(r'(?m)^(\s*)\.local\s+([\w.]+)',r'\1.globl \2',text)
    # Mark all named static functions/objects globally so GNU objcopy retains
    # their symbols instead of translating them to broken section references.
    for name in set(re.findall(r'(?m)^\s*\.type\s+([\w.]+),\s*@(function|object)',text)):
        symbol=name[0]
        if not symbol.startswith('.'): text='.globl '+symbol+'\n'+text
    asm.write_text(text)
    run('as','--64',asm,'-o',elf)
    run('objcopy','-O','pe-x86-64','--remove-section=.comment','--remove-section=.note.GNU-stack',elf,obj)
    fix_relocations(elf,obj)
    return obj

def import_library(dll, names):
    asm=BUILD/(dll+'.s'); elf=BUILD/(dll+'.elf.o'); obj=BUILD/(dll+'.o'); definition=BUILD/(dll+'.def')
    implib=BUILD/('lib'+dll+'.a'); stub=BUILD/('stub_'+dll+'.dll')
    asm.write_text('.text\n'+''.join(f'.globl {n}\n{n}:\n ret\n' for n in names))
    definition.write_text('LIBRARY '+dll+'.dll\nEXPORTS\n'+'\n'.join(names)+'\n')
    run('as','--64',asm,'-o',elf)
    run('objcopy','-O','pe-x86-64',elf,obj)
    run('ld','-mi386pep','--dll','--entry','0','--out-implib',implib,'-o',stub,definition,obj)
    return implib

def main():
    units=[compile_unit('editor'),compile_unit('installer'),compile_unit('probe'),compile_unit('versionmgr'),compile_unit('localrun')]
    libraries=[import_library(d,n) for d,n in DLLS.items()]
    output=ROOT/'Axiom-Editor.exe'
    run('ld','-mi386pep','--subsystem','windows','--entry','start','--no-insert-timestamp','-o',output,*units,*libraries)
    run('file',output)
    print('Built:',output)

if __name__=='__main__':
    try: main()
    except (ValueError,subprocess.CalledProcessError) as e:
        print('Build failed:',e,file=sys.stderr); sys.exit(1)
