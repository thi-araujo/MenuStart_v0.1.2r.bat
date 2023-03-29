@echo off

::Data da cria��o: 18/09/2022
::Data da revis�o: 23/12/2022
::Autor: Weriton Goes

::Altera a pagina do cmd para 1252 trabalhando assim com acentos e caracteres especiais
chcp 1252 >nul 2>&1

::Define o caminho do script
set folderScript=%~dp0
cd %folderScript%

::Vers�o do script
set version=Script V0.4.2r

::Define as variaveis dos arquivos tempor�rio
set returnMenu=%tmp%\returnMenu.txt
set returnFirstMenu=%tmp%\returnFirstMenu.txt
set returnSubMenu=%tmp%\returnSubMenu.txt
set logoff=%tmp%\logoff.txt
set restart=%tmp%\restart.txt

::Exclui os arquivos tempor�rio
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
	echo N�o � poss�vel executar este script corretamente se voc� n�o possuir privil�gios de Administrador
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo O script ser� encerrado, execute ele novamente como Administrador para prosseguir.
	timeout /t 5 >nul 2>&1
	goto end
	)

:menu
cls

title Options menu

echo.
echo Escolha qual op��o deseja executar e pressione enter:
echo.
echo 	1� Como o script funciona?
echo.
echo 	2� Atualiza as configura��es do PC/NB + icones
echo.
echo 	3� Atualiza apenas os icones do PC/NB
echo.
echo 	4� Atualiza as configura��es do PD AC + icones
echo.
echo 	5� Atualiza apenas os icones do PD AC
echo.
echo 	6� Atualiza as configura��es do PD LQC + icones
echo.
echo 	7� Atualiza apenas os icones do PD LQC
echo.
echo 	8� Vers�o do script
echo.
echo 	9� Mais op��es
echo.
echo 	10� Sair
echo.
set menuOption=
set /p menuOption=Digite a op��o:
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
echo Essa n�o � uma op��o valida !
timeout /t 5 >nul 2>&1