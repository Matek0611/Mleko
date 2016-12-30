unit DocClientCardHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKMDIChild, GridsEh, DBGridEh, DB, DBAccess, MSAccess,
  MemDS, ComCtrls, ExtCtrls, ActnList, ToolWin;

type
  TDocClientCardHeadForm = class(TCFLMLKMDIChildForm)
    Panel1: TPanel;
    Panel3: TPanel;
    tbCreate: TToolButton;
    tbEdit: TToolButton;
    tdDel: TToolButton;
    tbRefresh: TToolButton;
    tbClose: TToolButton;
    quDocClientCardHead: TMSQuery;
    quDocClientCardHeadPostNo: TIntegerField;
    quDocClientCardHeadDocDate: TDateTimeField;
    quDocClientCardHeadUserNo: TIntegerField;
    quDocClientCardHeadSotrudNo: TIntegerField;
    quDocClientCardHeadPrint3: TBooleanField;
    quDocClientCardHeadTTN: TBooleanField;
    quDocClientCardHeadIsApp: TBooleanField;
    quDocClientCardHeadPostName: TStringField;
    quDocClientCardHeadSotrudName: TStringField;
    quDocClientCardHeadUserName: TStringField;
    quDocClientCardHeadid: TIntegerField;
    dsDocClientCardHead: TMSDataSource;
    DBGridEh1: TDBGridEh;
    quDocClientCardHeadNotSignatureOtdel: TStringField;
    procedure tbCloseClick(Sender: TObject);
    procedure tbCreateClick(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure tdDelClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocClientCardHeadForm: TDocClientCardHeadForm;

procedure DocClientCardsHead(IsApp : boolean);

implementation

uses data, MlekoSelectFIrm, EditClientCard;

{$R *.dfm}

procedure DocClientCardsHead(IsApp : boolean);
var
  Dlg : TDocClientCardHeadForm;
begin
  Screen.Cursor := crHourGlass;
  Dlg := TDocClientCardHeadForm.Create(Application);

  if IsApp then Dlg.quDocClientCardHead.MacroByName('_where').Value := ' dcch.isApp = 1'
           else Dlg.quDocClientCardHead.MacroByName('_where').Value := ' dcch.isApp = 0';

           

  Dlg.quDocClientCardHead.Open;
  Dlg.quDocClientCardHead.First;
  Screen.Cursor := crDefault;
  Dlg.Show;
end;

procedure TDocClientCardHeadForm.tbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TDocClientCardHeadForm.tbCreateClick(Sender: TObject);
var
  PostNo : integer;
  Dlg : TMlekoSelectFIrmDlg;
  IsRun : boolean;
  Id : integer;
begin
  IsRun := true;
  Id := -1;
  
  Dlg := TMlekoSelectFIrmDlg.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk : PostNo := Dlg.Query.FieldByName('PostNo').Value;
      mrCancel : IsRun := False;
      mrIgnore : begin end;
    end;
  finally
     Dlg.Query.Close;
     Dlg.Free;
  end;

    if not IsRun then raise Exception.Create('Отменено пользователем!');

    dmDataModule.quUsers.Open;
    dmDataModule.quOtdel.Open;
    dmDataModule.quRegions.Open;

    ClientCard('Add',PostNo, Id);

    dmDataModule.quUsers.Close;
    dmDataModule.quOtdel.Close;
    dmDataModule.quRegions.Close;
end;

procedure TDocClientCardHeadForm.tbRefreshClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := quDocClientCardHead.FieldByName('Id').AsInteger;
  quDocClientCardHead.Close;
  quDocClientCardHead.Open;
  quDocClientCardHead.Locate('Id', Id, []);
end;

procedure TDocClientCardHeadForm.tbEditClick(Sender: TObject);
var
  PostNo, Id : integer;
begin
  PostNo := quDocClientCardHeadPostNo.AsInteger;
  Id := quDocClientCardHeadid.AsInteger;

  dmDataModule.quUsers.Open;
  dmDataModule.quOtdel.Open;
  dmDataModule.quRegions.Open;

  ClientCard('Edit', PostNo, Id);

  dmDataModule.quUsers.Close;
  dmDataModule.quOtdel.Close;
  dmDataModule.quRegions.Close;

  quDocClientCardHead.Close;
  quDocClientCardHead.Open;
  quDocClientCardHead.Locate('Id',Id,[]);
end;

procedure TDocClientCardHeadForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  tbEdit.Click;
end;

procedure TDocClientCardHeadForm.tdDelClick(Sender: TObject);
begin
  inherited;
  if quDocClientCardHeadIsApp.AsBoolean then ShowMessage ('Удаление проведенного документа не возможно')
                                        else if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then dmDataModule.ExecSQL('exec spDelDocClientCard :p1_DocId',[quDocClientCardHeadid.AsInteger]);
  tbRefresh.Click;
end;

procedure TDocClientCardHeadForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  dmDataModule.OpenSQL('select * from l_doc_signature where DocId = :p1_DocId and UserNo = :p2_UserNo',[quDocClientCardHeadid.Value, UserNo]);
  if dmDataModule.QFO.RecordCount = 1 then
    DBGridEh1.Canvas.Brush.Color := clLime;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

end.
