unit qrOtchet5_5;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls;

type
  TfmOtchet5_5 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    procedure fmOtchet5_5NeedData(Sender: TObject; var MoreData: Boolean);
    procedure fmOtchet5_5BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
  public
    SumPrihodTov,SumRashodTov,SumPrihodMany,SumRashodMany:double;

  end;

var
  fmOtchet5_5: TfmOtchet5_5;

implementation

uses qrOtchet5;

var rep:integer=0;
{$R *.DFM}

procedure TfmOtchet5_5.fmOtchet5_5NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
 Inc(rep);
 if rep>1 then MoreData:=False else MoreData:=True;
end;

procedure TfmOtchet5_5.fmOtchet5_5BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 rep:=0;
end;

procedure TfmOtchet5_5.QRLabel2Print(sender: TObject; var Value: String);
begin
 Value:=format('на %s :%.2f',[DateToStr(fmOtchet5.DateEnd),fmOtchet5.Saldo+(SumRashodTov-SumPrihodTov-SumPrihodMany+SumRashodMany)]);
end;

end.
