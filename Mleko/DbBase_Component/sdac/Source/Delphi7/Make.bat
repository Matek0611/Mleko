@echo off
rem **********************************************************************
rem *
rem * Sdac for Delphi 7
rem *
rem **********************************************************************

set IdeDir="C:\Program Files\Borland\Delphi7
del /Q/S SDAC\*.*
call ..\Make.bat Delphi 7
