@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 5
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\Delphi5
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 5
