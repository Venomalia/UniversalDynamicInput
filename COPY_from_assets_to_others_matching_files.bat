
@echo off
set "source=#Assets"
set "target=.\"


for /D /R "%~dp0%target%" %%D in ("*") do xcopy /Y /u "%~dp0%source%\*.json" "%%~D\"
