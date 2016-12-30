unit Temp0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ActnList;

type
  TfmTemp0 = class(TMlekoForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTemp0: TfmTemp0;
  function TempDLG: Integer;

implementation

{$R *.DFM}

function TempDLG;
begin
 fmTemp0:=TfmTemp0.Create(Application);
 try
 if fmTemp0.ShowModal=mrOk then
  begin
   try
    Result:=StrToInt(fmTemp0.Edit1.Text)-1;
   except
    on EConvertError do
     begin
      MessageDlg('Некорректная цифра',mtError,[mbOk],0);
      Result:=0;
     end;
   end;
  end
 else
  Result:=0;
 finally
 fmTemp0.Free;
 end;
end;


end.
