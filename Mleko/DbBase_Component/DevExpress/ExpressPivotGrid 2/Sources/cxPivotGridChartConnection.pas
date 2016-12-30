{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{                   ExpressPivotGrid                                 }
{                                                                    }
{       Copyright (c) 2005-2009 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSPIVOTGRID AND ALL ACCOMPANYING }
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.              }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit cxPivotGridChartConnection;

{$I cxVer.inc}

interface

uses
  SysUtils, Classes, cxClasses, cxCustomPivotGrid, cxGridChartView, Variants;

type
  TcxPivotGridChartConnection = class;

  { TcxPivotGridChartCellInfo }

  TcxPivotGridChartCellInfo = class(TObject)
  private
    FValue: Variant;
    FColumnIndex: Integer;
    FRowIndex: Integer;
  public
    constructor Create(AValue: Variant; AColumnIndex, ARowIndex: Integer);

    property ColumnIndex: Integer read FColumnIndex;
    property RowIndex: Integer read FRowIndex;
    property Value: Variant read FValue;
  end;

  { TcxPivotGridChartCellsIndexes }

  TcxPivotGridChartCellInfosList = class(TcxObjectList)
  private
    function GetItem(AIndex: Integer): TcxPivotGridChartCellInfo;
  public
    property Items[Index: Integer]: TcxPivotGridChartCellInfo read GetItem;
  end;

  { TcxPivotGridChartConnectionStorage }

  TcxPivotGridChartConnectionStorage = class(TObject)
  private
    FCells: TcxPivotGridChartCellInfosList;
    FColumns: TStringList;
    FRows: TStringList;
    function GetDataItemDisplayText(ADataItem: TcxPivotGridViewDataItem): string;
    function GetRowDataItem(Index: Integer): TcxPivotGridViewDataItem;
    function GetValue(ACol, ARow: Integer): Variant;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure AddCell(AValue: Variant; ARow, AColumn: TcxPivotGridViewDataItem);

    property Cells: TcxPivotGridChartCellInfosList read FCells;
    property Columns: TStringList read FColumns;
    property RowDataItem[Index: Integer]: TcxPivotGridViewDataItem read GetRowDataItem;
    property Rows: TStringList read FRows;
    property Values[ACol, ARow: Integer]: Variant read GetValue;
  end;

  TcxPivotGridChartViewSourceForCategories = (sfcRows, sfcColumns);
  TcxPivotGridChartViewSourceData = (sdAllShown, sdSelected);

  TcxPivotGridChartGetDataCellsEvent = procedure(Sender: TcxPivotGridChartConnection;
    ACol, ARow: Integer; ACell: TcxPivotGridCrossCellSummary;
    var AUseInCalculations: Boolean) of object;
  TcxPivotGridChartGetSeriesDisplayTextEvent = procedure(
    Sender: TcxPivotGridChartConnection; ASeries: TcxGridChartSeries;
    var ADisplayText: string) of object;

  { TcxPivotGridChartConnection }

  TcxPivotGridChartConnection = class(TComponent, IcxPivotGridListener)
  private
    FGridChartView: TcxGridChartView;
    FOnGetDataCells: TcxPivotGridChartGetDataCellsEvent;
    FOnGetSeriesDisplayText: TcxPivotGridChartGetSeriesDisplayTextEvent;
    FPivotGrid: TcxCustomPivotGrid;
    FSourceData: TcxPivotGridChartViewSourceData;
    FSourceForCategories: TcxPivotGridChartViewSourceForCategories;
    function GetDataFieldFromViewData(ADataBuilder: TcxPivotGridDataBuilder;
      AItem: TcxPivotGridViewDataItem): TcxPivotGridField;
    function GetDataFieldValue(ACol, ARow: TcxPivotGridViewDataItem;
      AViewData: TcxPivotGridViewData; ACell: TcxPivotGridCrossCellSummary;
      var AValue: Variant): Boolean;
    function GetSummaryType(ACol, ARow: TcxPivotGridViewDataItem;
      var ASummaryType: TcxPivotGridSummaryType): Boolean;
    procedure SetGridChartView(AValue: TcxGridChartView);
    procedure SetPivodGrid(AValue: TcxCustomPivotGrid);
    procedure SetSourceData(AValue: TcxPivotGridChartViewSourceData);
    procedure SetSourceForCategories(AValue: TcxPivotGridChartViewSourceForCategories);
  protected
    procedure DoChanged; virtual;
    function DoGetDataCells(ACol, ARow: Integer; AViewData: TcxPivotGridViewData): Boolean; virtual;
    function DoGetSeriesDisplayText(ASeries: TcxGridChartSeries;
      const ADisplayText: string): string; virtual;
    procedure InitializeChart(AStorage: TcxPivotGridChartConnectionStorage;
      AGridChartView: TcxGridChartView); virtual;
    function IsDesignMode: Boolean;
    function IsTotal(ACol, ARow: Integer; AViewData: TcxPivotGridViewData): Boolean;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure PopulateStorage(const AViewData: TcxPivotGridViewData;
      const AStorage: TcxPivotGridChartConnectionStorage); virtual;
    procedure PopulateChartView(AGridChartView: TcxGridChartView;
      AStorage: TcxPivotGridChartConnectionStorage); virtual;
    procedure RebuildChartSeries(AChartView: TcxGridChartView;
      APivotGrid: TcxCustomPivotGrid);
    // IcxPivotGridListener
    procedure DataChanged(Sender: TcxCustomPivotGrid);
    procedure LayoutChanged(Sender: TcxCustomPivotGrid);
    procedure PivotRemoved(Sender: TcxCustomPivotGrid);
    procedure SelectionChanged(Sender: TcxCustomPivotGrid);
  public
    destructor Destroy; override;
    procedure Refresh; virtual;
  published
    property GridChartView: TcxGridChartView read FGridChartView write SetGridChartView;
    property PivotGrid: TcxCustomPivotGrid read FPivotGrid write SetPivodGrid;
    property SourceData: TcxPivotGridChartViewSourceData read FSourceData write SetSourceData default sdAllShown;
    property SourceForCategories: TcxPivotGridChartViewSourceForCategories read FSourceForCategories write SetSourceForCategories default sfcRows;
    property OnGetDataCells: TcxPivotGridChartGetDataCellsEvent read FOnGetDataCells write FOnGetDataCells;
    property OnGetSeriesDisplayText: TcxPivotGridChartGetSeriesDisplayTextEvent read FOnGetSeriesDisplayText write FOnGetSeriesDisplayText;
  end;

