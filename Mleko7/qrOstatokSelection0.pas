unit qrOstatokSelection0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TqrOstatokSelection = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrOstatokSelectionBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrOstatokSelection: TqrOstatokSelection;

implementation

uses Ostatok2 ;

{$R *.DFM}

procedure TqrOstatokSelection.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=fmOstatok2.RxDBGrid1.SelectedRows.CurrentRowSelected;
end;

procedure TqrOstatokSelection.qrOstatokSelectionBeforePrint(
  Sender: TQuickRep; var PrintReport: Boolean);
var
 Ini:TIniFile;
begin
 Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');

 QRLabel4.Caption:='Мелкий опт';
 QRLabel5.Caption:='Опт';
 QRLabel6.Caption:='Крупный опт';

{ QRLabel4.Caption:=Ini.ReadString('Options','Price0','');
 QRLabel5.Caption:=Ini.ReadString('Options','Price1','');
 QRLabel6.Caption:=Ini.ReadString('Options','Price2','');}
 Ini.Free;
end;

end.
