unit ListMinusVidTovForPlanningOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusVidTovForPlanningOrderaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusVidTovForPlanningOrdera: TMSDataSource;
    quListMinusVidTovForPlanningOrdera: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdVidNo: TcitDBComboEdit;
    spInsInListMinusVidTovForPlanningOrder: TMSStoredProc;
    quListMinusVidTovForPlanningOrderaVidNo: TSmallintField;
    quListMinusVidTovForPlanningOrderaVidName: TStringField;
    quListMinusVidTovForPlanningOrderaCheckMinus: TBooleanField;
    quListMinusVidTovForPlanningOrderaIncrementRate: TIntegerField;
    quListMinusVidTovForPlanningOrderaUserNo: TIntegerField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdVidNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusVidTovForPlanningOrderaForm: TListMinusVidTovForPlanningOrderaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusVidTovForPlanningOrderaForm.OKClick(Sender: TObject);
begin
  if quListMinusVidTovForPlanningOrdera.State in [dsInsert, dsEdit] then quListMinusVidTovForPlanningOrdera.Post;
  ModalResult := mrOk;
end;

procedure TListMinusVidTovForPlanningOrderaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusVidTovForPlanningOrdera.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusVidTovForPlanningOrderaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusVidTovForPlanningOrdera.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusVidTovForPlanningOrderaForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if DBGridEh1.SelectedIndex <> 1 then
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TListMinusVidTovForPlanningOrderaForm.EdVidNoSelectOk(Sender: TObject);
begin
  spInsInListMinusVidTovForPlanningOrder.Close;
  spInsInListMinusVidTovForPlanningOrder.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidTovForPlanningOrder.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidTovForPlanningOrder.Execute;
  quListMinusVidTovForPlanningOrdera.Refresh;
  DBGridEh1.Refresh;
end;

end.
