SQL Server Data Access Components Source Code
Copyright 1997-2007, Core Lab. All Rights Reserved

There are two ways to compile and install SDAC for Windows manually.

I. Using IDE

Delphi and C++Builder for Win32
--------------------------------

Run your IDE and walk through the folowing steps:
  1) Compile DAC run-time package (dacXX.dpk)
  2) For Delphi 6,7,2005,2006,2007 or C++Builder 6,2006,2007 compile DAC GUI related package dacvclXX.dpk
  3) Compile DAC design-time package (dcldacXX.dpk)
  4) Compile SDAC run-time package (sdacXX.dpk)
  5) For Delphi 6,7,2005,2006,2007 or C++Builder 6,2006,2007 compile SDAC GUI related package sdacvclXX.dpk
  6) Compile and install SDAC design-time package (dclsdacXX.dpk)

You can find these packages in 
  Source\Delphi5\*.dpk - for Delphi 5 
  Source\Delphi6\*.dpk - for Delphi 6 
  Source\Delphi7\*.dpk - for Delphi 7 
  Source\Delphi9\*.dpk - for Delphi 2005
  Source\Delphi10\*.dpk - for Delphi 2006
  Source\Delphi11\*.dpk - for Delphi 2007
  Source\CBuilder5\*.bpk - for C++Builder 5
  Source\CBuilder6\*.bpk - for C++Builder 6

To compile SDAC based applications, add SDAC Source directory path 
to the "Library Path".

Delphi for .NET
-----------------

Run your IDE and walk through the folowing steps:
  1) Compile DAC run-time package (CoreLab.Dac.dpk)
  2) Compile DAC design-time package (CoreLab.Dac.Design.dpk)
  3) Compile SDAC run-time package (CoreLab.Sdac.dpk)
  4) Compile SDAC run-time package (CoreLab.Sdac.AdoNet.dpk)
  5) Compile and install SDAC design-time package (CoreLab.Sdac.Design.dpk)
  6) Specify the path to compiled assembles in "Assembly Search Paths"
  7) To register the MSDataAdapter component in Delphi for .Net Tool Palette, follow 
     these steps:
     - Open Delphi for .Net and go to the "Tool Palette" window;
     - Add "SDAC" category using popup menu;
     - Select "Installed .NET Components..." from popup menu;
     - Go to the "Installed .NET Components" tab within opened dialog;
     - Check the MSDataAdapter component;
     - Press the OK button.

You can find these packages in 
  Source\Delphi8\*.dpk - for Delphi 8 
  Source\Delphi9\*.dpk - for Delphi 2005
  Source\Delphi10\*.dpk - for Delphi 2006

To compile SDAC based applications, add CoreLab.Dac and CoreLab.Sdac to 
Namespace prefixes, add SDAC Source directory path to the "Library Path" list.

II. Using make-files

Delphi and C++Builder for Win32
--------------------------------

  1) Go to one of the following folders (let's denote this folder %MakePath%):
     Source\Delphi5 - for Delphi 5 
     Source\Delphi6 - for Delphi 6 
     Source\Delphi7 - for Delphi 7
     Source\Delphi9 - for Delphi 2005
     Source\Delphi10 - for Delphi 2006
     Source\Delphi11 - for Delphi 2007
     Source\CBuilder5 - for C++Builder 5
     Source\CBuilder6 - for C++Builder 6

  2) Find in the 'make.bat' line containing 

     set IdeDir="D:\Program Files\Borland\Delphi7

     and make sure that correct path to IDE is set (always include forward
     quote and do not include ending quote)

  3) Run 'Make.bat'. Binaries will be copied to the %MakePath%\Sdac subfolder
  4) Copy %MakePath%\Sdac\*.bpl files to a folder that is included in the
     PATH environment variable
  5) Run IDE and add dclsdacXX.bpl via Component->Install Packages... menu 
  6) To compile SDAC based applications, add SDAC Source directory path 
     to the "Library Path" list

Delphi for .NET
-----------------

  1) Go to the following folders (let's denote this folder %MakePath%):
     Source\Delphi8 - for Delphi 8
     Source\Delphi9 - for Delphi 2005
     Source\Delphi10 - for Delphi 2006

  2) Find in the 'Make.bat' line containing 

     For Delphi 8:
       set IdeDir="D:\Program Files\Borland\BDS\2.0

     For Delphi 2005:
       set IdeDir="D:\Program Files\Borland\BDS\3.0

     For Delphi 2006:
       set IdeDir="D:\Program Files\Borland\BDS\4.0

     For Delphi 2007:
       set IdeDir="D:\Program Files\CodeGear\RAD Studio\5.0\

     and make sure that correct path to IDE is set (always include forward
     quote and do not include ending quote)

  3) Run 'Make.bat'. Binaries will be copied to the %MakePath%\Sdac subfolder
  4) Run IDE and add CoreLab.Sdac.Design.dll via Component->Installed
     .NET Components->.NET VCL Components->Add... menu. Specify the path to compiled assembles 
     in Component->Assembly Search Paths->Add... menu
  5) To register the MSDataAdapter component in Delphi for .Net Tool Palette, follow 
     these steps:
     - Open Delphi for .Net and go to the "Tool Palette" window;
     - Add "SDAC" category using popup menu;
     - Select "Installed .NET Components..." from popup menu;
     - Go to the "Installed .NET Components" tab within opened dialog;
     - Press "Select an Assembly" and choose CoreLab.Sdac.AdoNet.dll
     - Check MSDataAdapter component;
     - Press the OK button.
  6) To compile SDAC based applications, add CoreLab.Dac and CoreLab.Sdac to 
     Tools->Options->Environment Options->Delphi Options->Library->
     Namespace prefixes

If you need SDAC 1.30 source code for Delphi 4 or C++Builder 4
please contact us.