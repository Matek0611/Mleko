unit EditDebet;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, DBGrids, Grids, ExtCtrls, Buttons,
  MemDS, DBAccess, MsAccess, ActnList;

type
  TfmEditDebet = class(TMlekoForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dsDolgi: TDataSource;
    Panel2: TPanel;
    quDolgi: TMSQuery;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure quDolgiBeforeOpen(DataSet: TDataSet);
  private
    { private declarations }
    SearchString:string;
  public
    { public declarations }
  end;

var
  fmEditDebet: TfmEditDebet;
  function EditDebetors(AllBuh, Buh:boolean):integer;

implementation

uses data;

{$R *.DFM}

function EditDebetors(AllBuh, Buh:boolean):integer;
begin
 fmEditDebet:=TfmEditDebet.Create(Application);
 try
 if not AllBuh then
  begin
   if Buh then
    begin
     fmEditDebet.quDolgi.ParamByName('BuhB').AsInteger:=2;
     fmEditDebet.quDolgi.ParamByName('BuhE').AsInteger:=3;
    end
   else
    begin
     fmEditDebet.quDolgi.ParamByName('BuhB').AsInteger:=1;
     fmEditDebet.quDolgi.ParamByName('BuhE').AsInteger:=1;
    end;
  end
 else
  begin
   fmEditDebet.quDolgi.ParamByName('BuhB').AsInteger:=1;
   fmEditDebet.quDolgi.ParamByName('BuhE').AsInteger:=3;
  end;
 fmEditDebet.quDolgi.Open;
 if fmEditDebet.ShowModal=mrOk then
  Result:=fmEditDebet.quDolgi.FielDByName('PostNo').AsInteger
 else
  Result:=0;
 finally
 fmEditDebet.quDolgi.Close;
 fmEditDebet.Free;
 end;
end;

procedure TfmEditDebet.FormShow(Sender: TObject);
begin
 fmEditDebet.ActiveControl:=DBGrid1;
 fmEditDebet.SearchString:='';
end;

procedure TfmEditDebet.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:fmEditDebet.SearchString:='';
 end;
end;

procedure TfmEditDebet.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key in ['A'..'Z','a'..'z','à'..'ÿ','À'..'ß','0'..'9'] then
  begin
   fmEditDebet.SearchString:=SearchString+Key;
   if not quDolgi.Locate('Name',fmEditDebet.SearchString,[loPartialKey,loCaseInsensitive])then
    begin
     SysUtils.Beep;
     fmEditDebet.SearchString:=Copy(fmEditDebet.SearchString,1,length(Trim(fmEditDebet.SearchString))-1);
    end
  end
 else
  fmEditDebet.SearchString:='';
end;

procedure TfmEditDebet.quDolgiBeforeOpen(DataSet: TDataSet);
begin
  quDolgi.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;


end.
