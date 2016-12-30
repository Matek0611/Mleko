unit PlanningOrderHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKMDIChild, DB, MemDS, DBAccess, MSAccess, GridsEh, SelNakl0,
  DBGridEh, ExtCtrls, ComCtrls, ActnList, ToolWin;

type
  TPlanningOrderHeadForm = class(TCFLMLKMDIChildForm)
    ToolBar1: TToolBar;
    NewPrihodOrder: TToolButton;
    EditPrihodOrder: TToolButton;
    DelPrihodOrder: TToolButton;
    Refresh: TToolButton;
    ExitForm: TToolButton;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    dsPlanningOrderHead: TMSDataSource;
    quPlanningOrderHead: TMSQuery;
    quPlanningOrderHeadid: TIntegerField;
    quPlanningOrderHeadDatePlanning: TDateTimeField;
    quPlanningOrderHeadDatePlanningBeg: TDateTimeField;
    quPlanningOrderHeadDatePlanningEnd: TDateTimeField;
    quPlanningOrderHeadUserName: TStringField;
    quPlanningOrderHeadNamePlanning: TStringField;
    quPlanningOrderHeadUserNo: TIntegerField;
    procedure NewPrihodOrderClick(Sender: TObject);
    procedure EditPrihodOrderClick(Sender: TObject);
    procedure DelPrihodOrderClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure ExitFormClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlanningOrderHeadForm: TPlanningOrderHeadForm;
  DateBegin, DateEnd: TDate;

procedure PlanningOrdersHead(RetSelNakl: TRetSelNakl);

implementation
uses data, PlanningOrder;

{$R *.dfm}

procedure PlanningOrdersHead(RetSelNakl: TRetSelNakl);
var
  Dlg : TPlanningOrderHeadForm;
  TmpSql: string;
begin
  Screen.Cursor := crHourGlass;
  Dlg := TPlanningOrderHeadForm.Create(Application);

   TmpSQL := '';
   if RetSelNakl.PostNo > 0 then
     TmpSql := '(epoh.PostNo=' + IntToStr(RetSelNakl.PostNo) + ')';
   if (RetSelNakl.DateBegin > 0) then
   begin
     if Length(TmpSql) > 0 then
       TmpSql := TmpSql + ' and ';
     TmpSql := TmpSql + '(DatePlanning >= :DateBegin) and (DatePlanning <= :DateEnd)';
   end;

   if Length(TmpSql) > 0 then
   begin
     Dlg.quPlanningOrderHead.MacroByName('_where').Value := TmpSQL;
     Dlg.quPlanningOrderHead.Prepare;
     if (RetSelNakl.DateBegin > 0) then
     begin
       Dlg.quPlanningOrderHead.ParamByName('DateBegin').AsDate := RetSelNakl.DateBegin;
       Dlg.quPlanningOrderHead.ParamByName('DateEnd').AsDate := RetSelNakl.DateEnd;

       DateBegin := RetSelNakl.DateBegin;
       DateEnd := RetSelNakl.DateEnd;
     end;
   end;
   Dlg.quPlanningOrderHead.Open;
   Dlg.quPlanningOrderHead.First;
   Screen.Cursor := crDefault;
   Dlg.Show;
end;


procedure TPlanningOrderHeadForm.NewPrihodOrderClick(Sender: TObject);
var
 Pkey: Int64;
begin
  inherited;
  Pkey := -1;
  PlanningOrders('Add',Pkey);
end;

procedure TPlanningOrderHeadForm.EditPrihodOrderClick(Sender: TObject);
var
 Pkey: Int64;
begin
  inherited;
  Pkey := quPlanningOrderHeadid.value;
  PlanningOrders('Edit',Pkey );
end;

procedure TPlanningOrderHeadForm.DelPrihodOrderClick(Sender: TObject);
begin
  inherited;
  if quPlanningOrderHeadUserNo.Value <> Data.UserNo then raise Exception.Create('Удалить планирование может только создававший пользователь!');
  if (MessageDlg('Вы уверены что хотите удалить планирование продаж ?', mtConfirmation, [mbNo,mbYes], 0) in [mrYes]) then begin
                                                                                                                            dmDataModule.ExecSQL('delete PlanningOrderSpec where PlanningOrderHeadId = :p1_PlanningOrderHeadId',[quPlanningOrderHeadid.value]);
                                                                                                                            quPlanningOrderHead.Delete;
                                                                                                                          end;
end;

procedure TPlanningOrderHeadForm.RefreshClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;
  Id := quPlanningOrderHead.FieldByName('Id').AsInteger;
  quPlanningOrderHead.Close;
  quPlanningOrderHead.Open;
  quPlanningOrderHead.Locate('Id', Id, []);
end;

procedure TPlanningOrderHeadForm.ExitFormClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TPlanningOrderHeadForm.DBGridEh1DblClick(Sender: TObject);
var
 Pkey: Int64;
begin
  inherited;
  Pkey := quPlanningOrderHeadid.value;
  PlanningOrders('Edit',Pkey );
end;

end.
