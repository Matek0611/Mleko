
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  SDAC registration
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSReg;
{$ENDIF}

interface
uses
  Classes, MSAccess, MSSQLMonitor, SdacVcl, 
{$IFNDEF STD}
  MSLoader, MSDump, MSServiceBroker, MSCompactConnection, MSTransaction,
{$ENDIF}
  MSScript;

procedure Register;

implementation

uses
{$IFDEF CLR}
  CoreLab.Sdac.DataAdapter, 
{$ENDIF}
  DBAccess, DacReg;

{$IFNDEF CLR}
  {$IFDEF VER9}
    {$R MSDesign9.res}
  {$ELSE}
    {$R MSDesign.res}
  {$ENDIF}
  {$IFDEF VER10P}
    {$R MSDesign10p.res}
  {$ENDIF}
{$ELSE}
  {$R MSDesign.res}
{$ENDIF}

procedure Register;
begin
{$IFNDEF STD}
  RegisterCRBatchMove;
{$ENDIF}

  RegisterComponents('SQL Server Access', [TMSConnection]);
  RegisterComponents('SQL Server Access', [TMSQuery]);
  RegisterComponents('SQL Server Access', [TMSTable]);
  RegisterComponents('SQL Server Access', [TMSStoredProc]);
  RegisterComponents('SQL Server Access', [TMSSQL]);
  RegisterComponents('SQL Server Access', [TMSScript]);
  RegisterComponents('SQL Server Access', [TMSUpdateSQL]);
  RegisterComponents('SQL Server Access', [TMSDataSource]);

{$IFNDEF STD}
  RegisterComponents('SQL Server Access', [TMSLoader]);
  RegisterComponents('SQL Server Access', [TMSDump]);
  RegisterComponents('SQL Server Access', [TMSServiceBroker]);
  RegisterComponents('SQL Server Access', [TMSMetadata]);
{$ENDIF}

  RegisterComponents('SQL Server Access', [TMSSQLMonitor]);
  RegisterComponents('SQL Server Access', [TMSConnectDialog]);

{$IFNDEF STD}
  RegisterComponents('SQL Server Access', [TMSCompactConnection]);
  RegisterComponents('SQL Server Access', [TMSTransaction]);
  RegisterComponents('SQL Server Access', [TMSChangeNotification]);
{$ENDIF}
end;

end.

