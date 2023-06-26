@echo off

::Data da Criação: 18/09/2022
::Data da Revisão: 15/05/2023
::Autor: Thiago

::Altera a página do CMD para 1252 trabalhando assim com acentos e caracteres especiais
chcp 1252 >nul 2>&1

::Define o caminho do script
set folderScript=%~dp0
cd %folderScript%

::Vers�o do script
set version=Script V0.4.2r

::Define as Variáveis dos Arquivos Temporário
set returnMenu=%tmp%\returnMenu.txt
set returnFirstMenu=%tmp%\returnFirstMenu.txt
set returnSubMenu=%tmp%\returnSubMenu.txt
set logoff=%tmp%\logoff.txt
set restart=%tmp%\restart.txt

::Exclui os arquivos temporários
del /q %logoff%           >nul 2>&1
del /q %restart%          >nul 2>&1
del /q %returnMenu%       >nul 2>&1
del /q %returnFirstMenu%  >nul 2>&1
del /q %returnSubMenu%    >nul 2>&1

::Verifica se o CMD esta sendo executado como ADM
net file >nul 2>&1
if '%errorlevel%' EQU '0' (
	goto menu
) else (
	cls
	echo.
	echo Não é possível executar este Script corretamente se você não possuir privilégios de Administrador
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo O SCRIPT será encerrado, execute ele novamente como Administrador para prosseguir.
	timeout /t 5 >nul 2>&1
	goto end
	)

:menu
cls

title Options menu

echo.
echo Escolha qual opção deseja Executar e pressione ENTER:
echo.
echo 	1 - Como o SCRIPT funciona?
echo.
echo 	2 - Atualizar as Configurações do PC/NB + Ícones
echo.
echo 	3 - Atualiza apenas os Ícones do PC/NB
echo.
echo 	4 - Atualiza as Configurações do PD AC + icones
echo.
echo 	5 - Atualiza apenas os Ícones do PD AC
echo.
echo 	6 - Atualiza as Configurações dos PD LQC Ícones
echo.
echo 	7 - Atualiza apenas os Icones do PD LQC
echo.
echo 	8 - Versão do Script
echo.
echo 	9 - Mais Opções
echo.
echo 	10 - SAIR
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
echo Essa não é uma Opção Válida !
timeout /t 5 >nul 2>&1
cls
echo.
echo Retornando ao Menu de Opções
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
echo Finalizando o SCRIPT!
taskkill /f /im caffeine.exe >nul 2>&1
timeout /t 5 >nul 2>&1
exit


