@echo off
echo.
echo  旼컴컴컴컴컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo  � MirageOS Batch File � Type: "mirage PROGNAME" (No Ext.) �
echo  읕컴컴컴컴컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo.
if exist %1.z80 tasm -80 -i -b %1.z80 %1.bin
if exist %1.asm tasm -80 -i -b %1.asm %1.bin
if errorlevel 1 goto errors
devpac8X %1
goto exit
:errors
echo !! There were errors !!
:exit
echo.
del %1.lst >> nul
del %1.bin >> nul
