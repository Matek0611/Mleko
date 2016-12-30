unit KartVerife0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBGridEh, DB,
  FR_DSet, FR_DBSet, FR_Class, RxMemDS, GridsEh, MemDS, DBAccess,
  MsAccess, ActnList;

type
  TfmKartVerife = class(TMlekoForm)
    RxDBGrid1: TDBGridEh;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quTovar: TMSQuery;
    quPrihod: TMSQuery;
    quPrihodKol: TFloatField;
    quRashod: TMSQuery;
    quRashodKol: TFloatField;
    mdTovarError: TRxMemoryData;
    mdTovarErrorTovarNo: TIntegerField;
    mdTovarErrorTovarName: TStringField;
    mdTovarErrorOstatokRas: TFloatField;
    mdTovarErrorOstatok: TFloatField;
    DataSource1: TDataSource;
    quTovarTovarNo: TSmallintField;
    quTovarNameTovar: TStringField;
    quTovarOstatok: TFloatField;
    quTovarRashod: TFloatField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKartVerife: TfmKartVerife;
  procedure KartVerife;

implementation

uses Kart2;

{$R *.dfm}

procedure KartVerife;
var
 Prihod, Rashod, Ostatok: Extended;
begin
{ if TovarNo=0 then
  begin
   RetTovar:=Tovar(True,0);
  end
 else
  begin
   RetTovar.TovarNo:=TovarNo;
  end;
 if RetTovar.TovarNo=0 then Exit;}

 Screen.Cursor:=crHourGlass;
 fmKartVerife:=TfmKartVerife.Create(Application);
 try
 with fmKartVerife do
  begin
   quTovar.Close;
   quTovar.Open;
   mdTovarError.Active:=False;
   mdTovarError.Active:=True;
   while not quTovar.Eof do
    begin
     if not(quTovarOstatok.AsFloat=null) then Ostatok:=quTovarOstatok.AsFloat
     else Ostatok:=0;
     quPrihod.Close;
     quPrihod.ParamByName('TovarNo').AsInteger:=quTovarTovarNo.AsInteger;
     quPrihod.Open;
     if quPrihod.RecordCount>0 then Prihod:=quPrihodKol.AsFloat
     else Prihod:=0;
//     quRashod.Close;
//     quRashod.ParamByName('TovarNo').AsInteger:=quTovarTovarNo.AsInteger;
//     quRashod.Open;
     if not (quTovarRashod.AsFloat=null) then Rashod:=quTovarRashod.AsFloat
     else Rashod:=0;
     if Ostatok<>(Prihod-Rashod) then
      begin
       mdTovarError.Insert;
       mdTovarErrorTovarNo.AsInteger:=quTovarTovarNo.AsInteger;
       mdTovarErrorTovarName.AsString:=quTovarNameTovar.AsString;
       mdTovarErrorOstatokRas.AsFloat:=Prihod-Rashod;
       mdTovarErrorOstatok.AsFloat:=Ostatok;
       mdTovarError.Post;
       mdTovarError.Refresh;
      end;
     quTovar.Next;
    end;
 end;
 Screen.Cursor:=crDefault;
 fmKartVerife.ShowModal;
 finally
 fmKartVerife.mdTovarError.Active:=False;
 fmKartVerife.quRashod.Close;
 fmKartVerife.quTovar.Close;
 fmKartVerife.quPrihod.Close;

 fmKartVerife.Free;
 Screen.Cursor:=crDefault;
 end;
end;

procedure TfmKartVerife.bbCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TfmKartVerife.bbOkClick(Sender: TObject);
begin
 mdTovarError.First;
 frReport1.LoadFromFile('ErrorOstatok.frf');
 frReport1.ShowReport;

end;

procedure TfmKartVerife.RxDBGrid1DblClick(Sender: TObject);
begin
 KartTovar2(mdTovarErrorTovarNo.AsInteger,0);
end;

end.
