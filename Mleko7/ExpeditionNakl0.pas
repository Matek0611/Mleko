unit ExpeditionNakl0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons, ExtCtrls, 
  DBGridEh, FR_Class, GridsEh, ActnList;

type
  TfmExpeditionNakl = class(TMlekoForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    bbOk: TBitBtn;
    quNakl: TMSQuery;
    dsNakl: TDataSource;
    quNaklNaklNo: TIntegerField;
    quNaklNom: TIntegerField;
    quNaklSumma: TFloatField;
    quNaklAddress: TStringField;
    quNaklName: TStringField;
    quNaklKolPerPak: TFloatField;
    quNaklWeight: TFloatField;
    quNaklDateNakl: TDateTimeField;
    DBGridEh1: TDBGridEh;
    bbPriview: TBitBtn;
    frReport1: TfrReport;
    quNaklSourceTable: TStringField;
    quNaklvidnaklname: TStringField;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure bbPriviewClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    SearchString: String;
  public
    { Public declarations }
  end;
type TExpeditionNakl = record
   TovarNo   :Integer;
   Kol       :Double;
   Price     :Double;
   AvgPriceIn:Double;
   NameTovar :string;
end;
var
  fmExpeditionNakl: TfmExpeditionNakl;
  function GetExpeditionNakl(DefDateBegin,DefDateEnd:TDate; ExpeditionNo:integer):integer;
implementation
uses data,Otchets0;

{$R *.dfm}

function GetExpeditionNakl(DefDateBegin,DefDateEnd:TDate; ExpeditionNo:integer):integer;
var
 c: Integer;
 S: String;
begin
 Screen.Cursor:=crHourGlass;
 fmExpeditionNakl:=TfmExpeditionNakl.Create(Application);
 try
  Result:=0;
  fmExpeditionNakl.quNakl.ParamByName('DateBegin').AsDate:=DefDateBegin;
  fmExpeditionNakl.quNakl.ParamByName('DateEnd').AsDate:=DefDateEnd;
  fmExpeditionNakl.quNakl.MacroByName('_order').Value:='Name,Address';
  s:=fmExpeditionNakl.quNakl.SQL.Text;
  fmExpeditionNakl.quNakl.Open;
//  fmExpeditionNakl.ShowModal;

{ fmOstatok.vColnPrice:=ColnPrice;
 fmOstatok.VidNaklNo:=VidNaklNo;
 fmOstatok.quOstatok.Prepare;
 fmOstatok.quOstatok.Open;
 if not fmOstatok.quOstatok.Locate('TovarNo',fmOstatok.PrevTovarNo,[]) then
  fmOstatok.quOstatok.Locate('TovarNo',fmOstatok.PrevTovarNo1,[]);}
 if fmExpeditionNakl.ShowModal = mrOk then
  begin
//   DBGridEh1.SelectedRows.CurrentRowSelected:=not DBGridEh1.SelectedRows.CurrentRowSelected;

   for c:=0 to fmExpeditionNakl.DBGridEh1.SelectedRows.Count-1 do
    begin
     fmExpeditionNakl.quNakl.Bookmark:=fmExpeditionNakl.DBGridEh1.SelectedRows[c];    
     if fmExpeditionNakl.quNaklSourceTable.AsString='NAKLR' then
     begin
        dmDataModule.quWork.Close;
        dmDataModule.quWork.SQL.Clear;
        dmDataModule.quWork.SQL.Add('UPDATE NaklR ');
        dmDataModule.quWork.SQL.Append('SET ExpeditionNo = :ExpeditionNo');
        dmDataModule.quWork.SQL.Append('WHERE (NaklNo = :NaklNo) and (DateNakl between :p_date_beg and :p_date_end )');
        dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger:=ExpeditionNo;
        dmDataModule.quWork.ParamByName('NaklNo').AsInteger:=fmExpeditionNakl.quNaklNaklNo.AsInteger;        
        dmDataModule.quWork.ParamByName('p_date_beg').AsDate:=DefDateBegin;
        dmDataModule.quWork.ParamByName('p_date_end').AsDate:=DefDateEnd;
        dmDataModule.quWork.Execute;
     end;
     if fmExpeditionNakl.quNaklSourceTable.AsString='E_BLANK_HEAD' then
     begin
        dmDataModule.quWork.Close;
        dmDataModule.quWork.SQL.Clear;
        dmDataModule.quWork.SQL.Add('UPDATE e_blank_head ');
        dmDataModule.quWork.SQL.Append('SET ExpeditionNo = :ExpeditionNo');
        dmDataModule.quWork.SQL.Append('WHERE (ID = :NaklNo)');
        dmDataModule.quWork.ParamByName('ExpeditionNo').AsInteger:=ExpeditionNo;
        dmDataModule.quWork.ParamByName('NaklNo').AsInteger:=fmExpeditionNakl.quNaklNaklNo.AsInteger;
        dmDataModule.quWork.Execute;
     end;
     Result:=fmExpeditionNakl.quNaklNaklNo.AsInteger;
    end;
{   Result.TovarNo:=fmOstatok.quOstatokTovarNo.AsInteger;
   Result.Kol:=fmOstatok.meKol.Value;
   Result.Price:=fmOstatok.mePrice.Value;
   Result.AvgPriceIn:=fmOstatok.quOstatokAvgPriceIn.AsFloat;
   Result.NameTovar:=fmOstatok.quOstatokNameTovar.AsString;}
  end
 else
//  Result.TovarNo:=0;
{ fmOstatok.PrevTovarNo:=fmOstatok.quOstatokTovarNo.AsInteger;
 fmOstatok.quOstatok.Prior;
 fmOstatok.PrevTovarNo1:=fmOstatok.quOstatokTovarNo.AsInteger;
 fmOstatok.quOstatok.Close;}


 finally
  fmExpeditionNakl.quNakl.Close;
  Screen.Cursor:=crDefault;
  fmExpeditionNakl.Free;
 end;

end;

procedure TfmExpeditionNakl.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmExpeditionNakl.RxDBGrid1KeyPress(Sender: TObject;
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

procedure TfmExpeditionNakl.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) and (not (gdFocused in State) or not DBGridEh1.Focused) then
    DBGridEh1.Canvas.Brush.Color := clSilver;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmExpeditionNakl.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_SPACE:DBGridEh1.SelectedRows.CurrentRowSelected:=not DBGridEh1.SelectedRows.CurrentRowSelected;
  VK_RETURN:begin
             Key:=0;
             //EditNaklR;
            end;
  VK_INSERT:begin
             Key:=0;
             //bbInsertClick(Sender);
            end;
  VK_DELETE:begin
             Key:=0;
             //bbDeleteClick(Sender);
            end;
  VK_DOWN,VK_UP,VK_LEFT,VK_RIGHT :SearchString:='';
  VK_F5:begin
         bbPriviewClick(Sender);
        end;

 end;
end;

procedure TfmExpeditionNakl.DBGridEh1KeyPress(Sender: TObject;
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

procedure TfmExpeditionNakl.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
 FindNaklRNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 FindNaklRNo:=quNaklNaklNo.AsInteger;
 quNakl.Close;
 case ACol of
  0:quNakl.MacroByName('_order').Value:='NaklR.NaklNo';
  1:quNakl.MacroByName('_order').Value:='NaklR.Nom';
  2:quNakl.MacroByName('_order').Value:='NaklR.DateNaklFirst, Post.Name, AddressPost.Address';
  3:quNakl.MacroByName('_order').Value:='Post.Name, AddressPost.Address';
  4:quNakl.MacroByName('_order').Value:='AddressPost.Address,Post.Name';
  5:quNakl.MacroByName('_order').Value:='NaklR.Summa, Post.Name, AddressPost.Address';
 end;
 quNakl.Prepare;
 quNakl.Open;
 quNakl.Locate('NaklNo',FindNaklRNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmExpeditionNakl.bbPriviewClick(Sender: TObject);
begin
 if not quNakl.Eof then
  PrintNaklRShort(quNaklNaklNo.AsInteger, True);
  
 ActiveControl:=DBGridEh1;
end;

procedure TfmExpeditionNakl.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if quNaklSourceTable.AsString='E_BLANK_HEAD' then Background:=clMoneyGreen;
end;


end.
