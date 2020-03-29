@ECHO OFF
TITLE MS Paint (Vista) pallette changer
echo Type the hex code of the colours you want...
echo Tips: The first should be 000000 (black) and the fifteenth should be ffffff (white)
SET /A COUNT=0
SET CUE=0a
COPY /B base.hex patch.ips >nul
:LOOP
SET /A ROW=((%COUNT% / 14) + 1) >nul
SET /A COL=((%COUNT% %% 14) + 1) >nul
SET /P COLOUR=Row %ROW%, Colour %COL%:
Hexciting -o -l 0x%CUE% 4 patch.ips 0x%COLOUR:~0,2% 0x%COLOUR:~2,2% 0x%COLOUR:~4,2% 0x00
GOTO SUBROUTINE
:CONTINUE
IF %COUNT% EQU 27 GOTO BREAK
SET /A COUNT=%COUNT%+1 >nul
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
SET /A DecNCue=%DecCue%+4
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
GOTO CONTINUE

:END