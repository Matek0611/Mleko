
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  Stored Proc Call Generator Frame
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit DASPCallFrame;
{$ENDIF}

interface

uses
{$IFDEF MSWINDOWS}
  Windows, Messages, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,
{$ENDIF}
{$IFDEF LINUX}
  QStdCtrls, QExtCtrls, QControls, QButtons, QForms,
{$ENDIF}
  Classes,  SysUtils, DBAccess,
  CRFrame, CRTabEditor, DASQLFrame, DAUpdateSQLFrame;

type
  TDASPCallFrameMode = (spSQL, spQuery, spSQLSP, spQuerySP);

  TDASPCallFrame = class(TDAUpdateSQLFrame)
    pnSQL: TPanel;
    Label14: TLabel;
    cbStoredProcName: TComboBox;
    btGenerate: TButton;
    pnSQLSP: TPanel;
    Label2: TLabel;
    cbStoredProcNameSP: TComboBox;
    procedure btGenerateClick(Sender: TObject);
    procedure cbStoredProcNameChange(Sender: TObject);
    procedure cbStoredProcNameDropDown(Sender: TObject);
    procedure cbStoredProcNameSPExit(Sender: TObject);
  protected
    FListGot: boolean;
    FMode: TDASPCallFrameMode;
    function GetStatementTypes: TStatementTypes; override;
    procedure SetMode(Value: TDASPCallFrameMode);
    function CreateProcCall(SPName: string; SPParams: TDAParams): string; virtual;
    function UsedConnection: TCustomDAConnection;
    procedure DoActivate; override;
  public
    function GetSPName: string;
    procedure SetSPName(Value: string);

    function ActiveControl: TWinControl; override;

    property Mode: TDASPCallFrameMode read FMode write SetMode;
  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R DASPCallFrame.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

uses
  DASQLEditor, DAQueryEditor, CREditor, DAConsts, DADesignUtils;

function TDASPCallFrame.ActiveControl: TWinControl;
begin
  case Mode of
    spSQL, spQuery, spQuerySP:
      Result := cbStoredProcName;
    spSQLSP:
      Result := cbStoredProcNameSP;
    else
      Result := inherited ActiveControl;
  end;
end;

procedure TDASPCallFrame.SetMode(Value: TDASPCallFrameMode);
begin
  if Value = spSQLSP then
    meSQL.Left := 1
  else
    meSQL.Left := 8;
  meSQL.Top := 8;
  meSQL.Width := meSQL.Parent.ClientWidth - meSQL.Left * 2;
  meSQL.Height := meSQL.Parent.Height - meSQL.Top * 2; // Delphi bug?

  pnSQL.Visible := False;
  pnlTop.Visible := False;
  pnSQLSP.Visible := False;

  pnSQL.Visible := Value in [spQuery, spQuerySP, spSQL];
  if pnSQL.Visible then
    pnlTop.Top := pnSQL.Height + 1
  else
    pnlTop.Top := 0;
  pnlTop.Visible := Value in [spQuery, spQuerySP];
  pnSQLSP.Visible := Value = spSQLSP;

  FMode := Value;
end;

function TDASPCallFrame.CreateProcCall(SPName: string; SPParams: TDAParams): string;
begin
  Assert(False, 'Must be overriden');
end;

function TDASPCallFrame.UsedConnection: TCustomDAConnection;
begin
  Result := nil;
  if Editor.Component is TCustomDADataSet then
    Result := TDBAccessUtils.UsedConnection(TCustomDADataSet(Editor.Component))
  else
  if Editor.Component is TCustomDASQL then
    Result := TDBAccessUtils.UsedConnection(TCustomDASQL(Editor.Component))
  else
    Assert(False);
end;

procedure TDASPCallFrame.DoActivate;
begin
  inherited;
{$IFDEF DBTOOLS}
  if Editor.DADesignUtilsClass.DBToolsAvailable then
    cbStoredProcNameSP.OnSelect := cbStoredProcNameSPExit;
{$ENDIF}    
  cbStoredProcNameChange(nil);
