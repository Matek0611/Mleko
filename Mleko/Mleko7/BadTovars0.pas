unit BadTovars0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBAccess, MsAccess, MemDS, ExtCtrls, Grids, DBGrids,
  RXDBCtrl, ActnList;

type
  TfmBadTovars = class(TMlekoForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    quBadTovars: TMSQuery;
    quBadTovarsTovarNo: TSmallintField;
    quBadTovarsKol: TFloatField;
    quBadTovarsNameTovar: TStringField;
    dsBadTovars: TDataSource;
    quBadTovarsVidName: TStringField;
    UpdateBadTovars: TMSUpdateSQL;
    bbExit: TBitBtn;
    procedure quBadTovarsBeforePost(DataSet: TDataSet);
    procedure quBadTovarsBeforeDelete(DataSet: TDataSet);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quBadTovarsNewRecord(DataSet: TDataSet);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBadTovars: TfmBadTovars;
  procedure BadTovars;
implementation

uses Tovar0, data;

{$R *.DFM}

procedure BadTovars;
begin
 fmBadTovars:=TfmBadTovars.Create(Application);
 try
 fmBadTovars.quBadTovars.Open;
 fmBadTovars.RxDBGrid1.Col:=3;
 fmBadTovars.ShowModal;
 finally
 fmBadTovars.quBadTovars.Close;
 fmBadTovars.Close;
 end;
end;

procedure TfmBadTovars.quBadTovarsBeforePost(DataSet: TDataSet);
begin
 if quBadTovars.State=dsInsert then
  UpdateBAdTovars.Apply(ukInsert)
 else
  UpdateBadTovars.Apply(ukModify);
end;

procedure TfmBadTovars.quBadTovarsBeforeDelete(DataSet: TDataSet);
begin
 UpdateBadTovars.Apply(ukDelete);
end;

procedure TfmBadTovars.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 RetTovar:TRetTovar;
begin
 case Key of
  VK_INSERT:begin
             Key:=0;
             RetTovar:=Tovar(True, True,0);
             if (RetTovar.TovarNo<>0) and
                (not quBadTovars.Locate('TovarNo',RetTovar.TovarNo,[])) then
              begin
               dmDataModule.quWork.SQL.Clear;
               dmDataModule.quWork.SQL.Add('select SUM(Kol) Kol from Ostatok where TovarNo=:TovarNo');
               dmDataModule.quWork.ParamByName('TovarNo').AsInteger:=RetTovar.TovarNo;
               dmDataModule.quWork.Open;
               quBadTovars.Append;
               quBadTovarsKol.AsCurrency:=dmDataModule.quWork.Fields[0].AsCurrency;
               dmDataModule.quWork.Close;
               quBadTovarsTovarNo.AsInteger:=RetTovar.TovarNo;
               quBadTovarsNameTovar.AsString:=RetTovar.NameTovar;
               quBadTovarsVidName.AsString:=RetTovar.VidName;
               quBadTovars.Post;
               RxDBGrid1.Col:=4;
              end;
            end;
  VK_DELETE:begin
             if not(quBadTovars.State=dsEdit) then
              begin
               Key:=0;
               quBadTovars.Delete;
              end;
            end;
 end;
end;

procedure TfmBadTovars.quBadTovarsNewRecord(DataSet: TDataSet);
begin
 quBadTovarsKol.AsFloat:=0;
end;

procedure TfmBadTovars.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
 TovarNo:SmallInt;
begin
 Screen.Cursor:=crHourGlass;
 TovarNo:=quBadTovarsTovarNo.AsInteger;
 quBadTovars.Close;
 case ACol of
  0:quBadTovars.MacroByName('_order').Value:='BadTovars.TovarNo';
  1:quBadTovars.MacroByName('_order').Value:='VidTov.VidName,Tovar.NameTovar';
  2:quBadTovars.MacroByName('_order').Value:='Tovar.NameTovar';
  3:quBadTovars.MacroByName('_order').Value:='BadTovars.Kol,Tovar.NameTovar';
 end;
 quBadTovars.Open;
 quBadTovars.Locate('TovarNo',TovarNo,[]);
 Screen.Cursor:=crDefault;
end;

end.
