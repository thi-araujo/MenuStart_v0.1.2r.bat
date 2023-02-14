:numLockOnLogin
::Este script ativa o Numlock na tela de login

cls

title Numlock turned on on login screen

::Faz a pesquisa no registro do Windows para verificar se a chave InitialKeyboardIndicators existe e se est� com o valor padr�o
for /f "tokens=*" %%a in ('reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ ^| find /i /c "InitialKeyboardIndicators    REG_SZ    2147483648"') do set checkNumlockOnLoginDefault=%%a

::Compara a variavel e executa o processo de acordo
if '%checkNumlockOnLoginDefault%' EQU '1' (
	echo.
	echo O valor padr�o do sistema est� definido, resetando o valor padr�o
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 0 /f >nul 2>&1
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo O Numlock est� sendo configurado para ser ativado na tela de login
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f >nul 2>&1
	echo 1-Configurado a ativa��o do Numlock na tela de login >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verifica��o para confirmar que o Numlock foi ativado ao iniciar a tela de login
	timeout /t 5 >nul 2>&1
	goto numLockOnLogin
) else (
	echo.
	echo O Numlock j� est� configurado para ser ativado na tela de login
	timeout /t 5 >nul 2>&1
	exit /b
	)
