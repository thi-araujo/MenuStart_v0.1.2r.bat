@echo off

cls

rem Vers�o do script: 0.1.2r
rem Data da cria��o: 18/09/2022
rem Data da revis�o: 03/10/2022


rem PS: Este script foi baseado no antigo script que havia criado para atualiza��o dos desktop.

rem --> Altera a pagina do cmd para 1252 deste modo posso trabalhar com acentos e caracteres especiais
chcp 1252 >nul 2>&1

rem --> Verifica se o cmd esta sendo executado como Administrador
net file >nul 2>&1

rem --> Verifica se o script esta sendo executado como Administrador
if '%errorlevel%' == '0' (
    goto begin
) else (
    echo.
    echo N�o � poss�vel executar este script corretamente se voc� n�o possuir privil�gios de Administrador
    timeout /t 3 >nul 2>&1
    cls
    echo.
    echo O script ser� encerrado, execute ele novamente como Administrador para prosseguir.
    timeout /t 3 >nul 2>&1
    goto eof
    )

rem -->Define o caminho do script
:begin
set "batchPath=%~0"
cd /d %~dp0

rem --> Limpa os arquivos "log" da script de atualiza��o
title Limpando os logs antigos

echo.
echo Executando a limpeza dos logs antes de iniciar o Menu a��es
del /q %tmp%\logoff.txt >nul 2>&1
del /q %tmp%\restart.txt >nul 2>&1
del /q %tmp%\folderIcones.txt >nul 2>&1
timeout /t 3 >nul 2>&1

:startMenu
rem --> Menu de a��es
cls

title Menu de a��es

echo.
echo Escolha qual op��o deseja executar e pressione enter:
echo.
echo 	1� Atualizar desktop (Est� op��o n�o precisa de verifica��o)
echo.
echo 	2� Atualizar desktop vip (Est� op��o n�o precisa de verifica��o)
echo.
echo 	3� Atualizar icones do desktop
echo.
echo 	4� Atualizar icones do desktop vip
echo.
echo 	5� Ativar NumLock na tela de login
echo.
echo 	6� Corre��o para o delay de instala��o das impressoras
echo.
echo 	7� Desativar os perfis de Firewall
echo.
echo 	8� Desativar o UAC
echo.
echo 	9� Desativar o Smartscreen
echo.
echo 	10� Desativar o Bing Search
echo.
echo 	11� Verificar se ser� preciso realizar o logoff ou reiniciar ap�s as a��es executadas
echo.
echo 	12� Sair
echo.

set menuOption=
set /p menuOption=Digite a op��o:
if /i '%menuOption%' EQU '1'  goto updateDesktop
if /i '%menuOption%' EQU '2'  goto updateDesktopVip
if /i '%menuOption%' EQU '3'  goto updateIconesDesktop
if /i '%menuOption%' EQU '4'  goto updateIconesDesktopVip
if /i '%menuOption%' EQU '5'  goto activeNumLockLogin
if /i '%menuOption%' EQU '6'  goto corretionPrinters
if /i '%menuOption%' EQU '7'  goto disabledFirewall
if /i '%menuOption%' EQU '8'  goto disabledUac
if /i '%menuOption%' EQU '9'  goto disabledSmartScreen
if /i '%menuOption%' EQU '10' goto disabledBingSearch
if /i '%menuOption%' EQU '11' goto checkActions
if /i '%menuOption%' EQU '12' goto eof

cls
echo.
echo Essa n�o � uma op��o valida !
timeout /t 3 >nul 2>&1
cls
echo.
echo Retornando ao menu de op��es
timeout /t 3 >nul 2>&1
goto startMenu


:updateDesktop
call .\scripts\correction_printers\correction_printers.bat
call .\scripts\numlock_login\numlock_login.bat
call .\scripts\disabled_firewall\disabled_firewall.bat
call .\scripts\disabled_uac\disabled_uac.bat
call .\scripts\disabled_smartscreen\disabled_smartscreen.bat
call .\scripts\disabled_bingsearch\disabled_bingsearch.bat
call .\scripts\folder_icones\folder_icones.bat
call .\scripts\update_desktop\update_desktop.bat
call .\scripts\check_actions\check_actions.bat
goto startMenu

:updateDesktopVip
goto startMenu

:updateIconesDesktop
call .\scripts\update_desktop\update_desktop.bat
goto startMenu

:updateDesktopVip
goto startMenu

:activeNumLockLogin
call .\scripts\numlock_login\numlock_login.bat
goto startMenu

:corretionPrinters
call .\scripts\correction_printers\correction_printers.bat
goto startMenu

:disabledFirewall
call .\scripts\disabled_firewall\disabled_firewall.bat
goto startMenu

:disabledUac
call .\scripts\disabled_uac\disabled_uac.bat
goto startMenu

:disabledSmartScreen
call .\scripts\disabled_smartscreen\disabled_smartscreen.bat
goto startMenu

:disabledBingSearch
call .\scripts\disabled_bingsearch\disabled_bingsearch.bat
goto startMenu

:checkActions
call .\scripts\check_actions\check_actions.bat
goto eof
