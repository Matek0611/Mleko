unit ListTovarNoForPlanningOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListTovarNoForPlanningOrderaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListTovarNoForPlanningOrdera: TMSDataSource;
    quListTovarNoForPlanningOrdera: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdTovarNo: TcitDBComboEdit;
    spInsInListTovarNoForPlanningOrder: TMSStoredProc;
    quListTovarNoForPlanningOrderaTovarNo: TSmallintField;
    quListTovarNoForPlanningOrderaNameTovar: TStringField;
    quListTovarNoForPlanningOrderaCheckPlus: TBooleanField;
    quListTovarNoForPlanningOrderaIncrementRate: TIntegerField;
    quListTovarNoForPlanningOrderaUserNo: TIntegerField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdTovarNoSelectOk(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListTovarNoForPlanningOrderaForm: TListTovarNoForPlanningOrderaForm;

implementation

uses data;

{$R *.dfm}

procedure TListTovarNoForPlanningOrderaForm.OKClick(Sender: TObject);
begin
  if quListTovarNoForPlanningOrdera.State in [dsInsert, dsEdit] then quListTovarNoForPlanningOrdera.Post;
  ModalResult := mrOk;
end;

procedure TListTovarNoForPlanningOrderaForm.JnvtyfClick(Sender: TObject);
begin
  quListTovarNoForPlanningOrdera.Cancel;
  ModalResult := mrCancel;
end;

procedure TListTovarNoForPlanningOrderaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListTovarNoForPlanningOrdera.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListTovarNoForPlanningOrderaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListTovarNoForPlanningOrderaForm.EdTovarNoSelectOk(Sender: TObject);
begin
  spInsInListTovarNoForPlanningOrder.Close;
  spInsInListTovarNoForPlanningOrder.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListTovarNoForPlanningOrder.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListTovarNoForPlanningOrder.Execute;
  quListTovarNoForPlanningOrdera.Refresh;
  DBGridEh1.Refresh;
end;

end.