end;

procedure TDASPCallFrame.btGenerateClick(Sender: TObject);
var
  Command: TCustomDASQL;
  Par: TDAParams;
  OldSQL: string;
begin
  OldSQL := TrimRight(LocalComponentSQL.Text);
  case Mode of
    spSQL: begin
      SQLText := CreateProcCall(GetSPName, Editor.DADesignUtilsClass.GetParams(Editor.LocalComponent));
      meSQLExit(nil);
    end;
    spQuery, spQuerySP: begin
      Assert(UsedConnection <> nil);
      Command := UsedConnection.CreateSQL;
      try
        if FStatementType = stQuery then
          Par := Editor.DADesignUtilsClass.GetParams(Editor.LocalComponent)
        else
          Par := Command.Params;

        Command.SQL.Text := CreateProcCall(GetSPName, Par);
        SQLText := Command.SQL.Text;
        meSQLExit(nil);
        meSQLChange(nil);
      finally
        Command.Free;
      end;
    end;
  end;
  if TrimRight(SQLText) <> OldSQL then
    Modified := True;
end;

procedure TDASPCallFrame.cbStoredProcNameChange(Sender: TObject);
begin
  case Mode of
    spSQL, spQuery, spQuerySP:
      btGenerate.Enabled := (UsedConnection <> nil) and (Trim(cbStoredProcName.Text) <> '');
    {spSQLSP:
      btGenerateSP.Enabled := Trim(cbStoredProcNameSP.Text) <> '';}
  end;
end;

function TDASPCallFrame.GetSPName: string;
begin
  case Mode of
    spSQL, spQuery, spQuerySP:
      Result := cbStoredProcName.Text;
    spSQLSP:
      Result := cbStoredProcNameSP.Text;
  end;
  Result := Trim(Result);
end;

procedure TDASPCallFrame.SetSPName(Value: string);
begin
  case Mode of
    spSQL, spQuery, spQuerySP:
      cbStoredProcName.Text := Value;
    spSQLSP:
      cbStoredProcNameSP.Text := Value;
  end;
end;

procedure TDASPCallFrame.cbStoredProcNameDropDown(Sender: TObject);
begin
  try
    if not FListGot and (UsedConnection <> nil) then begin
      Editor.CheckConnection(UsedConnection);
      UsedConnection.GetStoredProcNames(cbStoredProcName.Items);
      cbStoredProcNameSP.Items.Assign(cbStoredProcName.Items);
      FListGot := True;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TDASPCallFrame.cbStoredProcNameSPExit(Sender: TObject);
var
  SPName: string;
begin
  try
    SPName := GetSPName;
    if (SPName <> '') and (SPName <> Editor.DADesignUtilsClass.GetStoredProcName(Editor.LocalComponent as TCustomDADataSet)) then begin
      Modified := True;
      Editor.DADesignUtilsClass.SetStoredProcName(Editor.LocalComponent as TCustomDADataSet, SPName);
      if UsedConnection = nil then
        raise Exception.Create(SConnectionNotDefined)
      else begin
        SQLText := CreateProcCall(SPName, Editor.DADesignUtilsClass.GetParams(Editor.LocalComponent));
        Application.ProcessMessages;
        SetSelStart(meSQL, 0);
        meSQLExit(nil);
      end;
    end;
  except
    if Editor.ActiveControl <> nil then // prevent from infinite loop if ESC was pressed in Editor
      Application.HandleException(Self);
  end;
end;

function TDASPCallFrame.GetStatementTypes: TStatementTypes;
begin
  case FMode of
    spSQL:
      Result := [stQuery]; // invisible
    spQuery:
      Result := Editor.DADesignUtilsClass.GetStatementTypes;
    spSQLSP:
      Result := [stQuery]; // invisible
    spQuerySP:
      Result := Editor.DADesignUtilsClass.GetStatementTypes;
    else
      Assert(False);
  end;
end;

end.
