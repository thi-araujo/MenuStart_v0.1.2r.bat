:numLockOnLogin
::Este script ativa o Numlock na tela de login

cls

title Numlock turned on on login screen

::Faz a pesquisa no registro do Windows para verificar se a chave InitialKeyboardIndicators existe e se está com o valor padrão
for /f "tokens=*" %%a in ('reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ ^| find /i /c "InitialKeyboardIndicators    REG_SZ    2147483648"') do set checkNumlockOnLoginDefault=%%a

::Compara a variavel e executa o processo de acordo
if '%checkNumlockOnLoginDefault%' EQU '1' (
	echo.
	echo O valor padrão do sistema está definido, resetando o valor padrão
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 0 /f >nul 2>&1
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo O Numlock está sendo configurado para ser ativado na tela de login
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f >nul 2>&1
	echo 1-Configurado a ativação do Numlock na tela de login >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o Numlock foi ativado ao iniciar a tela de login
	timeout /t 5 >nul 2>&1
	goto numLockOnLogin
) else (
	echo.
	echo O Numlock já está configurado para ser ativado na tela de login
	timeout /t 5 >nul 2>&1
	exit /b
	)
