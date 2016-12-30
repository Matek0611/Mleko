unit qrOtchet5_1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, DBTables, DBAccess, MsAccess, MemDS;

type
  TfmOtchet5_1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    quNaklR: TMSQuery;
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
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    quNaklRDateNakl: TDateTimeField;
    quNaklRNom: TIntegerField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    quNaklRBuhName: TStringField;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
  private
  public
  end;

var
  fmOtchet5_1: TfmOtchet5_1;
implementation

uses qrOtchet5, qrOtchet5_4, qrOtchet5_5, data;

{$R *.DFM}

procedure TfmOtchet5_1.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:=fmOtchet5.NamePost;
end;

procedure TfmOtchet5_1.QRExpr1Print(sender: TObject; var Value: String);
begin
 try
 fmOtchet5_5.SumRashodTov:=StrToFloat(Value);
 except
 fmOtchet5_5.SumRashodTov:=0;
 end;
end;

procedure TfmOtchet5_1.quNaklRBeforeOpen(DataSet: TDataSet);
begin
   quNaklR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
