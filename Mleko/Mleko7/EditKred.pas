unit EditKred;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, DBGrids, Grids, ExtCtrls, Buttons,
  RXDBCtrl, MemDS, DBAccess, MsAccess, ActnList;

type
  TfmEditKred = class(TMlekoForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    dsDolgi: TDataSource;
    Panel2: TPanel;
    quDolgi: TMSQuery;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure quDolgiBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    SearchString:string;
  public
    { public declarations }
  end;

var
  fmEditKred: TfmEditKred;
  function EditKreditors(Buh:boolean):integer;

implementation

uses data;

{$R *.DFM}

function EditKreditors(Buh:boolean):integer;
begin
 fmEditKred:=TfmEditKred.Create(Application);
 try
 if Buh then
  begin
   fmEditKred.quDolgi.ParamByName('BuhB').AsInteger:=2;
   fmEditKred.quDolgi.ParamByName('BuhE').AsInteger:=3;
  end
 else
  begin
   fmEditKred.quDolgi.ParamByName('BuhB').AsInteger:=1;
   fmEditKred.quDolgi.ParamByName('BuhE').AsInteger:=1;
  end;
 fmEditKred.quDolgi.Open;
 if fmEditKred.ShowModal=mrOk then
  Result:=fmEditKred.quDolgi.FieldbYname('PostNo').AsInteger
 else
  Result:=0;
 finally
 fmEditKred.quDolgi.Close;
 fmEditKred.Free;
 end;
end;

procedure TfmEditKred.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmEditKred.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmEditKred.quDolgiBeforeOpen(DataSet: TDataSet);
begin
  quDolgi.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
