@echo off
set Version=1.3
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
echo 1: Xinput (XBOX ONE)
echo 2: Xinput (Linux-XBOX 360)
echo 3: DualShock
if exist "#DefaultDevices\*_backup" echo r: reset all to default

set /p answer=select an option: 
if /I "%answer%"=="0" exit
if /I "%answer%"=="1" goto AXinput
if /I "%answer%"=="2" goto AXinput360
if /I "%answer%"=="3" goto ADualShock
if /I "%answer%"=="r" if exist "#DefaultDevices\*_backup" goto :ResetAll

goto Start

:AXinput
set name=XBOX ONE
cls
echo which textures should be used for xinput devices?
echo 0: Back
echo 1: XBOX 360
echo 2: DualShock3
echo 3: DualShock4
echo 4: Generic
echo 5: Switch Pro Controller ( A=B, B=A, Y=X, X=Y")
if exist "#DefaultDevices\%name%_backup" echo r: %name% (default)

set /p answer=select an option: 
if /I "%answer%"=="0" goto Start
if /I "%answer%"=="1" goto XinputTo360
if /I "%answer%"=="2" goto XinputToPS3
if /I "%answer%"=="3" goto XinputToPS4
if /I "%answer%"=="4" goto XinputToGeneric
if /I "%answer%"=="5" goto XinputToPro
if /I "%answer%"=="r" CALL :ResetX "%name%"

goto AXinput

:AXinput360
set name=XBOX 360
cls
echo which textures should be used for xinput devices?
echo 0: Back
echo 1: DualShock3
echo 2: DualShock4
echo 3: Generic
echo 4: Switch Pro Controller ( A=B, B=A, Y=X, X=Y")
if exist "#DefaultDevices\%name%_backup" echo r: %name% (default)

set /p answer=select an option: 
if /I "%answer%"=="0" goto Start
if /I "%answer%"=="1" goto XinputToPS3
if /I "%answer%"=="2" goto XinputToPS4
if /I "%answer%"=="3" goto XinputToGeneric
if /I "%answer%"=="4" goto XinputToPro
if /I "%answer%"=="r" CALL :ResetX "%name%"

goto AXinput

:ADualShock
set name=DualShock4
cls
echo which textures should be used for xinput devices?
echo 0: Back
echo 1: DualShock3
if exist "#DefaultDevices\%name%_backup" echo r: %name% (default)

set /p answer=select an option: 
if /I "%answer%"=="0" goto Start
if /I "%answer%"=="1" goto DualShock3
if /I "%answer%"=="r" CALL :ResetX "%name%"

goto ADualShock

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

:Error
echo write error, try again with administrator rights!
timeout /t 12
exit

:DualShock3
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

if exist "%%G\..\DualShock3_backup" (
xcopy "%%G\..\DualShock3_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\DualShock3" "%%G\..\%name%" /s /e /q /i /y
)

robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl
)

cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start

:XinputTo360
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

if exist "%%G\..\XBOX 360_backup" (
xcopy "%%G\..\XBOX 360_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\XBOX 360" "%%G\..\%name%" /s /e /q /i /y
)

robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl
)


cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start

:XinputToPS3
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

if exist "%%G\..\DualShock4_backup" (
xcopy "%%G\..\DualShock4_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\DualShock4" "%%G\..\%name%" /s /e /q /i /y
)

if exist "%%G\..\DualShock3_backup" (
xcopy "%%G\..\DualShock3_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\DualShock3" "%%G\..\%name%" /s /e /q /i /y
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
ren "%%G\Touchpad.png" "Share.png"
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
ren "%%G\Touchpad.png" "Share.png"
)
)
robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl

)

cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start



:XinputToPS4
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

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
ren "%%G\Touchpad.png" "Share.png"
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
ren "%%G\Touchpad.png" "Share.png"
)
)
robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl

)

cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start

:XinputToGeneric
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

if exist "%%G\..\Generic_backup" (
xcopy "%%G\..\Generic_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\Generic" "%%G\..\%name%" /s /e /q /i /y
)

