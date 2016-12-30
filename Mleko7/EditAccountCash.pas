unit EditAccountCash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  MemDS, DBAccess, MsAccess, ActnList;

type
  TfmEditAccountCash = class(TMlekoForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    quAccountCash: TMSQuery;
    quAccountCashName: TStringField;
    dsAccountCash: TDataSource;
    quAccountCashPostNo: TSmallintField;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   SearchString:string;
  public
    { Public declarations }
  end;

var
  fmEditAccountCash: TfmEditAccountCash;
  function FEditAccountCash:integer;

implementation



{$R *.dfm}

function FEditAccountCash:integer;
begin
 fmEditAccountCash:=TfmEditAccountCash.Create(Application);
 try
 fmEditAccountCash.quAccountCash.Open;
 if fmEditAccountCash.ShowModal=mrOk then
  Result:=fmEditAccountCash.quAccountCashPostNo.AsInteger
 else
  Result:=0;
 finally
 fmEditAccountCash.quAccountCash.Close;
 fmEditAccountCash.Free;
 end;
end;


procedure TfmEditAccountCash.FormShow(Sender: TObject);
begin
 fmEditAccountCash.ActiveControl:=DBGrid1;
 fmEditAccountCash.SearchString:='';
end;

procedure TfmEditAccountCash.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:fmEditAccountCash.SearchString:='';
 end;
end;

procedure TfmEditAccountCash.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['A'..'Z','a'..'z','À'..'à','ß'..'ÿ','0'..'9'] then
  begin
   fmEditAccountCash.SearchString:=SearchString+Key;
   if not quAccountCash.Locate('Name',fmEditAccountCash.SearchString,[loPartialKey,loCaseInsensitive])then
    begin
     SysUtils.Beep;
     fmEditAccountCash.SearchString:=Copy(fmEditAccountCash.SearchString,1,length(Trim(fmEditAccountCash.SearchString))-1);
    end
  end
 else
  fmEditAccountCash.SearchString:='';
end;

end.
