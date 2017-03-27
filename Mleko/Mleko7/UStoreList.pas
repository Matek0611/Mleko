unit UStoreList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, Data, DB, MemDS, DBAccess,
  MSAccess, CheckLst, GridsEh, DBGridEh, Grids, DBGrids;

type
  TfrmStoreList = class(TMlekoForm)
    btnAdd: TButton;
    dsStores: TDataSource;
    quMaxID: TMSQuery;
    tbStores: TMSTable;
    btnClose: TButton;
    btnDelete: TButton;
    quMaxIDID: TSmallintField;
    tbStoresid: TSmallintField;
    tbStoresName: TStringField;
    tbStoresActive: TBooleanField;
    dbgStores: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgStoresTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    OldCol, OldDir: Integer;
    function EnableDelete: Boolean;
    procedure SortRecordsInTableByColumn(Table: TMSTable;
      Column: TColumnEh);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStoreList: TfrmStoreList;
implementation
uses Variants, MlekoUtils;

{$R *.DFM}

const
  DefStoreName = 'Склад ';

function TfrmStoreList.EnableDelete(): Boolean;
begin
  Result:= (tbStores.RecordCount>0);
end;

procedure TfrmStoreList.FormCreate(Sender: TObject);
begin
  inherited;
  tbStores.Open;
  btnDelete.Enabled:= EnableDelete();
  OldCol:= 1; OldDir:= 1;
end;

procedure TfrmStoreList.FormDestroy(Sender: TObject);
begin
  inherited;
  tbStores.Close;
end;

procedure TfrmStoreList.btnAddClick(Sender: TObject);
var CurName: string;
begin
  //CurName:= tbStoresName.AsString;
  tbStores.Append;
  quMaxID.Active:= False;
  quMaxID.Active:= True;
  tbStores.Edit;
  tbStoresID.AsInteger:= quMaxIDID.AsInteger + 1;
  tbStoresName.AsString:= DefStoreName + IntToStr(tbStoresID.AsInteger);
  tbStoresActive.AsBoolean:= True;
  tbStores.Post;
  btnDelete.Enabled:= EnableDelete;
end;

procedure TfrmStoreList.btnCloseClick(Sender: TObject);
begin
  inherited;
  if (tbStores.State in [dsEdit, dsInsert]) then
      tbStores.Post;
  Close;
end;

procedure TfrmStoreList.btnDeleteClick(Sender: TObject);
begin
  inherited;
    if Application.MessageBox('Вы уверены?', 'Удаление', MB_YESNO) = IDYES then
    begin
      tbStores.Edit;
      tbStores.Delete;
    end;
    btnDelete.Enabled:= EnableDelete();
end;

procedure TfrmStoreList.SortRecordsInTableByColumn(Table: TMSTable; Column: TColumnEh);
var OrderFields: string;
begin
  OrderFields:=
  SortMSQueryInEhGrid( OldCol, OldDir, Column.Index, 1, Column, nil, nil,
                       Column.FieldName, '', False, False);
  Table.OrderFields:= OrderFields;
end;

procedure TfrmStoreList.dbgStoresTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  SortRecordsInTableByColumn(tbStores, Column);
end;

end.
