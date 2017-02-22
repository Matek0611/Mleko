unit UFastDatasetView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, MemDS, DBAccess, MSAccess,
  StdCtrls, Menus, Buttons, GridsEh, DBGridEh, ActnList;

type
  TfrmFastDatasetView = class(TForm)
    sbStatus: TStatusBar;
    dsView: TDataSource;
    MSQuery: TMSQuery;
    pcView: TPageControl;
    tsExecute: TTabSheet;
    tsCode: TTabSheet;
    gbxControls: TGroupBox;
    btnExecute: TBitBtn;
    meCode: TMemo;
    btnRefresh: TButton;
    dbgView: TDBGridEh;
    actlst1: TActionList;
    acRefresh: TAction;
    acExecute: TAction;
    procedure sbStatusDblClick(Sender: TObject);
    procedure dbgViewTitleClick(Column: TColumnEh);
    procedure acRefreshExecute(Sender: TObject);
    procedure acExecuteExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    UserQuery: TDataSet;
    OldCol, OlDir: Integer;
    procedure ShowStatusMsg(Index: Integer; Msg: string);
    procedure ExecuteQueryFast(
              ACaption: string; Query: TDataSet; Source: TStrings; DoExecute: Boolean);
    procedure ExecuteUserQuery(Source: TStrings);
    procedure ShowHideControls;
    procedure RefreshUserQuery;
    { Private declarations }
  public
    { Public declarations }
    //TCustomMSDataSet
  end;

var
  frmFastDatasetView: TfrmFastDatasetView;

  procedure ViewDatasetFast(
  ACaption: string; ADataset: TDataSet;
  DoExecute: Boolean = False; IsModal: Boolean = False);
  //procedure ExecuteScript(ACaption: string; Script: TStrings);
function SortMSQueryInEhGrid( var OldCol, OldDir: Integer;
          Col, OrderLine: Integer; Column: TColumnEh; Source: TStrings;
          MSQuery: TMSQuery; MainField: String; OrderFields: String = '';
          DoOpen: Boolean = True): String;

implementation
uses MlekoUtils;

{$R *.dfm}

function SortMSQueryInEhGrid( var OldCol, OldDir: Integer;
          Col, OrderLine: Integer; Column: TColumnEh; Source: TStrings;
          MSQuery: TMSQuery; MainField: String; OrderFields: String = '';
          DoOpen: Boolean = True): String;
const
  idOrderBy = 'ORDER BY';
//const
//  OrderDirs: array[TSortMarkerEh] of String
var
  Dir: Integer; OrderStr: string;
  DoInsert: Boolean;
begin
  //  TSortMarkerEh = (smNoneEh, smDownEh, smUpEh);
  Result:= OrderFields;
  DoInsert:= False;
  if (OrderLine<=0) and (Source<>nil) then
  begin
    OrderLine:= GetStartPosIndex(Source, idOrderBy, 10, False);
    if (OrderLine<=0) then
    begin
      OrderLine:= GetStartPosIndex(Source, '--'+idOrderBy, 10, False);
      if (OrderLine>0) then
      begin
        DoInsert:= True;
        Inc(OrderLine);
      end;
    end;
  end;
  if (OrderLine>0) then
  begin
    if (OldCol<>Col) or (OldDir=0)
       then OldDir:= 1
       else OldDir:= -OldDir;
       OldCol:= Col;
   Column.Title.SortMarker:= TSortMarkerEh((3-OldDir) div 2);
   if (OldDir<0) then OrderStr:= ' DESC, ' else OrderStr:= ' ASC, ';
   if (OrderFields='') then OrderFields:= Column.Field.FieldName;
   Result:= idOrderBy + ' ' + MainField + OrderStr + OrderFields;
   MSQuery.Close;
   if DoInsert and (Source<>nil) then
   begin
     MSQuery.SQL.Assign(Source);
     MSQuery.SQL.Insert(OrderLine, Result);
   end
      else
      MSQuery.SQL[OrderLine]:= Result;
   if DoOpen then MSQuery.Open;
  end;
end;


