//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2005 Core Lab. All right reserved.
//  MSNames Editor
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSNamesEditor;
{$ENDIF}

interface

uses
{$IFDEF MSWINDOWS}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, StdCtrls,
{$ENDIF}
{$IFDEF LINUX}
  Qt, SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  QComCtrls, QGrids, QDBGrids, QDBCtrls, QButtons, QExtCtrls,
{$ENDIF}
  CREditor, DADualListEditor, MSAccess;
  
type
  TMSNamesEditorForm = class(TDADualListEditorForm)
  protected
    FConnection: TMSConnection;
    FNames: string;

    procedure DoInit; override;
    procedure DoSave; override;
    
    function GetComponent: TComponent; override;
    procedure SetComponent(Value: TComponent); override;

    function GetSrcLabelCaption: string; override;
    procedure GetSrcListItems(Items: TStrings); override;
    function GetDestLabelCaption: string; override;
    procedure GetDstListItems(Items: TStrings); override;
  public
    property Connection: TMSConnection read FConnection write FConnection;
    property Names: string read FNames write FNames;  
  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R MSNamesEditor.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

{ TMSNamesEditorForm }

procedure TMSNamesEditorForm.DoInit;
begin
  if Connection = nil then
    Abort;
    
  inherited;
end;

procedure TMSNamesEditorForm.DoSave;
begin
  Names := TableNamesFromList(DstList.Items);
end;

function TMSNamesEditorForm.GetComponent: TComponent;
begin
  Result := FConnection;
end;

procedure TMSNamesEditorForm.SetComponent(Value: TComponent);
begin
  FConnection := Value as TMSConnection;
end;

function TMSNamesEditorForm.GetDestLabelCaption: string;
begin
  Result := 'Selected tables';
end;

procedure TMSNamesEditorForm.GetDstListItems(Items: TStrings);
begin
  TableNamesToList(Names, DstList.Items);
end;

function TMSNamesEditorForm.GetSrcLabelCaption: string;
begin
  Result := 'Available tables';
end;

procedure TMSNamesEditorForm.GetSrcListItems(Items: TStrings);
begin
  Connection.GetTableNames(Items);
end;

end.
