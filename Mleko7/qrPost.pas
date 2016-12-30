unit qrPost;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MsAccess, ActnList;

type
  TfmPrintPost = class(TMlekoForm)
    QuickRep1 : TQuickRep;
    ColumnHeaderBand1 : TQRBand;
    DetailBand1 : TQRBand;
    QRLabel1 : TQRLabel;
    QRLabel2 : TQRLabel;
    QRLabel3 : TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    quPost: TMSQuery;
    quPostName: TStringField;
    quPostPhone: TStringField;
    quPostSotrudName: TStringField;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    quPostNameLong: TStringField;
    quPostContact: TStringField;
  private
  end;

var
  fmPrintPost: TfmPrintPost;

implementation



{$R *.DFM}

end.
