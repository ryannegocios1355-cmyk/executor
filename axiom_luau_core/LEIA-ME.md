# Axiom Luau Core — protótipo parcial

**Estado: ainda não é um executor dentro do Roblox.** Esta etapa reúne um compilador Luau e uma VM para executar scripts localmente. Não se conecta ao Roblox, não implementa injeção nem contém as APIs `game`, `workspace`, `Instance` ou outras APIs do jogo. Não depende de Xeno nem usa a porta 3110.

O caminho para executar scripts no cliente Roblox ainda exige identificar e validar como acessar o estado Luau e agendar execução na versão exata do cliente. A codificação opcional de opcodes é experimental e **não foi validada no Roblox**. Nenhum resultado de execução no jogo é afirmado neste pacote.

## Editor para Windows

Extraia o ZIP completo e abra `Axiom-Editor.exe` no Windows 10/11 x64, mantendo `axiom-luau.exe` na mesma pasta. O editor tem aparência escura inspirada na referência enviada e permite abrir, editar, salvar e copiar arquivos UTF-8, além de listar quantos processos Roblox foram encontrados. O botão **Instalar Roblox** tenta baixar o instalador oficial por HTTPS, pede ao Windows que valide a assinatura e o nome do publicador `Roblox Corporation`, e então abre esse instalador. O instalador oficial escolhe a versão atual.

### Testar um script localmente

1. Digite, por exemplo, `print("Axiom")` no editor.
2. Clique em **Verificar sintaxe** para compilar sem executar, ou em **Executar local** para executar na VM Luau do pacote.
3. Confira o resultado na área **SAIDA DO AXIOM**.

O texto é enviado ao processo local pela entrada padrão, sem criar um arquivo temporário de script. A saída aparece no editor e é limitada aos primeiros 6000 bytes. A execução usa limite de 5 segundos na VM e uma tentativa de encerramento após 15 segundos para a operação completa. O compilador local é necessário também para a verificação de sintaxe. **Esses botões não acessam o Roblox:** exemplos que dependem de `game`, `workspace`, `Instance` ou outras APIs do jogo não funcionarão nessa VM.

### Preparar uma cópia do cliente

1. Abra no Windows **uma única instância** do cliente desktop analisado, `version-5a21b87bbc2641cf`.
2. No Axiom, clique em **Preparar cliente** e mantenha o aplicativo aberto até terminar. O Axiom copia o diretório inteiro dessa instalação para `%LOCALAPPDATA%\Axiom\Versions\version-5a21b87bbc2641cf`. Ele verifica os hashes SHA-256 esperados tanto do `RobloxPlayerBeta.exe` quanto do `RobloxPlayerBeta.dll` antes e depois da cópia, recusa links/pontos de redirecionamento e não altera a instalação de origem.
3. Clique em **Abrir cópia** para solicitar ao Windows que abra o cliente copiado. A verificação dos dois arquivos é repetida antes de abrir; iniciar o processo não comprova que o cliente carregou ou que aceitou a versão.

A cópia exige que o cliente desktop dessa versão já esteja instalado e aberto: ela **não baixa versões antigas**, não seleciona entre várias versões e não garante que Roblox, atualizações ou dados de conta fiquem isolados do restante da instalação. Os arquivos restantes são copiados, mas não têm sua autenticidade comprovada pelos dois hashes. O gerenciador recusa uma pasta de destino preexistente sem o marcador correto; ele não a substitui. Há limites de caminho, profundidade, quantidade de arquivos e tamanho (8 GiB). Uma cópia interrompida ou bloqueada pelo Windows pode deixar uma pasta temporária de estágio.

O botão **Verificar cliente** executa uma verificação somente de leitura em segundo plano. Ele exige exatamente um processo Roblox, calcula o SHA-256 do executável desktop identificado abaixo, confere o SHA-256 dos 256 bytes da tabela na memória e compara os primeiros 16 bytes de quatro endereços com as amostras fornecidas pelo usuário. Também tenta ler uma cadeia de ponteiros candidata. Uma leitura bem-sucedida **não prova o tipo desses ponteiros, a identidade das funções, a compatibilidade de bytecode nem a execução no jogo**. O processo não é alterado.

