unit qrOtchet5_4;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, MlekoForm, Quickrpt, QRCtrls;

type
  TfmOtchet5_4 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    procedure fmOtchet5_4NeedData(Sender: TObject; var MoreData: Boolean);
    procedure fmOtchet5_4BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
  public

  end;

var
  fmOtchet5_4: TfmOtchet5_4;

implementation

uses qrOtchet5;
var rep:integer=0;

{$R *.DFM}

procedure TfmOtchet5_4.fmOtchet5_4NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
 Inc(rep);
 if rep>1 then MoreData:=False else MoreData:=True;
end;

procedure TfmOtchet5_4.fmOtchet5_4BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 rep:=0;
end;

procedure TfmOtchet5_4.QRLabel3Print(sender: TObject; var Value: String);
begin
 Value:=format('на %s :%.2f',[DateToStr(fmOtchet5.DateBegin),fmOtchet5.Saldo]);
end;

end.
