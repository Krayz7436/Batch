REM This file is incomplete, required snippits only. this will loop until puzzle is added.
@echo off
color 4
:Incomplete
cls
echo INCOMPLETE PLEASE WAIT FOR UPDATE. 
TIMEOUT /T 1 /NOBREAK >nul
goto Incomplete
REM This is the precheck, it changes the text color to red, Checks for a valid internet connection, If valid the program calls :Start initaiting the puzzle.
@echo off
color 4
echo " ________  ________  _______   ________  ___  __    ________  ___  ___  _________   ";
echo "|\   __  \|\   __  \|\  ___ \ |\   __  \|\  \|\  \ |\   __  \|\  \|\  \|\___   ___\ ";
echo "\ \  \|\ /\ \  \|\  \ \   __/|\ \  \|\  \ \  \/  /|\ \  \|\  \ \  \\\  \|___ \  \_| ";
echo " \ \   __  \ \   _  _\ \  \_|/_\ \   __  \ \   ___  \ \  \\\  \ \  \\\  \   \ \  \  ";
echo "  \ \  \|\  \ \  \\  \\ \  \_|\ \ \  \ \  \ \  \\ \  \ \  \\\  \ \  \\\  \   \ \  \ ";
echo "   \ \_______\ \__\\ _\\ \_______\ \__\ \__\ \__\\ \__\ \_______\ \_______\   \ \__\";
echo "    \|_______|\|__|\|__|\|_______|\|__|\|__|\|__| \|__|\|_______|\|_______|    \|__|";
echo "                                                                                    ";
echo =======================================================================================
echo Checking Connection.
ping -n 2 -w 700 www.google.com | find "bytes=" >nul
IF %ERRORLEVEL% EQU 0 (
    echo Connection Found.
    goto Start
) ELSE (
    echo No Connection, running diagnostics.
    TIMEOUT /T 1 /NOBREAK >nul
    echo Please relaunch with a connection.
    ipconfig /flushdns >nul
    exit /b
)

REM this is the start variable all puzzle related code will fall below it.

:Start


REM this sends a file download request to the github to install the next phase as shown previously in the first phase.

if /i not "%~1"=="BreakoutD" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/BREAKOUTd.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" BreakoutD & exit /b
)
cd /d "%~dp0"
pause
