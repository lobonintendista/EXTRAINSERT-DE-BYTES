@echo off
title OTIMIZADOR DE EXTRACAO E REINSERCAO DE BYTES - LOBO NINTENDISTA
setlocal enabledelayedexpansion

:main_menu
cls
echo.
echo        *****  EXTRAINSERT DE BYTES/HEXA   *****
echo.
echo        Dicas para usar:    Certifique-se de que  
echo        estejam  juntos,  dentro da mesma  pasta 
echo        deste aplicativo, os seguintes itens:
echo.
echo         01) dumpmaker.exe  02) redumpmaker.exe 
echo         03) tabela.tbl     04) arquivo do jogo
echo.
echo        ****************************************
echo        ******  ESCOLHA UMA PROGRAMACAO   ******
echo        ****************************************
echo.

:: Defina a localização dos executáveis
set "dumpmaker_exe=dumpmaker.exe"
set "redumpmaker_exe=redumpmaker.exe"

echo ...............................................
echo   1 - PARA EXTRAIR OS BYTES (CARACTERES)
echo   2 - PARA REINSERIR OS BYTES (CARACTERES)
echo   3 - AJUDA
echo   4 - SAIR
echo _______________________________________________
set /p "choice=Digite o numero de uma das quatro opcoes: "

if "%choice%" equ "1" (
    call :extract_texts
) else if "%choice%" equ "2" (
    call :reinsert_texts
) else if "%choice%" equ "3" (
    call :show_help
) else if "%choice%" equ "4" (
    echo Saindo do programa.
    pause
    exit
) else (
    echo Opcao invalida. Digite: 1, 2, 3 ou 4.
    pause
    goto :main_menu
)

goto :eof

:show_help
cls
echo _______________________________________________
echo.
echo AJUDA
echo.
echo 1. EXTRAIR OS BYTES (CARACTERES): Extrai bytes de um arquivo ROM.
echo    - Digite o nome do arquivo com a extensao, o qual deseja fazer a extracao;
echo    - Digite o nome do arquivo que contem a tabela feita por voce ou pelo programa monkey-moore;
echo    - Abra o arquivo com um editor Hexadecimal e anote o offset de inicio dos textos;
echo    - Ainda no editor Hexadecimal, anote o offset final dos textos.
echo    - Por ultimo, crie um nome para seu arquivo com a extensao ".txt".
echo.    
echo 2. VOLTAR OS BYTES (CARACTERES): Reinserir os bytes extraidos de volta ao arquivo ROM.
echo    - Digite o nome do arquivo com a extensao, o qual deseja voltar a extracao;
echo    - Digite o nome do arquivo de tabela que voce usou para fazer a extracao;
echo    - Digite o offset de inicio dos textos que usou para extrair;
echo    - Por ultimo, digite o nome do arquivo com a extensao ".txt" que contem os textos traduzidos.
echo.    
echo 3. AJUDA: Exibe esta tela de ajuda.
echo.    
echo 4. SAIR: Encerra o programa.
echo _______________________________________________
pause
goto :main_menu

:extract_texts
cls
echo _______________________________________________
echo.
:: Defina as variaveis de entrada para dumpmaker
echo.
echo PROCESSO DE EXTRACAO DE BYTES
echo.

:: Solicitar entrada do usuario
set /p "rom_file=Digite o nome do seu arquivo ROM com a extensao. Exemplo: system.bin: "
set /p "table_file=Digite o nome do arquivo de tabela. Exemplo: tabela.tbl: "
set /p "start_offset=Digite o endereco onde 'inicia' os textos (Offset em hexadecimal): "
set /p "end_offset=Digite o endereco onde 'termina' os textos (Offset em hexadecimal): "
set /p "output_file=Digite um nome com a extensao '.txt' para salvar um arquivo. Exemplo: textos.txt: "

:: Validacao de entrada
if not exist "!rom_file!" (
    echo.
    echo O arquivo da ROM nao foi encontrado.
    pause
    goto :main_menu
)
if not exist "!table_file!" (
    echo.
    echo O arquivo da tabela nao foi encontrado.
    pause
    goto :main_menu
)

:: Execute o dumpmaker
"%dumpmaker_exe%" "!rom_file!" "!table_file!" "!start_offset!" "!end_offset!" "!output_file!"
if !errorlevel! neq 0 (
    echo.
    echo Erro ao executar o dumpmaker.
    pause
) else (
    echo.
    echo Extracao concluida com sucesso.
    pause
)
goto :main_menu

:reinsert_texts
:: Defina as variaveis de entrada para redumpmaker
cls
echo _______________________________________________
echo.
echo PROCESSO DE REINSERCAO DE BYTES
echo.

:: Solicitar entrada do usuario
set /p "rom_ext=Digite o nome do arquivo ROM com a extensao. Exemplo: system.bin: "
set /p "tabela_tbl=Digite o nome do arquivo de tabela. Exemplo: tabela.tbl: "
set /p "inicio_offset=Digite o endereco onde 'inicia' os textos (Offset em hexadecimal): "
set /p "script_txt=Digite o nome do arquivo.txt que foi extraido. Exemplo: textos.txt: "

:: Validacao de entrada
if not exist "!rom_ext!" (
    echo.
    echo O arquivo de ROM nao foi encontrado.
    pause
    goto :main_menu
)
if not exist "!script_txt!" (
    echo.
    echo O arquivo de textos traduzido nao foi encontrado.
    pause
    goto :main_menu
)
if not
