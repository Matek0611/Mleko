
//////////////////////////////////////////////////
//  SQL Server Access Components
//  Copyright © 1998-2005 Core Lab. All right reserved.
//  SDAC Stored Proc Call Generator Frame
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I SDac.inc}

unit MSSPCallFrame;
{$ENDIF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DASPCallFrame, StdCtrls, Buttons, ExtCtrls, DBAccess;

type
  TMSSPCallFrame = class(TDASPCallFrame)
    cbSystem: TCheckBox;
    procedure cbStoredProcNameDropDown(Sender: TObject);
    procedure cbSystemClick(Sender: TObject);
  protected
    function CreateProcCall(SPName: string; SPParams: TDAParams): string; override;  
  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R MSSPCallFrame.dfm}
{$ENDIF}

uses
  MSAccess;

{ TMSSPCallFrame }

function TMSSPCallFrame.CreateProcCall(SPName: string; SPParams: TDAParams): string;
var
  MSSQL: TMSSQL;
begin
  MSSQL := TMSSQL.Create(nil);
  try
    MSSQL.Connection := TMSConnection(UsedConnection);
    Assert(MSSQL.Connection <> nil);
    MSSQL.CreateProcCall(SPName);
    SPParams.Assign(MSSQL.Params);
    Result := MSSQL.SQL.Text;
  finally
    MSSQL.Free;
  end;
end;

procedure TMSSPCallFrame.cbStoredProcNameDropDown(Sender: TObject);
begin
  try
    if not FListGot and (UsedConnection <> nil) then begin
      Editor.CheckConnection(UsedConnection);
      TMSConnection(UsedConnection).GetStoredProcNames(cbStoredProcName.Items, cbSystem.Checked);
      cbStoredProcNameSP.Items.Assign(cbStoredProcName.Items);
      FListGot := True;
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TMSSPCallFrame.cbSystemClick(Sender: TObject);
begin
  FListGot := False;
end;

end.
