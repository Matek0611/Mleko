unit MlekoBlnkPrivyazka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, MemDS, DBAccess, MSAccess;

type
  TPrivyazka = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    MSQuery1: TMSQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Privyazka: TPrivyazka;

implementation

{$R *.dfm}

end.
