::Este script copia os icones para pasta Usuários\Publicos, os links e programas necessários para o desktop
cls

::Define as variaveis dos itens a serem removidos
set ajudaMe="%public%\Desktop\Ajude-Me.lnk"
set adicionarImpressoraOld="%public%\Desktop\Adiciona Impressora.lnk"
set adicionarImpressoraNew="%public%\Desktop\Adicionar Impressora.lnk"
set captura="%public%\Desktop\Captura.lnk"
set excel="%public%\Desktop\Excel.lnk"
set excel2016="%public%\Desktop\Excel 2016.lnk"
set powerPoint="%public%\Desktop\PowerPoint.lnk"
set powerPoint2016="%public%\Desktop\Word 2016.lnk"
set outlook="%public%\Desktop\Outlook.lnk"
set outlook2016="%public%\Desktop\Outlook 2016.lnk"
set word="%public%\Desktop\Word.lnk"
set word2016="%public%\Desktop\Word 2016.lnk"
set internetExplorer="%public%\Desktop\Internet.lnk"
set internetExplorer1="%public%\Desktop\Internet Explorer.lnk"
set microsoftEdge="Microsoft Edge.lnk"
set sapBrasil="%public%\Desktop\SAP Brasil.lnk"
set sap4Hana="%public%\Desktop\SAP FIORI Produção S4P.url"
set saplogon="%public%\Desktop\Saplogon - All systems.lnk"
set softwareCenter="%public%\Desktop\Software Center.lnk"
set zscaler="%public%\Desktop\Zscaler.lnk"
set chamadoFiscal="%public%\Desktop\Chamados Fiscal.url"
set redefinirSenhaSap="%public%\Desktop\Redefinir Senha SAP PRD.url"
set sharepoint="%public%\Desktop\Sharepoint Corporativo.url"
set sharepointContabilidade="%public%\Desktop\Sharepoint Contabilidade.url"
set solicitarEpi="%public%\Desktop\Solicitação de EPI´s.url"
set suporteTi="%public%\Desktop\Suporte TI.url"
set notificacoesDeRecebimento="%public%\Desktop\Notificações Recebimento.url"
set quickAssist="%public%\Desktop\Quick Assist.lnk"
set brandAssetsBank="%public%\Desktop\Brand Assets Bank.url"
set screen="%public%\Desktop\Screen.exe"
set skype="%public%\Desktop\Skype for Business.lnk"
set skype2016="%public%\Desktop\Skype for Business 2016.lnk"
set mapear="%public%\Desktop\Mapear-AME.bat"

::Inicia o processo de remoção
title Área de Trabalho

echo.
echo Removendo icones antigos do Desktop

del /q %ajudaMe%                   >nul 2>&1
del /q %adicionarImpressoraOld%    >nul 2>&1
del /q %adicionarImpressoraNew%    >nul 2>&1
del /q %captura%                   >nul 2>&1
del /q %excel%                     >nul 2>&1
del /q %outlook%                   >nul 2>&1
del /q %powerPoint%                >nul 2>&1
del /q %word%                      >nul 2>&1
del /q %excel2016%                 >nul 2>&1
del /q %outlook2016%               >nul 2>&1
del /q %powerPoint2016%            >nul 2>&1
del /q %word2016%                  >nul 2>&1
del /q %internetExplorer%          >nul 2>&1
del /q %internetExplorer1%         >nul 2>&1
del /q %microsoftEdge%             >nul 2>&1
del /q %sapBrasil%                 >nul 2>&1
del /q %sap4Hana%                  >nul 2>&1
del /q %saplogon%                  >nul 2>&1
del /q %softwareCenter%            >nul 2>&1
del /q %zscaler%                   >nul 2>&1
del /q %chamadoFiscal%             >nul 2>&1
del /q %redefinirSenhaSap%         >nul 2>&1
del /q %sharepoint%                >nul 2>&1
del /q %sharepointContabilidade%   >nul 2>&1
del /q %solicitarEpi%              >nul 2>&1
del /q %suporteTi%                 >nul 2>&1
del /q %notificacoesDeRecebimento% >nul 2>&1
del /q %quickAssist%               >nul 2>&1
del /q %brandAssetsBank%           >nul 2>&1
del /q %screen%                    >nul 2>&1
del /q %skype%                     >nul 2>&1
del /q %skype2016%                 >nul 2>&1
del /q %mapear%                    >nul 2>&1
timeout /t 2 >nul 2>&1

cls

::Define as variaveis dos itens a serem copiados
set apps="src\apps\screen\Screen.exe" "%public%\Desktop"
set shortcuts="src\desktop\pd\ac\atalhos\*" "%public%\Desktop"
set icon="src\desktop\pd\ac\icones\*" "%public%\icones"
set map="src\scripts\map\*" "%public%\Desktop"
set urls="src\desktop\pd\ac\urls\*" "%public%\Desktop"
set newEdge="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" "%public%\Desktop"
set newSoftwareCenter="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Endpoint Manager\Configuration Manager\Software Center.lnk" "%public%\Desktop"
set newZscaler="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Zscaler\Zscaler\Zscaler.lnk" "%public%\Desktop"
set newWord="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word.lnk" "%public%\Desktop"
set newExcel="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "%public%\Desktop"

::Inicia a copia dos itens
title Desktop

echo.
echo Atualizando os icones do Desktop

::Verifica se existe o icone do Microsoft Edge
if exist "%public%\Desktop\Microsoft Edge.lnk" (
	goto folderIcons
) else (
	xcopy /q /y %newEdge%            >nul 2>&1
	goto folderIcons
	)

::Verifica se a pasta icones existe
:folderIcons
if exist "%public%\icones" (
forfiles -p "%public%" -m "icones" -c "cmd /c if @isdir==TRUE rd /s /q @path" >nul 2>&1
	md %public%\icones    >nul 2>&1
	xcopy /s /q /y %icon% >nul 2>&1
	goto copyIcon
) else (
	md %public%\icones    >nul 2>&1
	xcopy /s /q /y %icon% >nul 2>&1
	goto copyIcon
	)

::Copia os arquivos
:copyIcon
	xcopy /q /y %apps%               >nul 2>&1
	xcopy /q /y %shortcuts%          >nul 2>&1
	xcopy /q /y %map%                >nul 2>&1
	xcopy /q /y %urls%               >nul 2>&1
	xcopy /q /y %newZscaler%         >nul 2>&1
	xcopy /q /y %newSoftwareCenter%  >nul 2>&1
	xcopy /q /y %newWord%            >nul 2>&1
	xcopy /q /y %newExcel%           >nul 2>&1
timeout /t 2 >nul 2>&1

cls

echo.
echo Conluindo a copia dos arquivos
echo 0-Atualização dos icones do desktop concluida >> %tmp%\logoff.txt
	 timeout /t 5 >nul 2>&1
	 exit /b
