unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Chart, StdCtrls, TeEngine, TeeProcs, Debug, Series,
  MemDS, DBAccess, MSAccess, OLEDBAccess, OLEDBC, SdacVcl,
  Db, DBTables, ADODB, DBXpress, SqlExpr, FMTBcd, DBClient, Provider;

type
  TfmMain = class(TForm)
    MSConnection: TMSConnection;
    MSQuery: TMSQuery;
    scCreate: TMSSQL;
    scDrop: TMSSQL;
    Chart: TChart;
    Tollbar: TPanel;
    btFetchTest: TButton;
    meResult: TMemo;
    btConnect: TButton;
    btDisconnect: TButton;
    Database: TDatabase;
    BDEQuery: TQuery;
    btMasterDetailTest: TButton;
    btSPCallTest: TButton;
    cbSDAC: TCheckBox;
    cbBDE: TCheckBox;
    cbADO: TCheckBox;
    edFetchRows: TEdit;
    Label1: TLabel;
    btCreate: TButton;
    btDrop: TButton;
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    cbMark: TCheckBox;
    MSQuery1: TMSQuery;
    BDEQuery1: TQuery;
    ADOQuery1: TADOQuery;
    ADOStoredProc: TADOStoredProc;
    MSStoredProc: TMSStoredProc;
    BDEStoredProc: TStoredProc;
    lbSDAC: TLabel;
    lbBDE: TLabel;
    lbADO: TLabel;
    MSSQL: TMSSQL;
    cbdbExpress: TCheckBox;
    lbdbExpress: TLabel;
    BorlandSQLConnection: TSQLConnection;
    BorlandSQLQuery: TSQLQuery;
    BorlandSQLQuery1: TSQLQuery;
    BorlandSQLStoredProc: TSQLStoredProc;
    btnMultiExecuting: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnInsertPost: TButton;
    MSTable: TMSTable;
    BDETable: TTable;
    ADOTable: TADOTable;
    Splitter1: TSplitter;
    DataSetProvider1: TDataSetProvider;
    BorlandClientDataSet: TClientDataSet;
    BorlandSQLTable: TSQLTable;
    Bevel3: TBevel;
    cbResultLog: TCheckBox;
    Bevel4: TBevel;
    Bevel5: TBevel;
    cbdbExpSda: TCheckBox;
    lbdbExpSda: TLabel;
    CrLabSQLConnection: TSQLConnection;
    CrLabSQLQuery: TSQLQuery;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    CrLabSQLQuery1: TSQLQuery;
    CrLabSQLTable: TSQLTable;
    CrLabClientDataSet: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    Series1: TLineSeries;
    CrLabSQLStoredProc: TSQLStoredProc;
    scCreate2: TMSSQL;
    MSTable1: TMSTable;
    btEditPost: TButton;
    procedure btConnectClick(Sender: TObject);
    procedure btDisconnectClick(Sender: TObject);
    procedure btFetchTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFetchRowsExit(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure btDropClick(Sender: TObject);
    procedure cbMarkClick(Sender: TObject);
    procedure btMasterDetailTestClick(Sender: TObject);
    procedure btSPCallTestClick(Sender: TObject);
    procedure btnMultiExecutingClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInsertPostClick(Sender: TObject);
    procedure cbSetInternalNameClick(Sender: TObject);
    procedure cbResultLogClick(Sender: TObject);
    procedure CrLabSQLConnectionAfterConnect(Sender: TObject);
    procedure cbPermitPrepareClick(Sender: TObject);
    procedure btEditPostClick(Sender: TObject);
  private
    TickInfo: TTickInfo;
    //LoadCount: integer;

    function FetchTest(DataSet:TDataSet; Recs:integer): integer;
    function MasterDetailTest(Master: TDataSet; Detail: TDataSet; Recs: integer): integer;
    function SPCallTest(StoredProc: TComponent; Count: integer): integer;
    function MultiExecutingTest(Query: TComponent; Count: integer): integer;
    function InsertPostTest(Table: TDataSet; Count: integer): integer;
    function EditPostTest(Table: TDataSet; Count: integer): integer;

    procedure ExecSQL(const SQL: string);

    procedure CheckConnected;
    procedure PrintResults;

  public
    constructor Create(Owner:TComponent); override;
    destructor Destroy; override;
  end;

var
  fmMain: TfmMain;

implementation

uses
  Variants;

{$R *.DFM}

constructor TfmMain.Create(Owner:TComponent);
begin
  inherited;

  TickInfo := TTickInfo.Create;
  Caption := 'MS SQL Data Access Demos - SDAC ' + SDACVersion + ' performance';
end;

destructor TfmMain.Destroy;
begin
  TickInfo.Free;

  inherited;
end;

function TfmMain.FetchTest(DataSet:TDataSet; Recs:integer):integer;
var
  i: integer;
  OpenTime: integer;
  FetchTime: integer;
  SQL: string;
begin
  SQL := 'SELECT * FROM Detail WHERE Code <= :Recs';

  if DataSet is TMSQuery then begin
    meResult.Lines.Add('> SDAC');
    TMSQuery(DataSet).SQL.Text := SQL;
    TMSQuery(DataSet).ParamByName('Recs').AsInteger := Recs
  end
  else
    if DataSet is TQuery then begin
      meResult.Lines.Add('> BDE');
      TQuery(DataSet).SQL.Text := SQL;
      TQuery(DataSet).ParamByName('Recs').AsInteger := Recs;
    end
    else
      if DataSet is TADOQuery then begin
        meResult.Lines.Add('> ADO');
        TADOQuery(DataSet).SQL.Text := SQL;
        TADOQuery(DataSet).Parameters.ParamByName('Recs').Value := Recs;
      end else
      if DataSet is TSQLQuery then begin
        meResult.Lines.Add('> dbExpress');
        TSQLQuery(DataSet).SQL.Text := SQL;
        TSQLQuery(DataSet).ParamByName('Recs').DataType := ftString;
        TSQLQuery(DataSet).ParamByName('Recs').Value := Recs;
      end;

  TickInfo.Start;
  DataSet.Open;
  OpenTime := TickInfo.GetInterval;
  meResult.Lines.Add('Opened in ' +  IntervalToStr(OpenTime));

  TickInfo.Start;

  i := 0;
  while not DataSet.EOF do begin
    Inc(i);
    DataSet.Next;
  end;
  FetchTime := TickInfo.GetInterval;
  meResult.Lines.Add('Fetched ' + IntToStr(i) + ' recs in ' + IntervalToStr(FetchTime));
  DataSet.Close;

  Result := OpenTime + FetchTime;
end;

function TfmMain.MasterDetailTest(Master: TDataSet; Detail: TDataSet; Recs: integer):integer;
var
  i, j: integer;
  FetchTime: integer;
  SQL,SQL1: string;
begin
  SQL := 'SELECT * FROM Master WHERE Code <= :Recs'; //RowNum
  SQL1 := 'SELECT * FROM Detail WHERE Master = :Code';
  if Master is TMSQuery then begin
    meResult.Lines.Add('> SDAC');
    TMSQuery(Master).SQL.Text := SQL;
    TMSQuery(Detail).SQL.Text := SQL1;
    TMSQuery(Detail).Options.LocalMasterDetail := true;
    TMSQuery(Master).ParamByName('Recs').AsInteger := Recs
  end
  else
    if Master is TQuery then begin
      meResult.Lines.Add('> BDE');
      TQuery(Master).SQL.Text := SQL;
      TQuery(Detail).SQL.Text := SQL1;
      TQuery(Master).ParamByName('Recs').AsInteger := Recs;
    end
    else
      if Master is TADOQuery then begin
        meResult.Lines.Add('> ADO');
        TADOQuery(Master).SQL.Text := SQL;
        TADOQuery(Detail).SQL.Text := SQL1;
        TADOQuery(Master).Parameters.ParamByName('Recs').Value := Recs;
      end else
      if Master is TSQLQuery then begin
        meResult.Lines.Add('> dbExpress');
        TSQLQuery(Master).SQL.Text := SQL;
        TSQLQuery(Detail).SQL.Text := SQL1;
        TSQLQuery(Master).ParamByName('Recs').DataType := ftString;
        TSQLQuery(Master).ParamByName('Recs').Value := Recs;
      end;

  TickInfo.Start;
  Master.Open;

  if Detail is TMSQuery then
    TMSQuery(Detail).Prepare
  else
    if Detail is TQuery then
      TQuery(Detail).Prepare
    else
      if Detail is TADOQuery then
        TADOQuery(Detail).Prepared := True
      else
      if Detail is TSQLQuery then begin
        TSQLQuery(Detail).Prepared := True;
        TSQLQuery(Detail).ParamByName('Code').DataType := ftInteger;
      end;

  i := 0;
  j := 0;
  while not Master.EOF do begin
    if Detail is TMSQuery then
      TMSQuery(Detail).ParamByName('Code').AsInteger := Master.FieldByName('Code').AsInteger
    else
      if Detail is TQuery then
        TQuery(Detail).ParamByName('Code').AsInteger := Master.FieldByName('Code').AsInteger
      else
        if Detail is TADOQuery then
          TADOQuery(Detail).Parameters.ParamByName('Code').Value := Master.FieldByName('Code').AsInteger
        else
        if Detail is TSQLQuery then
          TSQLQuery(Detail).ParamByName('Code').Value := Master.FieldByName('Code').AsInteger;

    Detail.Open;
    while not Detail.EOF do begin
      Inc(j);
      Detail.Next;
    end;
    Detail.Close;

    Inc(i);
    Master.Next;
  end;
  FetchTime := TickInfo.GetInterval;
  meResult.Lines.Add('Fetched ' + IntToStr(i) + ' master recs, ' +
    IntToStr(j) + ' detail recs in ' + IntervalToStr(FetchTime));

  if Detail is TMSQuery then
    TMSQuery(Detail).UnPrepare
  else
    if Detail is TQuery then
      TQuery(Detail).UnPrepare
    else
      if Detail is TADOQuery then
        TADOQuery(Detail).Prepared := False
      else
      if Detail is TSQLQuery then
        TSQLQuery(Detail).Prepared := False;

  Master.Close;

  Result := FetchTime;
end;

procedure TMSSQLExecute(Query: TComponent);
begin
  TMSSQL(Query).Execute;
end;

procedure TQueryExecSQL(Query: TComponent);
begin
  TQuery(Query).ExecSQL;
end;

procedure TADOQueryExecSQL(Query: TComponent);
begin
  TADOQuery(Query).ExecSQL;
end;

procedure TSQLQueryExecSQL(Query: TComponent);
begin
  TSQLQuery(Query).ExecSQL;
end;

type
  TExecSQLProc = procedure (Query: TComponent);

function TfmMain.MultiExecutingTest(Query: TComponent; Count: integer): integer;
var
  i:integer;
  ExecTime:integer;
  SQL: string;
  ExecSQLProc: TExecSQLProc;
begin
  SQL := 'DECLARE @a INT';

  ExecSQLProc := nil;
  if Query is TMSSQL then begin
    meResult.Lines.Add('> SDAC');
    TMSSQL(Query).SQL.Text := SQL;
    TMSSQL(Query).Prepared := True;
    ExecSQLProc := TMSSQLExecute;
  end
  else
    if Query is TQuery then begin
      meResult.Lines.Add('> BDE');
      TQuery(Query).SQL.Text := SQL;
      TQuery(Query).Prepared := True;
      ExecSQLProc := TQueryExecSQL;
    end
    else
      if Query is TADOQuery then begin
        meResult.Lines.Add('> ADO');
        TADOQuery(Query).SQL.Text := SQL;
        TADOQuery(Query).Prepared := True;
        ExecSQLProc := TADOQueryExecSQL;
      end else
      if Query is TSQLQuery then begin
        meResult.Lines.Add('> dbExpress');
        TSQLQuery(Query).SQL.Text := SQL;
        TSQLQuery(Query).Prepared := True;
        ExecSQLProc := TSQLQueryExecSQL;
      end;

  TickInfo.Start;

  for i := 1 to Count do
    ExecSQLProc(Query);

  ExecTime := TickInfo.GetInterval;
  meResult.Lines.Add('Executed ' + IntToStr(Count) + ' count ' + IntervalToStr(ExecTime));

  Result := ExecTime;
end;

function TfmMain.InsertPostTest(Table: TDataSet; Count: integer): integer;
var
  i:integer;
  ExecTime:integer;
  TableName: string;
begin
  TableName := 'DETAIL';
  ExecSQL('TRUNCATE TABLE ' + TableName);

  if Table is TMSTable then begin
    meResult.Lines.Add('> SDAC');
    TMSTable(Table).TableName := TableName;

    // ~10% performance
    TMSTable(Table).SQLInsert.Text := 'INSERT INTO DETAIL (Code, Master, Field1, Field2) VALUES (:Code, :Master, :Field1, :Field2)';
  end
  else
    if Table is TTable then begin
      meResult.Lines.Add('> BDE');
      TTable(Table).TableName := TableName;
    end
    else
      if Table is TADOTable then begin
        meResult.Lines.Add('> ADO');
        TADOTable(Table).TableName := TableName;
      end else
      if Table = BorlandClientDataSet then begin
        meResult.Lines.Add('> dbExpress');
        BorlandSQLTable.TableName  := TableName;
      end else
        if Table = CrLabClientDataSet then begin
          meResult.Lines.Add('> dbExpSda');
          CrLabSQLTable.TableName  := TableName;
        end;

  Table.Open;

  TickInfo.Start;

  for i := 1 to Count do begin
    Table.Insert;
    Table.FieldByName('CODE').Value := i;
    Table.FieldByName('Field1').AsString := '01234567890123456789';
    Table.FieldByName('Field2').AsString := '12345678901234567890';
    Table.Post;
  end;

  if Table = BorlandClientDataSet then
    BorlandClientDataSet.ApplyUpdates(0);
  if Table = CrLabClientDataSet then
    CrLabClientDataSet.ApplyUpdates(0);

  ExecTime := TickInfo.GetInterval;
  Table.Close;
  meResult.Lines.Add('Inserted ' + IntToStr(Count) + ' records ' + IntervalToStr(ExecTime));

  Result := ExecTime;
end;

procedure TfmMain.ExecSQL(const SQL: string);
var
  MSSQL: TMSSQL; 
begin
  MSSQL := TMSSQL.Create(nil);
  try
    MSSQL.Connection := MSConnection;
    MSSQL.SQL.Text := SQL;
    MSSQL.Execute;
  finally
    MSSQL.Free;
  end;
end;

function TfmMain.SPCallTest(StoredProc: TComponent; Count: integer):integer;
var
  i:integer;
  ExecTime:integer;
begin
  if StoredProc is TMSStoredProc then
    meResult.Lines.Add('> SDAC')
  else
    if StoredProc is TStoredProc then
      meResult.Lines.Add('> BDE')
    else
    if StoredProc is TADOStoredProc then
       meResult.Lines.Add('> ADO');
    if StoredProc is TSQLStoredProc then
       meResult.Lines.Add('> dbExpress');

  TickInfo.Start;
  for i := 1 to Count do begin
    if StoredProc is TMSStoredProc then begin
     with TMSStoredProc(StoredProc) do begin
        if i = 1 then begin
          StoredProcName := 'Master_Insert';
          Prepare;
        end;

        ParamByName('p_Code').AsInteger := i;
        ParamByName('p_Field1').AsString := '01234567890123456789';
        ParamByName('p_Field2').AsString := '12345678901234567890';
        ParamByName('p_Field3').AsString := '23456789012345678901';

        Execute;
      end;
    end
    else
      if StoredProc is TStoredProc then begin
        with TStoredProc(StoredProc) do begin
          if i = 1 then begin
            StoredProcName := 'MASTER_INSERT';
            Params.Clear;
            with TParam(Params.Add) do begin
              Name := '@p_Code';
              ParamType := ptInput;
              DataType := ftInteger;
            end;

            with TParam(Params.Add) do begin
              Name := '@p_Field1';
              ParamType := ptInput;
              DataType := ftString;
            end;

            with TParam(Params.Add) do begin
              Name := '@p_Field2';
              ParamType := ptInput;
              DataType := ftString;
            end;

            with TParam(Params.Add) do begin
              Name := '@p_Field3';
              ParamType := ptInput;
              DataType := ftString;
            end;
            Prepare;
          end;

          ParamByName('@p_Code').AsInteger := i;
          ParamByName('@p_Field1').AsString := '01234567890123456789';
          ParamByName('@p_Field2').AsString := '12345678901234567890';
          ParamByName('@p_Field3').AsString := '23456789012345678901';

          ExecProc;
        end;
      end
      else
        if StoredProc is TADOStoredProc then begin
          with TADOStoredProc(StoredProc) do begin
            if i = 1 then begin
              ProcedureName := 'MASTER_INSERT';
              Parameters.Refresh;
            end;
            Parameters.ParamByName('@p_Code').Value := i;
            Parameters.ParamByName('@p_Field1').Value := '01234567890123456789';
            Parameters.ParamByName('@p_Field2').Value := '12345678901234567890';
            Parameters.ParamByName('@p_Field3').Value := '23456789012345678901';

            ExecProc;
          end;
        end else
        if StoredProc is TSQLStoredProc then begin
          with TSQLStoredProc(StoredProc) do begin
            if i = 1 then begin
              StoredProcName := 'MASTER_INSERT';
              Prepared := True;
            end;

            if StoredProc = BorlandSQLStoredProc then begin
              Params.ParamValues['@p_Code'] := i;
              Params.ParamValues['@p_Field1'] := '01234567890123456789';
              Params.ParamValues['@p_Field2'] := '12345678901234567890';
              Params.ParamValues['@p_Field3'] := '23456789012345678901';
            end
            else
            begin
              Params.ParamValues['p_Code'] := i;
              Params.ParamValues['p_Field1'] := '01234567890123456789';
              Params.ParamValues['p_Field2'] := '12345678901234567890';
              Params.ParamValues['p_Field3'] := '23456789012345678901';
            end;
            ExecProc;
//            Prepared := false;
          end;
        end
  end;

  ExecTime := TickInfo.GetInterval;
  meResult.Lines.Add('Executed ' + IntToStr(Count) + ' times in ' +  IntervalToStr(ExecTime));

  Result := ExecTime;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  edFetchRows.Text := IntToStr(MSQuery.FetchRows);
end;

procedure TfmMain.CheckConnected;
begin
  if (not MSConnection.Connected) or
    (cbBDE.Checked and not Database.Connected) or
    (cbADO.Checked and not ADOConnection.Connected) or
    (cbdbExpress.Checked and not BorlandSQLConnection.Connected) or
    (cbdbExpSda.Checked and not CrLabSQLConnection.Connected) then
    raise Exception.Create('You must connect first!');
end;

procedure TfmMain.PrintResults;
  procedure Process(CheckBox: TCheckBox; Res: string);
  begin
    if CheckBox.Checked then
      meResult.Lines.Add(CheckBox.Caption + ' ' + Res);
  end;

begin
  meResult.Lines.Add('---------------');
  Process(cbSDAC, lbSDAC.Caption);
  Process(cbBDE, lbBDE.Caption);
  Process(cbADO, lbADO.Caption);
  Process(cbdbExpress, lbdbExpress.Caption);
  Process(cbdbExpSda, lbdbExpSda.Caption);
  meResult.Lines.Add('===============');
end;

procedure TfmMain.btConnectClick(Sender: TObject);
begin
  edFetchRowsExit(nil);

  if not MSConnection.Connected then begin
    MSConnection.Connect;
    meResult.Lines.Add('SDAC connected');
  end;

  if cbBDE.Checked and not Database.Connected then begin
    Database.Params.Values['USER NAME'] := MSConnection.UserName;
    Database.Params.Values['PASSWORD'] := MSConnection.Password;
    Database.Params.Values['SERVER NAME'] := MSConnection.Server;
    Database.Params.Values['DATABASE NAME'] := MSConnection.Database;
    Database.Open;
    meResult.Lines.Add('BDE connected');
  end;

  if cbADO.Checked and not ADOConnection.Connected then begin
    ADOConnection.ConnectionString := MSConnection.ConnectString;
    ADOConnection.Open;
    meResult.Lines.Add('ADO connected');
  end;

  if cbdbExpress.Checked and not BorlandSQLConnection.Connected then begin
    BorlandSQLConnection.Params.Values['User_Name'] := MSConnection.UserName;
    BorlandSQLConnection.Params.Values['Password'] := MSConnection.Password;
    BorlandSQLConnection.Params.Values['HostName'] := MSConnection.Server;
    BorlandSQLConnection.Params.Values['DataBase'] := MSConnection.Database;

    BorlandSQLConnection.Connected := True;
    meResult.Lines.Add('dbExpress connected');
  end;
                         
  if cbdbExpSda.Checked and not CrLabSQLConnection.Connected then begin
    CrLabSQLConnection.Params.Values['User_Name'] := MSConnection.UserName;
    CrLabSQLConnection.Params.Values['Password'] := MSConnection.Password;
    CrLabSQLConnection.Params.Values['HostName'] := MSConnection.Server;
    CrLabSQLConnection.Params.Values['DataBase'] := MSConnection.Database;

    CrLabSQLConnection.Connected := True;
    meResult.Lines.Add('dbExpSda connected');
  end;
end;

procedure TfmMain.btDisconnectClick(Sender: TObject);
begin
  MSConnection.Disconnect;
  BorlandSQLConnection.Connected := false;
  CrLabSQLConnection.Connected := false;
  ADOConnection.Close;
  Database.Close;
  meResult.Lines.Add('Disconected');
end;

procedure TfmMain.btFetchTestClick(Sender: TObject);
const
  Step = 10000;
var
  i: integer;
  ResSDAC, ResBDE, ResADO, ResdbExp, ResdbExpSda: integer;
  mBDE, mADO, mdbExp, mdbExpSda: double;
begin
  CheckConnected;

  Chart.Title.Text.Text := 'Fetch Test';
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Clear;
  Chart.BottomAxis.Minimum := 0;
  Chart.BottomAxis.Maximum := 11 * Step;
  mBDE := 0;
  mADO := 0;
  mdbExp := 0;
  mdbExpSda := 0;

  for i := 1 to 10 do begin
    ResSDAC := 0;
    ResBDE := 0;
    ResADO := 0;
    ResdbExp := 0;
    ResdbExpSda := 0;

    meResult.Lines.Add('---------------');
  // BDE
    if cbBDE.Checked then begin
      ResBDE := FetchTest(BDEQuery, i*Step);
      Chart.Series[1].AddXY(i*Step, ResBDE/1000, '', clTeeColor);
    end;
  // SDAC
    if cbSDAC.Checked then begin
      ResSDAC := FetchTest(MSQuery, i*Step);
      Chart.Series[0].AddXY(i*Step, ResSDAC/1000, '', clTeeColor);
    end;
  // ADO
    if cbADO.Checked then begin
      ResADO := FetchTest(ADOQuery, i*Step);
      Chart.Series[2].AddXY(i*Step, ResADO/1000, '', clTeeColor);
    end;
  // dbExpress
    if cbdbExpress.Checked then begin
      ResdbExp := FetchTest(BorlandSQLQuery, i*Step);
      Chart.Series[3].AddXY(i*Step, ResdbExp/1000, '', clTeeColor);
    end;
  // dbExpSda
    if cbdbExpSda.Checked then begin
      ResdbExpSda := FetchTest(CrLabSQLQuery, i*Step);
      Chart.Series[4].AddXY(i*Step, ResdbExpSda/1000, '', clTeeColor);
    end;

    if ResSDAC > 0 then begin
      mBDE := ((i - 1)*mBDE + ResBDE/ResSDAC)/i;
      mADO := ((i - 1)*mADO + ResADO/ResSDAC)/i;
      mdbExp := ((i - 1)*mdbExp + ResdbExp/ResSDAC)/i;
      mdbExpSda := ((i - 1)*mdbExpSda + ResdbExpSda/ResSDAC)/i;
      lbSDAC.Caption := FloatToStrF(1, ffGeneral, 5, 3);
      lbBDE.Caption := FloatToStrF(mBDE, ffGeneral, 5, 3);
      lbADO.Caption := FloatToStrF(mADO, ffGeneral, 5, 3);
      lbdbExpress.Caption := FloatToStrF(mdbExp, ffGeneral, 5, 3);
      lbdbExpSda.Caption := FloatToStrF(mdbExpSda, ffGeneral, 5, 3);
      lbBDE.Update;
      lbADO.Update;
      lbdbExpress.Update;
      lbdbExpSda.Update;
    end;

    Chart.Update;
  end;
  PrintResults;
end;

procedure TfmMain.btMasterDetailTestClick(Sender: TObject);
var
  i:integer;
  ResSDAC, ResBDE, ResADO, ResdbExp, ResdbExpSda: integer;
  mBDE, mADO, mdbExp, mdbExpSda: double;
begin
  CheckConnected;

  Chart.Title.Text.Text := 'Master/Detail Test';
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Clear;
  Chart.BottomAxis.Minimum := 0;
  Chart.BottomAxis.Maximum := 110;

  mBDE := 0;
  mADO := 0;
  mdbExp := 0;
  mdbExpSda := 0;
  for i := 1 to 10 do begin
    ResSDAC := 0;
    ResBDE := 0;
    ResADO := 0;
    ResdbExp := 0;
    ResdbExpSda := 0;

    meResult.Lines.Add('---------------');
  // SDAC
    if cbSDAC.Checked then begin
      ResSDAC := MasterDetailTest(MSQuery, MSQuery1, i*10);
      Chart.Series[0].AddXY(i*10, ResSDAC/1000, '', clTeeColor);
    end;
  // BDE
    if cbBDE.Checked then begin
      ResBDE := MasterDetailTest(BDEQuery, BDEQuery1, i*10);
      Chart.Series[1].AddXY(i*10, ResBDE/1000, '', clTeeColor);
    end;
  // ADO
    if cbADO.Checked then begin
      ResADO := MasterDetailTest(ADOQuery, ADOQuery1, i*10);
      Chart.Series[2].AddXY(i*10, ResADO/1000, '', clTeeColor);
    end;
  // dbExpress
    if cbdbExpress.Checked then begin
      ResdbExp := MasterDetailTest(BorlandSQLQuery, BorlandSQLQuery1, i*10);
      Chart.Series[3].AddXY(i*10, ResdbExp/1000, '', clTeeColor);
    end;
  // dbExpSda
    if cbdbExpSda.Checked then begin
      ResdbExpSda := MasterDetailTest(CrLabSQLQuery, CrLabSQLQuery1, i*10);
      Chart.Series[4].AddXY(i*10, ResdbExpSda/1000, '', clTeeColor);
    end;

    if ResSDAC > 0 then begin
      mBDE := ((i - 1)*mBDE + ResBDE/ResSDAC)/i;
      mADO := ((i - 1)*mADO + ResADO/ResSDAC)/i;
      mdbExp := ((i - 1)*mdbExp + ResdbExp/ResSDAC)/i;
      mdbExpSda := ((i - 1)*mdbExpSda + ResdbExpSda/ResSDAC)/i;
      lbSDAC.Caption := FloatToStrF(1, ffGeneral, 5, 3);
      lbBDE.Caption := FloatToStrF(mBDE, ffGeneral, 5, 3);
      lbADO.Caption := FloatToStrF(mADO, ffGeneral, 5, 3);
      lbdbExpress.Caption := FloatToStrF(mdbExp, ffGeneral, 5, 3);
      lbdbExpSda.Caption := FloatToStrF(mdbExpSda, ffGeneral, 5, 3);
      lbBDE.Update;
      lbADO.Update;
      lbdbExpress.Update;
      lbdbExpSda.Update;
    end;

    Chart.Update;
  end;
  PrintResults;
end;

procedure TfmMain.btSPCallTestClick(Sender: TObject);
var
  i:integer;
  ResSDAC, ResBDE, ResADO, ResdbExp, ResdbExpSda: integer;
  mBDE, mADO, mdbExp, mdbExpSda: double;
const
  Step = 10;
begin
  CheckConnected;

  Chart.Title.Text.Text := 'StoredProc Call Test';
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Clear;
  Chart.BottomAxis.Minimum := 0;
  Chart.BottomAxis.Maximum := 11 * Step;

  mBDE := 0;
  mADO := 0;
  mdbExp := 0;
  mdbExpSda := 0;
  for i := 1 to 10 do begin
    ResSDAC := 0;
    ResBDE := 0;
    ResADO := 0;
    ResdbExp := 0;
    ResdbExpSda := 0;

    meResult.Lines.Add('---------------');
  // SDAC
    if cbSDAC.Checked then begin
      ResSDAC := SPCallTest(MSStoredProc, i*Step);
      Chart.Series[0].AddXY(i*Step, ResSDAC/(Step * 10), '', clTeeColor);
    end;
  // BDE
    if cbBDE.Checked then begin
      ResBDE := SPCallTest(BDEStoredProc, i*Step);
      Chart.Series[1].AddXY(i*Step, ResBDE/(Step * 10), '', clTeeColor);
    end;
  // ADO
    if cbADO.Checked then begin
      ResADO := SPCallTest(ADOStoredProc, i*Step);
      Chart.Series[2].AddXY(i*Step, ResADO/(Step * 10), '', clTeeColor);
    end;
  // dbExpress
    if cbdbExpress.Checked then begin
      ResdbExp := SPCallTest(BorlandSQLStoredProc, i*Step);
      Chart.Series[3].AddXY(i*Step, ResdbExp/(Step * 10), '', clTeeColor);
    end;
  // dbExpSda
    if cbdbExpSda.Checked then begin
      ResdbExpSda := SPCallTest(CrLabSQLStoredProc, i*Step);
      Chart.Series[4].AddXY(i*Step, ResdbExpSda/(Step * 10), '', clTeeColor);
    end;

    if ResSDAC > 0 then begin
      mBDE := ((i - 1)*mBDE + ResBDE/ResSDAC)/i;
      mADO := ((i - 1)*mADO + ResADO/ResSDAC)/i;
      mdbExp := ((i - 1)*mdbExp + ResdbExp/ResSDAC)/i;
      mdbExpSda := ((i - 1)*mdbExpSda + ResdbExpSda/ResSDAC)/i;
      lbSDAC.Caption := FloatToStrF(1, ffGeneral, 5, 3);
      lbBDE.Caption := FloatToStrF(mBDE, ffGeneral, 5, 3);
      lbADO.Caption := FloatToStrF(mADO, ffGeneral, 5, 3);
      lbdbExpress.Caption := FloatToStrF(mdbExp, ffGeneral, 5, 3);
      lbdbExpSda.Caption := FloatToStrF(mdbExpSda, ffGeneral, 5, 3);
      lbBDE.Update;
      lbADO.Update;
      lbdbExpress.Update;
      lbdbExpSda.Update;
    end;

    Chart.Update;
  end;
  PrintResults;
end;

procedure TfmMain.edFetchRowsExit(Sender: TObject);
var
  Connected: boolean;
begin
  try
    MSQuery.FetchRows := StrToInt(edFetchRows.Text);
    MSQuery1.FetchRows := StrToInt(edFetchRows.Text);
    Connected := Database.Connected;
    Database.Close;
    Database.Params.Values['ROWSET SIZE'] := edFetchRows.Text;
    if Connected then begin
      Database.LoginPrompt := False;
      Database.Open;
      Database.LoginPrompt := True;
    end;
    ADOQuery.CacheSize := StrToInt(edFetchRows.Text);
    ADOQuery1.CacheSize := StrToInt(edFetchRows.Text);    
  finally
    edFetchRows.Text := IntToStr(MSQuery.FetchRows);
  end;
end;

procedure TfmMain.btCreateClick(Sender: TObject);
begin
  scCreate.Execute;
  scCreate2.Execute;
end;

procedure TfmMain.btDropClick(Sender: TObject);
begin
  scDrop.Execute;
end;

procedure TfmMain.cbMarkClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Marks.Visible := cbMark.Checked;
end;

(*
procedure TfmMain.MSLoaderPutData(Sender: TMSLoader);
var
  i: integer;
begin
  for i := 1 to LoadCount do begin
    Sender.PutColumnData(0, i, i);
    Sender.PutColumnData(1, i, '01234567890123456789');
  end;
end;*)

procedure TfmMain.btnMultiExecutingClick(Sender: TObject);
var
  i:integer;
  ResSDAC, ResBDE, ResADO, ResdbExp, ResdbExpSda: integer;
  mBDE, mADO, mdbExp, mdbExpSda: double;
begin
  CheckConnected;

  Chart.Title.Text.Text := 'MultiExecuting Test';
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Clear;
  Chart.BottomAxis.Minimum := 0;
  Chart.BottomAxis.Maximum := 1100;

  mBDE := 0;
  mADO := 0;
  mdbExp := 0;
  mdbExpSda := 0;
  for i := 1 to 10 do begin
    ResSDAC := 0;
    ResBDE := 0;
    ResADO := 0;
    ResdbExp := 0;
    ResdbExpSda := 0;

    meResult.Lines.Add('---------------');
  // SDAC
    if cbSDAC.Checked then begin
      ResSDAC := MultiExecutingTest(MSSQL, i*100);
      Chart.Series[0].AddXY(i*100, ResSDAC/1000, '', clTeeColor);
    end;
  // BDE
    if cbBDE.Checked then begin
      ResBDE := MultiExecutingTest(BDEQuery, i*100);
      Chart.Series[1].AddXY(i*100, ResBDE/1000, '', clTeeColor);
    end;
  // ADO
    if cbADO.Checked then begin
      ResADO := MultiExecutingTest(ADOQuery, i*100);
      Chart.Series[2].AddXY(i*100, ResADO/1000, '', clTeeColor);
    end;
  // dbExpress
    if cbdbExpress.Checked then begin
      ResdbExp := MultiExecutingTest(BorlandSQLQuery, i*100);
      Chart.Series[3].AddXY(i*100, ResdbExp/1000, '', clTeeColor);
    end;
  // dbExpSda
    if cbdbExpSda.Checked then begin
      ResdbExpSda := MultiExecutingTest(CrLabSQLQuery, i*100);
      Chart.Series[4].AddXY(i*100, ResdbExpSda/1000, '', clTeeColor);
    end;

    if ResSDAC > 0 then begin
      mBDE := ((i - 1)*mBDE + ResBDE/ResSDAC)/i;
      mADO := ((i - 1)*mADO + ResADO/ResSDAC)/i;
      mdbExp := ((i - 1)*mdbExp + ResdbExp/ResSDAC)/i;
      mdbExpSda := ((i - 1)*mdbExpSda + ResdbExpSda/ResSDAC)/i;
      lbSDAC.Caption := FloatToStrF(1, ffGeneral, 5, 3);
      lbBDE.Caption := FloatToStrF(mBDE, ffGeneral, 5, 3);
      lbADO.Caption := FloatToStrF(mADO, ffGeneral, 5, 3);
      lbdbExpress.Caption := FloatToStrF(mdbExp, ffGeneral, 5, 3);
      lbdbExpSda.Caption := FloatToStrF(mdbExpSda, ffGeneral, 5, 3);
      lbBDE.Update;
      lbADO.Update;
      lbdbExpress.Update;
      lbdbExpSda.Update;
    end;

    Chart.Update;
  end;
  PrintResults;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  btDisconnectClick(nil);
end;

procedure TfmMain.btnInsertPostClick(Sender: TObject);
var
  i: integer;
  ResSDAC, ResBDE, ResADO, ResdbExp, ResdbExpSda: integer;
  mBDE, mADO, mdbExp, mdbExpSda: double;
const
  Step = 1000;
begin
  CheckConnected;

  Chart.Title.Text.Text := 'Insert / Post Test';
  for i := 0 to Chart.SeriesCount - 1 do
    Chart.Series[i].Clear;
  Chart.BottomAxis.Minimum := 0;
  Chart.BottomAxis.Maximum := 11 * Step;

  mBDE := 0;
  mADO := 0;
  mdbExp := 0;
  mdbExpSda := 0;
  for i := 1 to 10 do begin
    ResSDAC := 0;
    ResBDE := 0;
    ResADO := 0;
    ResdbExp := 0;
    ResdbExpSda := 0;

    meResult.Lines.Add('---------------');
  // SDAC
    if cbSDAC.Checked then begin
      ResSDAC := InsertPostTest(MSTable, i*Step);
      Chart.Series[0].AddXY(i*Step, ResSDAC, '', clTeeColor);
    end;
  // BDE
    if cbBDE.Checked then begin
      ResBDE := InsertPostTest(BDETable, i*Step);
      Chart.Series[1].AddXY(i*Step, ResBDE, '', clTeeColor);
    end;
  // ADO
    if cbADO.Checked then begin
      ResADO := InsertPostTest(ADOTable, i*Step);
      Chart.Series[2].AddXY(i*Step, ResADO, '', clTeeColor);
    end;
  // dbExpress
    if cbdbExpress.Checked then begin
      ResdbExp := InsertPostTest(BorlandClientDataSet, i*Step);
      Chart.Series[3].AddXY(i*Step, ResdbExp, '', clTeeColor);
    end;
  // dbExpSda
    if cbdbExpSda.Checked then begin
      ResdbExpSda := InsertPostTest(CrLabClientDataSet, i*Step);
      Chart.Series[4].AddXY(i*Step, ResdbExpSda, '', clTeeColor);
    end;

    if ResSDAC > 0 then begin
      mBDE := ((i - 1)*mBDE + ResBDE/ResSDAC)/i;
      mADO := ((i - 1)*mADO + ResADO/ResSDAC)/i;
      mdbExp := ((i - 1)*mdbExp + ResdbExp/ResSDAC)/i;
      mdbExpSda := ((i - 1)*mdbExpSda + ResdbExpSda/ResSDAC)/i;
      lbSDAC.Caption := FloatToStrF(1, ffGeneral, 5, 3);
      lbBDE.Caption := FloatToStrF(mBDE, ffGeneral, 5, 3);
      lbADO.Caption := FloatToStrF(mADO, ffGeneral, 5, 3);
      lbdbExpress.Caption := FloatToStrF(mdbExp, ffGeneral, 5, 3);
      lbdbExpSda.Caption := FloatToStrF(mdbExpSda, ffGeneral, 5, 3);
      lbBDE.Update;
      lbADO.Update;
      lbdbExpress.Update;
      lbdbExpSda.Update;
    end;

  //  Chart.Update;
  end;
  PrintResults;
end;

procedure TfmMain.cbSetInternalNameClick(Sender: TObject);
var
  AConnected: boolean;
  ALoginPrompt: boolean;
begin
  AConnected := MSConnection.Connected;
  ALoginPrompt := MSConnection.LoginPrompt;
  MSConnection.Connected := false;
  MSConnection.LoginPrompt := false;
  MSConnection.Connected := AConnected;
  MSConnection.LoginPrompt := ALoginPrompt;
end;

procedure TfmMain.cbResultLogClick(Sender: TObject);
begin
  meResult.Visible := cbResultLog.Checked;
  Splitter1.Visible := cbResultLog.Checked;
end;

const
  coFetchAll = TSQLConnectionOption(301); // boolean
  coPermitPrepare       = TSQLConnectionOption(104);
  
procedure TfmMain.CrLabSQLConnectionAfterConnect(Sender: TObject);
begin
  CrLabSQLConnection.SQLConnection.SetOption(coFetchAll, Integer(False));
  CrLabSQLConnection.SQLConnection.SetOption(coPermitPrepare, Integer(True));
end;

procedure TfmMain.cbPermitPrepareClick(Sender: TObject);
begin
  CrLabSQLConnection.Close;
end;


function TfmMain.EditPostTest(Table: TDataSet; Count: integer): integer;
const
  chrs: array [0..1] of char = ('a', 'b');
var
  i:integer;
  ExecTime:integer;
  TableName: string;
begin
  TableName := 'DETAIL';

  if Table is TMSTable then begin
    meResult.Lines.Add('> SDAC');
    TMSTable(Table).TableName := TableName;
    // ~10% performance
    TMSTable(Table).SQLInsert.Text := 'INSERT INTO DETAIL (Code, Master, Field1, Field2) VALUES (:Code, :Master, :Field1, :Field2)';
  end;
  Table.Open;
  if Table.RecordCount = 0 then begin
    MessageDlg('Record count in "DETAIL" table must be more than 0!', mtError, [mbOK], 0);
    Abort;
  end;

  TickInfo.Start;

  for i := 1 to Count do begin
    Table.Edit;
    Table.FieldByName('CODE').Value := i;
    Table.FieldByName('Field1').AsString := '0123456789012345678' + chrs[i mod 2];
    Table.FieldByName('Field2').AsString := '1234567890123456789' + chrs[i mod 2];
    Table.Post;
  end;

  if Table = CrLabClientDataSet then
    CrLabClientDataSet.ApplyUpdates(0);

  ExecTime := TickInfo.GetInterval;
  Table.Close;
  meResult.Lines.Add('Edited ' + IntToStr(Count) + ' records ' + IntervalToStr(ExecTime));

  Result := ExecTime;
end;

procedure TfmMain.btEditPostClick(Sender: TObject);
const
  Step = 100;
var
  i: integer;
  ResSDAC: integer;
begin
  for i := 1 to 10 do begin
    ResSDAC := EditPostTest(MSTable, i*Step);
    Chart.Series[0].AddXY(i*Step, ResSDAC, '', clGreen);
  end;
  PrintResults;
end;

end.
