@echo off
::Este script mapeia a unidade de rede
::Caminho do mapeamento de Americana:
::Mapeamento:\\caronte\data

cls

title Mapeando unidade de rede

:mapeamento
::Define as vari�veis
set letraMap=F:
set caminhoMap=\\caronte\data

::Processo de mapeamento F:
if exist %letraMap% (
    echo.
    echo Excluindo mapeando F: antigo
    timeout /t 3 >nul 2>&1
    net use %letraMap% /d /y
    timeout /t 2 >nul 2>&1
    cls
    echo.
    echo Exclus�o do mapeamento F: antigo conclu�do!
    timeout /t 3 >nul 2>&1
    goto mapeamento
) else (
	cls
	echo.
	echo Mapeando unidade F:
	timeout /t 3 >nul 2>&1
	net use %letraMap% %caminhoMap%
	timeout /t 2 >nul 2>&1
	cls
	echo.
	echo O mapeamento foi conclu�do, este script sera finalizado!
	timeout /t 3 >nul 2>&1
	goto eof
	)

