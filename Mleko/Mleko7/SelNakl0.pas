unit SelNakl0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectNakl = class(TMlekoForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbDate: TCheckBox;
    cbPost: TCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    cbOtdel: TCheckBox;
    procedure cbPostClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure cbOtdelClick(Sender: TObject);
  private
    { Private declarations }
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
     OtdelSelect  :String;
  public
    { Public declarations }
  end;
type
     TRetSelNakl=record
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
     OtdelNo  :string;
     Return   :Boolean;
end;


var
  fmSelectNakl: TfmSelectNakl;
  function SelectNakl(OtdelNo:string; ShowOtdel: Boolean):TRetSelNakl;

implementation

uses GetDate0, post0, SelOtdel;

{$R *.DFM}
function SelectNakl(OtdelNo:string; ShowOtdel: Boolean):TRetSelNakl;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 Result.PostNo:=-1;
// Result.OtdelNo:='';
 fmSelectNakl:=TfmSelectNakl.Create(Application);
 try
 with fmSelectNakl do
  begin
   OtdelSelect:=OtdelNo;
   if ShowOtdel then
    begin
     cbOtdel.Visible:=True;
     fmSelectNakl.Height:=176;
     GroupBox1.Height:=89;
     Bevel1.Height:=105;
     bbOK.Top:=116;
     bbCancel.Top:=116;
    end
   else
    begin
     cbOtdel.Visible:=False;
     fmSelectNakl.Height:=160;
     GroupBox1.Height:=69;
     Bevel1.Height:=89;
     bbOK.Top:=100;
     bbCancel.Top:=100;
    end;
  end;
 fmSelectNakl.PostNo:=0;
 if fmSelectNakl.ShowModal=mrOk then
  begin
   Result.DateBegin:=fmSelectNakl.DateBegin;
   Result.DateEnd:=fmSelectNakl.DateEnd;
   Result.PostNo:=fmSelectNakl.PostNo;
   if OtdelNo='-1' then
    Result.OtdelNo:='(3)'
   else
    Result.OtdelNo:=fmSelectNakl.OtdelSelect;
  end;
 finally
 fmSelectNakl.Free;
 end;
end;

procedure TfmSelectNakl.cbPostClick(Sender: TObject);
var
 RetPost:TRetPost;
begin
 if cbPost.Checked then
  begin
   RetPost:=Post(True, True);
   PostNo:=RetPost.PostNo;
  end
 else
  PostNo:=0;

 if PostNo=0 then
  cbPost.Checked:=False;
end;

procedure TfmSelectNakl.cbDateClick(Sender: TObject);
var
 Period:TPeriodDate;
begin
 if cbDate.Checked then
  begin
   Period:=ZapDate(2);
   fmSelectNakl.DateBegin:=Period[1];
   fmSelectNakl.DateEnd:=Period[2];
   if Period[1]=0 then
    begin
     fmSelectNakl.DateBegin:=0;
     fmSelectNakl.DateEnd:=0;
     cbDate.Checked:=False;
    end;
  end
 else
  begin
   fmSelectNakl.DateBegin:=0;
   fmSelectNakl.DateEnd:=0;
  end;
end;

procedure TfmSelectNakl.cbOtdelClick(Sender: TObject);
begin
 if cbOtdel.Checked then
  begin
   OtdelSelect:=SelectOtdel;
   if OtdelSelect='' then
{    RetSelNakl.OtdelNo:=i
   else}
    cbOtdel.Checked:=False;
  end
 else
  OtdelSelect:='';
end;

end.