Os botões superiores agora estão ativos: **Conectar** inicia a mesma verificação somente de leitura do cliente e informa quando a versão analisada foi encontrada; **Executar local** envia o texto para a VM Luau local. Eles não injetam código e não executam dentro do Roblox. O botão lateral **Executar local** faz a mesma operação. A área de saída mostra eventos do editor e resultados locais, não o console do Roblox. O editor usa apenas uma aba e não inclui destaque de sintaxe, Script Hub ou recursos em nuvem.

O EXE foi compilado neste ambiente Linux. A inicialização, a verificação de cliente, abrir/salvar, a listagem de processos, o fluxo de instalação, a cópia/abertura do cliente e a comunicação com o Luau local foram exercitados com APIs Windows simuladas, incluindo falhas. O núcleo Luau foi executado e testado no Linux, mas os novos binários ainda não foram testados no Windows real. O usuário confirmou que uma versão anterior do editor abre e detecta o Roblox no Windows. Código-fonte e testes estão em `editor-native`.

## Compilar no Windows

O pacote inclui `axiom-luau.exe`, compilado para Windows 10/11 x64, para uso **local**. Esse binário foi compilado em Linux e ainda não foi executado em um Windows real. Para recompilá-lo, são necessários Visual Studio 2022 com o componente **Desenvolvimento para desktop com C++** e CMake. O código-fonte de Luau 0.745 está incluído em `vendor/luau`, junto com suas licenças. A versão do compilador Luau e a versão numérica do aplicativo Roblox são sistemas de versão diferentes.

1. Extraia o ZIP.
2. Abra **PowerShell para Desenvolvedores do Visual Studio 2022** na pasta extraída.
3. Execute:

```powershell
./build-windows.ps1
```

O programa estará em `build\Release\axiom-luau.exe`. Se o PowerShell impedir o script, rode `cmake -S . -B build -A x64` e depois `cmake --build build --config Release --target axiom-luau`.

## Usar o núcleo local

```powershell
.\axiom-luau.exe run .\examples\local.luau
.\axiom-luau.exe check .\examples\local.luau
.\axiom-luau.exe compile .\examples\local.luau --output .\teste.luac
```

`run` executa na VM local Luau. O tempo padrão é cinco segundos, ajustável com `--timeout-ms` entre 10 e 60000. A VM tem limite de 64 MiB de alocação; o compilador e o próprio processo não são cobertos por esse limite. O limite de tempo é verificado nos pontos de interrupção da VM. `check` verifica a compilação/sintaxe, não executa nem faz análise de tipos completa. `compile` escreve bytecode padrão, sobrescrevendo o destino se ele já existir; a origem não pode ser o destino.

Para testar a transformação experimental de opcodes, acrescente `--experimental-opcodes` ao comando `compile`. Ela multiplica os opcodes por 227; isso não prova compatibilidade com a versão atual do Roblox e não cria um canal de execução.

Para gerar bytecode experimental usando a tabela de opcodes do próprio cliente Roblox, a versão `version-5a21b87bbc2641cf` é suportada pela leitura dos dados em disco:

```powershell
.\axiom-luau.exe compile .\examples\local.luau --output .\teste-roblox.luac --roblox-client "C:\caminho\RobloxPlayerBeta.exe"
```

A opção confere o tamanho e os cabeçalhos PE do cliente e o CRC32 e formato da tabela. Essas verificações são para compatibilidade, não uma prova criptográfica da origem do arquivo. A tabela é experimental e ainda não foi verificada executando scripts no Roblox.

## Diagnóstico do Roblox aberto

