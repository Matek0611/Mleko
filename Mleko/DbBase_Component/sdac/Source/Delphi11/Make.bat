@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 11
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\CodeGear\RAD Studio\5.0
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 11 WIN32
call ..\Make.bat Delphi 11 CLR
