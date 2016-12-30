unit PrihodOrderHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh, SelNakl0,
  DBGridEh, ExtCtrls, CFLMLKMDIChild, ComCtrls, ToolWin;

type
  TPrihodOrderHeadForm = class(TCFLMLKMDIChildForm)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    dsPrihodOrderHead: TMSDataSource;
    quPrihodOrderHead: TMSQuery;
    quPrihodOrderHeadId: TIntegerField;
    quPrihodOrderHeadOrderNo: TIntegerField;
    quPrihodOrderHeadOrderDate: TDateTimeField;
    quPrihodOrderHeadPostNo: TSmallintField;
    quPrihodOrderHeadPostName: TStringField;
    quPrihodOrderHeadBuh: TSmallintField;
    quPrihodOrderHeadBuhName: TStringField;
    quPrihodOrderHeadSumma: TFloatField;
    quPrihodOrderHeadDocTypeName: TStringField;
    quPrihodOrderHeadAnalisDateBeg: TDateTimeField;
    quPrihodOrderHeadAnalisDateEnd: TDateTimeField;
    quPrihodOrderHeadUserNo: TIntegerField;
    quPrihodOrderHeadUserName: TStringField;
    quPrihodOrderHeadEditUserNo: TIntegerField;
    quPrihodOrderHeadEditUserName: TStringField;
    quPrihodOrderHeadEditOrderDate: TDateTimeField;
    quPrihodOrderHeadDocType: TStringField;
    NewPrihodOrder: TToolButton;
    EditPrihodOrder: TToolButton;
    DelPrihodOrder: TToolButton;
    Refresh: TToolButton;
    ExitForm: TToolButton;
    quPrihodOrderHeadPkey: TLargeintField;
    procedure DelPrihodOrderClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure ExitFormClick(Sender: TObject);
    procedure EditPrihodOrderClick(Sender: TObject);
    procedure NewPrihodOrderClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrihodOrderHeadForm: TPrihodOrderHeadForm;
  DateBegin, DateEnd: TDate;

procedure PrihodOrdersHead(RetSelNakl: TRetSelNakl);
implementation

uses  data, PrihodOrder;

{$R *.dfm}

procedure PrihodOrdersHead(RetSelNakl: TRetSelNakl);
var
  Dlg : TPrihodOrderHeadForm;
  TmpSql: string;
begin
  Screen.Cursor := crHourGlass;
  Dlg := TPrihodOrderHeadForm.Create(Application);
//  try
   TmpSQL := '';
   if RetSelNakl.PostNo > 0 then
     TmpSql := '(epoh.PostNo=' + IntToStr(RetSelNakl.PostNo) + ')';
   if (RetSelNakl.DateBegin > 0) then
   begin
     if Length(TmpSql) > 0 then
       TmpSql := TmpSql + ' and ';
     TmpSql := TmpSql + '(OrderDate>=:DateBegin) and (OrderDate<=:DateEnd)';
   end;

   if Length(TmpSql) > 0 then
   begin
     Dlg.quPrihodOrderHead.MacroByName('_where').Value := TmpSQL;
     Dlg.quPrihodOrderHead.Prepare;
     if (RetSelNakl.DateBegin > 0) then
     begin
       Dlg.quPrihodOrderHead.ParamByName('DateBegin').AsDate := RetSelNakl.DateBegin;
       Dlg.quPrihodOrderHead.ParamByName('DateEnd').AsDate := RetSelNakl.DateEnd;

       DateBegin := RetSelNakl.DateBegin;
       DateEnd := RetSelNakl.DateEnd;
     end;
   end;
   Dlg.quPrihodOrderHead.Open;
   Dlg.quPrihodOrderHead.First;
   Screen.Cursor := crDefault;
   Dlg.Show;
{
  finally
   Dlg.quPrihodOrderHead.Close;
   Dlg.Free;
  end;
}
end;

procedure TPrihodOrderHeadForm.DelPrihodOrderClick(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Вы уверены что хотите удалить заказ ?', mtConfirmation, [mbNo,mbYes], 0) in [mrYes]) then  quPrihodOrderHead.Delete;
end;

procedure TPrihodOrderHeadForm.RefreshClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;
  Id := quPrihodOrderHead.FieldByName('Id').AsInteger;
  quPrihodOrderHead.Close;
  quPrihodOrderHead.Open;
  quPrihodOrderHead.Locate('Id', Id, []);
end;

procedure TPrihodOrderHeadForm.ExitFormClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TPrihodOrderHeadForm.EditPrihodOrderClick(Sender: TObject);
var
  pkey: Int64;
begin
  inherited;
  pkey := quPrihodOrderHead.FieldByName('Pkey').Value;
  PrihodOrders('Edit',Pkey);
  quPrihodOrderHead.Refresh;
  quPrihodOrderHead.Locate('pkey', Pkey, []);
end;


procedure TPrihodOrderHeadForm.NewPrihodOrderClick(Sender: TObject);
var
  pkey: Int64;
begin
  inherited;
  pkey := -1;
  PrihodOrders('Add',Pkey);
  quPrihodOrderHead.Refresh;
  quPrihodOrderHead.Locate('pkey', Pkey, []);
end;

procedure TPrihodOrderHeadForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditPrihodOrderClick(Sender);
end;

end.
