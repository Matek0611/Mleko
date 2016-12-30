
//////////////////////////////////////////////////
//  SQLServer Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  SDAC Package for C++ Builder 5
//////////////////////////////////////////////////

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USEPACKAGE("dcldb50.bpi");
USEUNIT("..\Design\MSReg.pas");
USEUNIT("..\Design\MSDesign.pas");
USERES("dclsdac50.res");
USEPACKAGE("sdac50.bpi");
USEPACKAGE("VCL50.bpi");
USEPACKAGE("VCLDB50.bpi");
USEPACKAGE("dcldac50.bpi");
USEPACKAGE("DAC50.bpi");
USEPACKAGE("VclJpg50.bpi");
USEUNIT("..\Design\MSMenu.pas");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
    return 1;
}
//---------------------------------------------------------------------------
