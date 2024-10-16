@echo off
set /a URI="https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/RemoteUpdate.bat"
if /i not "%~1"=="updated" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/RemoteUpdate.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" updated & exit /b
)
cd /d "%~dp0"
cls 
echo " __                .__   ";
echo " \ \    ____  __ __|  |  ";
echo "  \ \  /    \|  |  \  |  ";
echo "  / / |   |  \  |  /  |__";
echo " /_/  |___|  /____/|____/";
echo "           \/            ";
echo Updated.
pause
