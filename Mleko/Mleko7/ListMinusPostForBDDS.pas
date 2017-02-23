unit ListMinusPostForBDDS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom, Mask,
  DBCtrlsEh;

type
  TListMinusPostForBDDSForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListMinusPostForBDDS: TMSDataSource;
    quListMinusPostForBDDS: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdPostNo: TcitDBComboEdit;
    spInsInListMinusPostForBDDS: TMSStoredProc;
    quListMinusPostForBDDSPostNo: TSmallintField;
    quListMinusPostForBDDSPostName: TStringField;
    quListMinusPostForBDDSCheckMinus: TBooleanField;
    Panel1: TPanel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
    dsDateForBDDS: TMSDataSource;
    quDateForBDDS: TMSQuery;
    quDateForBDDSDataBDDS: TDateTimeField;
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
  ListMinusPostForBDDSaForm: TListMinusPostForBDDSForm;

implementation

uses data;

{$R *.dfm}

procedure TListMinusPostForBDDSForm.OKClick(Sender: TObject);
begin
  if quListMinusPostForBDDS.State in [dsInsert, dsEdit] then quListMinusPostForBDDS.Post;
  if quDateForBDDS.State in [dsInsert, dsEdit] then quDateForBDDS.Post;
  ModalResult := mrOk;
end;

procedure TListMinusPostForBDDSForm.JnvtyfClick(Sender: TObject);
begin
  quListMinusPostForBDDS.Cancel;
  ModalResult := mrCancel;
end;

procedure TListMinusPostForBDDSForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListMinusPostForBDDS.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListMinusPostForBDDSForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListMinusPostForBDDSForm.EdPostNoSelectOk(Sender: TObject);
begin
  spInsInListMinusPostForBDDS.Close;
  spInsInListMinusPostForBDDS.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusPostForBDDS.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusPostForBDDS.Execute;
  quListMinusPostForBDDS.Refresh;
  DBGridEh1.Refresh;
end;

end.
