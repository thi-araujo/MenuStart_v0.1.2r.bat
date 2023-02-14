:subMenu
cls

title Options menu

echo.
echo Escolha qual opção deseja executar e pressione enter:
echo.
echo 	11º Ativa o NumLock na tela de login
echo.
echo 	12º Ajusta a configuração do UAC para o nível 1
echo.
echo 	13º Corrige o delay de instalação das impressoras
echo.
echo 	14º Desativa os perfis de Firewall
echo.
echo 	15º Desativa o Smartscreen
echo.
echo 	16º Desativa o Bing Search
echo.
echo 	17º Desativa o UAC
echo.
echo 	18º Mais opções
echo.
echo 	19º Voltar ao menu anterior
echo.
echo 	20º Sair
echo.
set menuOption=
set /p menuOption=Digite a opção:
if /i '%menuOption%' EQU '11'  goto activeNumLockLogin
if /i '%menuOption%' EQU '12'  goto adjustUac
if /i '%menuOption%' EQU '13'  goto corretionPrinters
if /i '%menuOption%' EQU '14'  goto disabledFirewall
if /i '%menuOption%' EQU '15'  goto disabledSmartScreen
if /i '%menuOption%' EQU '16'  goto disabledBingSearch
if /i '%menuOption%' EQU '17'  goto disabledUac
if /i '%menuOption%' EQU '18'  goto subMenu1
if /i '%menuOption%' EQU '19'  goto backMenuStart
if /i '%menuOption%' EQU '20'  goto end

cls
echo.
echo Essa não é uma opção valida !
timeout /t 5 >nul 2>&1
cls
echo.
echo Retornando ao menu de opções
timeout /t 5 >nul 2>&1
goto subMenu

::Option 11
:activeNumLockLogin
echo Option 11 >> %tmp%\returnSubMenu.txt
call src\scripts\numLockLogin\numlock.bat
call src\scripts\checkActions\check.bat

::Option 12
:adjustUac
echo Option 14 >>%tmp%\returnSubMenu.txt
call src\scripts\configUac\adjustuac.bat
call src\scripts\checkActions\check.bat

::Option 13
:corretionPrinters
echo Option 12 >>%tmp%\returnSubMenu.txt
call src\scripts\correctionPrinters\printers.bat
call src\scripts\checkActions\check.bat

::Option 14
:disabledFirewall
echo Option 13 >>%tmp%\returnSubMenu.txt
call src\scripts\disabledFirewall\firewall.bat
call src\scripts\checkActions\check.bat

::Option 15
:disabledSmartScreen
echo Option 15 >>%tmp%\returnSubMenu.txt
call src\scripts\disabledSmartScreen\smartscreen.bat
call src\scripts\checkActions\check.bat

::Option 16
:disabledBingSearch
echo Option 16 >>%tmp%\returnSubMenu.txt
call src\scripts\disabledBingSearch\bingsearch.bat
call src\scripts\checkActions\check.bat

::Option 17
:disabledUac
echo Option 17 >>%tmp%\returnSubMenu.txt
call src\scripts\configUac\disableduac.bat
call src\scripts\checkActions\check.bat

::Option 18
:subMenu1
goto subMenu

::Option 19
:backMenuStart
echo Retornar ao menu inicial > %tmp%\returnFirstMenu.txt
call Start.bat

::Option 20
:end
title Finishing the script
cls
echo.
echo Finalizando o script!
taskkill /f /IM caffeine.exe >nul 2>&1
timeout /t 5 >nul 2>&1
exit

