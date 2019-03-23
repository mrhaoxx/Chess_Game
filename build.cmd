@echo off
title qmake and nmake build prompt
if not exist build (
   md build
)
cd build
if not exist %1 (
   md %1
)
cd %1
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC
set QTDIR=D:\Software\Qt\5.12.0\msvc_static\
set PATH=%VCINSTALLDIR%\bin;%QTDIR%\bin;C:\Program Files\7-Zip;%PATH%
call "%VCINSTALLDIR%\Auxiliary\Build\vcvarsall.bat" amd64
qmake ../../%1/%1.pro -spec win32-msvc "CONFIG+=%2" "CONFIG+=qml_%2"
nmake