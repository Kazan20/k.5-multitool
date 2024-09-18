@echo off
title K.5 - Kazan 20
chcp 65001 >nul
cd files
color 5

:START
cls
call :banner
echo.
echo [38;5;29m               ╔════════════════════════════════════╗[0m
echo [38;5;28m               ║              1. Menu               ║[0m
echo [38;5;34m               ║              2. File Explorer      ║[0m
echo [38;5;40m               ║              3. Calendar           ║[0m
echo [38;5;46m               ║              4. Winget             ║[0m
echo [38;5;46m               ║              5. Nushell            ║[0m 
echo [38;5;46m               ╚════════════════════════════════════╝[0m
echo.
set /p input=.%BS% [38;5;46m             ╚══════^>[0m

if /I "%input%"=="1" goto MENU
if /I "%input%"=="2" goto FILE_EXPLORER
if /I "%input%"=="3" goto CALENDAR
if /I "%input%"=="4" goto WINGET
if /I "%input%"=="5" goto NU

goto START

:MENU
cls
call :banner

echo.
echo.
echo [38;2;230;200;255m        ╔═(1) discord[0m  
echo [38;2;216;127;236m        ║[0m  
echo [38;2;201;101;224m        ╠══(2) krita[0m  
echo [38;2;186;85;211m        ║[0m  
echo [38;2;153;50;204m        ╠═══(3) np++[0m  
echo [38;2;128;0;128m        ║[0m  
echo [38;2;128;0;128m        ╚╦═══(4) vbox[0m  
echo [38;2;128;0;128m         ║[0m  
set /p input=.%BS% [38;2;128;0;128m       ╚══════^>[0m  

if /I "%input%"=="1" start Discord.lnk
if /I "%input%"=="2" start Krita.lnk
if /I "%input%"=="3" start np++.lnk
if /I "%input%"=="4" start vbox.lnk

cls
goto START

:FILE_EXPLORER
setlocal enabledelayedexpansion
set "current_dir=%cd%"

:FILE_EXPLORE
cls
echo.
echo [38;5;124m              Current Directory: %current_dir%[0m
echo.
echo [38;5;124m             [..] Go Up☺[0m
echo [38;5;124m             [0] Refresh☺[0m
echo [38;5;124m             [q] Exit
echo.


:: List files and directories
for /f "delims=" %%D in ('dir /b /a') do (
    if exist "%%D\" (
        echo [38;5;124m               [D] %%D[0m
    ) else (
        echo [38;5;196m               [F] %%D[0m
    )
)

echo.
set /p input=.%BS% [38;5;196m        ╚══════^>[0m

if "%input%"=="0" goto FILE_EXPLORE
if "%input%"==".." (
    cd ..
    set "current_dir=%cd%"
    goto FILE_EXPLORE
)
if "%input%"=="q" goto START
if exist "%input%" (
    if exist "%input%\" (
        cd "%input%"
        set "current_dir=%cd%"
        goto FILE_EXPLORE
    ) else (
        start "" "%input%"
    )
) else (
    echo [38;2;255;0;0m        Invalid selection[0m
    timeout /t 2 /nobreak >nul
)

.
goto FILE_EXPLORE

:CALENDAR
cls
echo.
echo [38;2;128;0;128m        *** Calendar ***[0m
echo.

:: Call PowerShell to display the calendar
powershell -ExecutionPolicy Bypass -File "C:\Users\User\Desktop\k.5 tools\calendar.ps1"

echo.
pause
goto START

:WINGET
cls
call :wingetlogo
echo.
echo [38;5;208m       (1) Search for a package[0m
echo [38;5;214m       (2) Install a package[0m
echo [38;5;220m       (3) List installed packages[0m
echo [38;5;222m       (4) Back to main menu[0m
echo.

set /p input=.%BS% [38;5;226m       ╚══════^>[0m

if /I "%input%"=="1" goto SEARCH_PACKAGE
if /I "%input%"=="2" goto INSTALL_PACKAGE
if /I "%input%"=="3" goto LIST_PACKAGES
if /I "%input%"=="4" goto START

goto WINGET

:SEARCH_PACKAGE
cls
echo [38;5;46m        Enter the package name to search for:
set /p pkgname="[0m Package Name: "
winget search "%pkgname%"
pause
goto WINGET

:INSTALL_PACKAGE
cls
echo [38;5;46m        Enter the package name to install:
set /p pkgname="[0m Package Name: "
winget install "%pkgname%"
pause
goto WINGET

:LIST_PACKAGES
cls
echo [38;5;46m        Listing installed packages:
winget list
pause
goto WINGET

:NU
cls
cd C:\Users\User\
C:\Users\User\AppData\Local\Programs\nu\bin\nu.exe

:wingetlogo
echo                         [38;5;202m █     █░ ██▓ ███▄    █   ▄████ ▓█████▄▄▄█████▓ [0m
echo                        [38;5;208m ▓█░ █ ░█░▓██▒ ██ ▀█   █  ██▒ ▀█▒▓█   ▀▓  ██▒ ▓▒ [0m
echo                        [38;5;214m ▒█░ █ ░█ ▒██▒▓██  ▀█ ██▒▒██░▄▄▄░▒███  ▒ ▓██░ ▒░ [0m
echo                        [38;5;220m ░█░ █ ░█ ░██░▓██▒  ▐▌██▒░▓█  ██▓▒▓█  ▄░ ▓██▓ ░  [0m
echo                       [38;5;222m ░░██▒██▓ ░██░▒██░   ▓██░░▒▓███▀▒░▒████▒ ▒██▒ ░  [0m
echo                        [38;5;226m ░ ▓░▒ ▒  ░▓  ░ ▒░   ▒ ▒  ░▒   ▒ ░░ ▒░ ░ ▒ ░░    [0m
echo                          [38;5;227m ▒ ░ ░   ▒ ░░ ░░   ░ ▒░  ░   ░  ░ ░  ░   ░     [0m
echo                            [38;5;228m ░   ░   ▒ ░   ░   ░ ░ ░ ░   ░    ░    ░       [0m
echo                                [38;5;229m ░     ░           ░       ░    ░  ░         [0m
                                               
goto:eof
:banner
echo.
echo.
echo            [38;5;29m ██╗  ██╗   ███████╗      ███╗   ███╗██╗   ██╗██╗  ████████╗██╗████████╗ ██████╗  ██████╗ ██╗ [0m    
echo            [38;5;28m ██║ ██╔╝   ██╔════╝      ████╗ ████║██║   ██║██║  ╚══██╔══╝██║╚══██╔══╝██╔═══██╗██╔═══██╗██║ [0m  
echo            [38;5;34m █████╔╝    ███████╗█████╗██╔████╔██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║  [0m   
echo            [38;5;40m ██╔═██╗    ╚════██║╚════╝██║╚██╔╝██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║    [0m 
echo            [38;5;46m ██║  ██╗██╗███████║      ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║   ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo            [38;5;82m ╚═╝  ╚═╝╚═╝╚══════╝      ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
 


