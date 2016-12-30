unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frxDBSet, DBTables, Db, frxClass, MemDS, DBAccess, MSAccess;

type
  TReportData = class(TDataModule)
    MSConnection: TMSConnection;
    Dept: TMSTable;
    Emp: TMSTable;
    DeptSource: TDataSource;
    EmpSource: TDataSource;
    DeptDS: TfrxDBDataset;
    EmpDS: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportData: TReportData;

implementation

{$R *.DFM}

end.