implementation

uses
  Types;

{ TcxPivotGridChartCellInfo }

constructor TcxPivotGridChartCellInfo.Create(AValue: Variant;
  AColumnIndex, ARowIndex: Integer);
begin
  FValue := AValue;
  FColumnIndex := AColumnIndex;
  FRowIndex := ARowIndex;
end;

{ TcxPivotGridChartCellsIndexes }

function TcxPivotGridChartCellInfosList.GetItem(AIndex: Integer): TcxPivotGridChartCellInfo;
begin
  Result := TcxPivotGridChartCellInfo(inherited Items[AIndex]);
end;

{ TcxPivotGridChartConnection }

destructor TcxPivotGridChartConnection.Destroy;
begin
  GridChartView := nil;
  PivotGrid := nil;
  inherited Destroy;
end;

procedure TcxPivotGridChartConnection.Refresh;
begin
  DoChanged;
end;

procedure TcxPivotGridChartConnection.DoChanged;
begin
  if not (csDestroying in ComponentState) then
    RebuildChartSeries(GridChartView, PivotGrid);
end;

function TcxPivotGridChartConnection.DoGetDataCells(ACol, ARow: Integer;
  AViewData: TcxPivotGridViewData): Boolean;
begin
  Result := ((SourceData = sdAllShown) and not IsTotal(ACol, ARow, AViewData)) or
    ((SourceData = sdSelected) and AViewData.IsCellSelected(ARow, ACol));
  if Assigned(OnGetDataCells) then
    OnGetDataCells(Self, ACol, ARow, AViewData.Cells[ARow, ACol], Result);
end;

function TcxPivotGridChartConnection.DoGetSeriesDisplayText(
  ASeries: TcxGridChartSeries; const ADisplayText: string): string;
begin
  Result := ADisplayText;
  if Assigned(OnGetSeriesDisplayText) then
    OnGetSeriesDisplayText(Self, ASeries, Result);
end;

procedure TcxPivotGridChartConnection.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = PivotGrid then
      PivotGrid := nil;
    if AComponent = GridChartView then
      GridChartView := nil;
  end;
end;

procedure TcxPivotGridChartConnection.PopulateStorage(
  const AViewData: TcxPivotGridViewData;
  const AStorage: TcxPivotGridChartConnectionStorage);
var
  AColumn: TcxPivotGridViewDataItem;
  ARow: TcxPivotGridViewDataItem;
  AValue: Variant;
  I, J: Integer;
begin
  for I := 0 to AViewData.ColumnCount - 1 do
  begin
    AColumn := AViewData.Columns[I];
    for J := 0 to AViewData.RowCount - 1 do
      if DoGetDataCells(I, J, AViewData) then
      begin                         
        ARow := AViewData.Rows[J]; 
        if GetDataFieldValue(AColumn, ARow, AViewData, AViewData.Cells[J, I], AValue) then
        begin
          if SourceForCategories = sfcRows then
            AStorage.AddCell(AValue, AColumn, ARow)
          else
            AStorage.AddCell(AValue, ARow, AColumn);
        end;
      end;
  end;
