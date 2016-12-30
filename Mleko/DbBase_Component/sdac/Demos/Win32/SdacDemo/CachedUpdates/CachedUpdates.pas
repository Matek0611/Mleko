unit CachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, Db, Grids, DBGrids, MemDS,  StdCtrls, ToolWin,
  ComCtrls, Buttons,  DBAccess, MSAccess, SdacVcl,
  DemoFrame, SdacDemoForm;

type
  TCachedUpdatesFrame = class(TDemoFrame)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    MSQuery: TMSQuery;
    Panel8: TPanel;
    ToolBar: TPanel;
    btOpen: TSpeedButton;
    btClose: TSpeedButton;
    RefreshRecord: TSpeedButton;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    btApply: TSpeedButton;
    btCommit: TSpeedButton;
    btCancel: TSpeedButton;
    btRevertRecord: TSpeedButton;
    Panel2: TPanel;
    cbCachedUpdates: TCheckBox;
    cbCustomUpdate: TCheckBox;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    btStartTrans: TSpeedButton;
    btCommitTrans: TSpeedButton;
    btRollBackTrans: TSpeedButton;
    Panel6: TPanel;
    Label1: TLabel;
    cbDeleted: TCheckBox;
    cbInserted: TCheckBox;
    cbModified: TCheckBox;
    cbUnmodified: TCheckBox;
    Panel7: TPanel;
    Label4: TLabel;
    edUpdateBatchSize: TEdit;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btStartTransClick(Sender: TObject);
    procedure btCommitTransClick(Sender: TObject);
    procedure btRollbackTransClick(Sender: TObject);
    procedure cbCachedUpdatesClick(Sender: TObject);
    procedure MSQueryUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure MSQueryUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure cbCustomUpdateClick(Sender: TObject);
    procedure MSQueryCalcFields(DataSet: TDataSet);
    procedure btCommitClick(Sender: TObject);
    procedure cbUnmodifiedClick(Sender: TObject);
    procedure cbModifiedClick(Sender: TObject);
    procedure cbInsertedClick(Sender: TObject);
    procedure cbDeletedClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure DataSourceStateChange(Sender: TObject);
    procedure DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure btRevertRecordClick(Sender: TObject);
    procedure RefreshRecordClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTrans;
    procedure ShowPending;
    procedure ShowUpdateRecordTypes;
  public
    destructor Destroy; override;

    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

uses
  UpdateAction;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

procedure TCachedUpdatesFrame.ShowTrans;
begin
  if MSQuery.Connection .InTransaction then
    SdacForm.StatusBar.Panels[2].Text := 'In Transaction'
  else
    SdacForm.StatusBar.Panels[2].Text := '';
end;

procedure TCachedUpdatesFrame.ShowPending;
begin
  if MSQuery.UpdatesPending then
    SdacForm.StatusBar.Panels[1].Text := 'Updates Pending'
  else
    SdacForm.StatusBar.Panels[1].Text := '';
end;

procedure TCachedUpdatesFrame.ShowUpdateRecordTypes;
begin
  if MSQuery.CachedUpdates then begin
    cbUnmodified.Checked := rtUnmodified in MSQuery.UpdateRecordTypes;
    cbModified.Checked := rtModified in MSQuery.UpdateRecordTypes;
    cbInserted.Checked := rtInserted in MSQuery.UpdateRecordTypes;
    cbDeleted.Checked := rtDeleted in MSQuery.UpdateRecordTypes;
  end;
end;

procedure TCachedUpdatesFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TCachedUpdatesFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TCachedUpdatesFrame.btApplyClick(Sender: TObject);
begin
  MSQuery.Options.UpdateBatchSize := StrToInt(edUpdateBatchSize.Text);
  MSQuery.ApplyUpdates;
  ShowPending;
end;

procedure TCachedUpdatesFrame.btCommitClick(Sender: TObject);
begin
  MSQuery.CommitUpdates;
  ShowPending;
end;

procedure TCachedUpdatesFrame.btCancelClick(Sender: TObject);
begin
  MSQuery.CancelUpdates;
  ShowPending;
end;

procedure TCachedUpdatesFrame.btStartTransClick(Sender: TObject);
begin
  MSQuery.Connection.StartTransaction;
  ShowTrans;
end;

procedure TCachedUpdatesFrame.btCommitTransClick(Sender: TObject);
begin
  MSQuery.Connection.Commit;
  ShowTrans;
end;

procedure TCachedUpdatesFrame.btRollbackTransClick(Sender: TObject);
begin
  MSQuery.Connection.Rollback;
  ShowTrans;
end;

