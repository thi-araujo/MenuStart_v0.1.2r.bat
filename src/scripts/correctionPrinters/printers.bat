:correctionPrinters
::Este script aplica a corre��o para o delay de instala��o das impressoras
cls

title Printer install correction

::Faz a pesquisa no registro do Windows para verificar se a chave PreventDeviceMetadataFromNetwork existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD ^| find /i /c "PreventDeviceMetadataFromNetwork    REG_DWORD    0x0"') do set fixePrinterInstallationDelay=%%a

::Compara a variavel e executa o processo de acordo
if '%fixePrinterInstallationDelay%' EQU '1' (
	echo.
	echo Aplicando corre��o de instala��o das impressoras para corrigir o delay de instala��o
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >nul 2>&1
	echo 1-Aplicado a corre��o de instala��o das impressora para corrigir o delay de instala��o >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verifica��o para confirmar que a corre��o do delay de instala��o das impressoras foi aplicada
	timeout /t 5 >nul 2>&1
	goto correctionPrinters
	) else (
	echo.
	echo A corre��o de delay de instala��o das impressoras j� est� aplicada
	timeout /t 5 >nul 2>&1
	exit /b
	)
