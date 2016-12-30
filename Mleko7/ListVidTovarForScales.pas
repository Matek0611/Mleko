unit ListVidTovarForScales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, Buttons, DB, GridsEh, DBGridEh, DBAccess,
  MSAccess, MemDS, ExtCtrls, ActnList;

type
  TListVidTovarForScalesForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qu_ListVidTovarForScales: TMSQuery;
    ds_ListVidTovarForScales: TMSDataSource;
    DBGridEh1: TDBGridEh;
    qu_ListVidTovarForScalesVidNo: TSmallintField;
    qu_ListVidTovarForScalesVidName: TStringField;
    qu_ListVidTovarForScalesCheckVid: TBooleanField;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
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
  ListVidTovarForScalesForm: TListVidTovarForScalesForm;

implementation

uses data;

{$R *.dfm}

procedure TListVidTovarForScalesForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if qu_ListVidTovarForScales.State in [dsEdit,dsInsert] then qu_ListVidTovarForScales.Post;
end;

procedure TListVidTovarForScalesForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if qu_ListVidTovarForScales.State in [dsEdit,dsInsert] then qu_ListVidTovarForScales.Cancel;
end;

procedure TListVidTovarForScalesForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListVidTovarForScalesForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
  inherited;
  if (Key in Data.SearchSet) then
   begin
     SearchString:=SearchString+Key;
     Key:=Chr(0);
     Found:=False;
   try
     Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.SelectedIndex].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
     SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

end.
