unit ListMinusPostForListAdrInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusPostForListAdrInfoaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForListAdrInfoa: TMSDataSource;
    quListMinusPostForListAdrInfoa: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    quListMinusPostForListAdrInfoaPostNo: TSmallintField;
    quListMinusPostForListAdrInfoaName: TStringField;
    quListMinusPostForListAdrInfoaCheckMinus: TBooleanField;
    spInsInListMinusPostForListAdrInfo: TMSStoredProc;
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
  ListMinusPostForListAdrInfoaForm: TListMinusPostForListAdrInfoaForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForListAdrInfoaForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForListAdrInfoa.State in [dsInsert, dsEdit] then quListMinusPostForListAdrInfoa.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForListAdrInfoaForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForListAdrInfoa.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForListAdrInfoaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForListAdrInfoa.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForListAdrInfoaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForListAdrInfoaForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForListAdrInfo.Close;
  spInsInListMinusPostForListAdrInfo.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForListAdrInfo.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForListAdrInfo.Execute;
  quListMinusPostForListAdrInfoa.Refresh;
  DBGridEh1.Refresh;
end;

end.
