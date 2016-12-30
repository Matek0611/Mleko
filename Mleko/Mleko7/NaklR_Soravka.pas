unit NaklR_Soravka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MSAccess, Grids, DBGrids, citDbGrid;

type
  TSpravka = class(TForm)
    citDBGrid1: TcitDBGrid;
    SpravkaQuery: TMSQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Spravka: TSpravka;

implementation

{$R *.dfm}

end.
