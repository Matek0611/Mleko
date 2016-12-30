unit Post0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  DBGridEh, citCtrls, citmask, citDBComboEdit,
  DBAccess, MsAccess, MemDS, GridsEh, ActnList, Grids, DBGrids, citDbGrid;

type
  TfmPost = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    sbInsert: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    quFirmProp: TMSQuery;
    ftProp: TcitDBComboEdit;
    quFirmPropName: TStringField;
    quFirmPropID: TAutoIncField;
    SpeedButton1: TSpeedButton;
    ftOurFirm: TcitDBComboEdit;
    quOurFirm: TMSQuery;
    quOurFirmname: TStringField;
    ftTrash: TcitDBComboEdit;
    quFltTrash: TMSQuery;
    StringField1: TStringField;
    quTrash: TMSQuery;
    dsPost: TDataSource;
    quFltTrashtrash: TSmallintField;
    quOurFirmPostNo: TSmallintField;
    DBGrid: TcitDBGrid;
    procedure bbInsertClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbPrintClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure quPostAfterOpen(DataSet: TDataSet);
    procedure quPostBeforeClose(DataSet: TDataSet);
    procedure quPostAfterInsert(DataSet: TDataSet);
    procedure quPostAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    function DBGridIsLighted(Sender: TObject; DataSet: TDataSet): Boolean;
    procedure DBGridTitleClick(Column: TColumn);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

type
  TRetPost = record
    PostNo: integer;
    NamePost: string;
    SotrudNo: integer;
    DayDelay: SmallInt;
  end;

var
  fmPost: TfmPost;
  isInsertMode : Boolean;
function Post(Select: Boolean = true; Visible: boolean = true; trash: integer = 0): TRetPost;
implementation

uses data, EditPost0, qrPost, SelectItem0, Otchets0, Main, MlekoDbDsMSSQL;

{$R *.DFM}

function Post(Select: Boolean = true; Visible: boolean = true; trash: integer = 0): TRetPost;
var
  l_sql: string;
begin
  Result.PostNo := 0;
  fmPost := TfmPost.Create(Application);
  try
    fmPost.ftOurFirm.KeyFieldValue := '';
    fmPost.bbOk.Default := Select;
    if Visible then fmPost.MlkCustomDm.quPost.MacroByName('_fltVisible').Value := ' and Visible=0 '
               else fmPost.MlkCustomDm.quPost.MacroByName('_fltVisible').Value := ' ';
    fmPost.MlkCustomDm.quPost.MacroByName('_fltTrash').Value := ' and Trash= ' + IntToStr(trash);
    //    fmPost.quPost.MacroByName('_fltOurFirm').Value := ' and exists( select 1 from d_firm_contract where PostNo=p.PostNo and ourFIrmNo='+IntToStr(dmDataModule.FirmNo)+') ';
{
    showmessage(fmPost.MlkCustomDm.quPost.SQL.Text+ #10#13 +
                fmPost.MlkCustomDm.quPost.MacroByName('_fltProp').Value+ #10#13 +
                fmPost.MlkCustomDm.quPost.MacroByName('_fltOurFirm').Value+ #10#13 +
                fmPost.MlkCustomDm.quPost.MacroByName('_fltTrash').Value+ #10#13 +
                fmPost.MlkCustomDm.quPost.MacroByName('_fltVisible').Value);
}
    fmPost.MlkCustomDm.quPost.Open;
    fmPost.ActiveControl := fmPost.DBGrid;
    if fmPost.ShowModal = mrOk then
    begin
      Result.PostNo := fmPost.MlkCustomDm.quPost.FieldByName('PostNo').AsInteger;
      Result.NamePost :=  fmPost.MlkCustomDm.quPost.FieldByName('Name').AsString;
      Result.SotrudNo :=  fmPost.MlkCustomDm.quPost.FieldByName('SotrudNo').AsInteger;
      Result.DayDelay :=  fmPost.MlkCustomDm.quPost.FieldByName('DayDelay').AsInteger;
    end;
  finally
    fmPost.MlkCustomDm.quPost.Close;
    fmPost.Free;
  end;
end;

procedure TfmPost.bbInsertClick(Sender: TObject);
begin
  if not EditPostUser then
  begin
    isInsertMode := true;
    MlkCustomDm.quPost.Insert;
    EditPost;
  end;
end;

procedure TfmPost.DBGridDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmPost.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: ModalResult := mrOk;
    VK_INSERT:
      begin
        if not EditPostUser then
          sbInsert.Click;
        Key := 0;
      end;
    VK_DOWN, VK_UP: SearchString := '';
    VK_DELETE: if not EditPostUser then
        if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then
          MLKCustoMDm.quPost.Delete;
  end;
end;

procedure TfmPost.bbPrintClick(Sender: TObject);
var
  i: integer;
