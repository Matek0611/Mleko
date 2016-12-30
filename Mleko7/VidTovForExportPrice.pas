unit VidTovForExportPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, Buttons, DB, GridsEh, DBGridEh, DBAccess,
  MSAccess, MemDS, ExtCtrls, ActnList;

type
  TVidTovForExportPriceForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qu_VidTovForExportPrice: TMSQuery;
    ds_VidTovForExportPrice: TMSDataSource;
    DBGridEh1: TDBGridEh;
    qu_VidTovForExportPriceVidNo: TSmallintField;
    qu_VidTovForExportPriceVidName: TStringField;
    qu_VidTovForExportPriceCheckVid: TBooleanField;
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
  VidTovForExportPriceForm: TVidTovForExportPriceForm;

implementation

uses data,ListVidTovarForScales;

{$R *.dfm}

procedure TVidTovForExportPriceForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if qu_VidTovForExportPrice.State in [dsEdit,dsInsert] then qu_VidTovForExportPrice.Post;
end;

procedure TVidTovForExportPriceForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  if qu_VidTovForExportPrice.State in [dsEdit,dsInsert] then qu_VidTovForExportPrice.Cancel;
end;

procedure TVidTovForExportPriceForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TVidTovForExportPriceForm.DBGridEh1KeyPress(Sender: TObject;
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
