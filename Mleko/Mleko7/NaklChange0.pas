unit NaklChange0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBGridEh, ToolWin,
  ComCtrls, DB, GridsEh, MemDS, DBAccess, MsAccess,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter, CFLMLKCustom,
  ActnList;

type
  TfmNaklChange = class(TCFLMLKCustomForm)
    CoolBar1: TPanel;
    DBGridEh1: TDBGridEh;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    fltDateNakl: TTargetFilter_DateFilter;
    fltActionDate: TTargetFilter_DateFilter;
    ActionItemProp: TAction;
    ActionViewRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton20: TToolButton;
    ToolBtnProp: TToolButton;
    bbCancel: TBitBtn;
    ToolButton1: TToolButton;
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
    procedure ActionItemPropExecute(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  fmNaklChange: TfmNaklChange;
procedure NaklChange(DateNakl: TDate);

implementation
//uses data, Expedition0, EditExpedition0, RashodTovSvedenie, SelectItem0,  Otchets0;
uses data, main, EditNaklR0;
{$R *.dfm}

procedure NaklChange(DateNakl: TDate);
begin
  fmNaklChange := TfmNaklChange.Create(Application);
  try
    with fmNaklChange do
    begin
      fltDateNakl.a_Minimum := main.GlobalDateNakl - 1;
      fltDateNakl.a_Maximum := main.GlobalDateNakl;
      fltActionDate.a_Minimum := main.GlobalDateNakl - 1;
      fltActionDate.a_Maximum := main.GlobalDateNakl;
      quNaklR.Open;
      fmNaklChange.ShowModal;
    end;
  finally
    fmNaklChange.quNaklR.Close;
    fmNaklChange.Free;
  end;
end;

procedure TfmNaklChange.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmNaklChange.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  FoundNaklNo: integer;
begin
  case Key of
    {  VK_SPACE: begin
                 Key:=0;
                end;}
    VK_RETURN:
      begin
        Key := 0;
        ActionItemProp.Execute;
        //sbEditClick(Sender);
      end;
    {  VK_INSERT:begin
                 Key:=0;
                 //bbInsertClick(Sender);
                end;
      VK_DELETE:begin
                 Key:=0;
                 //sbDelClick(Sender);
                end;}
    VK_DOWN, VK_UP, VK_LEFT, VK_RIGHT: SearchString := '';
    {  VK_F5:begin
             //sbPrevClick(Sender);
            end;
      VK_F6:begin
             //sbPrintClick(Sender);
            end;     }
  end;
end;

procedure TfmNaklChange.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
begin
  if (Key in Data.SearchSet) then
  begin
    SearchString := SearchString + Key;
    Key := Chr(0);
    Found := False;
    try
      Found := DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName, SearchString, [loPartialKey, loCaseInsensitive]);
    except
      SearchString := '';
    end;
    if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType = ftString) then
      SearchString := Copy(SearchString, 1, length(SearchString) - 1);
  end;
end;

procedure TfmNaklChange.DBGridEh1DblClick(Sender: TObject);
begin
  ActionItemProp.Execute;
end;

procedure TfmNaklChange.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  NaklNo: integer;
begin
  Screen.Cursor := crHourGlass;
  NaklNo := quNaklR.FieldByName('NaklNo').AsInteger;
  quNaklR.Close;
  case ACol of
    0: quNaklR.MacroByName('_order').Value := 'NaklRChange.Nom';
    1: quNaklR.MacroByName('_order').Value := 'NaklRChange.DateNakl';
    2: quNaklR.MacroByName('_order').Value := 'TipNakl.TipName, Post.Name';
    3: quNaklR.MacroByName('_order').Value := 'Post.Name';
    4: quNaklR.MacroByName('_order').Value := 'Cars.CarsName, Post.Name';
    5: quNaklR.MacroByName('_order').Value := 'NaklRChange.Summa';
  end;
  quNaklR.Prepare;
  quNaklR.Open;
  quNaklR.Locate('NaklNo', NaklNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmNaklChange.FormCreate(Sender: TObject);
begin
  inherited;
  fltDateNakl.a_Minimum := main.GlobalDateNakl;
  fltDateNakl.a_Maximum := main.GlobalDateNakl;
  fltActionDate.a_Minimum := main.GlobalDateNakl;
  fltActionDate.a_Maximum := main.GlobalDateNakl;
end;

procedure TfmNaklChange.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  quNaklR.ParamByName('DateNaklBeg').AsDate := fltDateNakl.a_Minimum;
  quNaklR.ParamByName('DateNaklEnd').AsDate := fltDateNakl.a_Maximum;
  quNaklR.ParamByName('ActionDateBeg').AsDate := fltActionDate.a_Minimum;
  quNaklR.ParamByName('ActionDateEnd').AsDate := fltActionDate.a_Maximum;
end;

procedure TfmNaklChange.ActionItemPropExecute(Sender: TObject);
var
  Pkey: Int64;
begin
  inherited;
  if quNaklR.FieldByName('Pkey').IsNull then
  begin
    MessageDlg('Накладная отсутствует!', mtWarning, [mbOK], 0);
    Exit;
  end;
  Pkey := quNaklR.FieldByName('Pkey').Value;
  TfmEditNaklR.EditNaklR(Pkey,'EDIT',False,false,true);
end;

procedure TfmNaklChange.ActionViewRefreshExecute(Sender: TObject);
begin
  inherited;
  quNaklR.Close;
  quNaklR.Open;
end;

procedure TfmNaklChange.ToolButton20Click(Sender: TObject);
var
  l_old_id: string;
  is_locate: boolean;
  DataSet: TDataSet;
begin
  inherited;
  try
    DataSet := quNaklR;
    Screen.Cursor := crHourGlass;
    is_locate := false;
    if DataSet.Active and (not DataSet.Eof) and (not DataSet.IsEmpty) then
    begin
      l_old_id := DataSet.FieldByName('Action_key').AsString;
      is_locate := true;
    end;
    DataSet.Close;
    DataSet.Open;
    if is_locate and (not DataSet.IsEmpty) then DataSet.Locate('Action_key', l_old_id, []);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

