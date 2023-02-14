rem --> Desabilitando o controle do usuário
:startDisabledUac
cls

rem --> Faz a pesquisa no registro do Windows para verificar se a chave do UAC existe
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD | find /i /c "EnableLUA    REG_DWORD    0x0" > %tmp%\checkUac.txt

rem --> Define o valor da variavél de acordo com o arquivo checkUac.txt
set /p checkDisabledUac=<%tmp%\checkUac.txt

rem --> Define o valor da variavél igual a 1
set disabledUac=1

title UAC

rem --> Compara a variável disabledUac com a variável checkDisabledUac, executa os comandos de acordo com o resultado
if '%disabledUac%' EQU '%checkDisabledUac%' (
	echo.
	echo O controle de usuário já está desativado
	del /q %tmp%\checkUac.txt >nul 2>&1
	echo 0-O controle de usuário já está desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo Desativando o controle de usuário
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
	del /q %tmp%\checkUac.txt >nul 2>&1
	echo 1-Desativando o controle de usuário, realizar o restart  >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o controle de usuário foi desativado.
	timeout /t 5 >nul 2>&1
	goto startDisabledUac
	)
:checkFiles
rem --> Verifica a existência do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
