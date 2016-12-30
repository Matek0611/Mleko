unit MlekoTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKMDIChild, ActnList, ToolWin, ComCtrls, DB, cxPC,
  cxControls, MemDS, DBAccess, MsAccess, Grids, DBGrids, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TMlekoTestForm = class(TCFLMLKMDIChildForm)
    quDSPEC: TMSQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Action1: TAction;
    ToolButton1: TToolButton;
    EdDate1: TcxDateEdit;
    EdDate2: TcxDateEdit;
    procedure btn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DataSource1UpdateData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoTestForm: TMlekoTestForm;

implementation

uses data;



{$R *.dfm}

procedure TMlekoTestForm.btn1Click(Sender: TObject);
var
  Params: TParams;
  c:TComponent;
begin
  inherited;


  Params := TParams.Create;
  with Params.CreateParam(ftString, 'Name', ptInput) do AsString := 'ButtonTest';
  with Params.CreateParam(ftString, 'Caption', ptInput) do AsString := 'ButtonTest';
  with Params.CreateParam(ftInteger, 'Top', ptInput) do AsInteger := 160;
  with Params.CreateParam(ftInteger, 'Width', ptInput) do AsInteger := 75;
  with Params.CreateParam(ftInteger, 'Left', ptInput) do AsInteger := 96;
  with Params.CreateParam(ftInteger, 'Height', ptInput) do AsInteger := 25;
  try
//    c:=CreateControl('TButton',Self,Params);
  finally
    Params.Free;
  end;
end;

procedure TMlekoTestForm.Action1Execute(Sender: TObject);
begin
  inherited;
  quDSPEC.ParamByName('DateNakl1').AsDate:=EdDate1.Date;
  quDSPEC.ParamByName('DateNakl2').AsDate:=EdDate2.Date;  
  quDSPEC.Close;
  quDSPEC.Open;  
end;

procedure TMlekoTestForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
//  MessageDlg('OnDataChange', mtInformation, [mbOK], 0);
end;

procedure TMlekoTestForm.DataSource1StateChange(Sender: TObject);
begin
  inherited;
//  MessageDlg('OnStateChange', mtInformation, [mbOK], 0);
end;

procedure TMlekoTestForm.DataSource1UpdateData(Sender: TObject);
begin
  inherited;
//  MessageDlg('OnUpdateData', mtInformation, [mbOK], 0);
end;

end.

