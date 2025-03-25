@echo off
net session >nul 2>&1 || (
    echo This file needs to be run with administrator privileges.
    pause
    exit /b
)
echo [1] Show Clock Seconds
echo [2] Hide Clock Seconds

CHOICE /C 12 /M "Please make a choice:"

IF %ERRORLEVEL%==1 (
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
    echo Clock seconds are now visible.
    echo Restart your device or explorer.exe for the changes to take effect.
) ELSE IF %ERRORLEVEL%==2 (
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 0 /f
    echo Clock seconds are now hidden.
    echo Restart your device or explorer.exe for the changes to take effect.
)

pause
