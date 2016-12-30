unit uAccountCashRashod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, DBCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrlsEh, rxToolEdit, rxCurrEdit, MemDS, DBAccess,
  MsAccess, ActnList;

type
  TfmAccountCashRashod = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RxDBGrid1: TRxDBGrid;
    quDolg: TMSQuery;
    dsDolg: TDataSource;
    quPlatToPlatR: TMSQuery;
    quCountPlatR: TMSQuery;
    quDolgDatePlat: TDateTimeField;
    quDolgSumma: TFloatField;
    quDolgNom: TIntegerField;
    quDolgPlatNo: TIntegerField;
    quDolgSpravka: TStringField;
    quDolgPostNo: TSmallintField;
    quDolgSummaDolg: TFloatField;
    quDolgBuh: TSmallintField;
    quDolgTipPlat: TSmallintField;
    quDolgUserNo: TSmallintField;
    quDolgName: TStringField;
    EditDate: TMaskEdit;
    quCountPlatRPlatNoMAX: TIntegerField;
    Label1: TLabel;
    cbType: TComboBox;
    ComboBox1: TComboBox;
    EditSumma: TCurrencyEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAccountCashRashod: TfmAccountCashRashod;
  PostNo: integer;
  procedure  FAccountCashRashod;


implementation

uses data, EditAccountCash;

{$R *.dfm}

procedure  FAccountCashRashod;
{var
 PostNo:integer;}
begin
 PostNo:=FEditAccountCash;
 if PostNo=0 then exit;


 fmAccountCashRashod:=TfmAccountCashRashod.Create(Application);
 try
 with fmAccountCashRashod do
  begin
   quDolg.ParamByName('PostNo').AsInteger:=PostNo;
   EditDate.Text:=DateToStr(Now);
   EditSumma.Text:='0,00';

   quDolg.Open;
   Caption:='Расход на '+quDolgName.AsString;
//   quDolg.Last;

{   fmEditPlatR.SummaDolg:=0;
   while not(quDolg.EOF) do
    begin
     fmEditPlatR.SummaDolg:=fmEditPlatR.SummaDolg+fmEditPlatR.quDolgSummaDolg.AsFloat;
     quDolg.Next;
    end;
   quPlatR.Open;
   quPlatR.Insert;
   quPlatRPostNo.AsInteger:=PostNo;
   dmDataModule.quGetPost.ParamByName('PostNo').AsInteger:=PostNo;
   dmDataModule.quGetPost.Open;
   quPlatRName.AsString:=dmDataModule.quGetPost.FieldByName('Name').AsString;
   dmDataModule.quGetPost.Close;
   if Buh then quPlatRBuh.AsInteger:=2;//?? ????????? 1}
//   fmAccountCashRashod.Caption:=quDolgName.AsString;
  end;
 fmAccountCashRashod.ShowModal;
 finally
 fmAccountCashRashod.quDolg.Close;
{ fmEditPlatR.quPlatR.Close;
 fmEditPlatR.quTipNakl.Close;}
 fmAccountCashRashod.Free;
 end;
end;

procedure TfmAccountCashRashod.bbOkClick(Sender: TObject);
begin
// if EditSumma.Text<>'0,00' then
  begin
   quCountPlatR.Close;
   quCountPlatR.Open;
   quPlatToPlatR.Close;
   quPlatToPlatR.ParamByName('PostNo').AsInteger:=PostNo;
   quPlatToPlatR.ParamByName('DatePlat').AsDate:=StrToDate(EditDate.Text);
   quPlatToPlatR.ParamByName('Summa').AsFloat:=StrToFloat(EditSumma.Text);
   quPlatToPlatR.ParamByName('SummaDolg').AsFloat:=StrToFloat(EditSumma.Text);
   if cbType.Text='Касса' then
    quPlatToPlatR.ParamByName('Buh').AsInteger:=1
   else
    quPlatToPlatR.ParamByName('Buh').AsInteger:=3;
   quPlatToPlatR.ParamByName('Spravka').AsString:=ComboBox1.Items[ComboBox1.itemindex];
   quPlatToPlatR.ParamByName('UserNo').AsInteger:=UserNo;
   quPlatToPlatR.ParamByName('PlatNo').AsInteger:=quCountPlatRPlatNoMAX.AsInteger+1;
   quPlatToPlatR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;   
   quPlatToPlatR.Execute;
   Close;
 end;
end;

procedure TfmAccountCashRashod.FormCreate(Sender: TObject);
begin
 cbType.ItemIndex:=0;
 ActiveControl:=EditDate;
 dmDataModule.quVidRashod.Open;
 ComboBox1.Clear;
 dmDataModule.quVidRashod.First;
 While not dmDataModule.quVidRashod.Eof do
  begin
   ComboBox1.Items.Add(dmDataModule.quVidRashodVidRashodName.AsString);
   dmDataModule.quVidRashod.Next;
  end;
 ComboBox1.ItemIndex:=0;
end;

procedure TfmAccountCashRashod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmDataModule.quVidRashod.Close;
end;

end.
