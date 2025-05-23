@echo off
echo [1] Show Clock Seconds
echo [2] Hide Clock Seconds

CHOICE /C 12 /M "Please make a choice:"

IF %ERRORLEVEL%==1 (
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
    taskkill /f /im explorer.exe
    start explorer.exe
    echo Clock seconds are now visible.
) ELSE IF %ERRORLEVEL%==2 (
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 0 /f
    taskkill /f /im explorer.exe
    start explorer.exe
    echo Clock seconds are now hidden.
)

pause