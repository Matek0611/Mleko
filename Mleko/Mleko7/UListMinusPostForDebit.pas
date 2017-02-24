unit UListMinusPostForDebit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom, Mask,
  DBCtrlsEh, ComCtrls, Menus;

type
  TfrmListMinusPostForDebit = class(TCFLMLKCustomForm)
    dsListMinusPostForDebit: TMSDataSource;
    quListMinusPostForDebit: TMSQuery;
    spInsInListMinusPostForDebit: TMSStoredProc;
    quListMinusPostForDebitPostNo: TSmallintField;
    quListMinusPostForDebitPostName: TStringField;
    quListMinusPostForDebitCheckMinus: TBooleanField;
    pcSettings: TPageControl;
    tsExclusions: TTabSheet;
    dbgExclusions: TDBGridEh;
    Panel2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    EdPostNo: TcitDBComboEdit;
    sbStatus: TStatusBar;
    pnlTop: TPanel;
    cbxDisableAll: TCheckBox;
    btnClearList: TButton;
    pmExclusions: TPopupMenu;
    mnuDeleteRecord: TMenuItem;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbgExclusionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgExclusionsKeyPress(Sender: TObject; var Key: Char);
    procedure EdPostNoSelectOk(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuDeleteRecordClick(Sender: TObject);
    procedure dbgExclusionsTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    OldCol, OldDir: Integer;
    OrderStr: string;
    SearchString:string;
    procedure DeleteRecordFromExclusions;
    procedure UpdateActions;
  public
    { Public declarations }
  end;

var
  frmListMinusPostForDebit: TfrmListMinusPostForDebit;

implementation

uses data;

{$R *.dfm}

procedure GetSortParams( Column: TColumnEh; var OldCol, OldDir: Integer;
                         var OrderStr: string);
var Col: Integer; DirStr: string;
begin
  Col:= Column.Index;
  if (OldDir=0) then OldDir:= 3 - Ord(Column.Title.SortMarker)*2;
  if (OldCol <> Col) or (OldDir = 0) then
    OldDir := 1
  else
    OldDir := -OldDir;
  OldCol := Col;
    //  TSortMarkerEh = (smNoneEh, smDownEh, smUpEh);
  Column.Title.SortMarker:=  TSortMarkerEh((3-OldDir) div 2);
  if (OldDir<0) then DirStr:= ' DESC' else DirStr:= ' ASC';
  OrderStr:= Column.Field.FieldName + DirStr;
end;


procedure TfrmListMinusPostForDebit.btnOKClick(Sender: TObject);
begin
  if quListMinusPostForDebit.State in [dsInsert, dsEdit] then quListMinusPostForDebit.Post;
  ModalResult := mrOk;
end;

procedure TfrmListMinusPostForDebit.btnCancelClick(Sender: TObject);
begin
  quListMinusPostForDebit.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmListMinusPostForDebit.UpdateActions();
begin
  mnuDeleteRecord.Enabled:= quListMinusPostForDebit.Active and
                            (quListMinusPostForDebit.RecordCount>0);
end;


procedure TfrmListMinusPostForDebit.DeleteRecordFromExclusions();
begin
if Application.MessageBox(
   PChar(Format( 'Вы согласны на удаление партнера ''%s'' из списка исключений?',
           [quListMinusPostForDebit.FieldByName('PostName').AsString])),
   'Подтвердите удаление', MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForDebit.Delete;
   UpdateActions;
end;

procedure TfrmListMinusPostForDebit.dbgExclusionsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE: DeleteRecordFromExclusions();
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfrmListMinusPostForDebit.dbgExclusionsKeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=dbgExclusions.DataSource.DataSet.Locate(dbgExclusions.Columns[dbgExclusions.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (dbgExclusions.Columns[dbgExclusions.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfrmListMinusPostForDebit.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForDebit.Close;
  spInsInListMinusPostForDebit.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForDebit.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForDebit.Execute;
  quListMinusPostForDebit.Refresh;
  dbgExclusions.Refresh;
  UpdateActions;
end;

procedure TfrmListMinusPostForDebit.FormCreate(Sender: TObject);
begin
  inherited;
     quListMinusPostForDebit.Open;
     OldCol:= 1; OldDir:= 1;
     UpdateActions;
end;

procedure TfrmListMinusPostForDebit.FormDestroy(Sender: TObject);
begin
  inherited;
   quListMinusPostForDebit.Close;
   //quDateForBDDS.Close;
end;

procedure TfrmListMinusPostForDebit.mnuDeleteRecordClick(Sender: TObject);
begin
  inherited;
  DeleteRecordFromExclusions();
end;

procedure TfrmListMinusPostForDebit.dbgExclusionsTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var ID: Integer;
begin
  inherited;
  ID := quListMinusPostForDebit.FieldByName('PostNo').AsInteger;
  GetSortParams(Column, OldCol, OldDir, OrderStr);
  quListMinusPostForDebit.Close;
  // only Value works correctly! Do not use AsString
  quListMinusPostForDebit.MacroByName('_order').Value:= OrderStr;
  quListMinusPostForDebit.Prepare;
  quListMinusPostForDebit.Open;
  quListMinusPostForDebit.Locate('PostNo',ID,[]);
  dbgExclusions.Refresh;
end;

end.
