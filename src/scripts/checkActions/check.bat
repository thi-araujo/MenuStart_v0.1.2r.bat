cls
::Este script limpa a tela e informa o usu�rio qual a��o deve ser tomada para atualizar as configura��es

title Checking the actions to be performed

::Define as variaveis de Logoff e Restart
set logoff=%tmp%\logoff.txt
set restart=%tmp%\restart.txt

::Verifi��o de qual a��es seguir
echo.
echo Verificando as a��es a serem executadas aguarde um momento!
	if exist %restart% (
	del /q %restart% >nul 2>&1
	del /q %logoff% >nul 2>&1
	timeout /t 5 >nul 2>&1
	goto restart
) else (
    if exist %logoff% (
	del /q %logoff% >nul 2>&1
	timeout /t 5 >nul 2>&1
	goto logoff
) else (
	cls
	echo.
	echo Nenhuma a��o � necess�ria, retornando ao menu
	timeout /t 5 >nul 2>&1
	goto returnToMenu
	)
)

::Segue para a reinicializa��o do sistema operacional
:restart
cls

title Reiniciar

echo.
echo Ser� necess�rio reiniciar para atualizar as configura��es!
	timeout /t 5 >nul 2>&1
cls
echo.
echo Gostaria de reiniciar o computador agora?

set menuOption=
set /p menuOption=Digite (S) para reiniciar ou (N) para voltar ao menu:
if /i "%menuOption%" EQU "S" goto rebootConfirmed
if /i "%menuOption%" EQU "N" goto returnToMenu

:rebootConfirmed
shutdown /f /r /t 0

::Segue para o logoff do desktop
:logoff
cls

title Logoff

echo.
echo Ser� necess�rio executar o Logoff para atualizar as configura��es!
	timeout /t 5 >nul 2>&1
cls
echo.
echo Gostaria de realizar o Logoff agora?
set menuOption=
set /p menuOption=Digite (S) para o Logoff ou (N) para voltar ao menu:
if /i "%menuOption%" EQU "S" goto logoffConfirmed
if /i "%menuOption%" EQU "N" goto returnToMenu

:logoffConfirmed
shutdown /f /l

:returnToMenu
set returnMenu=%tmp%\returnMenu.txt
set returnFirstMenu=%tmp%\returnFirstMenu.txt
set returnSubMenu=%tmp%\returnSubMenu.txt

if exist %returnMenu% (
	del /q %returnMenu% >nul 2>&1
	call Start.bat
) else (
	if exist %returnFirstMenu% (
	del /q %returnFirstMenu% >nul 2>&1
	call Start.bat
) else (
	if exist %returnSubMenu% (
	del /q %returnSubMenu% >nul 2>&1
	call src\scripts\subMenu\submenu.bat
		)
	)
)

