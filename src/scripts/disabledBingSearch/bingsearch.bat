:disableBingSearch
::Este script desativa o Bing Search da lupa do Windows evitando que a pesquisa ocorra na internet
cls

title Disable Bing Search

::Faz a pesquisa no registro do Windows para verificar se a chave do Bing Search existe
for /f "tokens=*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD ^| find /i /c "BingSearchEnabled    REG_DWORD    0x1"') do set disableBingSearch=%%a

::Compara a variavel e executa o processo de acordo
if '%disableBingSearch%' EQU '1' (
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
	goto disableBingSearch
) else (
	echo.
	echo O Bing Search já está desativado
	del /q %tmp%\checkBingSearch.txt >nul 2>&1
	timeout /t 5 >nul 2>&1
	exit /b
	)

