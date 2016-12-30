unit EditOrdersPrih0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB, ActnList;

type
  TfmEditOrdersPrih = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    deNom: TDBEdit;
    deNamePost: TDBEdit;
    deDatePlat: TDBEdit;
    deSumma: TDBEdit;
    deSpravka: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    lcBuhName: TDBLookupComboBox;
    Label6: TLabel;
    bbPrint: TBitBtn;
    procedure deNamePostEnter(Sender: TObject);
    procedure deNamePostDblClick(Sender: TObject);
    procedure deNamePostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbPrintClick(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditOrdersPrih: TfmEditOrdersPrih;
  procedure EditOrdersPrih;
implementation

uses OrdersPrih0, post0, data, qrPOrder;

{$R *.DFM}
procedure EditOrdersPrih;
begin
 fmEditOrdersPrih:=TfmEditOrdersPrih.Create(Application);
 try
 dmDataModule.quSetup.Close;
 dmDataModule.quSetup.Open;
 if StrToDate(fmEditOrdersPrih.deDatePlat.Text)<dmDataModule.quSetupDateBlock.AsDateTime then
  begin
   fmEditOrdersPrih.deNom.ReadOnly:=True;
   fmEditOrdersPrih.deDatePlat.ReadOnly:=True;
   fmEditOrdersPrih.deNamePost.ReadOnly:=True;
   fmEditOrdersPrih.deSumma.ReadOnly:=True;
   fmEditOrdersPrih.lcBuhName.ReadOnly:=True;
   fmEditOrdersPrih.deSpravka.ReadOnly:=True;
  end;
 dmDataModule.quSetup.Close;


 if fmEditOrdersPrih.ShowModal=mrOk then
  begin
   if fmOrdersPrih.quPlatP.State in [dsInsert,dsEdit] then
    fmOrdersPrih.quPlatP.Post;
  end
 else
  if fmOrdersPrih.quPlatP.State in [dsInsert,dsEdit] then
    fmOrdersPrih.quPlatP.Cancel;
 finally
 fmEditOrdersPrih.Free;
 end;
end;
procedure TfmEditOrdersPrih.deNamePostEnter(Sender: TObject);
var
 RetPost:TRetPost;
begin
 if fmOrdersPrih.quPlatPPostNo.AsInteger=0 then
  begin
   RetPost:=Post(True, True);
   if RetPost.PostNo>0 then
    begin
     fmOrdersPrih.quPlatP.Edit;
     fmOrdersPrih.quPlatPPostNo.AsInteger:=RetPost.PostNo;
     fmOrdersPrih.quPlatPName.AsString:=RetPost.NamePost;
     fmOrdersPrih.quPlatP.Post;
    end;
  end;
end;

procedure TfmEditOrdersPrih.deNamePostDblClick(Sender: TObject);
var
 RetPost:TRetPost;
begin
 RetPost:=Post(True, True);
 if RetPost.PostNo>0 then
  begin
   fmOrdersPrih.quPlatP.Edit;
   fmOrdersPrih.quPlatPPostNo.AsInteger:=RetPost.PostNo;
   fmOrdersPrih.quPlatPName.AsString:=RetPost.NamePost;
   fmOrdersPrih.quPlatP.Post;
  end;
end;

procedure TfmEditOrdersPrih.deNamePostKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key =VK_RETURN then
  deNamePostDblClick(Sender);
end;

procedure TfmEditOrdersPrih.bbPrintClick(Sender: TObject);
begin
 PrintPrihOrder(fmOrdersPrih.quPlatPPlatNo.AsInteger);
end;

procedure TfmEditOrdersPrih.Panel1Exit(Sender: TObject);
begin
 dmDataModule.quSetup.Close;
 dmDataModule.quSetup.Open;
 if StrToDate(deDatePlat.Text)>dmDataModule.quSetupDateBlock.AsDateTime then
  begin
//
  end
 else
  begin
   MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
   ActiveControl:=deDatePlat;
  end;
 dmDataModule.quSetup.Close;
end;

end.
