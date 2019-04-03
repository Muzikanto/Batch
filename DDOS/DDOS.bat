set /a x = 5
:start
set /a x+=1
call "cmd /c start DDOS_SITE.bat"
if NOT %x%==250 goto start


