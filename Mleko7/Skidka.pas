unit Skidka;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, RxCurrEdit, ExtCtrls, rxToolEdit, ActnList;

type
  TfmSkid = class(TMlekoForm)
    ceSkid: TCurrencyEdit;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    rgSkidka: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TSkidRet = record
   Kol    :Double;
   All    :boolean;
end;

var
  fmSkid: TfmSkid;
  function GetSkidka:TSkidRet;
implementation

{$R *.DFM}
function GetSkidka:TSkidRet;
begin
 Result.Kol:=0;
 Result.All:=False;
 fmSkid:=TfmSkid.Create(Application);
 try
 if fmSkid.ShowModal=mrOk then
  begin
   Result.Kol:=fmSkid.ceSkid.Value;
   if fmSkid.rgSkidka.ItemIndex=0 then Result.All:=True else Result.All:=False;
  end;
 finally
 fmSkid.Free;
 end;
end;

end.
