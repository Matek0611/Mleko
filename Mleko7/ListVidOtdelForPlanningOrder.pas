unit ListVidOtdelForPlanningOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  StdCtrls, citCtrls, citmask, citDBComboEdit, CFLMLKCustom;

type
  TListVidOtdelForPlanningOrderaForm = class(TCFLMLKCustomForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    dsListVidOtdelForPlanningOrdera: TMSDataSource;
    quListVidOtdelForPlanningOrdera: TMSQuery;
    OK: TButton;
    Jnvtyf: TButton;
    EdOtdelNo: TcitDBComboEdit;
    spInsInListVidOtdelForPlanningOrder: TMSStoredProc;
    quListVidOtdelForPlanningOrderaOtdelNo: TSmallintField;
    quListVidOtdelForPlanningOrderaOtdelName: TStringField;
    quListVidOtdelForPlanningOrderaCheckMinus: TBooleanField;
    quListVidOtdelForPlanningOrderaUserNo: TIntegerField;
    procedure OKClick(Sender: TObject);
    procedure JnvtyfClick(Sender: TObject);
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
  ListVidOtdelForPlanningOrderaForm: TListVidOtdelForPlanningOrderaForm;

implementation

uses data;

{$R *.dfm}

procedure TListVidOtdelForPlanningOrderaForm.OKClick(Sender: TObject);
begin
  if quListVidOtdelForPlanningOrdera.State in [dsInsert, dsEdit] then quListVidOtdelForPlanningOrdera.Post;
  ModalResult := mrOk;
end;

procedure TListVidOtdelForPlanningOrderaForm.JnvtyfClick(Sender: TObject);
begin
  quListVidOtdelForPlanningOrdera.Cancel;
  ModalResult := mrCancel;
end;

procedure TListVidOtdelForPlanningOrderaForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quListVidOtdelForPlanningOrdera.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListVidOtdelForPlanningOrderaForm.DBGridEh1KeyPress(Sender: TObject;
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

procedure TListVidOtdelForPlanningOrderaForm.EdOtdelNoSelectOk(Sender: TObject);
begin
  spInsInListVidOtdelForPlanningOrder.Close;
  spInsInListVidOtdelForPlanningOrder.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListVidOtdelForPlanningOrder.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListVidOtdelForPlanningOrder.Execute;
  quListVidOtdelForPlanningOrdera.Refresh;
  DBGridEh1.Refresh;
end;

end.
