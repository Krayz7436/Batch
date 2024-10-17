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

