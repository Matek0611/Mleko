unit Kart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, MemDS,
  DBAccess, MsAccess, ActnList;

type
  TfmKart = class(TMlekoForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    quPrihod: TMSQuery;
    dsPrihod: TDataSource;
    dsRashod: TDataSource;
    quRashod: TMSQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    bbClose: TBitBtn;
    bbPrint: TBitBtn;
    quPrihodKol: TFloatField;
    quPrihodPrice: TFloatField;
    quPrihodDateNakl: TDateTimeField;
    quPrihodNom: TIntegerField;
    quPrihodName: TStringField;
    quPrihodBuhName: TStringField;
    quWork: TMSQuery;
    quRashodKol: TFloatField;
    quRashodPriceOut: TFloatField;
    quRashodDateNakl: TDateTimeField;
    quRashodNom: TIntegerField;
    quRashodBuhName: TStringField;
    quRashodName: TStringField;
    procedure bbPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKart: TfmKart;
  KolOstatok:double;
  procedure KartTovar(Otdel:integer);

implementation

uses Tovar0, qrKart1, qrKart3, qrKart2;

{$R *.DFM}
procedure KartTovar(Otdel:integer);
var
 RetTovar:TRetTovar;
begin
 if Otdel=3 then
  RetTovar:=Tovar(True, True,3)
 else
  RetTovar:=Tovar(True, True,0);
 if RetTovar.TovarNo=0 then Exit;

 Screen.Cursor:=crHourGlass;
 fmKart:=TfmKart.Create(Application);
 try
 with fmKart do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select Sum(Kol) Kol from Ostatok where TovarNo=:TovarNo');
   quWork.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quWork.Open;
   KolOstatok:=quWork.Fields[0].AsFloat;
   quWork.Close;

   fmKart.Caption:=RetTovar.NameTovar;

   quPrihod.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quRashod.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
   quPrihod.Open;
   quRashod.Open;
  end;
 Screen.Cursor:=crDefault;
 fmKart.ShowModal;
 finally
 fmKart.quPrihod.Close;
 fmKart.quRashod.Close;
 fmKart.Free;
 end;
end;

procedure TfmKart.bbPrintClick(Sender: TObject);
begin
 qrKartTovar:=TqrKartTovar.Create(Application);
 qrKartTovar2:=TqrKartTovar2.Create(Application);
 qrKartTovar3:=TqrKartTovar3.Create(Application);
 try
 qrKartTovar.crKart.Preview;
 finally
 qrKartTovar.Free;
 qrKartTovar2.Free;
 qrKartTovar3.Free;
 end;
end;

end.
