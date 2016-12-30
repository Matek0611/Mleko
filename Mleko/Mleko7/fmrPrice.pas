{ QuickReport list template }

unit fmrPrice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, IniFiles, MemDS, DBAccess,
  MSAccess;

type
  TfmPrice = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    quPrice: TMSQuery;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    quPriceNameTovar: TStringField;
    quPricePrice: TFloatField;
    quPricePrice1: TFloatField;
    quPricePrice2: TFloatField;
    quPriceNameCompany: TStringField;
    quPriceKolPerPak: TSmallintField;
    quPriceEnableSkidka: TBooleanField;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    quPriceVidName: TStringField;
    QRBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    quPriceNameEnableSkidka: TStringField;
    procedure fmPriceBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure quPriceCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrice: TfmPrice;
  procedure Price;
implementation

uses CheckPrice0, data;


{$R *.DFM}

procedure Price;
var
 Ini:TIniFile;
begin
 fmPrice:=TfmPrice.Create(Application);
 fmCheckPrice:=TfmCheckPrice.Create(Application);
 try
 Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');

{ fmPrice.QRLabel1.Caption:=Ini.ReadString('Options','Price0','');
 fmPrice.QRLabel5.Caption:=Ini.ReadString('Options','Price1','');
 fmPrice.QRLabel6.Caption:=Ini.ReadString('Options','Price2','');
 fmCheckPrice.cbPrice.Caption:=Ini.ReadString('Options','Price0','');
 fmCheckPrice.cbPrice1.Caption:=Ini.ReadString('Options','Price1','');
 fmCheckPrice.cbPrice2.Caption:=Ini.ReadString('Options','Price2','');}

 fmPrice.QRLabel1.Caption:='Мелкий опт';
 fmPrice.QRLabel5.Caption:='Опт';
 fmPrice.QRLabel6.Caption:='Крупный опт';
 fmCheckPrice.cbPrice.Caption:='Мелкий опт';
 fmCheckPrice.cbPrice1.Caption:='Опт';
 fmCheckPrice.cbPrice2.Caption:='Крупный опт';
 Ini.Free;
 if fmCheckPrice.ShowModal=mrOk then
  begin
   if not fmCheckPrice.cbPrice.Checked then
    begin
     fmPrice.QRDBText2.Enabled:=False;
     fmPrice.QRLabel1.Enabled:=False;
     fmPrice.QRDBText6.Left:=fmPrice.QRDBText5.Left;
     fmPrice.QRLabel6.Left :=fmPrice.QRLabel5.Left;
     fmPrice.QRDBText5.Left:=fmPrice.QRDBText2.Left;
     fmPrice.QRLabel5.Left:=fmPrice.QRLabel1.Left;
    end;
   if not fmCheckPrice.cbPrice1.Checked then
    begin
     fmPrice.QRDBText5.Enabled:=False;
     fmPrice.QRLabel5.Enabled:=False;
     if fmCheckPrice.cbPrice.Checked then
      begin
       fmPrice.QRDBText6.Left:=fmPrice.QRDBText5.Left;
       fmPrice.QRLabel6.Left :=fmPrice.QRLabel5.Left;
      end
     else
      begin
       fmPrice.QRDBText6.Left:=fmPrice.QRDBText2.Left;
       fmPrice.QRLabel6.Left :=fmPrice.QRLabel1.Left;
      end;

    end;
   if not fmCheckPrice.cbPrice2.Checked then
    begin
     fmPrice.QRDBText6.Enabled:=False;
     fmPrice.QRLabel6.Enabled:=False;
    end;
  end;
 Screen.Cursor:=crHourGlass;
 fmPrice.quPrice.Open;
 Screen.Cursor:=crDefault;
 fmPrice.Preview;
 finally
 fmCheckPrice.Free;
 fmPrice.quPrice.Close;
 fmPrice.Free;
 end;
end;

procedure TfmPrice.fmPriceBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 dmDataModule.quPost.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
 dmDataModule.quPost.Open;
 QRLabel3.Caption:=format('Прайс лист фирмы %s на %s',
                 [dmDataModule.quPost.FieldByName('NameLong').AsString,DateToStr(Date())]);

 dmDataModule.quPost.Close;
 try
 QRMemo1.Lines.LoadFromFile('Title.txt');
 except
 QRMemo1.Lines.Clear;
 end;
end;

procedure TfmPrice.quPriceCalcFields(DataSet: TDataSet);
begin
 if quPriceEnableSkidka.AsBoolean then
  quPriceNameEnableSkidka.AsString:=''
 else
  quPriceNameEnableSkidka.AsString:='*';
end;

end.
