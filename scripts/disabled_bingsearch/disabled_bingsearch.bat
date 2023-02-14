rem --> Desabilita o Bing Search da lupa do Windows evitando que a pesquisa ocorra na internet
:startDisabledBingSearch
cls

rem --> Faz a pesquisa no registro do Windows para verificar se a chave do Bing Search existe
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD | find /i /c "BingSearchEnabled    REG_DWORD    0x0" > %tmp%\checkBingSearch.txt

rem --> Define o valor da variavél de acordo com o arquivo checkBingSearch.txt
set /p checkDisabledBingSearch=<%tmp%\checkBingSearch.txt

rem --> Define o valor da variavél igual a 1
set disabledBingSearch=1

title Bing Search

rem --> Compara a variável disabledBingSearch com a variável checkDisabledBingSearch, executa os comandos de acordo com o resultado
if '%disabledBingSearch%' EQU '%checkDisabledBingSearch%' (
	echo.
	echo O Bing Search já está desativado
	del /q %tmp%\checkBingSearch.txt >nul 2>&1
	echo 0-O Bing Search já está desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo Desativando o Bing Search na lupa de pesquisa
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
	del /q %tmp%\checkBingSearch.txt >nul 2>&1
	echo 1-Desativando o Bing Search na lupa de pesquisa, realizaro restart >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o Bing Search foi desativado
	timeout /t 5 >nul 2>&1
	goto startDisabledBingSearch
	)
:checkFiles
rem --> Verifica a existência do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
