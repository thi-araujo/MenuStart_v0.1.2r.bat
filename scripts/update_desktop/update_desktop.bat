rem --> Copia os icones para pasta Usuários\Publicos, os links e programas necessários para o desktop
cls

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
set sapBrasil="%public%\Desktop\SAP Brasil.lnk"
set sapProducao="%public%\Desktop\SAP FIORI Produção S4P.url"
set softwareCenter="%public%\Desktop\Software Center.lnk"
set zscaler="%public%\Desktop\Zscaler.lnk"
set chamadoFiscal="%public%\Desktop\Chamados Fiscal.url"
set redefinirSenhaSap="%public%\Desktop\Redefinir Senha SAP PRD.url"
set sharepoint="%public%\Desktop\Sharepoint Corporativo.url"
set sharepointContabilidade="%public%\Desktop\Sharepoint Contabilidade.url"
set solicitarEpi="%public%\Desktop\Solicitação de EPI´s.url"
set suporteTi="%public%\Desktop\Suporte TI.url"
set notificacoesDeRecebimento="%public%\Desktop\Notificações Recebimento.url"
set saplogon="%public%\Desktop\Saplogon - All systems.lnk"
set quickAssist="%public%\Desktop\Quick Assist.lnk"
set brandAssetsBank="%public%\Desktop\Brand Assets Bank.url"
set screen="%public%\Desktop\Screen.exe"
set skype="%public%\Desktop\Skype for Business.lnk"
set skype2016="%public%\Desktop\Skype for Business 2016.lnk"
set mapear="%public%\Desktop\Mapear-AME.bat"

title Área de Trabalho

echo.
echo Removendo icones antigos do Desktop

if exist %ajudaMe% (
	del /q %ajudaMe%                        >nul 2>&1
)

if exist %adicionarImpressoraOld% (
	del /q %adicionarImpressoraOld%         >nul 2>&1
)

if exist %adicionarImpressoraNew% (
	del /q %adicionarImpressoraNew%         >nul 2>&1
)

if exist %captura% (
	del /q %captura%                        >nul 2>&1
)

if exist %excel% (
	del /q %excel%                          >nul 2>&1
)

if exist %outlook% (
	del /q %outlook%                        >nul 2>&1
)

if exist %powerPoint% (
	del /q %powerPoint%                     >nul 2>&1
)

if exist %word% (
	del /q %word%                           >nul 2>&1
)

if exist %excel2016% (
    del /q %excel2016%                      >nul 2>&1
)

if exist %outlook2016% (
    del /q %outlook2016%                    >nul 2>&1
)

if exist %powerPoint2016% (
    del /q %powerPoint2016%                 >nul 2>&1
)

if exist %word2016% (
    del /q %word2016%                       >nul 2>&1
)

if exist %internetExplorer% (
	del /q %internetExplorer%               >nul 2>&1
)


if exist %internetExplorer1% (
	del /q %internetExplorer1%              >nul 2>&1
)

if exist %sapBrasil% (
	del /q %sapBrasil%                      >nul 2>&1
)

if exist %sapProducao% (
	del /q %sapProducao%                    >nul 2>&1
)

if exist %softwareCenter% (
	del /q %softwareCenter%                 >nul 2>&1
)

if exist %zscaler% (
	del /q %zscaler%                        >nul 2>&1
)

if exist %chamadoFiscal% (
	del /q %chamadoFiscal%                  >nul 2>&1
)

if exist %redefinirSenhaSap% (
	del /q %redefinirSenhaSap%              >nul 2>&1
)

if exist %sharepoint% (
	del /q %sharepoint%                     >nul 2>&1
)

if exist %sharepointContabilidade% (
	del /q %sharepointContabilidade%        >nul 2>&1
)

if exist %solicitarEpi% (
	del /q %solicitarEpi%                   >nul 2>&1
)

if exist %suporteTi% (
	del /q %suporteTi%                      >nul 2>&1
)

if exist %notificacoesDeRecebimento% (
	del /q %notificacoesDeRecebimento%      >nul 2>&1
)

if exist %saplogon% (
    del /q %saplogon%                       >nul 2>&1
)

