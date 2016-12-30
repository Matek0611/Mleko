unit KartTovarSvedenie0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, GridsEh, MemDS, DBAccess, MsAccess, ActnList,
  Grids, DBGrids, citDbGrid;

type
  TfmKartTovarSvedenie = class(TMlekoForm)
    DBGridEh1: TCitDBGrid;
    paBottom: TPanel;
    bbCancel: TBitBtn;
    DBGridEh2: TDBGridEh;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKartTovarSvedenie: TfmKartTovarSvedenie;
  Procedure KartTovarSvedenie(DateBegin: TDate; TovarNo: integer; NameTovar: string);

implementation

uses data;

{$R *.dfm}

Procedure KartTovarSvedenie(DateBegin: TDate; TovarNo: integer; NameTovar: string);
begin
 fmKartTovarSvedenie:=TfmKartTovarSvedenie.Create(Application);
 try
  fmKartTovarSvedenie.Caption:=NameTovar;
  fmKartTovarSvedenie.quNaklR.ParamByName('DateNakl').AsDate:=DateBegin;
  fmKartTovarSvedenie.quNaklR.ParamByName('TovarNo').AsInteger:=TovarNo;
  fmKartTovarSvedenie.quNaklR.Open;
  fmKartTovarSvedenie.ShowModal;

 finally
 fmKartTovarSvedenie.quNaklR.Close;
 fmKartTovarSvedenie.Free;
 end;
end;

end.
