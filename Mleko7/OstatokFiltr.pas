unit OstatokFiltr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, MSAccess, Grids, DBGrids;

type
  TFilter = class(TForm)
    FilterLabel: TLabel;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    MSQuery1: TMSQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Filter: TFilter;

implementation

{$R *.dfm}

end.
