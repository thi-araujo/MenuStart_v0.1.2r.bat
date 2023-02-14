@echo off

title Criando Mapeamento

cls

rem --> Caminho dos mapeamentos de AME:
rem --> mapeamento_1: \\caronte\data
rem --> mapeamento_2: \\caronte\isd-database

:mapeamento_1

set caminho_do_mapeamento_1=\\caronte\data
set letra_do_mapeamento_1=F:

if exist %letra_do_mapeamento_1% ( 
    net use %letra_do_mapeamento_1% /d /y
    timeout /t 3 >nul 2>&1
    goto mapeamento_1
    ) else ( 
        net use %letra_do_mapeamento_1% %caminho_do_mapeamento_1% 
        timeout /t 3 >nul 2>&1
        goto mapeamento_2
        )
:mapeamento_2

set caminho_do_mapeamento_2=\\caronte\isd-database
set letra_do_mapeamento_2=M:

if exist %letra_do_mapeamento_2% ( 
    net use %letra_do_mapeamento_2% /d /y
    timeout /t 3 >nul 2>&1
    goto mapeamento_2 
    ) else ( 
        net use %letra_do_mapeamento_2% %caminho_do_mapeamento_2% 
        timeout /t 3 >nul 2>&1
        exit %errorlevel%
		)
rem --> Fim do script
