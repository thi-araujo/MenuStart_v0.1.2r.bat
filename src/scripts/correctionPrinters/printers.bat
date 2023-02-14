:correctionPrinters
::Este script aplica a correção para o delay de instalação das impressoras
cls

title Printer install correction

::Faz a pesquisa no registro do Windows para verificar se a chave PreventDeviceMetadataFromNetwork existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD ^| find /i /c "PreventDeviceMetadataFromNetwork    REG_DWORD    0x0"') do set fixePrinterInstallationDelay=%%a

::Compara a variavel e executa o processo de acordo
if '%fixePrinterInstallationDelay%' EQU '1' (
	echo.
	echo Aplicando correção de instalação das impressoras para corrigir o delay de instalação
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >nul 2>&1
	echo 1-Aplicado a correção de instalação das impressora para corrigir o delay de instalação >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que a correção do delay de instalação das impressoras foi aplicada
	timeout /t 5 >nul 2>&1
	goto correctionPrinters
	) else (
	echo.
	echo A correção de delay de instalação das impressoras já está aplicada
	timeout /t 5 >nul 2>&1
	exit /b
	)
