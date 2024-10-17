@echo off
set /a %ADMIN%=0
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
:Start
cls
echo "__________                        __                 __   ";
echo "\______   \_______   ____ _____  |  | ______  __ ___/  |_ ";
echo " |    |  _/\_  __ \_/ __ \\__  \ |  |/ /  _ \|  |  \   __\";
echo " |    |   \ |  | \/\  ___/ / __ \|    <  <_> )  |  /|  |  ";
echo " |______  / |__|    \___  >____  /__|_ \____/|____/ |__|  ";
echo "        \/              \/     \/     \/                  ";
echo =============================================================
echo Task: Find a way to escape or exploit the prompt.
echo Hint: if you get stuck use the type command.
:PLoop
set /p "cmd=%CD%>" >nul
echo %cmd%
if '%ADMIN%'=='1' goto :Escaped
goto PLoop
exit /b
:Escaped
cls
echo " ________  ________  _______   ________  ___  __    ________  ___  ___  _________   ";
echo "|\   __  \|\   __  \|\  ___ \ |\   __  \|\  \|\  \ |\   __  \|\  \|\  \|\___   ___\ ";
echo "\ \  \|\ /\ \  \|\  \ \   __/|\ \  \|\  \ \  \/  /|\ \  \|\  \ \  \\\  \|___ \  \_| ";
echo " \ \   __  \ \   _  _\ \  \_|/_\ \   __  \ \   ___  \ \  \\\  \ \  \\\  \   \ \  \  ";
echo "  \ \  \|\  \ \  \\  \\ \  \_|\ \ \  \ \  \ \  \\ \  \ \  \\\  \ \  \\\  \   \ \  \ ";
echo "   \ \_______\ \__\\ _\\ \_______\ \__\ \__\ \__\\ \__\ \_______\ \_______\   \ \__\";
echo "    \|_______|\|__|\|__|\|_______|\|__|\|__|\|__| \|__|\|_______|\|_______|    \|__|";
echo "                                                                                    ";
echo =======================================================================================
echo Successfully completed task.
TIMEOUT /T 2 /NOBREAK >nul
echo Installing next phase.
TIMEOUT /T 5 /NOBREAK >nul
if /i not "%~1"=="BreakoutB" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/BREAKOUTb.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" BreakoutB & exit /b
)
cd /d "%~dp0"
pause


REM ANSWERS
REM in order to complete this task you can use the type command, type BREAKOUT.bat, this will display the full contents making analysis easier.
REM to complete this task you must change ADMIN value to 1 or goto :ESCAPED
REM this task requires you to use a vunerability using && to breakout of the line, the data before that will be echoed and everything past && will be ran as a cmd command.



