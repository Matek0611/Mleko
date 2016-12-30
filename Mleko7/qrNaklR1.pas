unit qrNaklR1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, MemDS, DBAccess,
  MSAccess;

type
  TqrNaklREx = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    quRegions: TMSQuery;
    quRegionsRegionName: TStringField;
    QRDBText3: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure qrNaklRBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
   Summa:double;
  public

  end;

var
  qrNaklREx: TqrNaklREx;

implementation

uses NaklR0;

{$R *.DFM}

procedure TqrNaklREx.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand:=(fmNaklR_.RxDBGrid1.SelectedRows.Count=0) or
            (fmNaklR_.RxDBGrid1.SelectedRows.CurrentRowSelected);
 if PrintBand then
  begin
   Summa:=Summa+fmNaklR_.quNaklR.FieldByName('Summa').AsFloat;
  end;
end;

procedure TqrNaklREx.QRLabel7Print(sender: TObject; var Value: String);
begin
 Value:=format('%.2f',[Summa]);
end;

procedure TqrNaklREx.qrNaklRBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
 Summa:=0;
end;

procedure TqrNaklREx.QRLabel3Print(sender: TObject; var Value: String);
begin
{ quRegions.ParamByName('PostNo').AsInteger:=fmNaklR_.quNaklRPostNo.AsInteger;
 quRegions.Open;
 Value:=quRegionsRegionName.AsString;
 quRegions.Close;   }
end;

end.
