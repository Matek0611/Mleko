SQL Server Data Access Components
Copyright 1997-2007, Core Lab. All Rights Reserved
--------------------------------------------------

Demo for FastReport included in SDAC was built and tested using
Fast Report 4.0.

IMPORTANT NOTE:
  Demo is provided as is, and there is no warranty that it is fully
  compatible with other versions of Fast Report.

Before using Demo you should install FastReport 4 SDAC Components.
The following instruction will help you to compile and install 
FastReport 4 SDAC Components manually using IDE.

Delphi and C++Builder for Win32
--------------------------------

Run your IDE and walk through the following steps:
  1) Compile DAC run-time package (frxDACXX.dpk)
  2) Compile SDAC run-time package (frxSDACXX.dpk)
  3) Compile and install SDAC design-time package (dclfrxSDACXX.dpk)

You can find these packages in 
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi5\*.dpk - for Delphi 5 
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi6\*.dpk - for Delphi 6 
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi7\*.dpk - for Delphi 7 
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi9\*.dpk - for Delphi 2005
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi10\*.dpk - for Delphi 2006
  Demos\Win32\ThirdParty\FastReport\FR4\Delphi11\*.dpk - for Delphi 2007
  Demos\Win32\ThirdParty\FastReport\FR4\CBuilder5\*.bpk - for C++Builder 5
  Demos\Win32\ThirdParty\FastReport\FR4\CBuilder6\*.bpk - for C++Builder 6

To compile applications based on FastReport 4 SDAC Components, add the following 
path to the "Library Path":
%SDAC%\Demos\Win32\ThirdParty\FastReport\FR4\
where %SDAC% is the SDAC installation path on your computer.