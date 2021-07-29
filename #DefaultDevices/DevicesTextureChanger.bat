@echo off
set Version=1.0
rem --------------------------------
rem by Venomalia
rem --------------------------------
setlocal EnableDelayedExpansion


cd /d "%~dp0"
if not exist "#DefaultDevices" CD ..
if not exist "#DefaultDevices" (
echo #DefaultDevices folder not found...
timeout /t 15
exit
)

:Start
cls
echo UniversalDynamicInput - Devices texture changer %Version%
echo Which device textures should be exchanged?
echo 0: Exit
echo 1: Xinput
if exist "#DefaultDevices\*_backup" echo r: reset all to default

set /p answer=select an option: 
if /I "%answer%"=="0" exit
if /I "%answer%"=="1" goto AXinput
if /I "%answer%"=="r" if exist "#DefaultDevices\*_backup" goto :ResetAll

goto Start

:AXinput
set name=XBOX ONE
cls
echo which textures should be used for xinput devices?
echo 0: Back
echo 1: DualShock4
if exist "#DefaultDevices\%name%_backup" echo r: %name% (default)

set /p answer=select an option: 
if /I "%answer%"=="0" goto Start
if /I "%answer%"=="1" goto XinputToPS4
if /I "%answer%"=="r" CALL :ResetX "%name%"

goto AXinput

:ResetAll
FOR /D /r %%A IN ("#DefaultDevices\*_backup") DO (
set string=%%~nA
CALL :ResetX "!string:~0,-7!"
)
echo all restored to default values.
timeout /t 5
goto Start
:ResetX
SETLOCAL
FOR /D /r %%G IN (*%1_backup) DO (
set string=%%G
RMDIR "!string:~0,-7!" /s /q
ren "%%G" %1
)
echo %1 restored to default values.
ENDLOCAL
EXIT /B 0

:XinputToPS4
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G exit

if exist "%%G\..\DualShock4_backup" (
xcopy "%%G\..\DualShock4_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\DualShock4" "%%G\..\%name%" /s /e /q /i /y
)

set string=%%~pG
if "!string:#DefaultDevices\=!"=="!string!" (
ren "%%G\Cross.png" "Button A.png"
ren "%%G\Circle.png" "Button B.png"
ren "%%G\Square.png" "Button X.png"
ren "%%G\Triangle.png" "Button Y.png"
ren "%%G\L1.png" "Shoulder L.png"
ren "%%G\L2.png" "Trigger L.png"
ren "%%G\L3.png" "Thumb L.png"
ren "%%G\R1.png" "Shoulder R.png"
ren "%%G\R2.png" "Trigger R.png"
ren "%%G\R3.png" "Thumb R.png"
ren "%%G\Options.png" "Start.png"
ren "%%G\Share.png" "Back.png"
ren "%%G\PS.png" "Guide.png"
) ELSE (
FOR /D %%S IN ("%%G\*") DO (
ren "%%S\Cross.png" "Button A.png"
ren "%%S\Circle.png" "Button B.png"
ren "%%S\Square.png" "Button X.png"
ren "%%S\Triangle.png" "Button Y.png"
ren "%%S\L1.png" "Shoulder L.png"
ren "%%S\L2.png" "Trigger L.png"
ren "%%S\L3.png" "Thumb L.png"
ren "%%S\R1.png" "Shoulder R.png"
ren "%%S\R2.png" "Trigger R.png"
ren "%%S\R3.png" "Thumb R.png"
ren "%%S\Options.png" "Start.png"
ren "%%S\Share.png" "Back.png"
ren "%%S\PS.png" "Guide.png"
)
)

)
cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start

