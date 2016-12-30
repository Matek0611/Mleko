{
Insert - example of using SP with return Identity value as result of executing
Update - example of using SP with return arbitrary value as result of executing
Delete - example of using SP with return arbitrary value as parameter
}

unit StoredProcUpdates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Grids, DBGrids, StdCtrls,
  ActnList, ExtCtrls, DBCtrls, MSAccess, SdacVcl,
  Buttons, DemoFrame, SdacDemoForm;

type
  TStoredProcUpdatesFrame = class(TDemoFrame)
    MSQuery: TMSQuery;
    DataSource: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btClose: TSpeedButton;
    btOpen: TSpeedButton;
    procedure btOpenClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure MSQueryBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure MSQueryAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
  private
    { Private declarations }
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

{$IFDEF CLR}
uses
  Variants;
{$ENDIF}

procedure TStoredProcUpdatesFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Open;
end;

procedure TStoredProcUpdatesFrame.btCloseClick(Sender: TObject);
begin
  MSQuery.Close;
end;

procedure TStoredProcUpdatesFrame.MSQueryBeforeUpdateExecute(Sender: TCustomMSDataSet;
  StatementTypes: TStatementTypes; Params: TMSParams);
begin
  if stInsert in StatementTypes then begin
    Params.ParamByName('EMPNO').ParamType := ptResult;
    // Params.ParamByName('RETURN_VALUE').DataType was setted equal to Sender.FieldByName('EMPNO').FieldType
  end;

  if stUpdate in StatementTypes then begin
    Params.ParamByName('RETURN_VALUE').ParamType := ptResult;
    Params.ParamByName('RETURN_VALUE').DataType := ftInteger; // Field 'RETURN_VALUE' does not present in Sender, so we need to set DataType manually

    Params.ParamByName('EMPINFO').ParamType := ptOutput;
    Params.ParamByName('EMPINFO').DataType := ftWideString; // Field 'EMPINFO' does not present in Sender, so we need to set DataType manually
  end;

  if stDelete in StatementTypes then begin
    Params.ParamByName('Result').ParamType := ptOutput;
    Params.ParamByName('Result').DataType := ftInteger; // Field 'Result' does not present in Sender, so we need to set DataType manually
  end;
end;

procedure TStoredProcUpdatesFrame.MSQueryAfterUpdateExecute(Sender: TCustomMSDataSet;
  StatementTypes: TStatementTypes; Params: TMSParams);
var
  EMPNO, ReturnedEMPNO: integer;
begin
  if stInsert in StatementTypes then begin
    EMPNO := Integer(Params.ParamByName('EMPNO').Value);
    Sender.FieldByName('EMPNO').ReadOnly := False;
    try
      Sender.FieldByName('EMPNO').NewValue := EMPNO;
    finally
      Sender.FieldByName('EMPNO').ReadOnly := True;
    end;
  end;

  if stUpdate in StatementTypes then begin
    EMPNO := Sender.FieldByName('EMPNO').AsInteger;
    ReturnedEMPNO := Integer(Params.ParamByName('RETURN_VALUE').Value);

    if EMPNO <> ReturnedEMPNO then
      raise Exception.Create('Error on Update occured!');

    Caption := String(Params.ParamByName('EMPINFO').Value);
  end;

  if stDelete in StatementTypes then begin
    EMPNO := Params.ParamByName('EMPNO').AsInteger;
    ReturnedEMPNO := Integer(Params.ParamByName('Result').Value);

    if EMPNO + 2 {see StoredProc SDAC_DeleteEmployees} <> ReturnedEMPNO then
      raise Exception.Create('Error on Delete occured!');
  end;
end;

// Demo management
procedure TStoredProcUpdatesFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
end;

procedure TStoredProcUpdatesFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

end.
