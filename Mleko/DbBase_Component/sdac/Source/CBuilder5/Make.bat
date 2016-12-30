@echo off
rem **********************************************************************
rem *
rem * Sdac for CBuilder 5
rem *
rem **********************************************************************

set IdeDir="D:\Program Files\Borland\CBuilder5
del /Q/S SDAC\*.*
call ..\Make.bat CBuilder 5
