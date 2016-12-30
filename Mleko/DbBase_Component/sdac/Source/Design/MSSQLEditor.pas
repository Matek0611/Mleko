
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2005 Core Lab. All right reserved.
//  MSSQL Editor
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I SDac.inc}

unit MSSQLEditor;
{$ENDIF}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DASQLEditor, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  OLEDBAccess;

type
  TMSSQLEditorForm = class(TDASQLEditorForm)
    btQueryAnalyzer: TButton;
    btManagementStudio: TButton;
    procedure btQueryAnalyzerClick(Sender: TObject);
    procedure btManagementStudioClick(Sender: TObject);
  protected
    procedure DoInit; override;
    procedure DoError(E: Exception); override;
  public
    property SQL;
  end;

procedure DoError(Sender: TDASQLEditorForm; E: EOLEDBError);

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R MSSQLEditor.dfm}
{$ENDIF}

uses
  MSAccess, DASQLFrame, DAParamsFrame, MSParamsFrame, DAMacrosFrame, DASPCallFrame,
  MSSPCallFrame{$IFDEF SDAC}, MSDesign{$ENDIF};

procedure DoError(Sender: TDASQLEditorForm; E: EOLEDBError);
begin
  Sender.ActivateFrame(Sender.SQLFrame);
  Sender.ActiveControl := Sender.SQLFrame.meSQL;
end;

{ TMSSQLEditorForm }

procedure TMSSQLEditorForm.DoError(E: Exception);
begin
  if E is EOLEDBError then
    {$IFDEF CLR}CoreLab.SDac.Design.{$ENDIF}MSSQLEditor.DoError(Self, EOLEDBError(E))
  else
    inherited;
end;

procedure TMSSQLEditorForm.DoInit;
begin
  FSQLFrame := AddTab(TDASQLFrame, shSQL) as TDASQLFrame;
  FParamsFrame := AddTab(TMSParamsFrame, shParameters) as TDAParamsFrame;
  FMacrosFrame := AddTab(TDAMacrosFrame, shMacros) as TDAMacrosFrame;
  FSPCallFrame := AddTab(TMSSPCallFrame, shGeneratorSPC) as TDASPCallFrame;

  inherited;

{$IFDEF SDAC}
  btQueryAnalyzer.Visible := IsServerToolInstalled(stQueryAnalyser);
  btManagementStudio.Visible := IsServerToolInstalled(stManagementStudio);
  if btQueryAnalyzer.Visible and (SQL.Connection <> nil) then
    btQueryAnalyzer.Visible := TMSConnection(SQL.Connection).Options.Provider <> prCompact;
  if btManagementStudio.Visible and (SQL.Connection <> nil) then
    btManagementStudio.Visible := TMSConnection(SQL.Connection).Options.Provider <> prCompact;
{$ENDIF}
end;

procedure TMSSQLEditorForm.btQueryAnalyzerClick(Sender: TObject);
begin
{$IFDEF SDAC}
  RunServerToolMSSQL(stQueryAnalyser, LocalComponent as TMSSQL);
{$ENDIF}
end;

procedure TMSSQLEditorForm.btManagementStudioClick(Sender: TObject);
begin
{$IFDEF SDAC}
  RunServerToolMSSQL(stManagementStudio, LocalComponent as TMSSQL);
{$ENDIF}
end;

end.
