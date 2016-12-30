@echo off
rem **********************************************************************
rem *
rem * Sdac for CBuilder 6
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\CBuilder6
del /Q/S SDAC\*.*
call ..\Make.bat CBuilder 6
