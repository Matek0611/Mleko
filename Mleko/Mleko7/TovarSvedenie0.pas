unit TovarSvedenie0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, Buttons, ExtCtrls,
  DBGridEh, DB, MemDS, DBAccess, MsAccess,
  comp_TargetFilter_DateFilter, dxBar,
  dxBarExtItems, cxClasses, ActnList, cxGraphics,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxStyles, cxCustomData, cxFilter, cxData;

type
  TfmTovarSvedenie = class(TMlekoForm)
    quTovar: TMSQuery;
    dsTovar: TDataSource;
    dxBarManager: TdxBarManager;
    dxBarManagerBar1: TdxBar;
    dxBarGroup1: TdxBarGroup;
    EdDateView: TdxBarDateCombo;
    dxBarButton1: TdxBarButton;
    ActionListCur: TActionList;
    actView: TAction;
    dxBarButton2: TdxBarButton;
    ActionViewRefresh: TAction;
    dxBarButton3: TdxBarButton;
    ActionCloseForm: TAction;
    dbGrdtvMain: TcxGridDBTableView;
    DbGridTovChangeLevel1: TcxGridLevel;
    DbGridTovChange: TcxGrid;
    dbGrdtvMaintovarno: TcxGridDBColumn;
    dbGrdtvMainnametovar: TcxGridDBColumn;
    dbGrdtvMainedizm: TcxGridDBColumn;
    dbGrdtvMainkolperpak: TcxGridDBColumn;
    dbGrdtvMainnamecompany: TcxGridDBColumn;
    dbGrdtvMainvidname: TcxGridDBColumn;
    dbGrdtvMainkol: TcxGridDBColumn;
    ActionCopyToExcel: TAction;
    dxBarButton4: TdxBarButton;
    SaveDialog: TSaveDialog;
    dbGrdtvMainUserName: TcxGridDBColumn;
    dbGrdtvMainColumn1: TcxGridDBColumn;
    dbGrdtvMainColumn2: TcxGridDBColumn;
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure actViewExecute(Sender: TObject);
    procedure quTovarBeforeOpen(DataSet: TDataSet);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure ActionCloseFormExecute(Sender: TObject);
    procedure dbGrdtvMainDblClick(Sender: TObject);
    procedure ActionCopyToExcelExecute(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
    NaklNo: Integer;
  public
    class procedure TovarSvedenie(DateBegin: TDate; pNaklNo: Integer = -1);
  end;

var
  fmTovarSvedenie: TfmTovarSvedenie;

implementation

uses KartTovarSvedenie0, Data, cxGridExportLink;

{$R *.dfm}

class procedure TfmTovarSvedenie.TovarSvedenie(DateBegin: TDate; pNaklNo: Integer = -1);
begin
  fmTovarSvedenie := TfmTovarSvedenie.Create(Application);
  try
    fmTovarSvedenie.NaklNo := pNaklNo;
    fmTovarSvedenie.EdDateView.Date := DateBegin;
    fmTovarSvedenie.quTovar.Open;
    fmTovarSvedenie.ShowModal;
  finally
    fmTovarSvedenie.quTovar.Close;
    fmTovarSvedenie.Free;
  end;
end;

procedure TfmTovarSvedenie.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  TovarNo: integer;
begin
  Screen.Cursor := crHourGlass;
  TovarNo := quTovar.FieldByName('TovarNo').AsInteger;
  quTovar.Close;
  case ACol of
    0: quTovar.MacroByName('_order').Value := 's.TovarNo';
    1: quTovar.MacroByName('_order').Value := 's.VidName, s.NameTovar';
    2: quTovar.MacroByName('_order').Value := 's.NameTovar';
    3: quTovar.MacroByName('_order').Value := 's.NameCompany, s.NameTovar';
    4: quTovar.MacroByName('_order').Value := 's.qty_change';
  end;
  quTovar.Prepare;
  quTovar.Open;
  quTovar.Locate('TovarNo', TovarNo, []);
  Screen.Cursor := crDefault;
end;

procedure TfmTovarSvedenie.actViewExecute(Sender: TObject);
begin
  KartTovarSvedenie(EdDateView.Date, quTovar.FieldByName('TovarNo').AsInteger, quTovar.FieldByName('NameTovar').AsString);
end;

procedure TfmTovarSvedenie.quTovarBeforeOpen(DataSet: TDataSet);
begin
  quTovar.ParamByName('Date').AsDate := EdDateView.Date;
  if NaklNo = -1 then
  begin
    quTovar.ParamByName('NaklNo').Clear;
    quTovar.ParamByName('is_all_date').AsInteger:=0;
  end
  else
  begin
    quTovar.ParamByName('NaklNo').AsInteger := NaklNo;
    quTovar.ParamByName('is_all_date').AsInteger:=1;    
  end;
end;

procedure TfmTovarSvedenie.ActionViewRefreshExecute(Sender: TObject);
begin
  quTovar.Close;
  quTovar.Open;
end;

procedure TfmTovarSvedenie.ActionCloseFormExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Close;
end;

procedure TfmTovarSvedenie.dbGrdtvMainDblClick(
  Sender: TObject);
begin
  inherited;
  actView.Execute;
end;

procedure TfmTovarSvedenie.ActionCopyToExcelExecute(Sender: TObject);
var
  FilePath: string;
begin
  inherited;
  if SaveDialog.Execute then
  begin
    FilePath := SaveDialog.FileName;
    ExportGridToExcel(FilePath, DbGridTovChange);
  end;
end;

end.

