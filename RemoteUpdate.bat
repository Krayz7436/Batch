@echo off
color 2
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
color 2
echo =================================================
echo "               __                       __    ";
echo "  ____   _____/  |___  _  _____________|  | __";
echo " /    \_/ __ \   __\ \/ \/ /  _ \_  __ \  |/ /";
echo "|   |  \  ___/|  |  \     (  <_> )  | \/    < ";
echo "|___|  /\___  >__|   \/\_/ \____/|__|  |__|_ \";
echo "     \/     \/                              \/";
echo =================================================
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
color 4
echo ============================
echo " __                .__   ";
echo " \ \    ____  __ __|  |  ";
echo "  \ \  /    \|  |  \  |  ";
echo "  / / |   |  \  |  /  |__";
echo " /_/  |___|  /____/|____/";
echo "           \/            ";
echo ============================
echo Check for updates[1]
echo Console[1]
SET /P Opt=Choice:
if '%Opt%'=='1' goto :Console
exit /b
:Console
title Console
color 4
echo =================================================
echo "                                 .__          ";
echo "  ____  ____   ____   __________ |  |   ____  ";
echo "_/ ___\/  _ \ /    \ /  ___/  _ \|  | _/ __ \ ";
echo "\  \__(  <_> )   |  \\___ (  <_> )  |_\  ___/ "; 
echo " \___  >____/|___|  /____  >____/|____/\___  >";
echo "     \/           \/     \/                \/ ";
echo =================================================
echo Sucessfully Launched.
:cmd
set /p "cmd=%CD%>"
%cmd%
echo.
goto cmd


