@echo off

::Data da criação: 18/09/2022
::Data da revisão: 23/12/2022
::Autor: Weriton Goes

::Altera a pagina do cmd para 1252 trabalhando assim com acentos e caracteres especiais
chcp 1252 >nul 2>&1

::Define o caminho do script
set folderScript=%~dp0
cd %folderScript%

::Versão do script
set version=Script V0.4.2r

::Define as variaveis dos arquivos temporário
set returnMenu=%tmp%\returnMenu.txt
set returnFirstMenu=%tmp%\returnFirstMenu.txt
set returnSubMenu=%tmp%\returnSubMenu.txt
set logoff=%tmp%\logoff.txt
set restart=%tmp%\restart.txt

::Exclui os arquivos temporário
del /q %logoff%           >nul 2>&1
del /q %restart%          >nul 2>&1
del /q %returnMenu%       >nul 2>&1
del /q %returnFirstMenu%  >nul 2>&1
del /q %returnSubMenu%    >nul 2>&1

::Verifica se o cmd esta sendo executado como Administrador
net file >nul 2>&1
if '%errorlevel%' EQU '0' (
	goto menu
) else (
	cls
	echo.
	echo Não é possível executar este script corretamente se você não possuir privilégios de Administrador
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo O script será encerrado, execute ele novamente como Administrador para prosseguir.
	timeout /t 5 >nul 2>&1
	goto end
	)

:menu
cls

title Options menu

echo.
echo Escolha qual opção deseja executar e pressione enter:
echo.
echo 	1º Como o script funciona?
echo.
echo 	2º Atualiza as configurações do PC/NB + icones
echo.
echo 	3º Atualiza apenas os icones do PC/NB
echo.
echo 	4º Atualiza as configurações do PD AC + icones
echo.
echo 	5º Atualiza apenas os icones do PD AC
echo.
echo 	6º Atualiza as configurações do PD LQC + icones
echo.
echo 	7º Atualiza apenas os icones do PD LQC
echo.
echo 	8º Versão do script
echo.
echo 	9º Mais opções
echo.
echo 	10º Sair
echo.
set menuOption=
set /p menuOption=Digite a opção:
if /i '%menuOption%' EQU '1'  goto howDoesItWork
if /i '%menuOption%' EQU '2'  goto updateDesktop
if /i '%menuOption%' EQU '3'  goto updateIconDesktop
if /i '%menuOption%' EQU '4'  goto updatePdAc
if /i '%menuOption%' EQU '5'  goto updateIconDesktopPdAc
if /i '%menuOption%' EQU '6'  goto updatePdLqc
if /i '%menuOption%' EQU '7'  goto updateIconDesktopPdLqc
if /i '%menuOption%' EQU '8'  goto checkVersion
if /i '%menuOption%' EQU '9'  goto subMenu
if /i '%menuOption%' EQU '10' goto end

cls
echo.
echo Essa não é uma opção valida !
timeout /t 5 >nul 2>&1
cls
echo.
echo Retornando ao menu de opções
timeout /t 5 >nul 2>&1
goto menu

::Option 1
:howDoesItWork
goto menu

::Option 2
:updateDesktop
echo Option 2 >> %tmp%\returnMenu.txt
call src\scripts\correctionPrinters\printers.bat
call src\scripts\numLockLogin\numlock.bat
call src\scripts\disabledFirewall\firewall.bat
call src\scripts\configUac\disableduac.bat
call src\scripts\disabledSmartscreen\smartscreen.bat
call src\scripts\disabledBingSearch\bingsearch.bat
call src\scripts\updateDesktop\desktop.bat
call src\scripts\checkActions\check.bat

::Option 3
:updateIconDesktop
echo Option 3 >> %tmp%\returnMenu.txt
call src\scripts\updateDesktop\desktop.bat
call src\scripts\checkActions\check.bat

::Option 4
:updatePdsAc
echo Option 4 >> %tmp%\returnMenu.txt
call src\scripts\correctionPrinters\printers.bat
call src\scripts\numLockLogin\numlock.bat
call src\scripts\disabledFirewall\firewall.bat
call src\scripts\configUac\disableduac.bat
call src\scripts\disabledSmartScreen\smartscreen.bat
call src\scripts\disabledBingSearch\bingsearch.bat
call src\scripts\updateDesktopPd\desktopPdAc.bat
call src\scripts\checkActions\check.bat

::Option 5
:updateIconDesktopPdAc
echo Option 5 >> %tmp%\returnMenu.txt
call src\scripts\updateDesktopPd\desktopPdAc.bat
call src\scripts\checkActions\check.bat

::Option 6
:updatePdsLqc
goto menu

::Option 7
:updateIconDesktopPdLqc
goto menu

::Option 8
:checkVersion
cls
echo.
echo %version%
timeout /t 5 >nul 2>&1
goto menu

::Option 9
:subMenu
call src\scripts\subMenu\submenu.bat

:end
title Finishing the script
cls
echo.
echo Finalizando o script!
taskkill /f /im caffeine.exe >nul 2>&1
timeout /t 5 >nul 2>&1
exit
