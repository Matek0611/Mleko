{ QuickReport master detail template }

unit qrSotrudDolg0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, DBAccess, MsAccess, MemDS;

type
  TqrSotrudDolg = class(TQuickRep)
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    quMaster: TMSQuery;
    quMasterSotrudName: TStringField;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    quMasterNom: TIntegerField;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    quMasterName: TStringField;
    quMasterPhone: TStringField;
    quMasterPSrok: TIntegerField;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    quMasterDateNakl: TDateTimeField;
    quMasterSummaDolg: TFloatField;
    quMasterDateOpl: TDateTimeField;
    quMasterContactFace: TStringField;
    quMasterBuhName: TStringField;
    quMasterSumma: TFloatField;
    quMasterSummaPlat: TFloatField;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    quMasterVIP: TBooleanField;
    QRBand4: TQRBand;
    procedure quMasterCalcFields(DataSet: TDataSet);
    procedure QRLabel9Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qrSotrudDolg: TqrSotrudDolg;
  procedure DolgSotrud;

implementation

uses Sotrud0;

{$R *.DFM}
procedure DolgSotrud;
Var
 SotrudNo:integer;
begin
 qrSotrudDolg:=TqrSotrudDolg.Create(Application);
 try
 if Application.MessageBox('По всем ?','Долги по менеджерам',MB_YESNO)=IDYES then
  begin
  end
 else
  begin
   SotrudNo:=Sotrud(True);
   qrSotrudDolg.quMaster.MacroByName('_Sotrud').Value:=' and (NaklR.SotrudNo=:SotrudNo) ';
   qrSotrudDolg.quMaster.Prepare;
   qrSotrudDolg.quMaster.ParamByName('SotrudNo').AsInteger:=SotrudNo;
  end;
 Screen.Cursor:=crHourGlass;
 qrSotrudDolg.quMaster.Open;
 Screen.Cursor:=crDefault;
 qrSotrudDolg.Preview;
 finally
 Screen.Cursor:=crDefault;
 qrSotrudDolg.quMaster.Close;
 qrSotrudDolg.Free;
 end;
end;

procedure TqrSotrudDolg.quMasterCalcFields(DataSet: TDataSet);
var
 i:integer;
begin
 i:=Trunc(Date()-quMasterDateNakl.AsFloat);
 if i>0 then
  quMasterPSrok.AsInteger:=i
 else
  quMasterPSrok.AsInteger:=0;
end;

procedure TqrSotrudDolg.QRLabel9Print(sender: TObject; var Value: String);
begin
 {Value:='';
 if quMasterPSrok.AsInteger>=7 then
  Value:='!!!'
 else
  if quMasterPSrok.AsInteger>=5 then
   Value:='!!'
  else
   if quMasterPSrok.AsInteger>=3 then
    Value:='!';
  }
 Value:=IntToStr(quMasterPSrok.AsInteger);
end;

end.
