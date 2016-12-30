unit KartData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons,
  ExtCtrls, MsAccess, MemDS, DBAccess, ActnList;

type
  TfmKartDate = class(TMlekoForm)
    Panel1: TPanel;
    bbClose: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    quWork: TMSQuery;
    spKartTovarData: TMSStoredProc;
    dsKartTovar: TDataSource;
    spKartTovarDataDateKart: TDateTimeField;
    spKartTovarDataKolPrih: TFloatField;
    spKartTovarDataKolRas: TFloatField;
    spKartTovarDataTip: TSmallintField;
    spKartTovarDataNaklNo: TIntegerField;
    spKartTovarDataNom: TIntegerField;
    spKartTovarDataPrice: TFloatField;
    spKartTovarDataOstatok: TFloatField;
    spKartTovarDataName: TStringField;
    spKartTovarDataNameBuh: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKartDate: TfmKartDate;
  procedure KartInData(TovarNo:integer);
implementation

uses GetDate0, Tovar0;

{$R *.DFM}
procedure KartInData(TovarNo:integer);
var
 RetTovar:TRetTovar;
 Period:TPeriodDate;
 Tip:string;
begin
 if TovarNo=0 then
  begin
   RetTovar:=Tovar(True, True,0);
  end
 else
  begin
   RetTovar.TovarNo:=TovarNo;
  end;
 if RetTovar.TovarNo=0 then Exit;

 Period:=ZapDate(2);
 if Period[1]=0 then exit;
 if Period[2]=0 then Period[2]:=Period[1];

{ Tip:=SelectTip;
 if Tip='' then exit;}

 Screen.Cursor:=crHourGlass;
 fmKartDate:=TfmKartDate.Create(Application);
 try
 with fmKartDate do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select NameTovar from Tovar where TovarNo=:TovarNo');
   quWork.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quWork.Open;
   fmKartDate.Caption:=quWork.FieldByName('NameTovar').AsString;
   quWork.Close;
   spKartTovarData.ParamByName('DateBegin').AsDate:=Period[1];
   spKartTovarData.ParamByName('DateEnd').AsDate:=Period[2];
   spKartTovarData.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   spKartTovarData.Open;
 end;
 Screen.Cursor:=crDefault;
 fmKartDate.ShowModal;
 finally
 fmKartDate.spKartTovarData.Close;
 fmKartDate.Free;
 Screen.Cursor:=crDefault;
 end;
end;

end.
