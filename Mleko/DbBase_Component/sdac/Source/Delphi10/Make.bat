@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 10
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\BDS\4.0
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 10 WIN32
call ..\Make.bat Delphi 10 CLR
