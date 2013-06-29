@ECHO OFF
@setlocal
::
:: Batch File for Creating Installer 
::  - Run as an administrator
::  - Requires WiX Toolset
::

set VERSION=1.6.1
set TFDIR=C:\TreeFrog\%VERSION%
set PATH="C:\Program Files (x86)\WiX Toolset v3.7\bin";%PATH%

%~d0
cd  %~dp0

mklink /D  SourceDir %TFDIR%

:: Creates Fragment file
heat.exe dir %TFDIR% -dr INSTALLDIR -cg TreeFrogFiles -gg -out TreeFrogFiles.wxs

:: Creates installer
candle.exe TreeFrog.wxs TreeFrogFiles.wxs 
light.exe  -ext WixUIExtension -out TreeFrog-SDK-%VERSION%.msi TreeFrog.wixobj TreeFrogFiles.wixobj

rd SourceDir 
echo.
pause
