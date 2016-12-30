unit SelPlat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectPlat = class(TMlekoForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbDate: TCheckBox;
    cbPost: TCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    procedure cbPostClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
  private
    { Private declarations }
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
  public
    { Public declarations }
  end;
type TRetSelPlat=record
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
     BuhTip   :String;
end;
var
  fmSelectPlat: TfmSelectPlat;
  function SelectPlat:TRetSelPlat;

implementation

uses GetDate0, post0;

{$R *.DFM}
function SelectPlat:TRetSelPlat;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 Result.PostNo:=-1;
 fmSelectPlat:=TfmSelectPlat.Create(Application);
 try
 if fmSelectPlat.ShowModal=mrOk then
  begin
   Result.DateBegin:=fmSelectPlat.DateBegin;
   Result.DateEnd:=fmSelectPlat.DateEnd;
   Result.PostNo:=fmSelectPlat.PostNo;
  end;
 finally
 fmSelectPlat.Free;
 end;
end;

procedure TfmSelectPlat.cbPostClick(Sender: TObject);
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
 if PostNo=0 then cbPost.Checked:=False;
end;

procedure TfmSelectPlat.cbDateClick(Sender: TObject);
var
 Period:TPeriodDate;
begin
 if cbDate.Checked then
  begin
   Period:=ZapDate(2);
   fmSelectPlat.DateBegin:=Period[1];
   fmSelectPlat.DateEnd:=Period[2];
   if Period[1]=0 then
    begin
     fmSelectPlat.DateBegin:=0;
     fmSelectPlat.DateEnd:=0;
     cbDate.Checked:=False;
    end;
  end
 else
  begin
   fmSelectPlat.DateBegin:=0;
   fmSelectPlat.DateEnd:=0;
  end;
end;

end.
