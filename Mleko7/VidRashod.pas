unit VidRashod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ExtCtrls, ActnList, DB, MemDS, DBAccess,
  MSAccess, GridsEh, DBGridEh;

type
  TVidRashodForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BtOk: TButton;
    BtCancel: TButton;
    DBGridEh1: TDBGridEh;
    dsVidRashod: TMSDataSource;
    quVidRashod: TMSQuery;
    quVidRashodVidRashodNo: TSmallintField;
    quVidRashodVidRashodName: TStringField;
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SearchString : string;
  public
    { Public declarations }
  end;

var
  VidRashodForm: TVidRashodForm;
  function VidRashoda(Visible: Boolean; PostNo: integer): integer;

implementation

uses data;

{$R *.dfm}
function VidRashoda(Visible: Boolean; PostNo: integer): integer;
begin
 VidRashodForm:=TVidRashodForm.Create(Application);
 try
//   VidRashodForm.DBGridEh1.Col:=1;
   if Visible then VidRashodForm.quVidRashod.MacroByName('_where').Value:=' AND (Visible=0) '
              else VidRashodForm.quVidRashod.MacroByName('_where').Value:=' ';

   VidRashodForm.quVidRashod.ParamByName('PostNo').Value := PostNo;
   VidRashodForm.quVidRashod.Open;
   if VidRashodForm.ShowModal = mrOk then
    Result:=VidRashodForm.quVidRashodVidRashodNo.AsInteger
 finally
   VidRashodForm.quVidRashod.Close;
   VidRashodForm.Free;
 end;
end;

procedure TVidRashodForm.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
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
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TVidRashodForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
  VK_RETURN: ModalResult := mrOk;
 end;
end;

end.
