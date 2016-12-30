unit InOutCash0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ActnList;

type
  TfmInOutCash = class(TMlekoForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    NumericEdit: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInOutCash: TfmInOutCash;
  function InOutCash(CaptionForm: String):String;

implementation

{$R *.dfm}

function InOutCash(CaptionForm: String):String;
var
 TempStr: String;
 DelChar, Cycle: Integer;
begin
 Result:='';
 TempStr:='';
 fmInOutCash:=TfmInOutCash.Create(Application);
 try
 with fmInOutCash do
  begin
   Label1.Caption:=CaptionForm;
   NumericEdit.Text:='0.00';
   if fmInOutCash.ShowModal=mrOk then
    begin
     if StrToFloat(NumericEdit.Text)<>0 then
      begin
       TempStr:=NumericEdit.Text;
       DelChar:=0;
       for Cycle:=1 to Length(TempStr) do
        begin
         if Pos(',', TempStr) > 0 then DelChar:=Pos(',', TempStr);
        end;
       if DelChar=0 then
        Result:=TempStr+'00'
       else
        Result:=Copy(TempStr,0,DelChar-1)+Copy(TempStr,DelChar+1,Length(TempStr));
      end
     else
      Result:='';
    end;
  end;
 finally
 fmInOutCash.Free;
 end;

end;

end.
