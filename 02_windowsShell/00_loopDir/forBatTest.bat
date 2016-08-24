setlocal enabledelayedexpansion

echo off

SET seqPath=.\batTest

set fNum=1

for /f "delims=x tokens=1,2" %%i in ('dir /b %seqPath%') do (
set width!fNum!=%%i
set height!fNum!=%%j
set /a fNum+=1
)

set FolderNum=%fNum%
echo %FolderNum%
echo %width1%
echo %height1%


set floopIndex=1
set /a floopEnd=%FolderNum%-1

:FolderLoop

echo %floopIndex%
echo !width%floopIndex%!x!height%floopIndex%!

set fileNum=1
for /f %%i in ('dir /a-d /b %seqPath%\!width%floopIndex%!x!height%floopIndex%!') do (
set file!fileNum!=%%i
set /a fileNum+=1
)


set iloopIndex=1
set /a iloopEnd=%fileNum%-1

:innnerLoop

set fileName=!file%iloopIndex%!
echo %fileName%
set mName=%fileName:~0,-4%
echo %mName%


::ADD COMMON LINE





set /a iloopIndex+=1
if %iloopIndex% LEQ %iloopEnd% goto innnerLoop



set /a floopIndex+=1
if %floopIndex% LEQ %floopEnd% goto FolderLoop



pause