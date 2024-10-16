@echo off
if /i not "%~1"=="updated" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/RemoteUpdate.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" updated & exit /b
)
cd /d "%~dp0"
pause
@echo off
cls 
echo ============================
echo " __                .__   ";
echo " \ \    ____  __ __|  |  ";
echo "  \ \  /    \|  |  \  |  ";
echo "  / / |   |  \  |  /  |__";
echo " /_/  |___|  /____/|____/";
echo "           \/            ";
echo ============================
echo Updated.
TIMEOUT /T 1 /NOBREAK >NUL
echo Launching.
TIMEOUT /T 1/NOBREAK >NUL

pause
