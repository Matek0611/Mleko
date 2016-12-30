unit MlekoSelectFloat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, citCtrls, citmask, citDBCtrls,
  citDBCalculator, StdCtrls, Mask, DBCtrlsEh, DB, ExtCtrls, MemDS,
  DBAccess, MSAccess;

type
  TMlekoSelectFloatDlg = class(TMlekoForm)
    FloatEditFromOststok: TcitDBCalcEdit;
    dsMaxKolFromOstatok: TMSDataSource;
    quMaxKolFromOstatok: TMSQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    quMaxKolFromOstatokMaxKol: TFloatField;
    btOk: TButton;
    btCancel: TButton;
    FloatEditFromAnalysisOstatok: TcitDBCalcEdit;
    dsMaxKolFromAnalysisOstatok: TMSDataSource;
    quMaxKolFromAnalysisOstatok: TMSQuery;
    quMaxKolFromAnalysisOstatokMaxKol: TIntegerField;
    dsMaxKolForAnalysisUnlocking: TMSDataSource;
    quMaxKolForAnalysisUnlocking: TMSQuery;
    IntegerField1: TIntegerField;
    FloatEditForAnalysisUnlocking: TcitDBCalcEdit;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectFloatDlg: TMlekoSelectFloatDlg;
  IdReport : integer;

implementation

uses data;

{$R *.dfm}
procedure TMlekoSelectFloatDlg.btOkClick(Sender: TObject);
begin
  inherited;
  if dsMaxKolFromOstatok.State in [dsInsert, dsEdit] then quMaxKolFromOstatok.Post;
  if dsMaxKolFromAnalysisOstatok.State in [dsInsert, dsEdit] then quMaxKolFromAnalysisOstatok.Post;
  if dsMaxKolForAnalysisUnlocking.State in [dsInsert, dsEdit] then quMaxKolForAnalysisUnlocking.Post;
  ModalResult := mrOk;
end;

procedure TMlekoSelectFloatDlg.btCancelClick(Sender: TObject);
begin
  inherited;
  if dsMaxKolFromOstatok.State in [dsInsert, dsEdit] then quMaxKolFromOstatok.Cancel;
  if dsMaxKolForAnalysisUnlocking.State in [dsInsert, dsEdit] then quMaxKolForAnalysisUnlocking.Cancel;
  ModalResult := mrCancel;
end;



initialization
 RegisterClass(TMlekoSelectFloatDlg);

finalization
 UnRegisterClass(TMlekoSelectFloatDlg);
end.
