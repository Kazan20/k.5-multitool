@echo off
title K.5 - Kazan 20
chcp 65001 >nul
cd 'C:\Users\%USERPROFILE%\Desktop\k.5 tools\files'
color 5

:START
cls
call :banner
echo.
echo [38;5;29m               ╔════════════════════════════════════╗[0m
echo [38;5;28m               ║              1. Menu               ║[0m
echo [38;5;34m               ║              2. File Explorer      ║[0m
echo [38;5;40m               ║              3. Newtrodit          ║[0m
echo [38;5;46m               ║              4. Winget             ║[0m
echo [38;5;46m               ║              5. Nushell            ║[0m 
echo [38;5;46m               ║              6. Credits            ║[0m
echo [38;5;46m               ║              7. Exit               ║[0m
echo [38;5;160m               ║              8. Dark side          ║[0m
echo [38;5;46m               ╚════════════════════════════════════╝[0m
echo.
set /p input=.%BS% [38;5;46m             ╚══════^>[0m

if /I "%input%"=="1" goto MENU
if /I "%input%"=="2" goto FILE_EXPLORER
if /I "%input%"=="3" goto CALENDAR
if /I "%input%"=="4" goto WINGET
if /I "%input%"=="5" goto NU
if /I "%input%"=="6" goto kcredits
if /I "%input%"=="7" goto getout
if /I "%input%"=="8" goto Night

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
cd %USERPROFILE%
setlocal enabledelayedexpansion
set "current_dir=%USERPROFILE%"

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
C:\Users\User\Newtrodit\src\newtrodit.exe
echo.
goto START
goto:eof 

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
goto START
goto:eof


:kcredits
echo This multitool was made by Ariel Zvinowanda/kazan20/kama flux
pause
goto start
goto:eof

:getout
exit

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
 
goto:eof

:Night

:startup

title LOADING...

color 0a
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo                                 =   0 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.          Please Wait
echo ---------------------------------------
echo []                              =   5 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][]                            =  15 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo [][][]                          =  23 ]
echo ---------------------------------------
ping localhost -n 3 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.          Please Wait
echo ---------------------------------------
echo [][][][]                        =  30 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][][][][]                      =  38 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo [][][][][]                      =  42 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.          Please Wait
echo ---------------------------------------
echo [][][][][][]                    =  45 ]
echo ---------------------------------------

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][][][][][][]                  =  48 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo [][][][][][][][]                =  50 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.           Please Wait
echo ---------------------------------------
echo [][][][][][][][][]              =  56 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][][][][][][][][][]            =  63 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][]          =  69 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.          Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][][]        =  75 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][][][]      =  79 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][][][][]    =  86 ]
echo ---------------------------------------
ping localhost -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading.          Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][][][][][]  =  90 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading..         Please Wait
echo ---------------------------------------
echo [][][][][][][][][][][][][][][]  =  96 ]
echo ---------------------------------------
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    Loading...        .Complete.
echo ---------------------------------------
echo [][][][][][][][][][][][][][][][]= 100 ]
echo ---------------------------------------

cd %userprofile%/documents

if exist "Login system" goto skip

md "Login System"

:skip

cd "Login System"

ping localhost -n 5 >nul

:home

color 7

title HOME

cls

echo --------------

echo HOME

echo --------------

echo.

echo 1. SIGNUP

echo --------------

echo 2. LOGIN

echo --------------

echo 3. DELETE ACCOUNT

echo --------------

echo 4. EXIT

echo --------------
echo.

set /p "a=Choice: "

if ["%a%"] == ["1"] goto signup

if ["%a%"] == ["2"] goto login

if ["%a%"] == ["4"] goto exit

if ["%a%"] == ["3"] goto delaccount

if ["%a%"] == [""] goto home

:signup

color 7

title SIGNUP

cls

set /p "nusr=New Username: "

if ["%nusr%"] == [""] goto signuperror

if EXIST "%nusr%.bat" goto usertaken

goto npass

:usertaken

cls

color c

echo USERNAME taken, please try another one.

pause >nul

goto signup

:npass

set /p "npass=New Password: "

if ["%npass%"] == [""] goto signuperror

set /p "npassr=Repeat Password: "

if ["%npassr%"] == ["%npass%"] goto signupc

goto signuperror

:signupc

echo set "auser=%nusr%"> %nusr%.bat

echo set "apass=%npass%">> %nusr%.bat

cls

color a

echo Signup successful!

echo press any button to continue!

pause >nul

goto home

:login

color 7

title LOGIN

cls

set /p "kusr=Username: "

if ["%kusr%"] == [""] goto LOGIN

if EXIST "%kusr%.bat" goto pass

goto usernotexist

:usernotexist

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto home



:pass
call %kusr%.bat

rem Use PowerShell to mask password input with • symbol
echo After the password click enter to go to the Next section
for /f "delims=" %%p in ('powershell -Command "$Password = ''; while ($true) { $key = Read-Host -AsSecureString -Prompt 'Enter Password'; if ([char]::IsControl([char][Console]::ReadKey($true).KeyChar)) {break}; $Password += '•'; Write-Host -NoNewline '•'}; [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($key))"') do set "pass=%%p"

rem Check password
if ["%pass%"] == ["%apass%"] goto MenTool

goto passinvalid


:passinvalid

color c

cls

echo The PASSWORD you entered is INVALID

pause >nul

goto login

:logingood

goto MenTool

:delaccount

color 7

title DELETE ACCOUNT

cls

set /p "dusr=Username: "

if ["%dusr%"] == [""] goto delaccount

if exist "%dusr%.bat" goto contin

goto usernotexistdel

:contin

call %dusr%.bat

set /p "dpass=Password: "

if ["%dpass%"] == ["%apass%"] goto contin2

goto passerror

:contin2

cls

echo Are you sure you want to echo delete you account?

set /p "delacc=y/n: "

if ["%delacc%"] == ["n"] goto home

echo Deleting you account...

del "%dusr%.bat"

ping localhost -n 2 >nul

cls

color a

echo Account deleted.

echo Redirecting to home


goto home

:exit

title EXIT

cls

echo Are you sure you want to exit?

set /p exit="y/n: "

if ["%exit%"] == ["y"] exit

if ["%exit%"] == ["n"] goto home

if ["%exit%"] == [""] goto exit

:signuperror

color c

cls

echo ERROR

echo proceeding back to SIGNUP...


goto signup

:passerror

color c

cls

echo PASSWORD INVALID

pause >nul

goto delaccount

:usernotexistdel

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto delaccount
goto:eof

:house
cls
echo --------------------------
echo   Welcome %kusr% to home
echo --------------------------
echo 1. go to START 
echo 2. Mentool
echo 3. Exit the whole tool
echo 4. Login Home
echo 5. play chill music

<nul set /p "=%pink%┌%pink%─%light_purple%─%medium_purple%─%dark_purple%(%medium_purple%load@%kusr%)%reset%-[tool] "
<nul set /p "= %light_purple%(step1)%reset% "
<nul set /p "= %medium_purple%(step2)%reset% "
<nul set /p "= %dark_purple%(step3)%reset% "
echo.
<nul set /p "=└─#> "
set /p pics1=

if ["%pics1%"] == ["1"] goto START

if ["%pics1%"] == ["2"] goto MenTool

if ["%pics1%"] == ["3"] exit

if ["%pics1%"] == ["4"] goto home

if ["%pics1%"] == ["5"] start C:\Users\User\Music\lofi-study-music.mp3

:MenTool
cls
echo Welcome %kusr%
echo                  ╔═══════════════════════╗
echo                  ║       1.Night Tools   ║ 
echo                  ║                       ║ 
echo                  ║       2.Cyb3r Tools   ║ 
echo                  ║                       ║ 
echo                  ║       3.Raptor Tools  ║ 
echo                  ║                       ║ 
echo                 ╔╝        4.house       ╔╝        
echo                 ╚═══════════════════════╝

set "pink=[38;2;255;182;193m"
set "light_purple=[38;2;255;105;180m"
set "medium_purple=[38;2;218;112;214m"
set "dark_purple=[38;2;128;0;128m"
set "reset=[0m"

<nul set /p "=%pink%┌%pink%─%light_purple%─%medium_purple%─%dark_purple%(%medium_purple%load@%kusr%)%reset%-[tool] "
<nul set /p "= %light_purple%(step1)%reset% "
<nul set /p "= %medium_purple%(step2)%reset% "
<nul set /p "= %dark_purple%(step3)%reset% "
echo.
<nul set /p "=└─#> "
set /p pics=


if ["%pics%"] == ["1"] goto Main

if ["%pics%"] == ["2"] goto Cyb3r

if ["%pics%"] == ["3"] goto Raptor

if ["%pics%"] == ["4"] goto house


:Main
cls
color a
title Welcome [%kusr%] : NothingGL : Page 1
mode con lines=30 cols=90 >nul
echo.
echo [38;5;202m███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗[0m
echo [38;5;214m████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝[0m
echo [38;5;220m██╔██╗ ██║██║██║  ███╗███████║   ██║          ██║   ██║   ██║██║   ██║██║     ███████╗[0m
echo [38;5;222m██║╚██╗██║██║██║   ██║██╔══██║   ██║          ██║   ██║   ██║██║   ██║██║     ╚════██║[0m
echo [38;5;226m██║ ╚████║██║╚██████╔╝██║  ██║   ██║          ██║   ╚██████╔╝╚██████╔╝███████╗███████║[0m
echo [38;5;227m╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝          ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝[0m
echo.
echo               ╔══════════════════════════════════════════════════════╗
echo               ║ 1. PuTTy        6. Port Scanner     11. Website      ║
echo               ║ 2. IP Pinger    7. IP LookUp        12. PWV          ║
echo               ║ 3. Stresser     8. Songs            13. Big Text     ║
echo               ║ 4. BAT TO EXE   9. DarkMagic DDoS   14. IG Followers ║
echo               ║ 5. NitroSniper  10. Proxy Checker   15. Exploit      ║
echo               ║                                                      ║
echo               ║   Exit. Exits the tool  99. Credits   Next Page: Next║
echo               ╚══════════════════════════════════════════════════════╝
echo.
set /p picks=[Night]: 

if %picks% == 1 goto putty
if %picks% == 2 goto ippinger
if %picks% == 3 goto stresser
if %picks% == 4 goto bat2exe
if %picks% == 5 goto nitsniper
if %picks% == 6 goto portscanner
if %picks% == 7 goto iplookup
if %picks% == 8 goto song
if %picks% == 9 goto darkddos
if %picks% == 10 goto checkerproxy
if %picks% == 11 goto googles
if %picks% == 12 goto passwifiview
if %picks% == 13 goto bigtexts
if %picks% == 14 goto igfoll
if %picks% == 15 goto exploweb
if %picks% == Next goto Main2
if %picks% == next goto Main2
if %picks% == 99 goto credits
if %picks% == Exit goto MenTool
echo Wrong...
timeout 3 >nul
goto Main





:Main2
cls
color a
title Welcome [%USERNAME%] : NothingGL : Page 2
echo.
echo ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗
echo ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
echo ██╔██╗ ██║██║██║  ███╗███████║   ██║          ██║   ██║   ██║██║   ██║██║     ███████╗
echo ██║╚██╗██║██║██║   ██║██╔══██║   ██║          ██║   ██║   ██║██║   ██║██║     ╚════██║
echo ██║ ╚████║██║╚██████╔╝██║  ██║   ██║          ██║   ╚██████╔╝╚██████╔╝███████╗███████║
echo ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝          ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
echo.
echo   ╔═══════════════════════════════════════════════════════════════════════════╗
echo   ║ 1. ListHackingWebsite    6. Web crasher       11. View all pc in Network  ║
echo   ║ 2. Web Tracker           7. Random Text Gen   12. Remote Desktop          ║
echo   ║ 3. Cyber Map             8. PC Messager       13. All NET CMD             ║
echo   ║ 4. Crack RAR Password    9. Remote Shutdown   14. System Info             ║
echo   ║ 5. Calculator            10. Rename File      15. Mode SSH                ║
echo   ║                                                                           ║
echo   ║ Back page: Back             99. Credits                  Next Page: Next  ║
echo   ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p pick=[Night]: 
if %pick% == 1 goto listhackweb
if %pick% == 2 goto ddostools
if %pick% == 3 goto cmap
if %pick% == 4 goto crackzip
if %pick% == 5 goto calculator
if %pick% == 6 goto web_crasher
if %pick% == 7 goto randgen
if %pick% == 8 goto compmessage
if %pick% == 9 goto shutdin
if %pick% == 10 goto renfile
if %pick% == 11 goto allpcnetwork
if %pick% == 12 goto remdesk
if %pick% == 13 goto allnetcmd
if %pick% == 14 goto systemin
if %pick% == 15 goto modeSSH
if %pick% == 99 goto credits
if %pick% == back goto Main
if %pick% == Back goto Main
if %pick% == Next goto Main3
if %pick% == next goto Main3
echo Wrong...
timeout 3 >nul
goto Main2




:Main3
cls
color a
title Welcome [%USERNAME%] : NothingGL : Page 3
echo.
echo ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗
echo ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
echo ██╔██╗ ██║██║██║  ███╗███████║   ██║          ██║   ██║   ██║██║   ██║██║     ███████╗
echo ██║╚██╗██║██║██║   ██║██╔══██║   ██║          ██║   ██║   ██║██║   ██║██║     ╚════██║
echo ██║ ╚████║██║╚██████╔╝██║  ██║   ██║          ██║   ╚██████╔╝╚██████╔╝███████╗███████║
echo ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝          ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
echo.
echo   ╔═══════════════════════════════════════════════════════════════════════════╗
echo   ║ 1. Window Version      6. Change Time                                     ║
echo   ║ 2. Status Device Mode  7. PC Setting                                      ║
echo   ║ 3. Mode WMIC           8.                                                 ║
echo   ║ 4. Task List                                                              ║
echo   ║ 5. Change Date                                                            ║
echo   ║                                                                           ║
echo   ║ Back page: Back             99. Credits                                   ║
echo   ╚═══════════════════════════════════════════════════════════════════════════╝
echo.
set /p pickz=[Night]: 
if %pickz% == 1 goto winve
if %pickz% == 2 goto modedev
if %pickz% == 3 goto modewmic
if %pickz% == 4 goto tasklists
if %pickz% == 5 goto datechange
if %pickz% == 6 goto timechanger
if %pickz% == 7 goto setpc
if %pickz% == 8 goto crt
if %pickz% == back goto Main2
if %pickz% == Back goto Main2
echo Wrong...
timeout 3 >nul
goto Main3



:crt
echo Coming Soon...
timeout 3 >nul
pause
goto Main3


:setpc
cls
	set
	pause
	goto Main3




:timechanger
cls
	TIME
	pause
	goto Main3





:datechange
cls
	DATE
	pause
	goto Main3




:tasklists
cls
	tasklist
	pause
	goto Main3


:modewmic
echo Are you sure want Mode WMIC?
set /p yn=[Y/N]: 
	if %yn% == Y goto wmicmod
	if %yn% == N goto Main3
	echo Wrong...
	timeout 3 >nul
	goto modewmic

:wmicmod
	cls
	title Mode_WMIC
	echo IF U WANT QUIT TYPE: "QUIT"
	WMIC
	pause

:modedev
	MODE
	pause
	goto Main3




:winve
winver
	pause
	goto Main3





:modeSSH
    cls
    set prevmenu=24
        title (SSH Mode)
            echo.
            echo Entering SSH Mode, Purely runs SSH commands.
                SSH
                goto modssh

:modssh
echo 0. Back to Main
    set /p sshinput=Night: 
    if %sshinput% == 0 goto Main2
    SSH %sshinput%
    pause
    goto modssh





:systemin
	systeminfo
        pause
        goto Main2




:allnetcmd
    cls
    echo.
    echo Here is a list of commands:
    NET
    echo.
    pause
    goto Main2





:remdesk
	echo.
	echo [+] OPEN REMOTE DESKTOP CONNECTION [+]
	echo.
	MSTSC
		pause
		goto Main2





:allpcnetwork
    title Night Tools
        echo.
        echo Enter the domain name you would like to view.
        echo.
        set /p networkviewinput=[+] :
        echo.
        net view /all /domain %networkviewinput%
        echo.
        
        pause
        goto Main2




:shutdin
	cls
    	title Night Tools
        echo.
        echo.
        echo Enter computer name.
        set /p "pcinput=>[+] : 
        goto confe

            :confe
                shutdown /s /p /m \\computer %pcinput% > "shutdownLogs.txt"
                echo Successfully shutdown %pcinput%! Returning to Main...
                timeout 4 >nul
                goto Main2




:renfile
    cls
        echo.
        echo Enter the file path of the file you want to rename, please include the file and the proper file extension.
            set /p "reliantfilerenamerpath=[+] : 
                echo.
                echo Enter the name you want to rename the file to.
                set /p "filerenameinput=[+] : 
                ren "%reliantfilerenamerpath%" %filerenameinput%
                cls
                echo.
                echo File renamed! Returning to the main menu.
                timeout /t 3 /nobreak >nul
                goto Main2




:randgen
title Random text generator
    cls
        echo.
        echo ============================
        echo Generated Number: %random%
        echo ============================
        echo.
        
        pause
        goto Main2





:compmessage
    cls
    set prevmenu=7
    title Night Tools
    echo Enter Computer name you want to message
    set /p MsgName=[+] : 
    if %MsgName%=='' goto 7_2
        :7_2
        cls
        echo Enter message you want to send:
        set /p MsgMessage=[+] : 
        if %MsgMessage%=='' goto 7_3
            :7_3
            cls
            msg %MsgName% %MsgMessage%
            echo.
            echo 1. Back to PC Messager
            echo 0. Back to main
            echo.
            set /p ghr=[+] : 
            if %ghr% == 0 goto Main2
            if %ghr% == 1 goto compmessage




:calculator
TITLE Calculator
    cls
    set prevmenu=12
        title Simple calculator by NothingGL
            echo ---------------------------
            echo Simple Calculator
            echo.
            echo Answer: %sum% = [ %ans% ]
            echo.
            echo Example: 2+2 and hit enter.
            echo.
            echo      0. Back to main
            echo ---------------------------
            echo.
                set /p sum=[+] Night: 
                if %sum% == 0 goto Main2
                set /a ans=%sum%
                    echo.
                    echo = %ans%
                    echo --------------------------------------------------------------
                        cls
                        goto calculator
                        

:crackzip
title Crack .zip, .rar file
	mode con lines=22 cols=96
	color a
	cls
		echo.
		echo " Put your rar files Copy bellow "
		echo " [ C:\Users\%username%\OneDrive\Desktop\NightProject\Tools\CrackZIP\Recovery ] "
		echo.
		set /p redy=[!] Done? Y/N: 
		if %redy% == Y goto crackzo
		if %redy% == N goto Main2
		echo Wrong...
			timeout 2 >nul
			goto crackzip

:crackzo
start Tools/CrackZIP/Kraken.exe
	goto Main2





:cmap
start https://www.fireeye.com/cyber-map/threat-map.html
	goto Main2





:ddostools
title DDoS Tools by NothingGL : Version: 1
	color a
	cls
	echo.
	echo ████████╗ ██████╗  ██████╗ ██╗     ███████╗
	echo ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
	echo    ██║   ██║   ██║██║   ██║██║     ███████╗
	echo    ██║   ██║   ██║██║   ██║██║     ╚════██║
	echo    ██║   ╚██████╔╝╚██████╔╝███████╗███████║
	echo    ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
	echo.
    	echo 1. Server
		echo 0. Back to Main
		echo.
			set /p tar=[+] Server: 
			if %tar% == 1 goto server
			if %tar% == 0 goto Main
				goto ddostools



:server
title Tracker
	color a
	cls
	echo.
	echo  "   0. Back to main   "
	echo.
		set /p trace=[+] Night [URL]: 
		if %trace%==0 goto Main2
		if "%trace%"=="%trace%" goto trace





:trace
color a
	tracert %trace%
	echo.
	echo    -- IP Over This Text --
	echo     Copy It If You Want It
	echo.
		pause
		goto Main2





:listhackweb
title List hacking website
	color a
	cls
	echo.
		echo ██╗  ██╗ █████╗  ██████╗██╗  ██╗
		echo ██║  ██║██╔══██╗██╔════╝██║ ██╔╝
		echo ███████║███████║██║     █████╔╝ 
		echo ██╔══██║██╔══██║██║     ██╔═██╗ 
		echo ██║  ██║██║  ██║╚██████╗██║  ██╗
		echo ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
		echo.
			echo ╔═════════════════════════╗
			echo ║ 1. Hackin9              ║
			echo ║ 2. pentestmag           ║
			echo ║ 3. malwaredevil         ║
			echo ║ 4. Hackforums           ║
			echo ║ 0. Back to Main         ║
			echo ╚═════════════════════════╝
			echo.
				set /p inp=[+] Night: 
				if %inp% == 1 goto hackin9
				if %inp% == 2 goto pentestmag
				if %inp% == 3 goto malwaredevil
				if %inp% == 4 goto hackforums
				if %inp% == 0 goto Main2
				echo Wrong...
					timeout 3 >nul
						goto listhackweb




:hackin9 
start https://hakin9.org/
	goto Main2




:pentestmag
start https://pentestmag.com/
	goto Main2




:malwaredevil
start https://www.malwaredevil.com/2
	goto Main2




:hackforums
start https://hackforums.net/
	goto Main2



:exploweb
start https://www.kitploit.com/
	goto Main



:igfoll
start https://pastebin.com/aVFQUKNE
	goto Main




:putty
echo Open Putty...
	timeout 1 >nul
	start putty
		goto Main



:ippinger
start Tools\NothingPing.exe
	goto Main




:checkerproxy
start Tools\ProxChecker\ProxyChecker.exe
	goto Main





:stresser
start Tools\Night.py
	goto Main



:bat2exe
start Tools\Bat_To_Exe_Converter
	echo Wait....
		timeout 4 >nul
			goto Main






:portscanner
start Tools\Pscan
	goto Main





:iplookup
start Lookup.exe
timeout 1 >nul
goto Main



:loookup
start lookup.py
	goto Main2




:nitsniper
start Tools\snip.py
	goto Main




:song
echo.
	echo       List Song
	echo ╔═════════════════════╗
	echo ║ 1. Hack Deface Song ║
	echo ║       0. Back       ║
	echo ╚═════════════════════╝
		set /p plays= [+] : 
			if %plays% == 1 goto hackmus
			if %plays% == 0 goto Main
			echo Wrong...
				timeout 2 >nul
				goto song




:hackmus
start Tools\Song\HackMus.mp3
	goto song



:darkddos
start Tools\DarkMagic
	goto Main




:credits
echo.
	echo ╔═════════════════════════════════════╗
	echo ║ Author = NothingGL                  ║
	echo ║ Version = 3.0                       ║
	echo ║ Discord: NothingGL#1053             ║
	echo ║ This is my very simple Multi Tools! ║
	echo ║            0. Back                  ║
	echo ╚═════════════════════════════════════╝
	echo.
		set /p er=[+] : 
		if %er% == 0 goto Main
		echo Wrong...
			timeout 2 >nul
			goto credits



:googles
title - Multi website -
	color 3
	cls
		echo.
		echo ██╗    ██╗███████╗██████╗ ███████╗██╗████████╗███████╗
		echo ██║    ██║██╔════╝██╔══██╗██╔════╝██║╚══██╔══╝██╔════╝
		echo ██║ █╗ ██║█████╗  ██████╔╝███████╗██║   ██║   █████╗  
		echo ██║███╗██║██╔══╝  ██╔══██╗╚════██║██║   ██║   ██╔══╝  
		echo ╚███╔███╔╝███████╗██████╔╝███████║██║   ██║   ███████╗
		echo  ╚══╝╚══╝ ╚══════╝╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚══════╝
		echo.
			echo ╔═════════════════════════╗
			echo ║ 1. List Website         ║
			echo ║ 2. Another website      ║
			echo ║ 0. Back to Main         ║
			echo ╚═════════════════════════╝
			echo.
				set /p listweb=[+] Night: 
				if %listweb% == 1 goto listwebsites
				if %listweb% == 2 goto anotweb
				if %listweb% == 0 goto Main
					echo Wrong...
					timeout 3 >nul
						goto googles



:anotweb
title Another website
	cls
	color a
		echo.
		echo ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
		echo ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
		echo ██╔██╗ ██║██║██║  ███╗███████║   ██║   
		echo ██║╚██╗██║██║██║   ██║██╔══██║   ██║   
		echo ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   
		echo ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
		echo.
		echo 0. Back to Main
		echo.
			echo Example: [ [+] Night: youtube ]
			echo.
			set /p an=[+] Night: 
			if %an% == 0 goto Main
			echo List: [ com/to/id/go.id/xys etc ]
			echo Example: [ [+] Night: com ]
				echo.
				echo.
				set /p dom=[+] Night: 
				start https://www.%an%.%dom%/
				echo Open [ %an% ]
				echo Wait...
					timeout 3 >nul
						goto anotweb

:listwebsites
title List website
cls
echo.
echo ██╗    ██╗███████╗██████╗ ███████╗██╗████████╗███████╗
echo ██║    ██║██╔════╝██╔══██╗██╔════╝██║╚══██╔══╝██╔════╝
echo ██║ █╗ ██║█████╗  ██████╔╝███████╗██║   ██║   █████╗  
echo ██║███╗██║██╔══╝  ██╔══██╗╚════██║██║   ██║   ██╔══╝  
echo ╚███╔███╔╝███████╗██████╔╝███████║██║   ██║   ███████╗
echo  ╚══╝╚══╝ ╚══════╝╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚══════╝
echo.
echo ╔════════════════════════════════╗
echo ║ 1. Google                      ║
echo ║ 2. Youtube                     ║
echo ║ 3. Icons List                  ║
echo ║ 4. Credit Crard Generator      ║
echo ║ 5. Bulk Credit card Generator  ║
echo ║ 6. C99 Free API's              ║
echo ║ 7. GitHub                      ║
echo ║ 8. Check Host/Server           ║
echo ║ 9. Logo Generator              ║
echo ║ 10. Twitter                    ║
echo ║ 11. Facebook                   ║
echo ║ 12. Instagram                  ║
echo ║ 13. Twitch                     ║
echo ║ 14. Discord                    ║
echo ║ 0. Back...................     ║
echo ╚════════════════════════════════╝
set /p listw=[+] Night: 
if %listw% == 1 goto wgoogle
if %listw% == 2 goto wyoutube
if %listw% == 3 goto wicons
if %listw% == 4 goto wccgen
if %listw% == 5 goto wbccgen
if %listw% == 6 goto wc99
if %listw% == 7 goto wgithub
if %listw% == 8 goto wcheckh
if %listw% == 9 goto wlogogen
if %listw% == 10 goto wtwi
if %listw% == 11 goto wfb
if %listw% == 12 goto wig
if %listw% == 13 goto wtwit
if %listw% == 14 goto wdisc
if %listw% == 0 goto Main
echo Wrong...
timeout 3 >nul
goto listwebsites



:wdisc
start https://discord.com/
	goto listwebsites




:wgoogle
start https://www.google.com/
	goto listwebsites






:wyoutube
start https://www.youtube.com/
	goto listwebsites




:wicons
start https://icons8.com/
	goto listwebsites





:wccgen
start https://herramientas-online.com/credit-card-generator-with-name.php
	goto listwebsites





:wbccgen
start https://cardgenerator.io/bulk-credit-card-generator/
	goto listwebsites





:wc99
start https://api.c99.nl/
	goto listwebsites




:wgithub
start https://github.com/
	goto listwebsites




:wcheckh
set /p ipcheck=[+] IP TO CHECK: 
	echo.
	echo Methods: [ tcp, udp, info, ping, dns, http ]
	echo.
		set /p methods=[+] METHODS: 
		start https://check-host.net/check-%methods%?host=%ipcheck%
			goto listwebsites




:wlogogen
start https://cooltext.com/Render-Image?RenderID=358125636485445&LogoId=3581256364
	goto listwebsites




:wtwi
start https://twitter.com/
	goto listwebsites






:wfb
start https://www.facebook.com/
	goto listwebsites






:wig
start https://www.instagram.com/
	goto listwebsites





:wtwit
start https://www.twitch.tv/
	goto listwebsites






:passwifiview
echo.
	echo ╔═════════════════════════╗
	echo ║ 1. Yes, Continue....... ║
	echo ║ 0. Back............     ║
	echo ╚═════════════════════════╝
	echo.
		set /p pwv=[+] Choose: 
			if %pwv% == 1 goto knowwifi
			if %pwv% == 0 goto Main
			echo Wrong...
				timeout 3 >nul
					goto passwifiview



:knowwifi
netsh wlan show profile
	echo.
		echo Put your Target wifi
		echo.
			set /p targets=[+] target: 
			netsh wlan show profile %targets% key=clear
			echo.
			echo     [  Key Content is password  ]
			echo.
			pause
				goto Main





:bigtexts
start http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
	goto Main




:web_crasher
Title Website Crasher
	color a
		echo Enter the website you would like to crash
		set input=
		set /p input=Enter your Website here:
		if %input%==goto A if NOT B
		echo Enter the number of attempts
		set input-attemps=
		set /p input=Enter your Amount here:
			if %input-attemps%==goto A if NOT B
			echo Processing Your request
			ping localhost>nul
			ping localhost>nul
				cls
				echo ------------------------
				echo PRESS CRTL + C TO END!!
				echo ------------------------
					goto website_crasher_main



:website_crasher_main
ping %input% -t -l %input-attemps%

goto:eof

:Cyb3r
python C:/Users/User/Cyb3rtech-Tool/cyb3rtech.py

:Raptor
python C:\Users\%USERPROFILE%\Documents\Raptor.py