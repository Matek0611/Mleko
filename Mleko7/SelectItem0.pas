unit SelectItem0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectItem = class(TMlekoForm)
    RadioGroup1: TRadioGroup;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
  private
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
  Result:=fmSelectItem.RadioGroup1.ItemIndex;
 finally
 fmSelectItem.Free;
 end;
end;
end.
