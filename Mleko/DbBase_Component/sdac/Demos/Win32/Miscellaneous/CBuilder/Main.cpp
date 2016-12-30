//---------------------------------------------------------------------------
#include <vcl.h>  
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "MemDS"
#pragma link "DBAccess"
#pragma link "MSAccess"
#pragma link "SdacVcl"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btOpenClick(TObject *Sender)
{
  MSQuery->Open();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btCloseClick(TObject *Sender)
{
  MSQuery->Close();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btDisconnectClick(TObject *Sender)
{
  MSConnection->Disconnect();
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btExecuteClick(TObject *Sender)
{
  MSQuery->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::FormShow(TObject *Sender)
{
  meSQL->Lines->Assign(MSQuery->SQL);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::meSQLExit(TObject *Sender)
{
  if (meSQL->Lines->Text != MSQuery->SQL->Text)
    MSQuery->SQL->Assign(meSQL->Lines);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::btConnectClick(TObject *Sender)
{
  MSConnection->Connect();        
}
//---------------------------------------------------------------------------

