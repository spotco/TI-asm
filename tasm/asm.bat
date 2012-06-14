echo Syntax: asm [NAME (w/o extension)] [PATH]

@echo off
echo ----- Assembling %1 for the TI-83 Plus...
echo #define TI83P >temp.z80
if exist %2%1.z80 type %2%1.z80 >>temp.z80
if exist %2%1.asm type %2%1.asm >>temp.z80
tasm -80 -i -b -l temp.z80 %1.bin %2%1.xlt
if errorlevel 1 goto ERRORS
devpac8x %1
copy %1.8xp %2%1.8xp >nul
echo ----- Assembling %1 for the TI-83...
echo #define TI83 >temp.z80
if exist %2%1.z80 type %2%1.z80 >>temp.z80
if exist %2%1.asm type %2%1.asm >>temp.z80
tasm -80 -i -b -l temp.z80 %1.bin %2%1.8lt
if errorlevel 1 goto ERRORS
devpac83 %1
copy %1.83p %2%1.83p >nul
echo ----- Success!
echo TI-83 version is %1.83p
echo TI-83 Plus version is %1.8xp
goto DONE
:ERRORS
echo ----- There were errors.
:DONE
del temp.z80 >nul
del %1.bin >nul