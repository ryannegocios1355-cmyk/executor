$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Get-Command cmake -ErrorAction SilentlyContinue)) {
    throw 'CMake nao encontrado. Instale Visual Studio 2022 com Desenvolvimento para desktop com C++ e CMake.'
}
cmake -S $Root -B (Join-Path $Root 'build') -A x64
if ($LASTEXITCODE -ne 0) { throw 'Falha ao configurar o projeto.' }
cmake --build (Join-Path $Root 'build') --config Release --target axiom-luau
if ($LASTEXITCODE -ne 0) { throw 'Falha ao compilar.' }
Write-Host 'Pronto: build\Release\axiom-luau.exe'
