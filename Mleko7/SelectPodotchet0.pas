unit SelectPodotchet0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmSelectPodotchet = class(TMlekoForm)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    cbDate: TCheckBox;
    cbSotrud: TCheckBox;
    cbPost: TCheckBox;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    procedure cbDateClick(Sender: TObject);
    procedure cbSotrudClick(Sender: TObject);
    procedure cbPostClick(Sender: TObject);
  private
    { Private declarations }
    DateBegin:TDateTime;
    DateEnd  :TDateTime;
    PostNo   :integer;
    SotrudNo   :integer;
  public
    { Public declarations }
  end;

type TRetSelectPodotchet=record
     DateBegin:TDateTime;
     DateEnd  :TDateTime;
     PostNo   :integer;
     SotrudNo   :integer;
end;
var
  fmSelectPodotchet: TfmSelectPodotchet;
  function SelectPodotchet:TRetSelectPodotchet;

implementation

uses GetDate0, post0, Sotrud0;

{$R *.dfm}

function SelectPodotchet:TRetSelectPodotchet;
begin
 Result.DateBegin:=0;
 Result.DateEnd:=0;
 Result.PostNo:=-1;
 Result.SotrudNo:=-1;
 fmSelectPodotchet:=TfmSelectPodotchet.Create(Application);
 try
// fmSelectExpedition.CarsNo:=0;
 if fmSelectPodotchet.ShowModal=mrOk then
  begin
   Result.DateBegin:=fmSelectPodotchet.DateBegin;
   Result.DateEnd:=fmSelectPodotchet.DateEnd;
   Result.PostNo:=fmSelectPodotchet.PostNo;
   Result.SotrudNo:=fmSelectPodotchet.SotrudNo;
  end;
 finally
 fmSelectPodotchet.Free;
 end;
end;

procedure TfmSelectPodotchet.cbDateClick(Sender: TObject);
var
 Period:TPeriodDate;
begin
 if cbDate.Checked then
  begin
   Period:=ZapDate(2);
   fmSelectPodotchet.DateBegin:=Period[1];
   fmSelectPodotchet.DateEnd:=Period[2];
   if Period[1]=0 then
    begin
     fmSelectPodotchet.DateBegin:=0;
     fmSelectPodotchet.DateEnd:=0;
     cbDate.Checked:=False;
    end;
  end
 else
  begin
   fmSelectPodotchet.DateBegin:=0;
   fmSelectPodotchet.DateEnd:=0;
  end;
end;

procedure TfmSelectPodotchet.cbSotrudClick(Sender: TObject);
begin
 if cbSotrud.Checked then
  SotrudNo:=Sotrud(True)
 else
  SotrudNo:=0;
 if SotrudNo=0 then
  cbSotrud.Checked:=False;
end;

procedure TfmSelectPodotchet.cbPostClick(Sender: TObject);
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

end.
