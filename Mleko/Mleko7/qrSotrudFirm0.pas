unit qrSotrudFirm0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrSotrudFirm = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    quPost: TMSQuery;
    QRDBText1: TQRDBText;
    quPostNAME: TStringField;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    quPostPHONE: TStringField;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    quPostAddress: TStringField;
    quSotrud: TMSQuery;
    quSotrudSotrudName: TStringField;
    QRDBText2: TQRDBText;
  private

  public

  end;

var
  qrSotrudFirm: TqrSotrudFirm;
  procedure SotrudFirm(SotrudNo:integer);
implementation


{$R *.DFM}
procedure SotrudFirm(SotrudNo:integer);
begin
 qrSotrudFirm:=TqrSotrudFirm.Create(Application);
 try
 qrSotrudFirm.quSotrud.ParamByName('SotrudNo').AsInteger:=SotrudNo;
 qrSotrudFirm.quSotrud.Open;
 qrSotrudFirm.quPost.ParamByName('SotrudNo').AsInteger:=SotrudNo;
 qrSotrudFirm.quPost.Open;
 qrSotrudFirm.Preview;
 finally
 qrSotrudFirm.quPost.Close;
 qrSotrudFirm.quSotrud.Close;
 qrSotrudFirm.Free;
 end;
end;

end.
