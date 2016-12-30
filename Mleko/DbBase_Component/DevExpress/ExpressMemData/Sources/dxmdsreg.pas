{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressMemData - CLX/VCL Edition                            }
{                                                                   }
{       Copyright (c) 1998-2009 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, DPU, SO, ETC.) ARE CONFIDENTIAL AND PROPRIETARY }
{   TRADE SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER}
{   IS LICENSED TO DISTRIBUTE THE EXPRESSMEMDATA                    }
{   AS PART OF AN EXECUTABLE PROGRAM ONLY.                          }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxmdsreg;

interface

{$I cxVer.inc}

procedure Register;

implementation

uses
{$IFDEF DELPHI6}
  DesignEditors, DesignIntf,
{$ELSE}
  DsgnIntf,
{$ENDIF}
  Windows, Classes, DB, dxmdaset, dxmdsedt, dxmdatps, ShellAPI;

const
  dxmdsVersion = '1.42';
  GetVerbSt0 = 'Field Editor ...';
  GetVerbSt1 = 'ExpressMemData Persistent Editor...';
  GetVerbSt2 = '-';
  GetVerbSt3 = 'ExpressMemData ' + dxmdsVersion;
  GetVerbSt4 = 'http://www.devexpress.com';
  GetVerbSt5 = 'Developer Express Inc.';

{TdxMemDataComponentEditor}
type
  TdxMemDataComponentEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure TdxMemDataComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      ShowdxMemDataEditor(TdxMemData(Component), Designer);
    1:
      ShowMemDataPersistentDesigner(TdxMemData(Component), Designer);
    3, 4, 5:
      ShellExecute(0, 'OPEN', 'http://www.devexpress.com', nil, '', SW_SHOWMAXIMIZED);
  end;
end;

function TdxMemDataComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := GetVerbSt0;
    1: Result := GetVerbSt1;
    2: Result := GetVerbSt2;
    3: Result := GetVerbSt3;
    4: Result := GetVerbSt4;
    5: Result := GetVerbSt5;
  end;
end;

function TdxMemDataComponentEditor.GetVerbCount: Integer;
begin
  Result := 6;
end;

{ TDBStringProperty }
type
  TDBStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TDBStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBStringProperty.GetValueList(List: TStrings);
begin
end;

procedure TDBStringProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

type
  TDBSortedFieldProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure TDBSortedFieldProperty.GetValueList(List: TStrings);
var
  i : Integer;
begin
  with TDataSet(GetComponent(0)) do
    for i := 0 to FieldCount - 1 do
      if(Fields[i].Owner = Owner)
      and (Fields[i].FieldName <> '')then
        List.Add(Fields[i].FieldName);
end;

type
  TDBIndexedFieldProperty = class(TDBStringProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

procedure TDBIndexedFieldProperty.GetValueList(List: TStrings);
var
  i : Integer;
  MemData: TdxCustomMemData;
begin
  MemData := TdxMemIndex(GetComponent(0)).MemData;
  for i := 0 to MemData.FieldCount - 1 do
    if(MemData.Fields[i].Owner = MemData.Owner)
    and (MemData.Fields[i].FieldName <> '')then
      List.Add(MemData.Fields[i].FieldName);
end;

type
  TMemDataPersistentProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TMemDataPersistentProperty.Edit;
begin
  ShowMemDataPersistentDesigner(TdxMemPersistent(GetOrdValue).MemData, Designer);
end;

function TMemDataPersistentProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paSubProperties, paDialog, paReadOnly];
end;

procedure Register;
begin
{$IFDEF DELPHI9}
  ForceDemandLoadState(dlDisable);
{$ENDIF}  

  RegisterComponents('Dev Express', [TdxMemData]);

  RegisterComponentEditor(TdxMemData, TdxMemDataComponentEditor);
  RegisterPropertyEditor(TypeInfo(string), TdxMemData, 'SortedField',
     TDBSortedFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxMemIndex, 'FieldName',
     TDBIndexedFieldProperty);
  RegisterPropertyEditor(TypeInfo(TdxMemPersistent), nil, '',
     TMemDataPersistentProperty);
end;

end.
