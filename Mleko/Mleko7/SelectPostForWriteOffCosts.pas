unit SelectPostForWriteOffCosts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, GridsEh, DBGridEh, MemDS, DBAccess, MSAccess,
  StdCtrls, ExtCtrls, ActnList;

type
  TSelectPostForWriteOffCostsForm = class(TMlekoForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btOk: TButton;
    btCancel: TButton;
    dsSelectPostForWriteOfCosts: TMSDataSource;
    quSelectPostForWriteOfCosts: TMSQuery;
    DBGridEh1: TDBGridEh;
    quSelectPostForWriteOfCostsPostNo: TSmallintField;
    quSelectPostForWriteOfCostsPostName: TStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  SelectPostForWriteOffCostsForm: TSelectPostForWriteOffCostsForm;
  function SelectPostForWriteOffCost(VidRashodNo : integer) : integer;

implementation

uses data;

{$R *.dfm}
function SelectPostForWriteOffCost(VidRashodNo : integer) : integer;
begin
  SelectPostForWriteOffCostsForm := TSelectPostForWriteOffCostsForm.Create(Application);
  try
//    SelectPostForWriteOffCostsForm.quSelectPostForWriteOfCosts.ParamByName('VidRashodNo').AsInteger := VidRashodNo;
    SelectPostForWriteOffCostsForm.quSelectPostForWriteOfCosts.Open;
    if SelectPostForWriteOffCostsForm.ShowModal = mrOk then
     Result := SelectPostForWriteOffCostsForm.quSelectPostForWriteOfCostsPostNo.AsInteger;
  finally
    SelectPostForWriteOffCostsForm.quSelectPostForWriteOfCosts.Close;
    SelectPostForWriteOffCostsForm.Free;
  end;
end;
procedure TSelectPostForWriteOffCostsForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
  VK_RETURN: ModalResult := mrOk;
 end;

end;

procedure TSelectPostForWriteOffCostsForm.DBGridEh1KeyPress(
  Sender: TObject; var Key: Char);
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

end.
