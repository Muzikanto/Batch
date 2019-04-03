@echo off
echo Set WshShell = CreateObject("WScript.Shell") >start.vbs
echo WshShell.Run "cmd.exe /c loadFiles.bat", 0, false>>start.vbs
cscript start.vbs
exit