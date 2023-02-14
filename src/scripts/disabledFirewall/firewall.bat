:disableFirewall
::Este script desativa o Firewall do Windows
cls

title Disable Firewall

::Faz a pesquisa no registro do Windows para verificar se a chave do Firewall existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD ^| find /i /c "EnableFirewall    REG_DWORD    0x1"') do set disabledFirewall=%%a

::Compara a variavel e executa o processo de acordo
if '%disabledFirewall%' EQU '1' (
	echo.
	echo Desativando os perfis do Firewall
	netsh advfirewall set allprofiles state off >nul 2>&1
	echo 1-Desativando os perfis do Firewall, realizar o restart >> %tmp%\restart
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que os perfis de Firewall foram desativados
	timeout /t 5 >nul 2>&1
	goto disableFirewall
) else (
	echo.
	echo Os perfis de firewall já estão desativados.
	timeout /t 5 >nul 2>&1
	exit /b
	)