Com o Roblox aberto dentro de um jogo, rode no PowerShell a partir da pasta extraída:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\diagnostico-roblox.ps1
```

O diagnóstico consulta somente o processo `RobloxPlayerBeta`, tenta calcular o SHA-256 do executável e verifica se consegue ler o cabeçalho PE na memória. Se a Microsoft Store negar a leitura do arquivo em `WindowsApps`, o teste de acesso à memória continua. Ele tenta comparar os offsets somente se o SHA-256 confirmar o executável desktop analisado. Cada comparação cobre apenas **16 bytes** e não determina a identidade das funções. Não escreve no processo, não altera permissões, não executa scripts no jogo e não consulta dados de contas. O usuário executou a versão anterior do script no Windows; esta revisão dos rótulos ainda não foi executada lá.

Para testes rápidos, com Python instalado:

```powershell
python .\tests\smoke.py .\build\Release\axiom-luau.exe
```

## Compatibilidade analisada

O pacote do cliente enviado anteriormente tem SHA-256 `ecc7097723111f34724b194e2c7bfb63928317884bd16f95d7a13e39026f7d87`, coincidente com o arquivo identificado pelo rbxoffsets para `version-5a21b87bbc2641cf`. O executável dentro dele tem SHA-256 `a5a13a9e4f578fce0675e0dfc3edcdaad639dcb3e306badeb9df597010ca6229`. O ZIP contém o cliente compilado, não código-fonte descompilado. Na consulta de 31/10/2026, a página dessa versão mostrava campos como `LocalScript::ByteCode`, `ModuleScript::ByteCode` e `ScriptContext::RequireBypass` com valor zero. A seção de código em disco está protegida.

Em uma sessão do usuário, o SHA-256 do executável coincidiu e a leitura do processo funcionou. A tabela completa de 256 bytes na memória teve SHA-256 `21fde37ce0448c18f5532f440b095b19e0d04127abbb8b66540e3c4cd89fa8f3`, igual ao da tabela em disco. O exame de amostras de código sugere que dois endereços anteriormente rotulados como funções principais podem apontar para rotinas auxiliares; não se deve chamá-los com assinaturas presumidas. A identidade das funções, o contexto Luau e a forma segura de agendar o script ainda precisam de validação.

Uma base pública examinada anuncia suporte à mesma versão, porém sua estrutura `lua_State` coloca campos em posições diferentes das sugeridas pelas amostras recebidas. Por isso, essa base não foi incorporada ao executável. `src/roblox_0745_layout.hpp` registra hipóteses de layout para trabalho futuro, com uma validação sintética em `tests/layout_test.cpp`; passar nesse teste **não confirma** o layout dentro do Roblox nem habilita execução.

O arquivo `RobloxApp.zip` dessa versão contém componentes do cliente desktop e não é um instalador completo. A instalação oficial do Roblox Player pode ser iniciada pelo site do Roblox: https://en.help.roblox.com/hc/pt-br/articles/204473560-Como-instalar-e-Jogar-Roblox. O instalador pode baixar uma versão mais nova. Como o mecanismo Roblox ainda não existe neste projeto, nenhuma versão está confirmada como compatível com execução.

Este núcleo foi compilado e verificado em Linux. A compilação com MSVC e a integração com Roblox não foram verificadas neste ambiente.

## Créditos

Luau: https://github.com/luau-lang/luau — licenças no diretório `vendor/luau`. O executável local para Windows usa componentes LLVM e MinGW-w64; veja `LLVM-LICENSE.txt`, `MINGW-RUNTIME-LICENSE.txt` e `WINPTHREADS-LICENSE.txt`. Dados de versão e offsets: https://www.rbxoffsets.com/windows. Referências para offsets e hipóteses de estrutura: https://github.com/Offsetmanager/Roblox-Internal-External-Offsets, https://github.com/SirAsta/module e https://github.com/codexvsberserkerxylo/offsets. Nenhum binário do Roblox é redistribuído neste pacote.
