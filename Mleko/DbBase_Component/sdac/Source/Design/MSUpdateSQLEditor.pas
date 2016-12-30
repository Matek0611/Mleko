//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2005 Core Lab. All right reserved.
//  MSStoredProc Editor
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I SDac.inc}

unit MSUpdateSQLEditor;
{$ENDIF}
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DAUpdateSQLEditor, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TMSUpdateSQLEditorForm = class(TDAUpdateSQLEditorForm)
  protected
    procedure DoInit; override;
  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R MSUpdateSQLEditor.dfm}
{$ENDIF}

uses
  DAUpdateSQLFrame, DASQLGeneratorFrame;

procedure TMSUpdateSQLEditorForm.DoInit;
begin
  FUpdateSQLFrame := AddTab(TDAUpdateSQLFrame, shEditSQL) as TDAUpdateSQLFrame;
  FSQLGeneratorFrame := AddTab(TDASQLGeneratorFrame, shGenerator) as TDASQLGeneratorFrame;
  inherited;
end;

end.
