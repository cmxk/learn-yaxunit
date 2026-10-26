@echo off
setlocal
chcp 65001 >nul

set VRUNNER_EDT_VERSION=2026.1.3

call vrunner infobase init --src src/cf %*
if errorlevel 1 exit /b 1

call vrunner cfe load --extension-name yaxunit src/cfe/yaxunit %*
if errorlevel 1 exit /b 1

call vrunner run enterprise --command "ЗапуститьОбновлениеИнформационнойБазы;ЗавершитьРаботуСистемы;" --execute "C:\bin\os\lib\vanessa-runner\epf\ЗакрытьПредприятие.epf" %*
if errorlevel 1 exit /b 1

call vrunner infobase dump-dt --ibconnection "/Fbuild/ib" build/etalon.dt %*
if errorlevel 1 exit /b 1

echo Etalon saved: build/etalon.dt
