unit Setup0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, IniFiles, ExtCtrls, ActnList;

type
  TfmSetup = class(TMlekoForm)
    Memo1: TMemo;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label3: TLabel;
    edFIO: TEdit;
    Label4: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    edPrice: TEdit;
    edPriceSkid1: TEdit;
    edPriceSkid2: TEdit;
    edPriceSkid4: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSetup: TfmSetup;
  procedure Setup;
implementation

{$R *.DFM}
procedure Setup;
var
 Ini:TIniFile;
begin
 fmSetup:=TfmSetup.Create(Application);
 Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
 try
  try
  fmSetup.Memo1.Lines.LoadFromFile('Title.txt');
  except
  fmSetup.Memo1.Lines.Clear;
  end;
 fmSetup.edFIO.Text:=Ini.ReadString('Options','FIO','');
 fmSetup.edPrice.Text:=Ini.ReadString('Options','Price0','');
 fmSetup.edPriceSkid1.Text:=Ini.ReadString('Options','Price1','');
 fmSetup.edPriceSkid2.Text:=Ini.ReadString('Options','Price2','');
 fmSetup.edPriceSkid4.Text:=Ini.ReadString('Options','Price4','');
 if fmSetup.ShowModal=mrOk then
  begin
   Ini.WriteString('Options','Price0',fmSetup.edPrice.Text);
   Ini.WriteString('Options','Price1',fmSetup.edPriceSkid1.Text);
   Ini.WriteString('Options','Price2',fmSetup.edPriceSkid2.Text);
   Ini.WriteString('Options','Price4',fmSetup.edPriceSkid4.Text);
   Ini.WriteString('Options','FIO',fmSetup.edFIO.Text);
   fmSetup.Memo1.Lines.SaveToFile('Title.txt');
  end;
 finally
 Ini.Free;
 fmSetup.Free;
 end;
end;

end.
