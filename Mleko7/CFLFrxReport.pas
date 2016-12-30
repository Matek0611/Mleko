unit CFLFrxReport;

interface

uses
  Classes,SysUtils,StrUtils,DB,DBAccess, MsAccess, frxClass,frxDBSet;

  const MaxRepDataSet = 6;


type
  TCFLFrxReport=class(TfrxReport)
  private
    DataSetList: array [1..6] of TMSQuery;
    frxDBDatasetList: array [1..6] of TfrxDBDataset;
    DataSetNameList: Tstrings;
    Report_id: Integer;
    print_template_id: Integer;
  public
    FrxReport:TfrxReport;
    function parse_flt_sql(p_sql: WideString):WideString;
    procedure AddRepParam(param_name: String;param_value: Variant);
    constructor GetReport(AOwner : TComponent;p_report_id :Integer;p_print_template_id:Integer);
    destructor Destroy; override;
  end;


implementation

uses data;

function TCFLFrxReport.parse_flt_sql(p_sql: WideString):WideString;
var l_result:WideString;
begin
  l_result:=AnsiReplaceStr(p_sql,'<USERNO>',IntToStr(data.UserNo));
  l_result:=AnsiReplaceStr(l_result,'<OWNERNAME>',''''+'REPORT'+IntToStr(Report_Id)+'''');
  result:=l_result;
//  p_sql;
//  result:=
end;

constructor TCFLFrxReport.GetReport(AOwner : TComponent;p_report_id :Integer;p_print_template_id:Integer);
var
  sql_text: WideString;
  k,i:integer;
  StreamRead: TStream;
begin
 inherited Create(AOwner);
 report_id:=p_report_id;
 print_template_id:=p_print_template_id;
 DataSetNameList:=TStringList.Create;

 with dmDataModule.quWork do
 begin
    Close;
    SQL.Clear;
    SQL.Add('select * from d_report_template where prop_dlg_id = :p_report_id');
    ParamByName('p_report_id').AsInteger:=p_report_id;
    Open;
 end;

 dmDataModule.quWork.First;
 k:=0;
 while not dmDataModule.quWork.Eof do
  begin
   DataSetNameList.Add(dmDataModule.quWork.FieldByName('num').AsString);
   sql_text:=parse_flt_sql (dmDataModule.quWork.FieldByName('SQL_TEXT').AsString);
   DataSetList[k] := TMSQuery.Create(AOwner);
   frxDBDatasetList[k] := TfrxDBDataset.Create(AOwner);
   DataSetList[k].Name:='QUERY'+dmDataModule.quWork.FieldByName('num').AsString;
   frxDBDatasetList[k].Name:='frxDataSet'+dmDataModule.quWork.FieldByName('num').AsString;
   DataSetList[k].Connection:=dmDataModule.DB;
//   DataSetList[k].CommandType:=cmdText;
   DataSetList[k].SQL.Text:=sql_text;
   frxDBDatasetList[k].DataSet:=DataSetList[k];
   inc(k);
   dmDataModule.quWork.Next;
 end;

 with dmDataModule.quWork do
 begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from D_REPORT_PRINT_TEMPLATE where prop_dlg_id = :p_report_id');
    ParamByName('p_report_id').AsInteger:=p_report_id;
    Open;
    StreamRead:=TStream.Create;
    try
     StreamRead:=CreateBlobStream(FieldByName('template'),bmRead);
     LoadFromStream(StreamRead);
    finally
     StreamRead.Free;
    end;
 end;

end;

procedure TCFLFrxReport.AddRepParam(param_name: String;param_value: Variant);
var i:Integer;
begin
 for i := 0 to DataSetNameList.Count-1 do
  begin
    if DataSetList[i].Params.FindParam(param_name)<>nil then
     begin DataSetList[i].Params.ParamByName(param_name).Value:=param_value;
    end;
  end;
end;

destructor TCFLFrxReport.Destroy;
var
  i: integer;
begin
  for i := 0 to  DataSetNameList.Count-1 do
  begin
   frxDBDatasetList[i].Free;
   DataSetList[i].Free;
  end;
  DataSetNameList.Free;
  inherited;
end;
end.
