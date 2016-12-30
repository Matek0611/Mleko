unit ListMinusPostForAnalizPrihod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPostForAnalizPrihodaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForAnalizPrihoda: TMSDataSource;
    quListMinusPostForAnalizPrihoda: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    quListMinusPostForAnalizPrihodaPostNo: TSmallintField;
    quListMinusPostForAnalizPrihodaName: TStringField;
    quListMinusPostForAnalizPrihodaCheckMinus: TBooleanField;
    spInsInListMinusPostForAnalizPrihod: TMSStoredProc;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdPostNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusPostForAnalizPrihodaForm: TListMinusPostForAnalizPrihodaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForAnalizPrihodaForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForAnalizPrihoda.State in [dsInsert, dsEdit] then quListMinusPostForAnalizPrihoda.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForAnalizPrihodaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForAnalizPrihoda.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForAnalizPrihodaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForAnalizPrihoda.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForAnalizPrihodaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForAnalizPrihodaForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForAnalizPrihod.Close;
  spInsInListMinusPostForAnalizPrihod.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForAnalizPrihod.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForAnalizPrihod.Execute;
  quListMinusPostForAnalizPrihoda.Refresh;
  DBGridEh1.Refresh;
end;

end.
