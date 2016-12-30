@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 8
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\BDS\2.0
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 8 CLR
