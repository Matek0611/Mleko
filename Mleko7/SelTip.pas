unit SelTip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, ActnList;

type
  TfmSelectTip = class(TMlekoForm)
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    cbNal: TCheckBox;
    cbNalBn: TCheckBox;
    GroupBox1: TGroupBox;
    cbBank1: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectTip: TfmSelectTip;
  function SelectTip:string;
implementation

uses data;

{$R *.DFM}
function SelectTip:string;
begin
 fmSelectTip:=TfmSelectTip.Create(Application);
 try
 with fmSelectTip do
  begin
   dmDataModule.quTipNakl.Open;
   if dmDataModule.quTipNakl.Locate('TipNo',1,[]) then
    cbNal.Caption:=dmDataModule.quTipNaklTipName.AsString;
   if dmDataModule.quTipNakl.Locate('TipNo',2,[]) then
    cbNalBn.Caption:=dmDataModule.quTipNaklTipName.AsString;
   if dmDataModule.quTipNakl.Locate('TipNo',3,[]) then
    cbBank1.Caption:=dmDataModule.quTipNaklTipName.AsString;
   dmDataModule.quTipNakl.Close;
  end;
 if fmSelectTip.ShowModal <> mrOK then exit;
 Result:='(';
 if fmSelectTip.cbNal.Checked then Result:=Result+'1';
 if fmSelectTip.cbNalBn.Checked then
  begin
   if fmSelectTip.cbNal.Checked then Result:=Result+',2'
   else Result:=Result+'2';
  end;
 if fmSelectTip.cbBank1.Checked then
  begin
   if Length(Result)>1 then
    Result:=Result+',3'
   else
    Result:=Result+'3';
  end;
 Result:=Result+')';
 if Length(Result)=2 then Result:='';
 finally
 fmSelectTip.Free;
 end;
end;

end.
