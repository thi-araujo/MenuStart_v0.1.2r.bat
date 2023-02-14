rem --> Limpa a tela e informa o usuário qual ação será tomada para atualizar a Área de trabalho
cls

title Verificando o próximo passo

echo.
echo Verificando as ações a serem executadas aguarde um momento!
	if exist %tmp%\restart.txt (
	del /q %tmp%\restart.txt >nul 2>&1
	del /q %tmp%\logoff.txt >nul  2>&1
	timeout /t 5 >nul 2>&1
	goto restart
) else (
    if exist %tmp%\logoff.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	timeout /t 5 >nul 2>&1
	goto logoff
	)
)

rem --> Segue para a reinicialização do sistema operacional
:restart

cls

title Reiniciar

echo.
echo O computador será reiniciado para atualizar de Área de Trabalho.
	timeout /t 5 >nul 2>&1
cls
echo.
echo Entre novamente quando sua senha for solicitada.
	timeout /t 5 >nul 2>&1
    shutdown /f /r /t 0
    exit /b

rem --> Segue para o logoff do desktop
:logoff

cls

title Logoff

echo.
echo Será executado o Logoff para atualizar de Área de Trabalho.
	timeout /t 5 >nul 2>&1
cls
echo.
echo Entre novamente quando sua senha for solicitada.
	timeout /t 5 >nul 2>&1
    shutdown /f /l
    exit /b
