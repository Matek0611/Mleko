unit Infarmatsionny_Analysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ExtCtrls, ActnList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, DB,
  MemDS, DBAccess, MSAccess, GridsEh, DBGridEh;

type
  TInfarmatsionny_AnalysisForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dsInfarmatsionny_AnalysisHead: TMSDataSource;
    DBGridEh1: TDBGridEh;
    quInfarmatsionny_AnalysisHead: TMSQuery;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    quInfarmatsionny_AnalysisHeadId: TIntegerField;
    quInfarmatsionny_AnalysisHeadOrderDate: TDateTimeField;
    quInfarmatsionny_AnalysisHeadPosnNo: TIntegerField;
    quInfarmatsionny_AnalysisHeadPostName: TStringField;
    quInfarmatsionny_AnalysisHeadSotrudNo: TIntegerField;
    quInfarmatsionny_AnalysisHeadSotrudName: TStringField;
    quInfarmatsionny_AnalysisHeadBuh: TIntegerField;
    quInfarmatsionny_AnalysisHeadBuhType: TStringField;
    quInfarmatsionny_AnalysisHeadOtdelNo: TIntegerField;
    quInfarmatsionny_AnalysisHeadOtdelName: TStringField;
    quInfarmatsionny_AnalysisHeadAddress: TStringField;
    quInfarmatsionny_AnalysisHeadColnPrice: TIntegerField;
    quInfarmatsionny_AnalysisHeadNaklNo: TIntegerField;
    quInfarmatsionny_AnalysisHeadPrice: TStringField;
    procedure EdDateBegPropertiesChange(Sender: TObject);
    procedure EdDateEndPropertiesChange(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Infarmatsionny_AnalysisForm: TInfarmatsionny_AnalysisForm;

implementation
uses data,Infarmatsionny_AnalysisSpec;

{$R *.dfm}

procedure TInfarmatsionny_AnalysisForm.EdDateBegPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quInfarmatsionny_AnalysisHead.Close;
  quInfarmatsionny_AnalysisHead.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quInfarmatsionny_AnalysisHead.Open;
end;

procedure TInfarmatsionny_AnalysisForm.EdDateEndPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quInfarmatsionny_AnalysisHead.Close;
  quInfarmatsionny_AnalysisHead.ParamByName('DateEnd').Value := EdDateEnd.Date;
  quInfarmatsionny_AnalysisHead.Open;
end;

procedure TInfarmatsionny_AnalysisForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
    with TInfarmatsionny_AnalysisSpecForm.Create(Application) do
   try
     quInfarmatsionny_AnalysisSpec.Close;
     quInfarmatsionny_AnalysisSpec.ParamByName('IdInfarmatsionny_Analysis').value := quInfarmatsionny_AnalysisHeadId.Value;
     quInfarmatsionny_AnalysisSpec.Open;


     ShowModal;
   finally
     quInfarmatsionny_AnalysisSpec.Close;
     Free;
   end;
end;

end.
