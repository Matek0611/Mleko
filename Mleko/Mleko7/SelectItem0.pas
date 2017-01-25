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
  private
    SecretKeyPressed: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectItem: TfmSelectItem;
  function SelectItem(Title:string;Value:array of string):integer;
implementation
uses main;
{$R *.DFM}
function SelectItem(Title:string;Value:array of string):integer;
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
 if IsSelectItemTTN = True Then fmSelectItem.RadioGroup1.ItemIndex:=0
                           Else fmSelectItem.RadioGroup1.ItemIndex:=0;
 if fmSelectItem.ShowModal=mrOk then
 begin
   Result:=fmSelectItem.RadioGroup1.ItemIndex;
   if fmSelectItem.SecretKeyPressed then
     Result:= EncodeSecretValue(Result, 100);
 end;
 finally
 fmSelectItem.Free;
 end;
end;
procedure TfmSelectItem.bbOkClick(Sender: TObject);
begin
  inherited;
  SecretKeyPressed:= Ctrl_Is_Down() and Shift_Is_Down();
end;

end.
