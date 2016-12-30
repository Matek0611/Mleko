unit qrNaklR0;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrNaklR = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure qrNaklRBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
  private
   Summa,SummaDolg:double;
  public

  end;

var
  qrNaklR: TqrNaklR;

implementation

uses NaklR0;

{$R *.DFM}

procedure TqrNaklR.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand:=(fmNaklR_.RxDBGrid1.SelectedRows.Count=0) or
            (fmNaklR_.RxDBGrid1.SelectedRows.CurrentRowSelected);
 if PrintBand then
  begin
   Summa:=Summa+fmNaklR_.quNaklR.FieldByName('Summa').AsFloat;
   SummaDolg:=SummaDolg+fmNaklR_.quNaklR.FieldBYName('SummaDolg').AsFloat;
  end;
end;

procedure TqrNaklR.QRLabel7Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[Summa]);
end;

procedure TqrNaklR.QRLabel8Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[SummaDolg]);
end;

procedure TqrNaklR.qrNaklRBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 Summa:=0; SummaDolg:=0;
end;

end.
