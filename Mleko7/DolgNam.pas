unit DolgNam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, DBCtrls, Db, StdCtrls,
  Buttons, ComCtrls, MemDS, DBAccess, MSAccess, ActnList;

type
  TfmDolgNam = class(TMlekoForm)
    grDolg: TRxDBGrid;
    dsDolg: TDataSource;
    quDolg: TMSQuery;
    dsNaklR: TDataSource;
    quNaklR: TMSQuery;
    dsRashod: TDataSource;
    BitBtn1: TBitBtn;
    quRashod: TMSQuery;
    quRashodNameTovar: TStringField;
    bbPrint: TBitBtn;
    quDolgPostNo: TSmallintField;
    quDolgName: TStringField;
    quDolgPSrok: TIntegerField;
    quNaklRNaklNo: TIntegerField;
    quNaklRNom: TIntegerField;
    PageControl1: TPageControl;
    tsDolg: TTabSheet;
    tsNakl: TTabSheet;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    quDolgDolg: TBCDField;
    quDolgMinDate: TDateTimeField;
    quNaklRSumma: TBCDField;
    quNaklRSummaDolg: TBCDField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRDateOpl: TDateTimeField;
    quNaklRBuhName: TStringField;
    quRashodRasNo: TSmallintField;
    quRashodKol: TBCDField;
    quRashodPriceOut: TBCDField;
    quDolgPhone: TStringField;
    quDolgContactFace: TStringField;
    quDolgSotrudName: TStringField;
    quNaklROtdelName: TStringField;
    procedure grDolgGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure bbPrintClick(Sender: TObject);
    procedure quDolgCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grDolgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grDolgKeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
    procedure quDolgBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmDolgNam: TfmDolgNam;
  procedure ShowDolgNam;

implementation

uses data, repDolgNam{, EditDolgNakl0};

{$R *.DFM}

procedure ShowDolgNam;
begin
 fmDolgNam:=TfmDolgNam.Create(Application);
 try
 Screen.Cursor:=crHourGlass;
 fmDolgNam.quDolg.Open;
 Screen.Cursor:=crDefault;
 fmDolgNam.ShowModal;
 finally
 Screen.Cursor:=crDefault;
 fmDolgNam.quRashod.Close;
 fmDolgNam.quNaklR.Close;
 fmDolgNam.quDolg.Close;
 fmDolgNam.Free;
 end;
end;

procedure TfmDolgNam.grDolgGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var Srok:double;
begin
 if quDolgDolg.AsFloat>0 then
  begin
   Srok:=Date-quDolgMinDate.AsDateTime;
   if Srok>0 then AFont.Color:=clBlue;
   if Srok>3 then AFont.Color:=clRed;
  end;
end;

procedure TfmDolgNam.bbPrintClick(Sender: TObject);
var
 Rec:TBookmarkStr;
begin
 PageControl1.ActivePage:=tsDolg;
 fmDolgNam.PageControl1Change(nil);
 Rec:=quDolg.Bookmark;
 qrDolgNam:=TqrDolgNam.Create(Application);
 try
 qrDolgNam.Preview;
 finally
 qrDolgNam.Free;
 end;
 quDolg.Bookmark:=Rec;
end;

procedure TfmDolgNam.quDolgCalcFields(DataSet: TDataSet);
var i:integer;
begin
 i:=Trunc(date-quDolgMinDate.AsFloat);
 if i>0 then
  quDolgPSrok.AsInteger:=i
 else
   quDolgPSrok.AsInteger:=0;
end;

procedure TfmDolgNam.FormShow(Sender: TObject);
begin
 fmDolgNam.SearchString:='';
end;

procedure TfmDolgNam.grDolgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:fmDolgNam.SearchString:='';
  VK_RETURN:begin
             PageControl1.SelectNextPage(True);
            end;
 end;
end;

procedure TfmDolgNam.grDolgKeyPress(Sender: TObject; var Key: Char);
begin
 if Key in ['A'..'Z','a'..'z','à'..'ÿ','À'..'ß','0'..'9'] then
  begin
   fmDolgNam.SearchString:=SearchString+Key;
   if not quDolg.Locate('Name',fmDolgNam.SearchString,[loPartialKey,loCaseInsensitive])then
    begin
     SysUtils.Beep;
     fmDolgNam.SearchString:=Copy(fmDolgNam.SearchString,1,length(Trim(fmDolgNam.SearchString))-1);
    end
  end
 else
  fmDolgNam.SearchString:='';
end;

procedure TfmDolgNam.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:begin
             PageControl1.SelectNextPage(True);
            end;
 end;

end;

procedure TfmDolgNam.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePage=tsNakl then
  begin
  Screen.Cursor:=crHourGlass;
  quNaklR.ParamByName('PostNo').AsInteger:=quDolgPostNo.AsInteger;
  quNaklR.Open;
  //quRashod.Open;
  Screen.Cursor:=crDefault;
  end
 else
  begin
  quNaklR.Close;
  quRashod.Close;
  end

end;

procedure TfmDolgNam.RxDBGrid1DblClick(Sender: TObject);
begin
{ Screen.Cursor:=crHourGlass;
 quRashod.Open;
 fmEditDolgNakl:=TfmEditDolgNakl.Create(Application);
 try
 Screen.Cursor:=crDefault;;
 fmEditDolgNakl.ShowModal;
 finally
 Screen.Cursor:=crDefault;;
 quRashod.Close;
 fmEditDolgNakl.Free;
 end;}
end;

procedure TfmDolgNam.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  quNaklR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmDolgNam.quDolgBeforeOpen(DataSet: TDataSet);
begin
  quDolg.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
