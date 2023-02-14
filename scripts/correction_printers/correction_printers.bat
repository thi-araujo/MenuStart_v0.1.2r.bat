rem --> Aplicação correção para o delay de instalação das impressoras
:startCorrectionPrinters
cls

rem -->Faz a pesquisa no registro do Windows para verificar se a chave PreventDeviceMetadataFromNetwork existe
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD | find /i /c "PreventDeviceMetadataFromNetwork    REG_DWORD    0x1" > %tmp%\checkFixedPrinterInstallationDelay.txt

rem --> Define o valor da variavél de acordo com o arquivo checkFixedPrinterInstallationDelay.txt
set /p checkFixedPrinterInstallationDelay=<%tmp%\checkFixedPrinterInstallationDelay.txt

rem --> Define o valor da variavél igual a 1
set fixedPrinterInstallationDelay=1

title Printer install correction

rem --> Compara a variável fixedPrinterInstallationDelay com a variável checkFixedPrinterInstallationDelay, executa os comandos de acordo com o resultado
if '%fixedPrinterInstallationDelay%' EQU '%checkFixedPrinterInstallationDelay%' (
	echo.
	echo A correção de delay de instalação das impressoras já está aplicada
	del/q %tmp%\checkFixedPrinterInstallationDelay.txt >nul 2>&1
	echo 0-A correção de delay de instalação das impressoras já está aplicado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo Aplicando correção de instalação das impressoras para corrigir o delay de instalação
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >nul 2>&1
	del /q %tmp%\checkFixedPrinterInstallationDelay.txt >nul 2>&1
	echo 1-Aplicado a correção de instalação das impressora para corrigir o delay de instalação >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que a correção do delay de instalação das impressoras foi aplicada
	timeout /t 5 >nul 2>&1
	goto startCorrectionPrinters
	)
:checkFiles
rem --> Verifica a existência do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
