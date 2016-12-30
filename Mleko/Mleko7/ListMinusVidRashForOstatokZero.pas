unit ListMinusVidRashForOstatokZero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusVidRashodForOstatokZeroaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusVidRashodForOstatokZeroa: TMSDataSource;
    quListMinusVidRashodForOstatokZeroa: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdVidRashodNo: TcitDBComboEdit;
    spInsInListMinusVidRashodForOstatokZero: TMSStoredProc;
    quListMinusVidRashodForOstatokZeroaVidRashNo: TSmallintField;
    quListMinusVidRashodForOstatokZeroaVidRashodName: TStringField;
    quListMinusVidRashodForOstatokZeroaCheckMinus: TBooleanField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdVidRashodNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusVidRashodForOstatokZeroaForm: TListMinusVidRashodForOstatokZeroaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusVidRashodForOstatokZeroaForm.OKClick(Sender: TObject);
begin
  if quListMinusVidRashodForOstatokZeroa.State in [dsInsert, dsEdit] then quListMinusVidRashodForOstatokZeroa.Post;
  ModalResult := mrOk;
end;

procedure TListMinusVidRashodForOstatokZeroaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusVidRashodForOstatokZeroa.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusVidRashodForOstatokZeroaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusVidRashodForOstatokZeroa.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusVidRashodForOstatokZeroaForm.DBGridEh1KeyPress(Sender: TObject;
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
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TListMinusVidRashodForOstatokZeroaForm.EdVidRashodNoSelectOk(Sender: TObject);
begin
  spInsInListMinusVidRashodForOstatokZero.Close;
  spInsInListMinusVidRashodForOstatokZero.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidRashodForOstatokZero.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidRashodForOstatokZero.Execute;
  quListMinusVidRashodForOstatokZeroa.Refresh;
  DBGridEh1.Refresh;
end;

end.
