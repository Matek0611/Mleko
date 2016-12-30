unit BlockDate0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB,
  citCtrls, citmask, citDBCalendar, ActnList;

type
  TfmBlockDate = class(TMlekoForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    mdDate: TCitDBDateEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBlockDate: TfmBlockDate;
  procedure BlockDate;

implementation
uses data;

{$R *.dfm}
procedure BlockDate;
var
 VerifeDate: String;
begin
 fmBlockDate:=TfmBlockDate.Create(Application);
 try
 dmDataModule.quSetup.Close;
 dmDataModule.quSetup.Open;
// fmBlockDate.mdDate.Text:=DateToStr(dmDataModule.quSetupDateBlock.AsDateTime);
 fmBlockDate.ShowModal;

 if fmBlockDate.ModalResult=mrOk then
  begin
   if dmDataModule.quSetup.State in [dsEdit,dsInsert] then
    dmDataModule.quSetup.Post;
  end
 else
  begin
   if dmDataModule.quSetup.State in [dsEdit,dsInsert] then
    dmDataModule.quSetup.Cancel;
  end;
 finally
 dmDataModule.quSetup.Close;
 fmBlockDate.Free;
 end;



end;

procedure TfmBlockDate.BitBtn1Click(Sender: TObject);
begin
{ try
  StrToDate(mdDate.Text);
 except
  mdDate.Clear;
  ActiveControl:=mdDate;
  exit;
 end;}
 // Если нет except-шенов то закрываем форму

 fmBlockDate.ModalResult:=mrOK;
end;

end.
