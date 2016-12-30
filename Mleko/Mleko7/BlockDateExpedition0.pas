unit BlockDateExpedition0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB,
  citCtrls, citmask, citDBCalendar, ActnList;

type
  TfmBlockDateExpedition = class(TMlekoForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource: TDataSource;
    mdDate: TCitDBDateEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBlockDateExpedition: TfmBlockDateExpedition;
  procedure BlockDateExpedition;

implementation
uses data;

{$R *.dfm}
procedure BlockDateExpedition;
var
 VerifeDate: String;
begin
 fmBlockDateExpedition:=TfmBlockDateExpedition.Create(Application);
 try
 dmDataModule.quSetupForExpedition.Close;
 dmDataModule.quSetupForExpedition.Open;
// fmBlockDate.mdDate.Text:=DateToStr(dmDataModule.quSetupDateBlock.AsDateTime);
 fmBlockDateExpedition.ShowModal;

 if fmBlockDateExpedition.ModalResult=mrOk then
  begin
   if dmDataModule.quSetupForExpedition.State in [dsEdit,dsInsert] then
    dmDataModule.quSetupForExpedition.Post;
  end
 else
  begin
   if dmDataModule.quSetupForExpedition.State in [dsEdit,dsInsert] then
    dmDataModule.quSetup.Cancel;
  end;
 finally
 dmDataModule.quSetupForExpedition.Close;
 fmBlockDateExpedition.Free;
 end;



end;

procedure TfmBlockDateExpedition.BitBtn1Click(Sender: TObject);
begin
{ try
  StrToDate(mdDate.Text);
 except
  mdDate.Clear;
  ActiveControl:=mdDate;
  exit;
 end;}
 // Если нет except-шенов то закрываем форму

 fmBlockDateExpedition.ModalResult:=mrOK;
end;

end.
