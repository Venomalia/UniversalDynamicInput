@echo off
if exist "XBOX ONE_backup\" goto exist

echo This will set DualShock4 as Xinput.
set /p answer= Type "yes" to proceed or "no" to exit.
if /I "%answer%"=="yes" goto XinputBackup
if /I "%answer%"=="y" goto XinputBackup
exit

:exist
echo DualShock4 is already Xinput, reset?
set /p answer= Type "yes" to proceed or "no" to exit.
if /I "%answer%"=="yes" goto :Reset
if /I "%answer%"=="y" goto :Reset
exit

:XinputBackup
ren "XBOX ONE" "XBOX ONE_backup"

:PS4Xinput
xcopy "DualShock4" "XBOX ONE" /s /e /q /i /y

FOR /D %%G IN ("XBOX ONE\*") DO (
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
)
goto EX

:Reset
RMDIR "XBOX ONE" /s /q
ren "XBOX ONE_backup" "XBOX ONE"

:EX
echo Done! Your controller has changed!
pause
exit