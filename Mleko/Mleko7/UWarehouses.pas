unit UWarehouses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, Data, DB, MemDS, DBAccess,
  MSAccess, CheckLst, GridsEh, DBGridEh, Grids, DBGrids;

type
  TfrmWarehouses = class(TMlekoForm)
    btnAdd: TButton;
    dsWarehouses: TDataSource;
    quMaxID: TMSQuery;
    tbWarehouses: TMSTable;
    btnOK: TButton;
    btnDelete: TButton;
    quMaxIDID: TSmallintField;
    tbWarehousesid: TSmallintField;
    tbWarehousesName: TStringField;
    tbWarehousesActive: TBooleanField;
    dbgWarehouses: TDBGridEh;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgWarehousesTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dbgWarehousesCellClick(Column: TColumnEh);
  private
    OldCol, OldDir, CurrentID: Integer;
    function EnableDelete: Boolean;
    procedure SortRecordsInTableByColumn(Table: TMSTable;
      Column: TColumnEh);
    function GetCurrentID: Integer;
    function GetMaxID: Integer;
    function LocateID(ID: Integer): Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

function GetWarehouseIDByDlg(MaxID: PInteger = nil): Integer;

var
  frmWarehouses: TfrmWarehouses;
implementation
uses Variants, MlekoUtils;

{$R *.DFM}

const
  DefWarehouseName = 'Склад ';

function GetWarehouseIDByDlg(MaxID: PInteger = nil): Integer;
begin
  Result:= -1;
  if (frmWarehouses=nil) then
     frmWarehouses:= TfrmWarehouses.Create(Application);
  if (MaxID<>nil) then frmWarehouses.LocateID(MaxID^);
   if frmWarehouses.ShowModal=mrOK then
   begin
     Result:= frmWarehouses.CurrentID;
     if MaxID<>nil then MaxID^:= frmWarehouses.GetMaxID;
   end;
   FreeAndNil(frmWarehouses);
end;

function TfrmWarehouses.LocateID(ID: Integer): Boolean;
begin
  Result:= tbWarehouses.Locate('ID', ID, []);
end;

function TfrmWarehouses.EnableDelete(): Boolean;
begin
  Result:= (tbWarehouses.RecordCount>0);
end;

function TfrmWarehouses.GetCurrentID(): Integer;
var CurID: Variant;
begin
  Result:= -1;
  CurID:= tbWarehousesID.Value;
  if (not VarIsNull(CurID)) then
     Result:= tbWarehousesID.AsInteger;
end;

procedure TfrmWarehouses.FormCreate(Sender: TObject);
begin
  inherited;
  tbWarehouses.Open;
  btnDelete.Enabled:= EnableDelete();
  OldCol:= 1; OldDir:= 1;
  CurrentID:= GetCurrentID();
end;

procedure TfrmWarehouses.FormDestroy(Sender: TObject);
begin
  inherited;
  tbWarehouses.Close;
end;

function TfrmWarehouses.GetMaxID(): Integer;
begin
  quMaxID.Active:= False;
  quMaxID.Active:= True;
  Result:= quMaxIDID.AsInteger;
end;

procedure TfrmWarehouses.btnAddClick(Sender: TObject);
var CurName: string;
begin
  //CurName:= tbWarehousesName.AsString;
  tbWarehouses.Append;
  CurrentID:= GetMaxID + 1;
  tbWarehouses.Edit;
  tbWarehousesID.AsInteger:= CurrentID;
  tbWarehousesName.AsString:= DefWarehouseName + IntToStr(tbWarehousesID.AsInteger);
  tbWarehousesActive.AsBoolean:= True;
  tbWarehouses.Post;
  btnDelete.Enabled:= EnableDelete;
end;

procedure TfrmWarehouses.btnOKClick(Sender: TObject);
begin
  inherited;
  if (tbWarehouses.State in [dsEdit, dsInsert]) then
      tbWarehouses.Post;
  CurrentID:= GetCurrentID();
end;

procedure TfrmWarehouses.btnDeleteClick(Sender: TObject);
begin
  inherited;
    if Application.MessageBox('Вы уверены?', 'Удаление', MB_YESNO) = IDYES then
    begin
      tbWarehouses.Edit;
      tbWarehouses.Delete;
    end;
    btnDelete.Enabled:= EnableDelete();
    CurrentID:= GetCurrentID();
end;

procedure TfrmWarehouses.SortRecordsInTableByColumn(Table: TMSTable; Column: TColumnEh);
var OrderFields: string;
begin
  OrderFields:=
  SortMSQueryInEhGrid( OldCol, OldDir, Column.Index, 1, Column, nil, nil,
                       Column.FieldName, '', False, False);
  Table.OrderFields:= OrderFields;
end;

procedure TfrmWarehouses.dbgWarehousesTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  SortRecordsInTableByColumn(tbWarehouses, Column);
end;

procedure TfrmWarehouses.dbgWarehousesCellClick(Column: TColumnEh);
begin
  inherited;
  CurrentID:= GetCurrentID();
end;

end.