function ExecuteQuery(Query: TDataSet; Source: TStrings): string;
begin
  Result := '';
  try
  if Query.Active then
    Query.Close;
    if (Source<>nil) and (Query is TCustomMSDataSet) then
    with (Query as TCustomMSDataSet) do
    if (Source<>SQL) then
    begin
      SQL.Clear;
      SQL.Assign(Source);
    end;
    if not Query.Active then
    begin
      Query.Open;
      Query.First;
    end;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

procedure TfrmFastDatasetView.ShowStatusMsg(Index: Integer; Msg: string);
begin
  if (Index<0) or sbStatus.SimplePanel then
     sbStatus.SimpleText:= Msg else
     sbStatus.Panels[Index].Text := Msg;
end;

procedure TfrmFastDatasetView.ExecuteUserQuery(Source: TStrings);
var
  Msg: string;
begin
  Msg := ExecuteQuery(UserQuery, Source);
  if (Msg <> '') then
    ShowStatusMsg(-1, 'SQL Error: ' + Msg)
  else
  begin
    ShowStatusMsg(-1, 'Records: ' + IntToStr(UserQuery.RecordCount));
    pcView.ActivePage:= tsExecute;
    dbgView.Refresh;
    //
    //pcView.ActivePage:= tsCode;
  end;
end;


procedure TfrmFastDatasetView.ExecuteQueryFast(
ACaption: string; Query: TDataSet; Source: TStrings; DoExecute: Boolean);
var
  Msg: string;
begin
  Caption:= ACaption;
  if (Query=nil) then Query:= MSQuery;
  
  UserQuery:= Query;
  if (Source=nil) and (Query is TCustomMSDataSet) then
    with (Query as TCustomMSDataSet) do
         Source:= SQL;
    meCode.Lines.Assign(Source);
  if DoExecute then
  begin
    Query.Close;
    dbgView.DataSource:= nil;
    dsView.DataSet:= UserQuery;
    ExecuteUserQuery(Source);

    dbgView.DataSource:= dsView;
    //RefreshUserQuery;
     //
     //ExecuteUserQuery(meCode.Lines);

    pcView.ActivePage:= tsExecute;
    //RefreshUserQuery;
  end else
    pcView.ActivePage:= tsCode;
//  Msg := ExecuteQuery(Query, Source);
//  if (Msg <> '') then
//    ShowStatusMsg(-1, 'SQL Error: ' + Msg)
//  else
//    ShowStatusMsg(-1, 'Records: ' + IntToStr(Query.RecordCount));
end;

procedure ViewDatasetFast(
          ACaption: string; ADataset: TDataSet; DoExecute: Boolean = False; IsModal: Boolean = False);
begin
  if (frmFastDatasetView=nil) then
  frmFastDatasetView:= TfrmFastDatasetView.Create(Application);
  frmFastDatasetView.ExecuteQueryFast(ACaption, ADataset, nil, DoExecute);
  if IsModal then
  begin
    frmFastDatasetView.ShowModal;
    frmFastDatasetView.dsView.DataSet.Close;
  end
     else
     frmFastDatasetView.Show;
  //frmFastDatasetView.ExecuteQueryFast(ACaption, ADataset, nil, DoExecute);
  //frmFastDatasetView.Free;
end;

procedure TfrmFastDatasetView.ShowHideControls();
begin
  with gbxControls do
   Visible:= not Visible;
end;

procedure TfrmFastDatasetView.sbStatusDblClick(Sender: TObject);
begin
  ShowHideControls;
end;

procedure TfrmFastDatasetView.RefreshUserQuery;
begin
  UserQuery.Close;
  UserQuery.Open;
  dbgView.Refresh;
end;

procedure TfrmFastDatasetView.dbgViewTitleClick(Column: TColumnEh);
var ACol: Integer;
begin
//  if (UserQuery is TMSQuery) then
//  begin
//    ACol:= Column.Index;
//    SortMSQueryInEhGrid(
//    OldCol, OlDir, ACol, 0, Column, meCode.Lines,
//    (UserQuery as TMSQuery), '', True);
//     //UserQuery.Open;
//  end;
end;

procedure TfrmFastDatasetView.acRefreshExecute(Sender: TObject);
begin
  RefreshUserQuery;
end;

procedure TfrmFastDatasetView.acExecuteExecute(Sender: TObject);
begin
  ExecuteUserQuery(meCode.Lines);
end;

procedure TfrmFastDatasetView.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=27) then Close;
end;

end.

