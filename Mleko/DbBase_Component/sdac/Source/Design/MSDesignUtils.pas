
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I SDac.inc}

unit MSDesignUtils;
{$ENDIF}

interface

uses
  Classes, SysUtils, DBAccess, DADesignUtils;

type
  TMSDesignUtilsAlias = class(TDADesignUtilsAlias)
    {$IFNDEF VER8}class{$ENDIF} function GetProjectName: string; override;

    {$IFNDEF VER8}class{$ENDIF} function GetConnectionList: TObject; override;

  { TDATable support }
    {$IFNDEF VER8}class{$ENDIF} function GetTableName(Obj: TCustomDADAtaSet): string; override;
    {$IFNDEF VER8}class{$ENDIF} procedure SetTableName(Obj: TCustomDADAtaSet; Value: string); override;
    {$IFNDEF VER8}class{$ENDIF} function GetOrderFields(Obj: TCustomDADAtaSet): string; override;
    {$IFNDEF VER8}class{$ENDIF} procedure SetOrderFields(Obj: TCustomDADAtaSet; Value: string); override;
    {$IFNDEF VER8}class{$ENDIF} procedure PrepareSQL(Obj: TCustomDADAtaSet); override;
    {$IFNDEF VER8}class{$ENDIF} function GetStoredProcName(Obj: TCustomDADataSet): string; override;
    {$IFNDEF VER8}class{$ENDIF} procedure SetStoredProcName(Obj: TCustomDADataSet; Value: string); override;

  {$IFDEF USE_SYNEDIT}
    {$IFNDEF VER8}class{$ENDIF} function SQLDialect: integer ; override; // SynHighlighterSQL TSQLDialect = (sqlStandard, sqlInterbase6, sqlMSSQL7, sqlMySQL, sqlOracle, sqlSybase, sqlIngres, sqlMSSQL2K);
  {$ENDIF}
  end;

{$IFDEF VER8}
  TMSDesignUtilsClass = TMSDesignUtilsAlias;

var
  TMSDesignUtils: TMSDesignUtilsAlias;
{$ELSE}
  TMSDesignUtils = TMSDesignUtilsAlias;
  TMSDesignUtilsClass = class of TMSDesignUtils;
{$ENDIF}

implementation

uses
  MSAccess{$IFDEF SDAC}, MSDesign{$ENDIF};

{ TMSDesignUtils }

{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.GetProjectName: string;
begin
  Result := 'SDAC';
end;

{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.GetConnectionList: TObject;
begin
{$IFDEF SDAC}
  Result := TMSConnectionList.Create;
{$ELSE}
  Result := nil;
{$ENDIF}
end;

{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.GetTableName(Obj: TCustomDADAtaSet): string;
begin
  Assert(Obj is TCustomMSTable, Obj.ClassName);
  Result := TCustomMSTable(Obj).TableName;
end;

{$IFNDEF VER8}class{$ENDIF} procedure TMSDesignUtilsAlias.SetTableName(Obj: TCustomDADAtaSet;
  Value: string);
begin
  Assert(Obj is TCustomMSTable, Obj.ClassName);
  TCustomMSTable(Obj).TableName := Value;
end;

{$IFNDEF VER8}class{$ENDIF} procedure TMSDesignUtilsAlias.PrepareSQL(Obj: TCustomDADAtaSet);
begin
  Assert(Obj is TCustomMSTable, Obj.ClassName);
  TCustomMSTable(Obj).PrepareSQL;
end;

{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.GetOrderFields(Obj: TCustomDADAtaSet): string;
begin
  Assert(Obj is TCustomMSTable, Obj.ClassName);
  Result := TCustomMSTable(Obj).OrderFields;
end;

{$IFNDEF VER8}class{$ENDIF} procedure TMSDesignUtilsAlias.SetOrderFields(Obj: TCustomDADAtaSet;
  Value: string);
begin
  Assert(Obj is TCustomMSTable, Obj.ClassName);
  TCustomMSTable(Obj).OrderFields := Value;
end;

{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.GetStoredProcName(Obj: TCustomDADataSet): string;
begin
  Assert(Obj is TMSStoredProc, Obj.ClassName);
  Result := TMSStoredProc(Obj).StoredProcName;
end;

{$IFNDEF VER8}class{$ENDIF} procedure TMSDesignUtilsAlias.SetStoredProcName(Obj: TCustomDADataSet; Value: string);
begin
  Assert(Obj is TMSStoredProc, Obj.ClassName);
  TMSStoredProc(Obj).StoredProcName := Value;
end;

{$IFDEF USE_SYNEDIT}
{$IFNDEF VER8}class{$ENDIF} function TMSDesignUtilsAlias.SQLDialect: integer;
begin
  Result := 7; // sqlMSSQL2K
end;
{$ENDIF}

{$IFDEF VER8}
initialization
  TMSDesignUtils := TMSDesignUtilsAlias.Create;

finalization
  TMSDesignUtils.Free;
{$ENDIF}

end.
