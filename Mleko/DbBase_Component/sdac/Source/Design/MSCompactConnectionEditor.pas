//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MSCompactConnection Editor
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I SDac.inc}

unit MSCompactConnectionEditor;
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, MSConnectionEditor, StdCtrls, ExtCtrls, Mask, ComCtrls, Buttons;

type
  TMSCompactConnectionEditorForm = class(TMSConnectionEditorForm)
  end;

var
  MSCompactConnectionEditorForm: TMSCompactConnectionEditorForm;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R MSCompactConnectionEditor.dfm}
{$ENDIF}

end.
