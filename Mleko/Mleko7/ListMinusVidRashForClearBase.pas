unit ListMinusVidRashForClearBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListMinusVidRashodForClearBaseForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusVidRashodForClearBase: TMSDataSource;
    quListMinusVidRashodForClearBase: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdVidRashodNo: TcitDBComboEdit;
    spInsInListMinusVidRashodForClearBase: TMSStoredProc;
    quListMinusVidRashodForClearBaseVidRashNo: TSmallintField;
    quListMinusVidRashodForClearBaseVidRashodName: TStringField;
    quListMinusVidRashodForClearBaseCheckMinus: TBooleanField;
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
  ListMinusVidRashodForClearBaseForm: TListMinusVidRashodForClearBaseForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusVidRashodForClearBaseForm.OKClick(Sender: TObject);
begin
  if quListMinusVidRashodForClearBase.State in [dsInsert, dsEdit] then quListMinusVidRashodForClearBase.Post;
  ModalResult := mrOk;
end;

procedure TListMinusVidRashodForClearBaseForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusVidRashodForClearBase.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusVidRashodForClearBaseForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusVidRashodForClearBase.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusVidRashodForClearBaseForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusVidRashodForClearBaseForm.EdVidRashodNoSelectOk(Sender: TObject);
begin
  spInsInListMinusVidRashodForClearBase.Close;
  spInsInListMinusVidRashodForClearBase.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidRashodForClearBase.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidRashodForClearBase.Execute;
  quListMinusVidRashodForClearBase.Refresh;
  DBGridEh1.Refresh;
end;

end.
