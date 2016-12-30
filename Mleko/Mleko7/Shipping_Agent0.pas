unit Shipping_Agent0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ToolWin, ComCtrls, DBGridEh,
  GridsEh, ActnList;

type
  TfmShipping_Agent = class(TMlekoForm)
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGridEh1: TDBGridEh;
    CBAll: TCheckBox;
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CBAllClick(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
    FVisibleAll: Boolean;
    procedure SetVisibleAll(const Value: Boolean);
  public
    { Public declarations }
    property VisibleAll: Boolean read FVisibleAll write SetVisibleAll;
  end;

var
  fmShipping_Agent: TfmShipping_Agent;
  KeyReturne: Boolean;
function Shipping_Agent(Selected, Visible: Boolean): integer;

implementation
uses data, EditShipping_Agent0;

{$R *.dfm}

function Shipping_Agent(Selected, Visible: Boolean): integer;
begin
  KeyReturne := Selected;
  Result := 0;
  fmShipping_Agent := TfmShipping_Agent.Create(Application);
  try
    // fmCars.RxDBGrid1.Col:=2;
    if Selected then
      fmShipping_Agent.bbOk.Default := True
    else
      fmShipping_Agent.bbOk.Default := False;
    dmDataModule.quShipping_Agent.Open;
    fmShipping_Agent.ActiveControl := fmShipping_Agent.DBGridEh1;
    if fmShipping_Agent.ShowModal = mrOk then
      Result := dmDataModule.quShipping_AgentShipping_AgentNo.AsInteger
  finally
    dmDataModule.quShipping_Agent.Close;
    fmShipping_Agent.Free;
  end;
end;

procedure TfmShipping_Agent.bbCancelClick(Sender: TObject);
begin
  //
end;

procedure TfmShipping_Agent.bbOkClick(Sender: TObject);
begin
  //
end;

procedure TfmShipping_Agent.SpeedButton1Click(Sender: TObject);
begin
  dmDataModule.quShipping_Agent.Append;
  EditShipping_Agent;
end;

procedure TfmShipping_Agent.SpeedButton4Click(Sender: TObject);
begin
  if not dmDataModule.quShipping_Agent.Eof then
    EditShipping_Agent;
end;

procedure TfmShipping_Agent.SpeedButton5Click(Sender: TObject);
begin
  if not dmDataModule.quShipping_Agent.Eof then
    if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then
      dmDataModule.quShipping_Agent.Delete;
end;

procedure TfmShipping_Agent.DBGridEh1DblClick(Sender: TObject);
begin
  SpeedButton4Click(Sender);
end;

procedure TfmShipping_Agent.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        Key := 0;
        bbCancelClick(Sender);
      end;
    VK_RETURN:
      begin
        Key := 0;
        if KeyReturne then
          bbOkClick(fmShipping_Agent.bbOk) //fmShipping_Agent.
        else
          SpeedButton4Click(Sender);
      end;
    VK_INSERT:
      begin
        Key := 0;
        SpeedButton1Click(Sender);
      end;
    VK_DELETE:
      begin
        Key := 0;
        SpeedButton5Click(Sender);
      end;
    VK_DOWN, VK_UP: SearchString := '';
  end;
end;

procedure TfmShipping_Agent.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfmShipping_Agent.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  Shipping_AgentNo: integer;
begin
  Shipping_AgentNo := dmDataModule.quShipping_AgentShipping_AgentNo.AsInteger;
  dmDataModule.quShipping_Agent.Close;
  case ACol of
    //  0:dmDataModule.quShipping_Agent.MacroByName('_order').Value:='Shipping_AgentNo';
    0: dmDataModule.quShipping_Agent.MacroByName('_order').Value := 'Shipping_AgentName';
  end;
  dmDataModule.quShipping_Agent.Open;
  dmDataModule.quShipping_Agent.Locate('Shipping_AgentNo', Shipping_AgentNo, []);
end;

procedure TfmShipping_Agent.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if dmDataModule.quShipping_AgentVisible.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfmShipping_Agent.SetVisibleAll(const Value: Boolean);
begin
  if FVisibleAll = Value then Exit;
  FVisibleAll := Value;
    dmDataModule.quShipping_Agent.Close;
  if not Value then
    dmDataModule.quShipping_Agent.MacroByName('_where').Value := ' and Visible=0 '
  else
    dmDataModule.quShipping_Agent.MacroByName('_where').Value := '';
  dmDataModule.quShipping_Agent.Open;    
end;

procedure TfmShipping_Agent.CBAllClick(Sender: TObject);
begin
  inherited;
  VisibleAll := CBAll.Checked;
end;

end.

