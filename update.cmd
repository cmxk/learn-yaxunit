@echo off
setlocal
chcp 65001 >nul

call vrunner infobase update --db-user "Администратор" %*
if errorlevel 1 exit /b 1

call vrunner cfe load --extension-name yaxunit --db-user "Администратор" src/cfe/yaxunit %*
if errorlevel 1 exit /b 1

call vrunner run enterprise --command "ЗапуститьОбновлениеИнформационнойБазы;ЗавершитьРаботуСистемы;" --execute "C:\bin\os\lib\vanessa-runner\epf\ЗакрытьПредприятие.epf" %*
if errorlevel 1 exit /b 1
