unit DolgNash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, DBCtrls, Db, StdCtrls,
  Buttons, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmDolgNash = class(TMlekoForm)
    grDolg: TRxDBGrid;
    grNaklR: TRxDBGrid;
    grPlat: TRxDBGrid;
    dsDolg: TDataSource;
    quDolg: TMSQuery;
    dsNaklP: TDataSource;
    quNaklP: TMSQuery;
    quNaklPNaklNo: TIntegerField;
    dsPrihod: TDataSource;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    quPrihod: TMSQuery;
    quPrihodPrihNo: TSmallintField;
    quNaklPNom: TIntegerField;
    bbPrint: TBitBtn;
    quDolgDolg: TFloatField;
    quDolgName: TStringField;
    quDolgPostNo: TSmallintField;
    quNaklPSummaDolg: TFloatField;
    quNaklPDateNakl: TDateTimeField;
    quNaklPSumma: TFloatField;
    quPrihodKol: TFloatField;
    quPrihodPrice: TFloatField;
    quPrihodNameTovar: TStringField;
    procedure FormShow(Sender: TObject);
    procedure grDolgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grDolgKeyPress(Sender: TObject; var Key: Char);
    procedure bbPrintClick(Sender: TObject);
    procedure quDolgBeforeOpen(DataSet: TDataSet);
    procedure quNaklPBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmDolgNash: TfmDolgNash;
  procedure ShowDolgNash;

implementation

uses data, qrDolgNash0;

{$R *.DFM}
procedure ShowDolgNash;
begin
 Screen.Cursor:=crHourGlass;
 fmDolgNash:=TfmDolgNash.Create(Application);
 try
 fmDolgNash.quDolg.Open;
 fmDolgNash.quNaklP.Open;
 fmDolgNash.quPrihod.Open;
 Screen.Cursor:=crDefault;
 fmDolgNash.ShowModal;
 finally
 fmDolgNash.quPrihod.Close;
 fmDolgNash.quNaklP.Close;
 fmDolgNash.quDolg.Close;
 fmDolgNash.Free;
 end;
end;
procedure TfmDolgNash.FormShow(Sender: TObject);
begin
 fmDolgNash.SearchString:='';
 fmDolgNash.ActiveControl:=grDolg;
end;

procedure TfmDolgNash.grDolgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:fmDolgNash.SearchString:='';
 end;
end;

procedure TfmDolgNash.grDolgKeyPress(Sender: TObject; var Key: Char);
begin
 if Key in ['A'..'Z','a'..'z','à'..'ÿ','À'..'ß','0'..'9'] then
  begin
   fmDolgNash.SearchString:=SearchString+Key;
   if not quDolg.Locate('Name',fmDolgNash.SearchString,[loPartialKey,loCaseInsensitive])then
    begin
     SysUtils.Beep;
     fmDolgNash.SearchString:=Copy(fmDolgNash.SearchString,1,length(Trim(fmDolgNash.SearchString))-1);
    end
  end
 else
  fmDolgNash.SearchString:='';
end;

procedure TfmDolgNash.bbPrintClick(Sender: TObject);
begin
 qrDolgNash:=TqrDolgNash.Create(Application);
 try
 qrDolgNash.Preview;
 finally
 qrDolgNash.Free;
 end
end;

procedure TfmDolgNash.quDolgBeforeOpen(DataSet: TDataSet);
begin
  quDolg.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmDolgNash.quNaklPBeforeOpen(DataSet: TDataSet);
begin
  quNaklP.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
