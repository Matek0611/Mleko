unit TopTovars0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBAccess, MsAccess, MemDS, ExtCtrls, Grids, DBGrids,
  RXDBCtrl, ActnList;

type
  TfmTopTovars = class(TMlekoForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    quTopTovars: TMSQuery;
    quTopTovarsTovarNo: TSmallintField;
    quTopTovarsKol: TFloatField;
    quTopTovarsNameTovar: TStringField;
    dsTopTovars: TDataSource;
    quTopTovarsVidName: TStringField;
    UpdateTopTovars: TMSUpdateSQL;
    bbExit: TBitBtn;
    procedure quTopTovarsBeforePost(DataSet: TDataSet);
    procedure quTopTovarsBeforeDelete(DataSet: TDataSet);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quTopTovarsNewRecord(DataSet: TDataSet);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTopTovars: TfmTopTovars;
  procedure TopTovars;
implementation

uses Tovar0;

{$R *.DFM}

procedure TopTovars;
begin
 fmTopTovars:=TfmTopTovars.Create(Application);
 try
 fmTopTovars.quTopTovars.Open;
 fmTopTovars.RxDBGrid1.Col:=3;
 fmTopTovars.ShowModal;
 finally
 fmTopTovars.quTopTovars.Close;
 fmTopTovars.Close;
 end;
end;

procedure TfmTopTovars.quTopTovarsBeforePost(DataSet: TDataSet);
begin
 if quTopTovars.State=dsInsert then
  UpdateTopTovars.Apply(ukInsert)
 else
  UpdateTopTovars.Apply(ukModify);
end;

procedure TfmTopTovars.quTopTovarsBeforeDelete(DataSet: TDataSet);
begin
 UpdateTopTovars.Apply(ukDelete);
end;

procedure TfmTopTovars.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 RetTovar:TRetTovar;
begin
 case Key of
  VK_INSERT:begin
             Key:=0;
             RetTovar:=Tovar(True, True,0);
             if (RetTovar.TovarNo<>0) and
                (not quTopTovars.Locate('TovarNo',RetTovar.TovarNo,[])) then
              begin
               quTopTovars.Append;
               quTopTovarsTovarNo.AsInteger:=RetTovar.TovarNo;
               quTopTovarsNameTovar.AsString:=RetTovar.NameTovar;
               quTopTovarsVidName.AsString:=RetTovar.VidName;
               quTopTovars.Post;
              end;
            end;
  VK_DELETE:begin
             if not(quTopTovars.State=dsEdit) then
              begin
               Key:=0;
               quTopTovars.Delete;
              end;
            end;
 end;
end;

procedure TfmTopTovars.quTopTovarsNewRecord(DataSet: TDataSet);
begin
 quTopTovarsKol.AsFloat:=0;
end;

procedure TfmTopTovars.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
 TovarNo:SmallInt;
begin
 Screen.Cursor:=crHourGlass;
 TovarNo:=quTopTovarsTovarNo.AsInteger;
 quTopTovars.Close;
 case ACol of
  0:quTopTovars.MacroByName('_order').Value:='TopTovars.TovarNo';
  1:quTopTovars.MacroByName('_order').Value:='VidTov.VidName,Tovar.NameTovar';
  2:quTopTovars.MacroByName('_order').Value:='Tovar.NameTovar';
  3:quTopTovars.MacroByName('_order').Value:='TopTovars.Kol,Tovar.NameTovar';
 end;
 quTopTovars.Open;
 quTopTovars.Locate('TovarNo',TovarNo,[]);
 Screen.Cursor:=crDefault;
end;

end.
