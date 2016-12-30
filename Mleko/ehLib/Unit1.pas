unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Db, MemTableEh, GridsEh, DBAxisGridsEh, DBGridEh, IniFiles,
  EhlibMTE;

type
  TForm1 = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    MemTableEh1: TMemTableEh;
    MemTableEh1a: TIntegerField;
    MemTableEh1b: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    for i := 0 to DBGridEh1.Columns.Count - 1 do
      DBGridEh1.Columns[i].STFilter.ExpressionStr := Ini.ReadString('DBGridEh1Filter', IntToStr(i), '');
  finally
    Ini.Free;
  end;
  DBGridEh1.ApplyFilter;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  i: Integer;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    for i := 0 to DBGridEh1.Columns.Count - 1 do
      Ini.WriteString('DBGridEh1Filter', IntToStr(i), DBGridEh1.Columns[i].STFilter.ExpressionStr);
  finally
    Ini.Free;
  end;
end;

end.
