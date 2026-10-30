
@echo off
setlocal
chcp 65001 >nul

cd /d "%~dp0"

taskkill /F /IM 1cv8.exe /IM 1cv8c.exe >nul 2>&1

set "VA_EPF=C:\bin\os\lib\vanessa-automation\vanessa-automation.epf"
set "VA_PARAMS=%CD%\tools\VAParams.json"

call vrunner run enterprise --ibconnection "/F./build/ib" --v8version "8.3.27.1786" --db-user "Администратор" --execute "%VA_EPF%" --command "StartFeaturePlayer;QuietInstallVanessaExt;VAParams=%VA_PARAMS%;WorkspaceRoot=%CD%" --exitCodePath "./build/out/BuildStatus.log"
if errorlevel 1 exit /b 1

call vrunner test yaxunit --ibconnection "/F./build/ib" --yaxunit-config "./tools/yaxunit.json" --db-user "Администратор" %*

exit /b 0