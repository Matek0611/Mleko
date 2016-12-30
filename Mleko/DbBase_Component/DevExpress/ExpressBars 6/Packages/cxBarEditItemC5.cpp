//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("cxBarEditItem.res");
USEPACKAGE("VCL50.bpi");
USEPACKAGE("dxcomnC5.bpi");
USEPACKAGE("dxThemeC5.bpi");
USEPACKAGE("cxLibraryVCLC5.bpi");
USEPACKAGE("dxBarC5.bpi");
USEPACKAGE("cxEditorsC5.bpi");
USEPACKAGE("cxExtEditorsC5.bpi");
USEUNIT("cxBarEditItemValueEditor.pas");
USEUNIT("cxBarEditItem.pas");
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
