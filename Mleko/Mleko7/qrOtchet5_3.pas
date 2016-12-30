unit qrOtchet5_3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, DBTables, DBAccess, MsAccess, MemDS;

type
  TfmOtchet5_3 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    quPlatP: TMSQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    quPlatPNom: TIntegerField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPSumma: TFloatField;
    quPlatPSpravka: TStringField;
    quPlatPBuhName: TStringField;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure quPlatPBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

var
  fmOtchet5_3: TfmOtchet5_3;
implementation

uses qrOtchet5, qrOtchet5_4, qrOtchet5_5, data;

{$R *.DFM}

procedure TfmOtchet5_3.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:=fmOtchet5.NamePost;
end;

procedure TfmOtchet5_3.QRExpr1Print(sender: TObject; var Value: String);
begin
 try
 fmOtchet5_5.SumPrihodMany:=StrToFloat(Value);
 except
 fmOtchet5_5.SumPrihodMany:=0;
 end;
end;

procedure TfmOtchet5_3.quPlatPBeforeOpen(DataSet: TDataSet);
begin
   quPlatP.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
