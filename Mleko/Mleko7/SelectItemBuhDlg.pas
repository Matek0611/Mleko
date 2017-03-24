unit SelectItemBuhDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, Data, DB, MemDS, DBAccess,
  MSAccess, CheckLst, GridsEh, DBGridEh, Grids, DBGrids;

type
  TfrmSelectItemBuhDlg = class(TMlekoForm)
    btnAdd: TButton;
    dsBuhPersons: TDataSource;
    quMaxID: TMSQuery;
    tbBuhPersons: TMSTable;
    btnClose: TButton;
    btnDelete: TButton;
    tbBuhPersonsid: TSmallintField;
    tbBuhPersonsPerson: TStringField;
    tbBuhPersonsActive: TBooleanField;
    quActive: TMSQuery;
    quActiveID: TSmallintField;
    dbgBuhPersons: TDBGrid;
    quMaxIDID: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgBuhPersonsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgBuhPersonsCellClick(Column: TColumn);
    procedure btnDeleteClick(Sender: TObject);
  private
    function ActiveID: Integer;
    function EnableDelete: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectItemBuhDlg: TfrmSelectItemBuhDlg;
implementation
uses Variants, MlekoUtils;

{$R *.DFM}

function TfrmSelectItemBuhDlg.EnableDelete(): Boolean;
begin
  Result:= (tbBuhPersons.RecordCount>1) and
           (tbBuhPersonsID.AsInteger<>ActiveID);
end;

procedure TfrmSelectItemBuhDlg.FormCreate(Sender: TObject);
begin
  inherited;
  tbBuhPersons.Open;
  btnDelete.Enabled:= EnableDelete();
end;

procedure TfrmSelectItemBuhDlg.FormDestroy(Sender: TObject);
begin
  inherited;
  tbBuhPersons.Close;
end;

procedure TfrmSelectItemBuhDlg.btnAddClick(Sender: TObject);
var CurName: string;
begin
  CurName:= tbBuhPersonsPerson.AsString;
  tbBuhPersons.Append;
  quMaxID.Active:= False;
  quMaxID.Active:= True;
  tbBuhPersons.Edit;
  tbBuhPersonsID.AsInteger:= quMaxIDID.AsInteger + 1;
  tbBuhPersonsPerson.AsString:= CurName;
  tbBuhPersonsActive.AsBoolean:= False;
  tbBuhPersons.Post;
  btnDelete.Enabled:= (tbBuhPersons.RecordCount>1);
end;

function TfrmSelectItemBuhDlg.ActiveID: Integer;
begin
    quActive.Active:= False;
    quActive.Active:= True;
    Result:= quActiveID.AsInteger;
end;

procedure TfrmSelectItemBuhDlg.btnCloseClick(Sender: TObject);
begin
  inherited;
  if (tbBuhPersons.State in [dsEdit, dsInsert]) then
      tbBuhPersons.Post;
  Close;
end;

procedure TfrmSelectItemBuhDlg.dbgBuhPersonsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  CtrlState: array[Boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or
    DFCS_CHECKED);
begin
  if (Column.Field.DataType = ftBoolean) then
  begin
    TDBGrid(Column.Grid).Canvas.FillRect(Rect);
    if VarIsNull(Column.Field.Value) then
      DrawFrameControl(TDBGrid(Column.Grid).Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONCHECK
        or DFCS_INACTIVE) {grayed}
    else
      DrawFrameControl(TDBGrid(Column.Grid).Canvas.Handle, Rect, DFC_BUTTON, CtrlState[Column.Field.AsBoolean]);
        {checked or unchecked}
  end;
end;

procedure TfrmSelectItemBuhDlg.dbgBuhPersonsCellClick(Column: TColumn);
var ID, ActID: Integer; Value: Boolean;
    DataSet: TDataSet;
begin
  if (Column.Field.DataType = ftBoolean) then
  begin
    Value:= Column.Field.AsBoolean;
    DataSet:= Column.Grid.DataSource.DataSet;
    ID:= tbBuhPersonsID.AsInteger;
    ActID:= ActiveID;
    if (ActID=ID) then Exit;
    if not Value then
       begin
         if (ActID>=0) then
            begin
              DataSet.DisableControls;
              DataSet.Locate('ID', ActID, []);
              DataSet.Edit;
              Column.Field.Value := False;
              DataSet.Post;
              DataSet.Locate('ID', ID, []);
              DataSet.EnableControls;
            end;
       end;
    DataSet.Edit;
    Column.Field.Value := not Value;
    DataSet.Post;
  end;
  btnDelete.Enabled:= EnableDelete();
end;

procedure TfrmSelectItemBuhDlg.btnDeleteClick(Sender: TObject);
begin
  inherited;
    if Application.MessageBox('Вы уверены?', 'Удаление', MB_YESNO) = IDYES then
    begin
      tbBuhPersons.Edit;
      tbBuhPersons.Delete;
    end;
    btnDelete.Enabled:= EnableDelete();
end;

end.
