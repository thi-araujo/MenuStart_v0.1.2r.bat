rem --> Desabilitando o Microsoft Defender SmartScreen
:startDisabledSmartScreen
cls

rem --> Faz a pesquisa no registro do Windows para verificar se a chave do SmartScreen existe
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD | find /i /c "EnableSmartScreen    REG_DWORD    0x0" > %tmp%\checkSmartScreen.txt

rem --> Define o valor da variavél de acordo com o arquivo checkSmartScreen.txt
set /p checkDisabledSmartScreen=<%tmp%\checkSmartScreen.txt

rem --> Define o valor da váriavel igual a 1
set disabledSmartScreen=1

title SmartScreen

rem --> Compara a variável disabledSmartScreen com a variável checkDisabledSmartScreen, executa os comandos de acordo com o resultado
if '%disabledSmartScreen%' EQU '%checkDisabledSmartScreen%' (
	echo.
	echo O SmartScreen já está desativado
	del /q %tmp%\checkSmartScreen.txt >nul 2>&1
	echo 0-O SmartScreen já está desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo Desativando o SmartScreen
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f >nul 2>&1
	del /q %tmp%\checkSmartScreen.txt >nul 2>&1
	echo 1-Desativando o SmartScreen, realizar o restart >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o SmartScreen foi desativado
	timeout /t 5 >nul 2>&1
	goto startDisabledSmartScreen
	)
:checkFiles
rem --> Verifica a existência do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
