::2010 Revan Sopher

@echo off
title zTree Dev

:START
cls
echo   -------------------------
echo  /  zTree Developer Tools  \
echo  ===========================
echo :1: start ztree
echo :2: start zleaves
echo :3: kill all zleaves
echo :4: purge data files
echo :5: 
echo :6: configure ztreeDev
echo :7: 
echo :8: 
echo :9: help
echo :0: exit
echo  ===========================
echo  \    Revan Sopher 2010    /
echo   -------------------------

CHOICE /N /C 1234567890
cls
IF ERRORLEVEL ==10 exit
IF ERRORLEVEL ==9 GOTO HELP
::IF ERRORLEVEL ==8 
::IF ERRORLEVEL ==7 
IF ERRORLEVEL ==6 GOTO CONFIG
::IF ERRORLEVEL ==5 
IF ERRORLEVEL ==4 GOTO PURGE
IF ERRORLEVEL ==3 GOTO KILL
IF ERRORLEVEL ==2 GOTO ZLEAVES
IF ERRORLEVEL ==1 GOTO ZTREE

goto START


:HELP
cls
echo   -------------------------
echo  /  zTree Developer Tools  \
echo  ===========================
echo :1: zTreeDev help (to do)
echo :2: zTree manual
echo :
echo :
echo :
echo :
echo :
echo :
echo :
echo :0: back
echo  ===========================
echo  \    Revan Sopher 2010    /
echo   -------------------------
CHOICE /N /C 120
cls
IF ERRORLEVEL ==3 GOTO START
IF ERRORLEVEL ==2 GOTO MANUAL
goto HELP

:CONFIG
cls
echo   -------------------------
echo  /  zTree Developer Tools  \
echo  ===========================
echo :1: change active project
echo :2: change number of zLeaves
echo :
echo :
echo :
echo :
echo :
echo :
echo :
echo :0: back
echo  ===========================
echo  \    Revan Sopher 2010    /
echo   -------------------------
CHOICE /N /C 120
cls
IF ERRORLEVEL ==3 GOTO START
IF ERRORLEVEL ==2 GOTO SETNUM
IF ERRORLEVEL ==1 GOTO SETPROJ
goto CONFIG

:MANUAL
start manual.pdf
goto START

:PURGE
echo **********************************************
echo *WARNING: THIS WILL ERASE ANY DATA COLLECTED.*
echo **********************************************
CHOICE /M "Purge? "
IF ERRORLEVEL ==1 GOTO PURGEREAL
goto START
:PURGEREAL
rd /s /q data
del *.gsf
del server.eec
goto START

:KILL
echo **********************************************
echo *WARNING: THIS WILL KILL ALL RUNNING ZLEAVES.*
echo **********************************************
CHOICE /M "Kill? "
IF ERRORLEVEL ==2 GOTO START
IF ERRORLEVEL ==1 GOTO KILLREAL
:KILLREAL
taskkill /f /im zleaf.exe
goto START

:SETNUM
set /p number= < settings\zleafcount.dat
echo Current number of zleaves to launch: %number%
set /p file=New number of zleaves:
echo %file% > settings\zleafcount.dat
goto START

:SETPROJ
cls
echo Programs in directory:
echo ======================
dir /b programs
echo ======================
set /p current= < settings\currentproject.dat
echo Current zTree project: %current%
set /p file=New zTree project name:
echo %file% > settings\currentproject.dat
goto START

:ZLEAVES
set /p count= < settings\zleafcount.dat
set loop=0
:ZLEAFLOOP
start zleaf.exe /name %loop% /size 1280x1024
set /a loop+=1
PING 1.1.1.1 -n 1 -w 2000 >NUL
IF %loop% lss %count% goto ZLEAFLOOP
goto START

:ZTREE
mkdir data
set /p file= < settings\currentproject.dat
start ztree.exe /dir data programs/%file%
goto START
