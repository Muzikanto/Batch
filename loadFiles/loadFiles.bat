@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set mypath=%cd%
cd /d d:\

if not exist "%mypath%\copy" mkdir "%mypath%\copy"
set "index=0"
for /F "tokens=*" %%a in  (%mypath%\findFiles.txt) do (
    if not exist "%mypath%\copy\!index!" mkdir "%mypath%\copy\!index!"
    set file=%%a
    echo Find file: !file!
    dir /b /s \!file! > %mypath%\copy\!index!listFiles.txt

    set "counter=0"
    for /f "tokens=*" %%f in  (%mypath%\copy\!index!listFiles.txt) do (
        set /a "counter+=1"
        copy "%%f" "%mypath%\copy\!index!\!file!"
        ren "%mypath%\copy\!index!\!file!" "!counter!!file!"
    )
    set /a "index+=1"
)
exit



curl -F "load_data=@%%f" -H "Content-Type: multipart/form-data" -X POST "localhost:3001/api/bat_load" > result.txt
DEL result.txt