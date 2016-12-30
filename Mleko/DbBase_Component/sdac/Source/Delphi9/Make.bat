@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 9
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\BDS\3.0
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 9 WIN32
call ..\Make.bat Delphi 9 CLR
