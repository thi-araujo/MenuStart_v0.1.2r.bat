:disabledUac
::Este script desativa o controle de usuário

cls

title Disable UAC

::Faz a pesquisa no registro do Windows para verificar se a chave  EnableLUA existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD ^| find /i /c "EnableLUA    REG_DWORD    0x0"') do set enableLua=%%a

::Compara a variável e executa o processo de acordo
if '%enableLua%' EQU '1' (
	echo.
	echo Verificando a configuração inicial
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1
	echo 1-Reativando o controle de usuário, realizar o restart  >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	goto disabledUac
) else (
	echo.
	echo Verificando a configuração inicial
	timeout /t 5 >nul 2>&1
	goto checkLevel
	)

:checkLevel
::Faz a pesquisa no registro do Windows para verificar se a chave do UAC existe
for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD ^| find /i /c "ConsentPromptBehaviorAdmin    REG_DWORD    0x2"') do set consentPromptBehaviorAdminN3=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD ^| find /i /c "ConsentPromptBehaviorAdmin    REG_DWORD    0x5"') do set consentPromptBehaviorAdminN2=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD ^| find /i /c "ConsentPromptBehaviorAdmin    REG_DWORD    0x5"') do set consentPromptBehaviorAdminN1=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD ^| find /i /c "ConsentPromptBehaviorAdmin    REG_DWORD    0x0"') do set consentPromptBehaviorAdminN0=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD ^| find /i /c "PromptOnSecureDesktop    REG_DWORD    0x1"') do set promptOnSecureDesktopN3=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD ^| find /i /c "PromptOnSecureDesktop    REG_DWORD    0x1"') do set promptOnSecureDesktopN2=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD ^| find /i /c "PromptOnSecureDesktop    REG_DWORD    0x0"') do set promptOnSecureDesktopN1=%%a

for /f "tokens=*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD ^| find /i /c "PromptOnSecureDesktop    REG_DWORD    0x0"') do set promptOnSecureDesktopN0=%%a


cls

::Compara as variaveis e executa o processo de acordo
if '%consentPromptBehaviorAdminN3%' EQU '1' (
	goto n3
	)
if '%consentPromptBehaviorAdminN2%' EQU '1' (
	goto n2
	)
if '%consentPromptBehaviorAdminN1%' EQU '1' (
	goto n1
	)
if '%consentPromptBehaviorAdminN0%' EQU '1' (
	goto n0
	)

::Informa um possível mal funionamento do script
cls
echo Nenhum dos valores determinados foram encontrados, verificar um possível erro do execução do script!
timeout /t 5 >nul 2>&1
exit /b

::::Verifica em qual nível está o controle usuário e desativa o mesmo
:n3
if '%promptOnSecureDesktopN3%' EQU '1' (
	echo.
	echo O controle de usuário está ajustado para o nível 3
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Desativando o controle de usuário
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f >nul 2>&1
	echo 1-O controle de usuário foi desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o controle de usuário foi desativado.
	timeout /t 5 >nul 2>&1
	goto disabledUac
	)

:n2
if '%promptOnSecureDesktopN2%' EQU '1' (
	echo.
	echo O controle de usuário está ajustado para o nível 2
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Desativando o controle de usuário
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f >nul 2>&1
	echo 1-O controle de usuário foi desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o controle de usuário foi desativado.
	timeout /t 5 >nul 2>&1
	goto disabledUac
	)

:n1
if '%promptOnSecureDesktopN1%' EQU '1' (
	echo.
	echo O controle de usuário está ajustado para o nível 1
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Desativando o controle de usuário
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f >nul 2>&1
	echo 1-O controle de usuário foi desativado, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verificação para confirmar que o controle de usuário foi desativado.
	timeout /t 5 >nul 2>&1
	goto disabledUac
	)

:n0
	if '%promptOnSecureDesktopN0%' EQU '1' (
	echo.
	echo O controle de usuário já está desativado
	timeout /t 5 >nul 2>&1
	exit /b
	)
