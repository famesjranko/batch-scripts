:: =================================================
:: Robocopy - Windows Server 2003 Resource Kit Tools
::            File transfer/sync application
:: =================================================
::
:: Explanation of the switches used:
::  /MIR  mirror the source directory and the destination directory. 
::        this will delete files at the destination if deleted at the source.
::
::  /FFT  uses fat file timing instead of NTFS. This means the granularity is a bit less precise. 
::        for across-network share operations this seems to be much more reliable.
::
::  /Z    ensures Robocopy can resume the transfer of a large file in mid-file instead of restarting.
::
::  /XA:H ignore hidden files.
::
::  /W:1  reduces the wait time between failures to 1 seconds, from 30 second default.
::
:: =================================================
@echo off

echo =================================================
echo Robocopy - Windows Server 2003 Resource Kit Tools
echo            File transfer/sync application
echo =================================================
echo.
echo WARNING: set to mirror directories
echo		- anything not in source dir will be deleted from dest dir
echo		- only continue if you know what you are doing!
echo.

setlocal
:prompt
set /p AREYOUSURE=are you sure you want to continue? (y/[n])
if /i "%AREYOUSURE%" neq "y" goto commonexit
endlocal
echo.

:promp2
set /p AREYOUSURE=backup all directories? (y/[n])
if /i "%AREYOUSURE%" neq "y" goto start1

Robocopy  "D:\andy\University"  "B:\andy\University"  /MIR /FFT /Z /XA:H /W:1
pause
Robocopy  "D:\andy\Pictures"  "B:\andy\Pictures"  /MIR /FFT /Z /XA:H /W:1
pause
Robocopy  "D:\andy\Philosophy"  "B:\andy\Philosophy"  /MIR /FFT /Z /XA:H /W:1
pause
Robocopy  "D:\andy\Music"  "B:\andy\Music"  /MIR /FFT /Z /XA:H /W:1
pause
Robocopy  "D:\andy\Documents\Personal"  "B:\andy\Documents"  /MIR /FFT /Z /XA:H /W:1
pause
Robocopy  "D:\andy\Desktop\landofoz-backup"  "B:\systems\landofoz"  /MIR /FFT /Z /XA:H /W:1
endlocal
goto commonexit
echo.

:start1
echo available backup directories:
echo		1: University
echo		2: Pictures
echo		3: Philosophy
echo		4: Music
echo		5: Personal
echo		6: LandOfOz-Backup
echo		x: exit
echo.

set /p dir=choose dir# to back up (press x to exit):
if /i "%dir%"=="1" goto university
if /i "%dir%"=="2" goto pictures
if /i "%dir%"=="3" goto philosophy
if /i "%dir%"=="4" goto music
if /i "%dir%"=="5" goto personal
if /i "%dir%"=="6" goto landofoz
if /i "%dir%"=="x" goto commonexit

echo unknown selection, try again...
cls
endlocal
goto start1

:university
Robocopy  "D:\andy\University"  "B:\andy\University"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:pictures
Robocopy  "D:\andy\Pictures"  "B:\andy\Pictures"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:philosophy
Robocopy  "D:\andy\Philosophy"  "B:\andy\Philosophy"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:music
Robocopy  "D:\andy\Music"  "B:\andy\Music"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:personal
Robocopy  "D:\andy\Documents\Personal"  "B:\andy\Documents"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:landofoz
Robocopy  "D:\andy\Desktop\landofoz-backup"  "B:\systems\landofoz"  /MIR /FFT /Z /XA:H /W:1
pause
cls
goto start1

:commonexit
echo.
echo exiting...
pause