destructor TCachedUpdatesFrame.Destroy;
begin
  FreeAndNil(UpdateActionForm);
  inherited;
end;

procedure TCachedUpdatesFrame.cbCachedUpdatesClick(Sender: TObject);
begin
  try
    MSQuery.CachedUpdates := cbCachedUpdates.Checked;
  except
    cbCachedUpdates.Checked := MSQuery.CachedUpdates;
    raise;
  end;
  ShowUpdateRecordTypes;
end;

procedure TCachedUpdatesFrame.MSQueryUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateActionForm.rgAction.ItemIndex := Ord(UpdateAction);
  UpdateActionForm.rgKind.ItemIndex := Ord(UpdateKind);
  UpdateActionForm.lbField.Caption := String(DataSet.Fields[0].Value);
  UpdateActionForm.lbMessage.Caption := E.Message;
  UpdateActionForm.ShowModal;
  UpdateAction := TUpdateAction(UpdateActionForm.rgAction.ItemIndex);
end;

procedure TCachedUpdatesFrame.MSQueryUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  UpdateActionForm.rgAction.ItemIndex := Ord(UpdateAction);
  UpdateActionForm.rgKind.ItemIndex := Ord(UpdateKind);
  UpdateActionForm.lbField.Caption := String(DataSet.Fields[0].NewValue);
  UpdateActionForm.lbMessage.Caption := '';
  UpdateActionForm.ShowModal;
  UpdateAction := TUpdateAction(UpdateActionForm.rgAction.ItemIndex);
end;

procedure TCachedUpdatesFrame.cbCustomUpdateClick(Sender: TObject);
begin
  if cbCustomUpdate.Checked then
    MSQuery.OnUpdateRecord := MSQueryUpdateRecord
  else
    MSQuery.OnUpdateRecord := nil;
end;

procedure TCachedUpdatesFrame.MSQueryCalcFields(DataSet: TDataSet);
var
  St:string;
begin
  case Ord(TCustomMSDataSet(DataSet).UpdateStatus) of
    0: St := 'Unmodified';
    1: St := 'Modified';
    2: St := 'Inserted';
    3: St := 'Deleted';
  end;
  DataSet.FieldByName('Status').AsString := St;

{  case Ord(TMSDataSet(DataSet).UpdateResult) of
    0: St := 'Fail';
    1: St := 'Abort';
    2: St := 'Skip';
    3: St := 'Applied';
  end;
  DataSet.FieldByName('Result').AsString := St;}
end;

procedure TCachedUpdatesFrame.cbUnmodifiedClick(Sender: TObject);
begin
  if cbUnmodified.Checked then
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes + [rtUnmodified]
  else
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes - [rtUnmodified];
end;

procedure TCachedUpdatesFrame.cbModifiedClick(Sender: TObject);
begin
  if cbModified.Checked then
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes + [rtModified]
  else
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes - [rtModified];
end;

procedure TCachedUpdatesFrame.cbInsertedClick(Sender: TObject);
begin
  if cbInserted.Checked then
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes + [rtInserted]
  else
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes - [rtInserted];
end;

procedure TCachedUpdatesFrame.cbDeletedClick(Sender: TObject);
begin
  if cbDeleted.Checked then
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes + [rtDeleted]
  else
    MSQuery.UpdateRecordTypes := MSQuery.UpdateRecordTypes - [rtDeleted];
end;

procedure TCachedUpdatesFrame.DataSourceStateChange(Sender: TObject);
begin
  ShowPending;
  SdacForm.StatusBar.Panels[3].Text := 'Record ' + IntToStr(MSQuery.RecNo) + ' of ' + IntToStr(MSQuery.RecordCount) ;
end;

procedure TCachedUpdatesFrame.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  DataSourceStateChange(nil);
end;

procedure TCachedUpdatesFrame.DBGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if MSQuery.UpdateResult in [uaFail,uaSkip] then
    TDBGrid(Sender).Canvas.Brush.Color := clRed
  else
    if MSQuery.UpdateStatus <> usUnmodified then
      TDBGrid(Sender).Canvas.Brush.Color := clYellow;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);
end;

procedure TCachedUpdatesFrame.btRevertRecordClick(Sender: TObject);
begin
  MSQuery.RevertRecord;
  ShowPending;
end;

procedure TCachedUpdatesFrame.RefreshRecordClick(Sender: TObject);
begin
  MSQuery.RefreshRecord;
end;

// Demo management
procedure TCachedUpdatesFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  UpdateActionForm := TUpdateActionForm.Create(nil);
  cbCachedUpdates.Checked := MSQuery.CachedUpdates;
  ShowUpdateRecordTypes;
end;

procedure TCachedUpdatesFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.