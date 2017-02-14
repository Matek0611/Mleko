unit SelectItem0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, Data;

type
  TfmSelectItem = class(TMlekoForm)
    RadioGroup1: TRadioGroup;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SecretKeyCode: Integer;
  public
    { Public declarations }
  end;

var
  fmSelectItem: TfmSelectItem;
  function SelectItem(Title:string; Value:array of string; Index: Integer = 0):integer;
implementation
uses MlekoUtils;

{$R *.DFM}
function SelectItem(Title:string;Value:array of string; Index: Integer = 0):integer;
var
 i:integer;
begin
 Result:=-1;
 fmSelectItem:=TfmSelectItem.Create(Application);
 try
 fmSelectItem.Caption:=Title;
 fmSelectItem.RadioGroup1.Height:=(High(Value)+1)*33;
 fmSelectItem.bbOk.Top:=fmSelectItem.RadioGroup1.Top+
                        fmSelectItem.RadioGroup1.Height+6;
 fmSelectItem.bbCancel.Top:=fmSelectItem.bbOk.Top;
 fmSelectItem.ClientHeight:=fmSelectItem.RadioGroup1.Height+1+38;
 for i:=Low(Value) to High(Value) do
  fmSelectItem.RadioGroup1.Items.Add(Value[i]);
if (Index>=0) and (Index<=High(Value)) then
   fmSelectItem.RadioGroup1.ItemIndex:=Index else
   fmSelectItem.RadioGroup1.ItemIndex:= 0;
 if fmSelectItem.ShowModal=mrOk then
 begin
   Result:= EncodeSecretValue(
   fmSelectItem.RadioGroup1.ItemIndex, fmSelectItem.SecretKeyCode);
 end;
 finally
 fmSelectItem.Free;
 end;
end;

procedure TfmSelectItem.bbOkClick(Sender: TObject);
var Ctrl_Down, Shift_Down, Alt_Down: Boolean;
begin
  inherited;
  SecretKeyCode:= 0;
  Ctrl_Down:= Ctrl_Is_Down();
  Shift_Down:= Shift_Is_Down();
  Alt_Down:= Alt_Is_Down();
  if Ctrl_Down and Shift_Down then
     SecretKeyCode:=  100 else
  if Ctrl_Down and Alt_Down then
     SecretKeyCode:=  200;
end;

procedure TfmSelectItem.FormShow(Sender: TObject);
begin
  inherited;
  if not RadioGroup1.Focused then
  Perform(WM_NEXTDLGCTL, 0, 0); // Now RadioGroup1 is focused
end;

end.