set string=%%~pG
if "!string:#DefaultDevices\=!"=="!string!" (
ren "%%G\SOUTH.png" "Button A.png"
ren "%%G\EAST.png" "Button B.png"
ren "%%G\WEST.png" "Button X.png"
ren "%%G\NORTH.png" "Button Y.png"
ren "%%G\TL.png" "Shoulder L.png"
ren "%%G\TL2.png" "Trigger L.png"
ren "%%G\TR.png" "Shoulder R.png"
ren "%%G\TR2.png" "Trigger R.png"
ren "%%G\START.png" "Start.png"
ren "%%G\SELECT.png" "Back.png"
ren "%%G\Dolphin.png" "Guide.png"
ren "%%G\E1.png" "Share.png"
) ELSE (
FOR /D %%S IN ("%%G\*") DO (
ren "%%S\SOUTH.png" "Button A.png"
ren "%%S\EAST.png" "Button B.png"
ren "%%S\WEST.png" "Button X.png"
ren "%%S\NORTH.png" "Button Y.png"
ren "%%S\TL.png" "Shoulder L.png"
ren "%%S\TL2.png" "Trigger L.png"
ren "%%S\TR.png" "Shoulder R.png"
ren "%%S\TR2.png" "Trigger R.png"
ren "%%S\START.png" "Start.png"
ren "%%S\SELECT.png" "Back.png"
ren "%%S\Dolphin.png" "Guide.png"
ren "%%S\E1.png" "Share.png"
)
xcopy "%%G\Flat" "%%G\Defaultstyle" /s /e /q /i /y
xcopy "%%G\Flat_Pressed" "%%G\Defaultstyle_Pressed" /s /e /q /i /y
xcopy "%%G\Simple-Default" "%%G\Text-Default" /s /e /q /i /y
xcopy "%%G\Simple-Default" "%%G\Text-Outlines" /s /e /q /i /y
)
robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl

)

cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start

:XinputToPro
FOR /D /r %%G IN (*"%name%") DO (

if not exist "%%G_backup" (
ren "%%G" "%name%_backup"
) ELSE (
rmdir /Q /S "%%G"
)
if exist %%G goto Error

if exist "%%G\..\Switch_Pro Controller_backup" (
xcopy "%%G\..\Switch_Pro Controller_backup" "%%G\..\%name%" /s /e /q /i /y
) ELSE (
xcopy "%%G\..\Switch_Pro Controller" "%%G\..\%name%" /s /e /q /i /y
)

set string=%%~pG
if "!string:#DefaultDevices\=!"=="!string!" (
ren "%%G\Button B.png" "Button A.png"
ren "%%G\Button A.png" "Button B.png"
ren "%%G\Button Y.png" "Button X.png"
ren "%%G\Button X.png" "Button Y.png"
ren "%%G\L.png" "Shoulder L.png"
ren "%%G\ZL.png" "Trigger L.png"
ren "%%G\R.png" "Shoulder R.png"
ren "%%G\ZR.png" "Trigger R.png"
ren "%%G\Button +.png" "Start.png"
ren "%%G\Button -.png" "Back.png"
ren "%%G\Home.png" "Guide.png"
) ELSE (
FOR /D %%S IN ("%%G\*") DO (
ren "%%S\Button B.png" "Button A.png"
ren "%%S\Button A.png" "Button B.png"
ren "%%S\Button Y.png" "Button X.png"
ren "%%S\Button X.png" "Button Y.png"
ren "%%S\L.png" "Shoulder L.png"
ren "%%S\ZL.png" "Trigger L.png"
ren "%%S\R.png" "Shoulder R.png"
ren "%%S\ZR.png" "Trigger R.png"
ren "%%S\Button +.png" "Start.png"
ren "%%S\Button -.png" "Back.png"
ren "%%S\Home.png" "Guide.png"
)
)
robocopy "%%G\..\%name%_backup" "%%G" /e /xc /xn /xo /njh /njs /ndl /nc /ns /np /nfl

)

cls
echo %name%, Devices textures changed!
timeout /t 10
goto Start