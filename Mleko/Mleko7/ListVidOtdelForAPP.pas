unit ListVidOtdelForAPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom, Mask,
  DBCtrlsEh;

type
  TListVidOtdelForAPPaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListVidOtdelForAPP: TMSDataSource;
    quListVidOtdelForAPP: TMSQuery;
    OK: TButton;
    Cancel: TButton;
    EdOtdelNo: TcitDBComboEdit;
    spInsInListVidOtdelForAPP: TMSStoredProc;
    Panel1: TPanel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    quDateForAPP: TMSQuery;
    dsDateForAPP: TMSDataSource;
    quDateForAPPDataApp: TDateTimeField;
    quListVidOtdelForAPPOtdelNo: TSmallintField;
    quListVidOtdelForAPPOtdelName: TStringField;
    quListVidOtdelForAPPCheckPlus: TBooleanField;
    Label1: TLabel;
    procedure OKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdOtdelNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListVidOtdelForAPPaForm: TListVidOtdelForAPPaForm;

implementation

uses data;

{$R *.dfm}

procedure TListVidOtdelForAPPaForm.OKClick(Sender: TObject);
begin
  if quListVidOtdelForAPP.State in [dsInsert, dsEdit] then quListVidOtdelForAPP.Post;
  if quDateForAPP.State in [dsInsert, dsEdit] then quDateForAPP.Post;
  ModalResult := mrOk;
end;

procedure TListVidOtdelForAPPaForm.CancelClick(Sender: TObject);
begin
  quListVidOtdelForAPP.Cancel;
  quDateForAPP.Cancel;
  ModalResult := mrCancel;
end;

procedure TListVidOtdelForAPPaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListVidOtdelForAPP.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListVidOtdelForAPPaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListVidOtdelForAPPaForm.EdOtdelNoSelectOk(Sender: TObject);
begin
  spInsInListVidOtdelForAPP.Close;
  spInsInListVidOtdelForAPP.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListVidOtdelForAPP.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListVidOtdelForAPP.Execute;
  quListVidOtdelForAPP.Refresh;
  DBGridEh1.Refresh;
end;

end.
