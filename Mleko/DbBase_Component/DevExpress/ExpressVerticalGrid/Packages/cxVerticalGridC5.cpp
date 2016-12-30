//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("cxVerticalGridC5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("vclx50.bpi");
USEPACKAGE("vcldb50.bpi");
USEPACKAGE("cxEditorsC5.bpi");
USEPACKAGE("cxExtEditorsC5.bpi");
USEPACKAGE("cxLibraryVCLC5.bpi");
USEPACKAGE("cxExportC5.bpi");
USEPACKAGE("cxDataC5.bpi");
USEPACKAGE("dxThemeC5.bpi");
USEUNIT("cxDBVGrid.pas");
USEUNIT("cxExportVGLink.pas");
USEUNIT("cxOI.pas");
USEFORMNS("cxOICollectionEd.pas", Cxoicollectioned, cxCollectionEditor);
USEFORMNS("cxOIPictureEd.pas", Cxoipictureed, cxfmPictureEditor);
USEFORMNS("cxOIStringsEd.pas", Cxoistringsed, cxfmStringsEditor);
USEUNIT("cxVGrid.pas");
USEUNIT("cxVGridConsts.pas");
USEFORMNS("cxVGridNewCategory.pas", Cxvgridnewcategory, fmCreateCategory);
USEUNIT("cxVGridUtils.pas");
USEUNIT("cxVGridViewInfo.pas");
USEUNIT("cxVGridStyleSheetPreview.pas");
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
