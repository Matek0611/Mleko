unit Zakupka0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, DBAccess, MsAccess, MemDS, ExtCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls,
  Buttons, ActnList;

type
  TfmZakupka = class(TMlekoForm)
    quOstatok: TMSQuery;
    quRashod: TMSQuery;
    quOstatokTovarNo: TSmallintField;
    quRashodTovarNo: TSmallintField;
    dsOstatok: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    UpdateSQL1: TMSUpdateSQL;
    BitBtn1: TBitBtn;
    bbPrint: TBitBtn;
    quWork: TMSQuery;
    quOstatokNameTovar: TStringField;
    quOstatokKol: TFloatField;
    quOstatokNameCompany: TStringField;
    quRashodKol: TFloatField;
    quOstatokKolZak: TFloatField;
    quOstatokKolRas: TFloatField;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure bbPrintClick(Sender: TObject);
    procedure quOstatokBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    DateBegin,DateEnd:TDate;
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmZakupka: TfmZakupka;
  procedure Zakupka;

implementation

uses GetDate0, data, qrZakupka0;

{$R *.DFM}
procedure Zakupka;
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmZakupka:=TfmZakupka.Create(Application);
 try
 fmZakupka.DateBegin:=Period[1];
 fmZakupka.DateEnd:=Period[2];
 with fmZakupka do
  begin
   fmZakupka.Caption:='Закупка '+DateToStr(DateBegin)+' - '+DateToStr(DateEnd);
   quRashod.ParamByName('DateBegin').AsDate:=Period[1];
   quRashod.ParamByName('DateEnd').AsDate:=Period[2];
   quRashod.Open;
   quOstatok.Open;
  end;
 Screen.Cursor:=crDefault;
 fmZakupka.ShowModal;
 finally
 Screen.Cursor:=crDefault;
 fmZakupka.quOstatok.Close;
 fmZakupka.quRashod.Close;
 fmZakupka.Free;
 end;
end;


procedure TfmZakupka.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DELETE:begin
             Key:=0;
             if abs(quOstatokKol.AsFloat)<0.001 then
              begin
               quOstatok.Delete;
              end;
            end;
  VK_DOWN,VK_UP:SearchString:='';
 end;

end;

procedure TfmZakupka.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in data.SearchSetWitoutDigits) then
  begin
   SearchString:=SearchString+Key;
   try
   Found:=quOstatok.Locate('NameTovar',SearchString,[loCaseInsensitive,loPartialKey]);
   except
   Found:=False;
   SearchString:='';
   end;
   if RxDBGrid1.Columns[RxDBGrid1.Col-1].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;

end;

procedure TfmZakupka.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
 if (quOstatokKolZak.AsFloat>0) and
    (Not Highlight) then
  AFont.Color:=clBlue;
end;

procedure TfmZakupka.bbPrintClick(Sender: TObject);
begin
 qrZakupka:=TqrZakupka.Create(Application);
 try
 qrZakupka.Preview;
 finally
 qrZakupka.Free;
 end
end;

procedure TfmZakupka.quOstatokBeforeDelete(DataSet: TDataSet);
begin
 quWork.SQL.Clear;
 quWork.SQL.Add('delete  from Ostatok where TovarNo=:TovarNo');
 quWork.ParamByName('TovarNo').AsInteger:=quOstatokTovarNo.AsInteger;
 quWork.Execute;
end;

end.
