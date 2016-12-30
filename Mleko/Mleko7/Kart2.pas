unit Kart2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, Db, StdCtrls, Buttons,
  MsAccess, MemDS, DBAccess, ActnList;

type
  TfmKart2 = class(TMlekoForm)
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    quWork: TMSQuery;
    bbClose: TBitBtn;
    Label1: TLabel;
    spKartTovar: TMSStoredProc;
    spKartTovarDateKart: TDateTimeField;
    spKartTovarKolPrih: TFloatField;
    spKartTovarKolRas: TFloatField;
    spKartTovarTip: TSmallintField;
    spKartTovarNaklNo: TIntegerField;
    spKartTovarNom: TIntegerField;
    spKartTovarPrice: TFloatField;
    spKartTovarOstatok: TFloatField;
    spKartTovarName: TStringField;
    spKartTovarNameBuh: TStringField;
    dsKartTovar: TDataSource;
  private
    { Private declarations }
    KolOstatok:double;
  public
    { Public declarations }
  end;

var
  fmKart2: TfmKart2;
  procedure KartTovar2(TovarNo, OtdelNo:integer);
implementation

uses Tovar0, data;

{$R *.DFM}
procedure KartTovar2(TovarNo, OtdelNo:integer);
var
 RetTovar:TRetTovar;
begin
 if TovarNo=0 then
  begin
   if OtdelNo<>3 then
    RetTovar:=Tovar(True, True,0)
   else
    RetTovar:=Tovar(True, True,3);
  end
 else
  begin
   RetTovar.TovarNo:=TovarNo;
  end;
 if RetTovar.TovarNo=0 then Exit;

 Screen.Cursor:=crHourGlass;
 fmKart2:=TfmKart2.Create(Application);
 try
 with fmKart2 do
  begin
   KolOstatok:=0;
   quWork.SQL.Clear;
   quWork.SQL.Add('select Sum(Kol) Kol from Ostatok where TovarNo=:TovarNo');
   quWork.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quWork.Open;
   KolOstatok:=quWork.Fields[0].AsFloat;
   quWork.Close;
   Label1.Caption:=format('Текущий остаток %.2f',[fmKart2.KolOstatok]);

   quWork.SQL.Clear;
   quWork.SQL.Add('select NameTovar from Tovar where TovarNo=:TovarNo');
   quWork.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quWork.Open;
   fmKart2.Caption:=quWork.FieldByName('NameTovar').AsString;
   quWork.Close;

   spKartTovar.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   spKartTovar.Open;
 end;
 Screen.Cursor:=crDefault;
 fmKart2.ShowModal;
 finally
 fmKart2.spKartTovar.Close;
 fmKart2.Free;
 Screen.Cursor:=crDefault;
 end;
end;

end.
