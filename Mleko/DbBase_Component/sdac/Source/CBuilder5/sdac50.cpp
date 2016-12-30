
//////////////////////////////////////////////////
//  SQLServer Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  sdac Package for C++ Builder 5
//////////////////////////////////////////////////

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("sdac50.res");

USEUNIT("..\SdacVcl.pas");              
USEUNIT("..\OLEDBAccess.pas");          
USEUNIT("..\MSAccess.pas");             
USEUNIT("..\OLEDBC.pas");               
USEUNIT("..\MSSQLMonitor.pas");         
USEUNIT("..\MSParser.pas");             
USEUNIT("..\OLEDBIntf.pas");            
USEUNIT("..\MSConsts.pas");             
USEUNIT("..\MSScript.pas");             

USEPACKAGE("dac50.bpi");
USEPACKAGE("VCL50.bpi");
USEPACKAGE("VCLDB50.bpi");
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
