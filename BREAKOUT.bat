@echo off
echo Updating %~nx0 ...
>nul 2>&1 powershell iwr "https://raw.githubusercontent.com/Krayz7436/Batch/refs/heads/main/BREAKOUTa.bat" -OutFile "%temp%\%~nx0"
>nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
>nul 2>&1 powershell start "%~0" updated & exit /b
cls
echo "__________                        __                 __   ";
echo "\______   \_______   ____ _____  |  | ______  __ ___/  |_ ";
echo " |    |  _/\_  __ \_/ __ \\__  \ |  |/ /  _ \|  |  \   __\";
echo " |    |   \ |  | \/\  ___/ / __ \|    <  <_> )  |  /|  |  ";
echo " |______  / |__|    \___  >____  /__|_ \____/|____/ |__|  ";
echo "        \/              \/     \/     \/                  ";
echo =============================================================
echo Succesfully Installed.
TIMEOUT /T 1 /NOBREAK >NUL
exit /b
REM This script sends a file download request to the github repository, and replaces the current file with the new contents.
