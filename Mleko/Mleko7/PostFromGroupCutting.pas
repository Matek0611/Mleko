unit PostFromGroupCutting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ActnList, DB, MemDS, DBAccess, MSAccess,
  GridsEh, DBGridEh, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh;

type
  TPostFromGroupCuttingForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    dsPostFromGroupCutting: TMSDataSource;
    quPostFromGroupCutting: TMSQuery;
    quPostFromGroupCuttingPostNo: TSmallintField;
    quPostFromGroupCuttingName: TStringField;
    quPostFromGroupCuttingNameGropCutting: TStringField;
    quPostFromGroupCuttingVidName: TStringField;
    dsGroupCutting: TMSDataSource;
    quGroupCutting: TMSQuery;
    lGroupCutting: TDBLookupComboboxEh;
    quGroupCuttingid: TIntegerField;
    quGroupCuttingNameGropCutting: TStringField;
    quGroupCuttingPriorityGroupCutting: TIntegerField;
    quGroupCuttingPercentGroupCutting: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    lPost: TDBLookupComboboxEh;
    Label3: TLabel;
    lVidTov: TDBLookupComboboxEh;
    dsPost: TMSDataSource;
    quPost: TMSQuery;
    dsVidTov: TMSDataSource;
    quVidTov: TMSQuery;
    quPostPostNo: TSmallintField;
    quPostName: TStringField;
    quVidTovVidNo: TSmallintField;
    quVidTovVidName: TStringField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure lPostChange(Sender: TObject);
    procedure lGroupCuttingChange(Sender: TObject);
    procedure lVidTovChange(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
     SearchString:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PostFromGroupCuttingForm: TPostFromGroupCuttingForm;

implementation

uses data;

{$R *.dfm}

procedure TPostFromGroupCuttingForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;

  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TPostFromGroupCuttingForm.DBGridEh1KeyPress(Sender: TObject;
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
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TPostFromGroupCuttingForm.lPostChange(
  Sender: TObject);
begin
  inherited;
  quPostFromGroupCutting.Close;
  if lPost.Text <> '' then quPostFromGroupCutting.MacroByName('_wherePost').Value := 'and p.PostNo = '+ quPostPostNo.AsString
                      else quPostFromGroupCutting.MacroByName('_wherePost').Value := '';
  quPostFromGroupCutting.Open;
end;

procedure TPostFromGroupCuttingForm.lGroupCuttingChange(Sender: TObject);
begin
  inherited;
  quPostFromGroupCutting.Close;
  if lGroupCutting.Text <> '' then quPostFromGroupCutting.MacroByName('_whereGroupCutting').Value := 'and gc.id =  '+ quGroupCuttingid.AsString
                              else quPostFromGroupCutting.MacroByName('_whereGroupCutting').Value := '';
  quPostFromGroupCutting.Open;
end;

procedure TPostFromGroupCuttingForm.lVidTovChange(Sender: TObject);
begin
  inherited;
  quPostFromGroupCutting.Close;
  if lVidTov.Text <> '' then quPostFromGroupCutting.MacroByName('_whereVidTov').Value := 'and vt.VidNo = '+ quVidTovVidNo.AsString
                        else quPostFromGroupCutting.MacroByName('_whereVidTov').Value := '';
  quPostFromGroupCutting.Open;
end;

procedure TPostFromGroupCuttingForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quPostFromGroupCutting.Close;
  case ACol of
    0: quPostFromGroupCutting.MacroByName('_order').Value := ' p.PostNo';
    1: quPostFromGroupCutting.MacroByName('_order').Value := ' p.Name';
    2: quPostFromGroupCutting.MacroByName('_order').Value := ' gc.NameGropCutting';
    3: quPostFromGroupCutting.MacroByName('_order').Value := ' vt.VidName';
  end;
  quPostFromGroupCutting.Open;
end;

end.
