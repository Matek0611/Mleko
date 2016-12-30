unit Infarmatsionny_AnalysisSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, DB, DBAccess, MSAccess, MemDS, ExtCtrls,
  GridsEh, DBGridEh;

type
  TInfarmatsionny_AnalysisSpecForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    quInfarmatsionny_AnalysisSpec: TMSQuery;
    dsInfarmatsionny_AnalysisSpec: TMSDataSource;
    quInfarmatsionny_AnalysisSpecId: TIntegerField;
    quInfarmatsionny_AnalysisSpecIdInfarmatsionny_Analysis: TIntegerField;
    quInfarmatsionny_AnalysisSpecTovarNo: TIntegerField;
    quInfarmatsionny_AnalysisSpecVidNo: TIntegerField;
    quInfarmatsionny_AnalysisSpecNameTovar: TStringField;
    quInfarmatsionny_AnalysisSpecQty: TFloatField;
    quInfarmatsionny_AnalysisSpecResidue: TFloatField;
    quInfarmatsionny_AnalysisSpecNeed: TFloatField;
    DBGridEh1: TDBGridEh;
    quInfarmatsionny_AnalysisSpecVidName: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Infarmatsionny_AnalysisSpecForm: TInfarmatsionny_AnalysisSpecForm;

implementation
uses data;


{$R *.dfm}

end.
