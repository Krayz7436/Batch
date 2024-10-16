@echo off 
if /i not "%~1"=="updated" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" updated & exit /b
)
cd /d "%~dp0"
pause 