begin
  i := SelectItem('Печать', ['1', '2']);
  case i of
    0:
      begin
        fmPrintPost := TfmPrintPost.Create(Application);
        try
          fmPrintPost.quPost.Open;
          fmPrintPost.QuickRep1.Preview;
        finally
          fmPrintPost.quPost.Close;
          fmPrintPost.Free;
        end;
      end;
    1:
      begin
        PrintPost;
      end;
  end;
end;


procedure TfmPost.DBGridKeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if Key in data.SearchSet then
  begin
   Found:=False;
   SearchString:=SearchString+Key;
   try
   Found:=DBGrid.DataSource.DataSet.Locate(DBGrid.Columns[DBGrid.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if DBGrid.Columns[DBGrid.SelectedIndex].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;
end;

procedure TfmPost.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  Screen.Cursor := crHourGlass;
  MlkCustomDm.quPost.Close;
  case ACol of
    2: MlkCustomDm.quPost.MacroByName('_order').Value := 'PostNo';
    0: MlkCustomDm.quPost.MacroByName('_order').Value := 'Name';
    1: MlkCustomDm.quPost.MacroByName('_order').Value := 'NameLong,Name';
  end;
  MlkCustomDm.quPost.Open;
  Screen.Cursor := crDefault;
end;

procedure TfmPost.SpeedButton2Click(Sender: TObject);
begin
  MlkCustomDm.quPost.Edit;
  EditPost;
end;

procedure TfmPost.SpeedButton3Click(Sender: TObject);
begin
  if not EditPostUser then
    if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then
      MlkCustomDm.quPost.Delete;
end;

procedure TfmPost.SpeedButton1Click(Sender: TObject);
begin
  MlkCustomDm.quPost.Close;
  if (ftProp.Text = '') or (ftProp.TextField = '') then
    MlkCustomDm.quPost.MacroByName('_FltProp').Value := ''
  else
    MlkCustomDm.quPost.MacroByName('_FltProp').Value :=
      ' and exists (select 1 from d_firm_prop dp,l_firm_prop lp where dp.id=lp.prop_id and lp.PostNo=p.PostNo and dp.id = ' + ftProp.KeyFieldValue +
      ') ';

  if ftTrash.Text = '' then
    MlkCustomDm.quPost.MacroByName('_fltTrash').Value := ''
  else
    MlkCustomDm.quPost.MacroByName('_fltTrash').Value := ' and Trash=' + quFltTrash.FieldByName('Trash').AsString;

  if ftOurFirm.Text = '' then
    MlkCustomDm.quPost.MacroByName('_fltOurFirm').Value := ''
  else
    MlkCustomDm.quPost.MacroByName('_fltOurFirm').Value := ' and exists( select 1 from d_firm_contract where PostNo = p.PostNo and ourFIrmNo = ' +
      quOurFirm.FieldByName('PostNo').AsString + ') ';
  ;

  MlkCustomDm.quPost.Open;
end;

procedure TfmPost.quPostAfterOpen(DataSet: TDataSet);
begin
  MlkCustomDm.quPost.Locate('PostNo', dmDataModule.PrevPostNo, []);
end;

procedure TfmPost.quPostBeforeClose(DataSet: TDataSet);
begin
  dmDataModule.PrevPostNo := MlkCustomDm.quPost.FieldByName('PostNo').AsInteger;
end;

procedure TfmPost.quPostAfterInsert(DataSet: TDataSet);
begin
  if MlkCustomDm.quPost.State = dsInsert then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select Max(PostNo) from Post');
    dmDataModule.quWork.Open;
    MlkCustomDm.quPost.FieldByName('PostNo').AsInteger := dmDataModule.quWork.Fields[0].AsInteger + 1;
    dmDataModule.quWork.Close;
  end;
end;

procedure TfmPost.quPostAfterPost(DataSet: TDataSet);
begin
  inherited;
  MlkCustomDm.quPost.Refresh;
end;

procedure TfmPost.FormCreate(Sender: TObject);
begin
  inherited;
  sbInsert.Enabled := not EditPostUser;
end;

function TfmPost.DBGridIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result:=MLKCustomDm.quPost.FieldByName('Visible').AsBoolean;
end;


procedure TfmPost.DBGridTitleClick(Column: TColumn);
var
 PostNo:integer;
begin
  inherited;
  PostNo := MLKCustomDm.quPostPostNo.Value;
  Screen.Cursor := crHourGlass;
  MLKCustomDm.quPost.Close;
  case Column.Index of
    0: MLKCustomDm.quPost.MacroByName('_order').Value := 'Name';
    1: MLKCustomDm.quPost.MacroByName('_order').Value := 'NameLong';
    2: MLKCustomDm.quPost.MacroByName('_order').Value := 'TrashName';
    3: MLKCustomDm.quPost.MacroByName('_order').Value := 'PostNo';
    4: MLKCustomDm.quPost.MacroByName('_order').Value := 'Expire_Date';
  end;
  MLKCustomDm.quPost.Open;
  MLKCustomDm.quPost.Locate('PostNo',PostNo,[]);
  Screen.Cursor := crDefault;
end;

end.