if exist %quickAssist% (
    del /q %quickAssist%                    >nul 2>&1
)

if exist %brandAssetsBank% (
    del /q %brandAssetsBank%                >nul 2>&1
)

if exist %screen% (
	del /q %screen%                         >nul 2>&1
)

if exist %skype% (
    del /q %skype%                          >nul 2>&1
)

if exist %skype2016% (
    del /q %skype2016%                      >nul 2>&1
)

if exist %sapBrasil% (
	del /q %sapBrasil%                      >nul 2>&1
)

if exist %mapear% (
	del /q %mapear%							>nul 2>&1
)
	timeout /t 5 >nul 2>&1


rem --> Atualiza a área de trabalho
cls

set aplicativos=".\apps\screen\*" "%public%\Desktop"
set atalhos=".\desktop\users\atalhos\*" "%public%\Desktop"
set icones=".\desktop\users\icones\*" "%public%\icones"
set mapear=".\scripts\map\*" "%public%\Desktop"
set urls=".\desktop\users\urls\*" "%public%\Desktop"
set newEdge="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" "%public%\Desktop"
set quickAssist="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories\Quick Assist.lnk" "%public%\Desktop"
set newSoftwareCenter="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Microsoft Endpoint Manager\Configuration Manager\Software Center.lnk" "%public%\Desktop"
set newZscaler="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Zscaler\Zscaler\Zscaler.lnk" "%public%\Desktop"
set newWord="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word.lnk" "%public%\Desktop"
set newExcel="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "%public%\Desktop"
set newPowerPoint="%ProgramData%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" "%public%\Desktop"
set newOutlook="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Outlook.lnk" "%public%\Desktop"
set oldWord2016="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk" "%public%\Desktop"
set oldExcel2016="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel 2016.lnk" "%public%\Desktop"
set oldPowerpoint2016="%ProgramData%\Microsoft\Windows\Start Menu\Programs\PowerPoint 2016.lnk" "%public%\Desktop"
set oldOutlook2016="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Outlook 2016.lnk" "%public%\Desktop"
set checkOffice="%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk"

title Desktop

echo.
echo Atualizando os icones do Desktop
timeout /t 5 >nul 2>&1

rem --> Verifica se existe o icone do Microsoft Edge caso exista segue direto para copia dos icones definidos nas variaveis
if exist "%public%\Desktop\Microsoft Edge.lnk" (
	goto copyIcon
) else (
	xcopy /q /y %newEdge%            >nul 2>&1
	)

rem --> Copia os arquivos definidos nas váriaveis
:copyIcon
	xcopy /s /q /y %icones%          >nul 2>&1
	xcopy /q /y %aplicativos%        >nul 2>&1
	xcopy /q /y %atalhos%            >nul 2>&1
	xcopy /q /y %mapear%             >nul 2>&1
	xcopy /q /y %iE%                 >nul 2>&1
	xcopy /q /y %urls%               >nul 2>&1
	xcopy /q /y %newZscaler%         >nul 2>&1
rem	xcopy /q /y %quickAssist%        >nul 2>&1
	xcopy /q /y %newSoftwareCenter%  >nul 2>&1

rem -->. Verifica se existe os atalhos do Office 2016 caso exista ira copiar eles, do contrário vai copiar os atalhos do Office novo
if exist %checkOffice% (

	xcopy /q /y %oldWord2016%        >nul 2>&1
	xcopy /q /y %oldExcel2016%		 >nul 2>&1
	xcopy /q /y %oldPowerpoint2016%  >nul 2>&1
	xcopy /q /y %oldOutlook2016%     >nul 2>&1

) else (

	xcopy /q /y %newWord%           >nul 2>&1
	xcopy /q /y %newExcel%          >nul 2>&1
	xcopy /q /y %newPowerPoint%     >nul 2>&1
	xcopy /q /y %newOutlook%        >nul 2>&1

	)

cls

echo.
echo Conluindo a copia dos arquivos
echo 0-Atualização dos icones do desktop concluida >> %tmp%\logoff.txt
	 timeout /t 5 >nul 2>&1
	 exit /b