end;

procedure TcxPivotGridChartConnection.PopulateChartView(
  AGridChartView: TcxGridChartView; AStorage: TcxPivotGridChartConnectionStorage);
var
  I, J: Integer;
begin
  for I := 0 to AStorage.Columns.Count - 1 do
    for J := 0 to AStorage.Rows.Count - 1 do
      AGridChartView.ViewData.Values[J, I] := AStorage.Values[I, J];
end;

procedure TcxPivotGridChartConnection.RebuildChartSeries(
  AChartView: TcxGridChartView; APivotGrid: TcxCustomPivotGrid);
var
  AStorage: TcxPivotGridChartConnectionStorage;
begin
  if (APivotGrid = nil) or (AChartView = nil) or APivotGrid.IsLoading or IsDesignMode then
    Exit;
    
  AStorage := TcxPivotGridChartConnectionStorage.Create;
  try
    PopulateStorage(APivotGrid.ViewData, AStorage);
    AChartView.BeginUpdate;
    try
      InitializeChart(AStorage, AChartView);
      PopulateChartView(AChartView, AStorage);
    finally
      AChartView.EndUpdate;
    end;
  finally
    AStorage.Free;
  end;
end;

procedure TcxPivotGridChartConnection.InitializeChart(
  AStorage: TcxPivotGridChartConnectionStorage; AGridChartView: TcxGridChartView);
var
  ARowDataItem: TcxPivotGridViewDataItem;
  ASeries: TcxGridChartSeries;
  I: Integer;
begin
  AGridChartView.BeginUpdate;
  try
    AGridChartView.ViewData.CategoryCount := AStorage.Columns.Count;
    for I := 0 to AStorage.Columns.Count - 1 do
      AGridChartView.ViewData.Categories[I] := AStorage.Columns.Strings[I];

    AGridChartView.ClearSeries;
    for I := 0 to AStorage.Rows.Count - 1 do
    begin
      ASeries := AGridChartView.CreateSeries;
      ASeries.DisplayText := DoGetSeriesDisplayText(ASeries,
        AStorage.Rows.Strings[I]);
      ARowDataItem := AStorage.RowDataItem[I];
      if ARowDataItem.Field <> nil then
        ASeries.ValueCaptionFormat := ARowDataItem.Field.DisplayFormat;
    end;
  finally
    AGridChartView.EndUpdate;
  end;
end;

function TcxPivotGridChartConnection.IsDesignMode: Boolean;
begin
  Result := csDesigning in ComponentState;
end;

function TcxPivotGridChartConnection.IsTotal(ACol, ARow: Integer;
  AViewData: TcxPivotGridViewData): Boolean;
begin
  Result := AViewData.Columns[ACol].IsTotalItem or AViewData.Rows[ARow].IsTotalItem;
end;

// IcxPivotGridListener
procedure TcxPivotGridChartConnection.DataChanged(Sender: TcxCustomPivotGrid);
begin
  DoChanged;
end;

procedure TcxPivotGridChartConnection.LayoutChanged(Sender: TcxCustomPivotGrid);
begin
  DoChanged;
end;

procedure TcxPivotGridChartConnection.PivotRemoved(Sender: TcxCustomPivotGrid);
begin
  PivotGrid := nil;
end;

procedure TcxPivotGridChartConnection.SelectionChanged(Sender: TcxCustomPivotGrid);
begin
  if SourceData = sdSelected then
    DoChanged;
end;

function TcxPivotGridChartConnection.GetDataFieldFromViewData(
  ADataBuilder: TcxPivotGridDataBuilder;
  AItem: TcxPivotGridViewDataItem): TcxPivotGridField;
var
  I: Integer;
begin
  Result := nil;
  if ADataBuilder.DataFields.Count = 0 then
    Exit;
  if ADataBuilder.DataFields.Count = 1 then
    Result := ADataBuilder.DataFields[0]
  else
  begin
    while (AItem <> nil) and not AItem.IsDataField do
      AItem := AItem.Parent;
    if (AItem <> nil) and AItem.IsDataField then
      Result := AItem.Field
    else
    begin
      for I := 0 to ADataBuilder.DataFields.Count - 1 do
        if ADataBuilder.DataFields[I].SummaryVariation = svNone then
          Result := ADataBuilder.DataFields[I];
    end;
  end;
end;

function TcxPivotGridChartConnection.GetSummaryType(
  ACol, ARow: TcxPivotGridViewDataItem; var ASummaryType: TcxPivotGridSummaryType): Boolean;
var
  ATotal: TcxPivotGridCustomTotal;
