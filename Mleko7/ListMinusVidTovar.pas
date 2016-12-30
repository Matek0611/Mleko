unit ListMinusVidTovar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusVidTovaraForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusVidTovara: TMSDataSource;
    quListMinusVidTovara: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    quListMinusVidTovaraVidNo: TSmallintField;
    quListMinusVidTovaraVidName: TStringField;
    quListMinusVidTovaraCheckMinus: TBooleanField;
    EdVidTovar: TcitDBComboEdit;
    spInsInListMinusVidTovar: TMSStoredProc;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdVidTovarSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListMinusVidTovaraForm: TListMinusVidTovaraForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusVidTovaraForm.OKClick(Sender: TObject);
begin
  if quListMinusVidTovara.State in [dsInsert, dsEdit] then quListMinusVidTovara.Post;
  ModalResult := mrOk;
end;

procedure TListMinusVidTovaraForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusVidTovara.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusVidTovaraForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusVidTovara.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusVidTovaraForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusVidTovaraForm.EdVidTovarSelectOk(Sender: TObject);
begin
  spInsInListMinusVidTovar.Close;
  spInsInListMinusVidTovar.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidTovar.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidTovar.Execute;
  quListMinusVidTovara.Refresh;
  DBGridEh1.Refresh;
end;

end.
