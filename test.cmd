
@echo off
setlocal
chcp 65001 >nul

cd /d "%~dp0"

set "VA_EPF=C:\bin\os\lib\vanessa-automation\vanessa-automation.epf"
set "VA_PARAMS=%CD%\tools\VAParams.json"

call vrunner run enterprise --ibconnection "/F./build/ib"  --db-user "Администратор" --execute "%VA_EPF%" --command "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=%VA_PARAMS%;WorkspaceRoot=%CD%" --exitCodePath "./build/out/BuildStatus.log"
if errorlevel 1 exit /b 1

call vrunner test yaxunit --ibconnection "/F./build/ib" --yaxunit-config "./tools/yaxunit.json" --db-user "Администратор" %*

exit /b 0