@echo off
setlocal
chcp 65001 >nul

call vrunner test vanessa --db-user "Администратор" %*
if errorlevel 1 exit /b 1

call vrunner test yaxunit --yaxunit-config tools/yaxunit.json --db-user "Администратор" %*
if errorlevel 1 exit /b 1
