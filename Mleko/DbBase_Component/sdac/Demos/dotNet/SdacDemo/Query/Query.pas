unit Query;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids,  StdCtrls, ToolWin,
  ComCtrls,  Buttons, MemDS, DBAccess, MSAccess, 
  SdacVcl, DemoFrame, SdacDemoForm;

type
  TQueryFrame = class(TDemoFrame)
    DataSource: TDataSource;
    MSQuery: TMSQuery;
    DBGrid: TDBGrid;
    Panel9: TPanel;
    btRefreshRecord: TSpeedButton;
    DBNavigator: TDBNavigator;
    Splitter1: TSplitter;
    ToolBar: TPanel;
    Panel1: TPanel;
    btClose: TSpeedButton;
    btOpen: TSpeedButton;
    Panel2: TPanel;
    cbRefreshBeforeEdit: TCheckBox;
    cbRefreshAfterInsert: TCheckBox;
    cbRefreshAfterUpdate: TCheckBox;
    Panel5: TPanel;
    StaticText1: TLabel;
    edFetchRows: TEdit;
    Panel6: TPanel;
    Label5: TLabel;
    edFilter: TEdit;
    cbFiltered: TCheckBox;
    Panel7: TPanel;
    edUpdatingTable: TEdit;
    Label2: TLabel;
    Memo: TMemo;
    btPrepare: TSpeedButton;
    btUnPrepare: TSpeedButton;
    btExecute: TSpeedButton;
    Panel3: TPanel;
    cbNonBlocking: TCheckBox;
    btSaveToXML: TSpeedButton;
    SaveDialog: TSaveDialog;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btRefreshRecordClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure DataSourceStateChange(Sender: TObject);
    procedure cbFilteredClick(Sender: TObject);
    procedure cbRefreshBeforeEditClick(Sender: TObject);
    procedure cbRefreshAfterInsertClick(Sender: TObject);
    procedure cbRefreshAfterUpdateClick(Sender: TObject);
    procedure MSQueryAfterOpen(DataSet: TDataSet);
    procedure edFetchRowsExit(Sender: TObject);
    procedure btPrepareClick(Sender: TObject);
    procedure btUnPrepareClick(Sender: TObject);
    procedure btExecuteClick(Sender: TObject);
    procedure cbNonBlockingClick(Sender: TObject);
    procedure btSaveToXMLClick(Sender: TObject);
  private
    { Private declarations }
    procedure AssignProperties;
    procedure ShowState;
  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TQueryFrame.ShowState;
var
  St: string;

  procedure AddSt(S:string);
  begin
    if St <> '' then
      St := St + ', ';
    St := St + S;
  end;

begin
  St := '';

  if MSQuery.Prepared then begin
    AddSt('Prepared');

    if MSQuery.IsQuery then
      AddSt('IsQuery');
  end;

  if MSQuery.Active then
    AddSt('Active')
  else
    AddSt('Inactive');

  if MSQuery.Executing then
    AddSt('Executing');

  if MSQuery.Fetching then
    AddSt('Fetching');

  edUpdatingTable.Text := MSQuery.UpdatingTable;

  SdacForm.StatusBar.Panels[2].Text := St;
end;

procedure TQueryFrame.AssignProperties;
begin
  try
    MSQuery.FetchRows := StrToInt(edFetchRows.Text);
  except
    edFetchRows.SetFocus;
    raise;
  end;
  try
    MSQuery.UpdatingTable := edUpdatingTable.Text;
  except
    edUpdatingTable.SetFocus;
    raise;
  end;

  MSQuery.Filter := edFilter.Text;
  if MSQuery.SQL.Text <> Memo.Lines.Text then
    MSQuery.SQL.Assign(Memo.Lines);
end;

procedure TQueryFrame.btOpenClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSQuery.Open;
  finally
    ShowState;
  end;
end;

procedure TQueryFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
  ShowState;
end;

procedure TQueryFrame.btRefreshRecordClick(Sender: TObject);
begin
  MSQuery.RefreshRecord;
end;

procedure TQueryFrame.DataSourceStateChange(Sender: TObject);
begin
  SdacForm.StatusBar.Panels[1].Text := 'Record ' + IntToStr(MSQuery.RecNo) + ' of ' + IntToStr(MSQuery.RecordCount);
end;

procedure TQueryFrame.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  DataSourceStateChange(nil);
end;

procedure TQueryFrame.cbFilteredClick(Sender: TObject);
begin
  try
    MSQuery.Filtered := cbFiltered.Checked;
  finally
    cbFiltered.Checked := MSQuery.Filtered;
  end;
end;

procedure TQueryFrame.cbRefreshBeforeEditClick(Sender: TObject);
begin
  if cbRefreshBeforeEdit.Checked then
    MSQuery.RefreshOptions := MSQuery.RefreshOptions + [roBeforeEdit]
  else
    MSQuery.RefreshOptions := MSQuery.RefreshOptions - [roBeforeEdit];
end;

procedure TQueryFrame.cbRefreshAfterInsertClick(Sender: TObject);
begin
  if cbRefreshAfterInsert.Checked then
    MSQuery.RefreshOptions := MSQuery.RefreshOptions + [roAfterInsert]
  else
    MSQuery.RefreshOptions := MSQuery.RefreshOptions - [roAfterInsert];
end;

procedure TQueryFrame.cbRefreshAfterUpdateClick(Sender: TObject);
begin
  if cbRefreshAfterUpdate.Checked then
    MSQuery.RefreshOptions := MSQuery.RefreshOptions + [roAfterUpdate]
  else
    MSQuery.RefreshOptions := MSQuery.RefreshOptions - [roAfterUpdate];
end;

procedure TQueryFrame.MSQueryAfterOpen(DataSet: TDataSet);
begin
  edUpdatingTable.Text := MSQuery.UpdatingTable;
end;

procedure TQueryFrame.edFetchRowsExit(Sender: TObject);
begin
  AssignProperties;
end;

procedure TQueryFrame.btPrepareClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSQuery.Prepare;
  finally
    ShowState;
  end;
end;

procedure TQueryFrame.btUnPrepareClick(Sender: TObject);
begin
  MSQuery.UnPrepare;
  ShowState;
end;

procedure TQueryFrame.btExecuteClick(Sender: TObject);
begin
  try
    AssignProperties;
    MSQuery.Execute;
  finally
    ShowState;
  end;
end;

procedure TQueryFrame.cbNonBlockingClick(Sender: TObject);
begin
  try
    MSQuery.Options.NonBlocking := cbNonBlocking.Checked;
  finally
    cbNonBlocking.Checked := MSQuery.Options.NonBlocking;
  end;
end;

procedure TQueryFrame.btSaveToXMLClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    MSQuery.SaveToXML(SaveDialog.FileName);
end;

// Demo management
procedure TQueryFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  edFetchRows.Text := IntToStr(MSQuery.FetchRows);

  cbRefreshBeforeEdit.Checked := roBeforeEdit in MSQuery.RefreshOptions;
  cbRefreshAfterInsert.Checked := roAfterInsert in MSQuery.RefreshOptions;
  cbRefreshAfterUpdate.Checked := roAfterUpdate in MSQuery.RefreshOptions;

  edFilter.Text := MSQuery.Filter;
  cbFiltered.Checked := MSQuery.Filtered;

  Memo.Lines.Text := MSQuery.SQL.Text;
end;

procedure TQueryFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.

