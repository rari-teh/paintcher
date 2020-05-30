@ECHO OFF
TITLE Palips - NT Paint PALette to IPS
IF "%1"=="" GOTO HELP
ECHO Working...
SET /A COUNT=0
SET IPSCUE=0a
SET PALCUE=18
SET TAB=	
COPY /B base.hex %2 >nul
:LOOP
FOR /F "TOKENS=2 DELIMS=%TAB%" %%i IN ('Hexciting -p -l 0x%PALCUE% 16 %1') DO SET BINSTR=%%i
Hexciting -o -l 0x%IPSCUE% 16 %2 0x%BINSTR:~0,2% 0x%BINSTR:~3,2% 0x%BINSTR:~6,2% 0x%BINSTR:~9,2% 0x%BINSTR:~12,2% 0x%BINSTR:~15,2% 0x%BINSTR:~18,2% 0x%BINSTR:~21,2% 0x%BINSTR:~24,2% 0x%BINSTR:~27,2% 0x%BINSTR:~30,2% 0x%BINSTR:~33,2% 0x%BINSTR:~36,2% 0x%BINSTR:~39,2% 0x%BINSTR:~42,2% 0x%BINSTR:~45,2%
SET CUE=%IPSCUE%
SET PLACE=IPS
GOTO SUBROUTINE
:CONTINUEIPS
SET IPSCUE=%CUE%
SET CUE=%PALCUE%
SET PLACE=PAL
GOTO SUBROUTINE
:CONTINUEPAL
SET PALCUE=%CUE%
SET /A COUNT=%COUNT%+1 >nul
IF %COUNT% EQU 7 GOTO BREAK
GOTO LOOP
:BREAK
echo Done!
GOTO END

:SUBROUTINE
REM Convert %CUE% to decimal
SET /A DecCueH=%CUE:~0,1%
SET /A DecCueU=%CUE:~1,1%
IF %CUE:~1,1%==a SET /A DecCueU=10
IF %CUE:~1,1%==b SET /A DecCueU=11
IF %CUE:~1,1%==c SET /A DecCueU=12
IF %CUE:~1,1%==d SET /A DecCueU=13
IF %CUE:~1,1%==e SET /A DecCueU=14
IF %CUE:~1,1%==f SET /A DecCueU=15
SET /A DecCueH=%DecCueH%*16
SET /A DecCue=%DecCueH%+%DecCueU%
REM Do the thing...
SET /A DecNCue=%DecCue%+16
REM ...then back to hexadecimal. If only Batch supported hex arithmetics.
SET /A DecCueH=(%DecNCue% / 16)
SET /A DecCueU=(%DecNCue% %% 16)
IF %DecCueU%==10 SET DecCueU=a
IF %DecCueU%==11 SET DecCueU=b
IF %DecCueU%==12 SET DecCueU=c
IF %DecCueU%==13 SET DecCueU=d
IF %DecCueU%==14 SET DecCueU=e
IF %DecCueU%==15 SET DecCueU=f
FOR %%i in (%DecCueH%%DecCueU%) do SET CUE=%%i
REM Don't fucking reuse this shitty code if your hexadecimals may hit 10 in the 16^1 col
IF %PLACE%==IPS GOTO CONTINUEIPS
IF %PLACE%==PAL GOTO CONTINUEPAL
ECHO If you're reading this, I'm a terrible coder. Error code: PEBCAK.
GOTO END
:HELP
echo Usage: palips palette.pal output.ips
GOTO END
:END
ECHO.
ECHO Press any key to close.
PAUSE >nul