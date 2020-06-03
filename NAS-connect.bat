@echo off
:: reset the lines with : to add verbose status printing

echo testing NAS drive connections status

:Start
timeout /t 3 /nobreak >NUL
if exist M:\NUL goto End
net use M: \\192.168.20.200\jelly-movies /PERSISTENT:YES
if ERRORLEVEL 1 echo jelly-movies			 [ ERROR ] && goto Start
::if ERRORLEVEL 1 goto Start
:End
echo jelly-movies 			[ UP	]

:Start2
timeout /t 3 /nobreak >NUL
if exist T:\NUL goto End2
net use T: \\192.168.20.200\jelly-tv /PERSISTENT:YES
if ERRORLEVEL 1 echo jelly-tv 			[ ERROR ] && goto Start2
::if ERRORLEVEL 1 goto Start2
:End2
echo jelly-tv 			[ UP	]

:Start3
timeout /t 3 /nobreak >NUL
if exist G:\NUL goto End3
net use G: \\192.168.20.200\games /PERSISTENT:YES
if ERRORLEVEL 1 echo games 				[ ERROR ] && goto Start3
::if ERRORLEVEL 1 goto Start3
:End3
echo games 				[ UP 	]

:Start4
timeout /t 3 /nobreak >NUL
if exist B:\NUL goto End4
net use B: \\192.168.20.200\backup /PERSISTENT:YES
if ERRORLEVEL 1 echo backup 				[ ERROR ] && goto Start4
::if ERRORLEVEL 1 goto Start4
:End4
echo backup 				[ UP 	]
::Continue

echo NAS drive connection SUCCESS!

timeout /t 30 /nobreak

::PAUSE

exit
