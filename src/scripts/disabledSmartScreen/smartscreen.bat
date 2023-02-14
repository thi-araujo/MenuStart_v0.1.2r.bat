:disableSmartScreen
::Este script desativa o Microsoft Defender SmartScreen
cls

title Disable SmartScreen

rem Faz a pesquisa no registro do Windows para verificar se a chave do SmartScreen existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD ^| find /i /c "EnableSmartScreen    REG_DWORD    0x1"') do set disableSmartScreen=%%a

::Compara a variavel e executa o processo de acordo
if '%disableSmartScreen%' EQU '1' (
	echo.
	echo Desativando o SmartScreen
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f >nul 2>&1
	echo 1-Desativando o SmartScreen, realizar o restart >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o SmartScreen foi desativado
	timeout /t 5 >nul 2>&1
	goto disableSmartScreen
) else (
	echo.
	echo O SmartScreen já está desativado
	timeout /t 5 >nul 2>&1
	exit /b
	)
