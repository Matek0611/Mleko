unit OtdelForm0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, ExtCtrls, Buttons, ToolWin, ComCtrls, StdCtrls;

type
  TOtdelForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    CoolBar1: TCoolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    SpeedButton2: TSpeedButton;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

  type TRetVidOtdel=record
   OtdelNo  :SmallInt;
   OtdelName:string;
  end;

var
  OtdelForm: TOtdelForm;
  function VidOtdel(Select, Visible:boolean):TRetVidOtdel;

implementation

{$R *.dfm}
uses data, EditOtdel0;

function VidOtdel(Select, Visible:boolean):TRetVidOtdel;
begin
 Result.OtdelNo:=0;
 OtdelForm:=TOtdelForm.Create(Application);
 try
{
 if Visible then dmDataModule.quCompany.MacroByName('_where').Value:='where Visible=0 '
 else dmDataModule.quCompany.MacroByName('_where').Value:=' ';
}
 dmDataModule.quVidOtdel.Open;
 OtdelForm.DBGridEh1.Col:=1;
 if OtdelForm.ShowModal=mrOk then
  begin
   Result.OtdelNo:=dmDataModule.quVidOtdelOtdelNo.AsInteger;
   Result.OtdelName:=dmDataModule.quVidOtdelOtdelName.AsString;
  end;
 finally
 dmDataModule.quVidOtdel.Close;
 OtdelForm.Free;
 end;
end;

procedure TOtdelForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditOtdel;
end;

procedure TOtdelForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
   VK_RETURN:EditOtdel;
   VK_INSERT: begin
              Key:=0;
              dmDataModule.quVidOtdel.Append;
              EditOtdel;
             end;
   VK_DOWN,VK_UP:SearchString:='';
   VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quVidOtdel.Delete;
  end;
end;

procedure TOtdelForm.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TOtdelForm.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             dmDataModule.quVidOtdel.Delete;
end;

procedure TOtdelForm.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  EditOtdel;
end;

procedure TOtdelForm.SpeedButton1Click(Sender: TObject);
var
 OtdelNo : integer;
begin
  inherited;
  dmDataModule.quVidOtdel.Append;
  dmDataModule.OpenSQL('select max(isnull(OtdelNo,0)+1) as OtdelNo from VidOtdel');
  OtdelNo := dmDataModule.QFO.FIeldByName('OtdelNo').AsInteger;
  dmDataModule.quVidOtdelOtdelNo.Value := OtdelNo;
  EditOtdel;
end;

procedure TOtdelForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quVidOtdel.Close;
  dmDataModule.quVidOtdel.Open;
end;

end.
