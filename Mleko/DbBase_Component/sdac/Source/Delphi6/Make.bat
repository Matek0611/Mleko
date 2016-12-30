@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 6
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\Delphi6
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 6
