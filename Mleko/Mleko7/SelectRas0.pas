unit SelectRas0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectRas = class(TMlekoForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbDate: TCheckBox;
    cbPost: TCheckBox;
    cbTip: TCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    procedure cbDateClick(Sender: TObject);
    procedure cbPostClick(Sender: TObject);
    procedure cbTipClick(Sender: TObject);
  private
    { Private declarations }
    DateBegin:TDateTime;
    DateEnd  :TDateTime;
    PostNo   :integer;
    TipNakl  :String;
  public
    { Public declarations }
  end;
type
     TRetSelRas=record
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
     TipNakl  :string;
end;

var
  fmSelectRas: TfmSelectRas;
  function SelectRas:TRetSelRas;

implementation

uses GetDate0, post0, SelTip;

{$R *.dfm}

function SelectRas:TRetSelRas;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 Result.PostNo:=-1;
 Result.TipNakl:='';
 fmSelectRas:=TfmSelectRas.Create(Application);
 try
  with fmSelectRas do
   begin
    PostNo:=0;
    if ShowModal=mrOk then
     begin
      Result.DateBegin:=DateBegin;
      Result.DateEnd:=DateEnd;
      Result.PostNo:=PostNo;
      Result.TipNakl:=TipNakl;
     end;
   end;
 finally
 fmSelectRas.Free;
 end;
end;

procedure TfmSelectRas.cbDateClick(Sender: TObject);
var
 Period:TPeriodDate;
begin
 if cbDate.Checked then
  begin
   Period:=ZapDate(2);
   DateBegin:=Period[1];
   DateEnd:=Period[2];
   if Period[1]=0 then
    begin
     DateBegin:=0;
     DateEnd:=0;
     cbDate.Checked:=False;
    end;
  end
 else
  begin
   DateBegin:=0;
   DateEnd:=0;
  end;
end;

procedure TfmSelectRas.cbPostClick(Sender: TObject);
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

procedure TfmSelectRas.cbTipClick(Sender: TObject);
begin
 if cbTip.Checked then
  begin
   TipNakl:=SelectTip;
  end
 else
  TipNakl:='';
 if TipNakl='' then
  cbTip.Checked:=False;
end;

end.
