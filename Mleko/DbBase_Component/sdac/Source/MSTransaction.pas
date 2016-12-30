//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  MSTransaction
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit MSTransaction;
{$ENDIF}

interface

uses
  Classes, DATransaction, DBAccess, MSAccess;
  
type
  TMSTransaction = class(TDATransaction)
  protected
    function SQLMonitorClass: TClass; override;
    function GetITransactionClass: TCRTransactionClass; override;

    // function GetDefaultConnection: TMSConnection;
    // procedure SetDefaultConnection(Value: TMSConnection);

  published
    // property DefaultConnection: TMSConnection read GetDefaultConnection write SetDefaultConnection;
    
    property IsolationLevel;
    property DefaultCloseAction;
    property OnError;
  end;

implementation

uses
  OLEDBAccess, MSSQLMonitor;
  
{ TMSTransaction }

function TMSTransaction.SQLMonitorClass: TClass;
begin
  Result := TMSSQLMonitor;
end;

function TMSTransaction.GetITransactionClass: TCRTransactionClass;
begin
  Result := TOLEDBTransaction;
end;

end.