begin
  Result := ARow.GetSummaryType(ASummaryType, ATotal) or
    ACol.GetSummaryType(ASummaryType, ATotal);
end;

function TcxPivotGridChartConnection.GetDataFieldValue(
  ACol, ARow: TcxPivotGridViewDataItem; AViewData: TcxPivotGridViewData;
  ACell: TcxPivotGridCrossCellSummary; var AValue: Variant): Boolean;
var
  ADataField: TcxPivotGridField;
  ASummaryType: TcxPivotGridSummaryType;
begin
  if PivotGrid.OptionsDataField.Area = dfaRow then
    ADataField := GetDataFieldFromViewData(AViewData.DataBuilder, ARow)
  else
    ADataField := GetDataFieldFromViewData(AViewData.DataBuilder, ACol);

  Result := ADataField <> nil;
  if Result then
  begin
    ASummaryType := ADataField.SummaryType;
    if GetSummaryType(ACol, ARow, ASummaryType) or (ADataField.SummaryVariation = svNone) then
      AValue := ACell.GetSummaryValue(ASummaryType)
    else
      AValue := ACell.SummaryVariation;
  end;
end;

procedure TcxPivotGridChartConnection.SetSourceForCategories(
  AValue: TcxPivotGridChartViewSourceForCategories);
begin
  if AValue <> SourceForCategories then
  begin
    FSourceForCategories := AValue;
    DoChanged;
  end;
end;

procedure TcxPivotGridChartConnection.SetSourceData(
  AValue: TcxPivotGridChartViewSourceData);
begin
  if AValue <> SourceData then
  begin
    FSourceData := AValue;
    DoChanged;
  end;
end;

procedure TcxPivotGridChartConnection.SetGridChartView(AValue: TcxGridChartView);
begin
  if AValue <> FGridChartView then
  begin
    FGridChartView := AValue;
    DoChanged;
  end;
end;

procedure TcxPivotGridChartConnection.SetPivodGrid(AValue: TcxCustomPivotGrid);
begin
  if AValue <> FPivotGrid then
  begin
    if PivotGrid <> nil then
      PivotGrid.RemoveListener(Self);
    FPivotGrid := AValue;
    if PivotGrid <> nil then
      PivotGrid.AddListener(Self);
    DoChanged;
  end;
end;

{ TcxPivotGridChartConnectionStorage }

constructor TcxPivotGridChartConnectionStorage.Create;
begin
  FCells := TcxPivotGridChartCellInfosList.Create;
  FColumns := TStringList.Create;
  FRows := TStringList.Create;
end;

destructor TcxPivotGridChartConnectionStorage.Destroy;
begin
  FCells.Clear;
  FreeAndNil(FRows);
  FreeAndNil(FColumns);
  FreeAndNil(FCells);
  inherited Destroy;
end;

procedure TcxPivotGridChartConnectionStorage.AddCell(AValue: Variant;
  ARow, AColumn: TcxPivotGridViewDataItem);
var
  AColumnIndex: Integer;
  ARowIndex: Integer;
begin
  ARowIndex := Rows.IndexOfObject(ARow);
  if ARowIndex < 0 then
  begin
    ARowIndex := Rows.Count;
    Rows.AddObject(GetDataItemDisplayText(ARow), ARow);
  end;
  AColumnIndex := Columns.IndexOfObject(AColumn);
  if AColumnIndex < 0 then
  begin
    AColumnIndex := Columns.Count;
    Columns.AddObject(GetDataItemDisplayText(AColumn), AColumn);
  end;
  Cells.Add(TcxPivotGridChartCellInfo.Create(AValue, AColumnIndex, ARowIndex));
end;

function TcxPivotGridChartConnectionStorage.GetDataItemDisplayText(
  ADataItem: TcxPivotGridViewDataItem): string;
begin
  Result := ADataItem.GetDisplayText;
  if (ADataItem.Parent <> nil) and (ADataItem.Parent.Value <> '') then
    Result := GetDataItemDisplayText(ADataItem.Parent) + ' - ' + Result;
end;

function TcxPivotGridChartConnectionStorage.GetRowDataItem(
  Index: Integer): TcxPivotGridViewDataItem;
begin
  Result := TcxPivotGridViewDataItem(Rows.Objects[Index]);
end;

function TcxPivotGridChartConnectionStorage.GetValue(ACol, ARow: Integer): Variant;
var
  AItem: TcxPivotGridChartCellInfo;
  I: Integer;
begin
  Result := Null;
  for I := 0 to Cells.Count - 1 do
  begin
    AItem := Cells.Items[I];
    if (AItem.ColumnIndex = ACol) and (AItem.RowIndex = ARow) then
    begin
      Result := AItem.Value;
      Break;
    end;
  end;
end;

end.
