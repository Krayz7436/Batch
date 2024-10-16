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
SET /P Opt=Choice:
if '%Opt%'=='1' goto :ex
if '%Opt%'=='2' goto :ex
:ex
echo This is just an example.
pause
@echo off
set /p webhook=Webhook : 
:send
cls
set /p message=Message : 
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%message%\"}" %webhook%
goto :send
pause
