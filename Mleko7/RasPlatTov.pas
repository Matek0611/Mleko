unit RasPlatTov;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, MlekoForm, DBCtrls, DB, Mask, ExtCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, DBAccess, MsAccess, MemDS, ActnList;

type
  TfmEditPlatR = class(TMlekoForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label4: TLabel;
    EditDate: TDBEdit;
    Label5: TLabel;
    EditSumma: TDBEdit;
    Label6: TLabel;
    EditSpravka: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quDolg: TMSQuery;
    RxDBGrid1: TRxDBGrid;
    dsDolg: TDataSource;
    tePost: TDBEdit;
    lcNameBuh: TDBLookupComboBox;
    edNom: TDBEdit;
    quDolgNaklNo: TIntegerField;
    quDolgNom: TIntegerField;
    quDolgDateNakl: TDateTimeField;
    quDolgSumma: TFloatField;
    quDolgSummaDolg: TFloatField;
    Label3: TLabel;
    quPlatToNakl: TMSQuery;
    quPlatR: TMSQuery;
    dsPlatR: TDataSource;
    quTipNakl: TMSQuery;
    quTipNaklTipNo: TSmallintField;
    quTipNaklTipName: TStringField;
    quWork: TMSQuery;
    spModify_Plat_Nakl_link: TMSStoredProc;
    QuBuh: TMSQuery;
    DSBuh: TDataSource;
    procedure bbOkClick(Sender: TObject);
    procedure quPlatRNewRecord(DataSet: TDataSet);
    procedure EditDateExit(Sender: TObject);
    procedure quDolgBeforeOpen(DataSet: TDataSet);
    procedure quPlatRAfterPost(DataSet: TDataSet);
    procedure quPlatRAfterUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
    procedure quPlatRBeforeUpdateExecute(Sender: TCustomMSDataSet;
      StatementTypes: TStatementTypes; Params: TMSParams);
  private
    { private declarations }
    SummaDolg: double;
    PKeyPlat: Int64;    
  public
    { public declarations }
  end;

var
  fmEditPlatR: TfmEditPlatR;
procedure RashodManyTov(Buh: boolean);
implementation

uses data, EditKred;

{$R *.DFM}

procedure RashodManyTov(Buh: boolean);
var
  PostNo: integer;
begin
  PostNo := EditKreditors(Buh);
  if PostNo = 0 then exit;

  fmEditPlatR := TfmEditPlatR.Create(Application);
  try
    with fmEditPlatR do
    begin
      quBuh.Close;
      quBuh.Open;
      quDolg.ParamByName('PostNo').AsInteger := PostNo;
      if Buh then
      begin
        quDolg.ParamByName('BuhB').AsInteger := 2;
        quDolg.ParamByName('BuhE').AsInteger := 3;
      end
      else
      begin
        quDolg.ParamByName('BuhB').AsInteger := 1;
        quDolg.ParamByName('BuhE').AsInteger := 1;
      end;
      quDolg.Open;
      fmEditPlatR.SummaDolg := 0;
      while not (quDolg.EOF) do
      begin
        fmEditPlatR.SummaDolg := fmEditPlatR.SummaDolg + fmEditPlatR.quDolgSummaDolg.AsFloat;
        quDolg.Next;
      end;
      quPlatR.Open;
      quPlatR.Insert;
      quPlatR.FieldByName('PostNo').AsInteger := PostNo;
      dmDataModule.quPost.Close;      
      dmDataModule.quPost.ParamByName('PostNo').AsInteger := PostNo;
      dmDataModule.quPost.Open;
      if Buh then quPlatR.FieldByName('Buh').AsInteger := 2; //по умолчанию 1
      fmEditPlatR.Caption := 'Сумма долга ' + format('%2f', [fmEditPlatR.SummaDolg]);
    end;
    fmEditPlatR.ShowModal;
  finally
    fmEditPlatR.quDolg.Close;
    fmEditPlatR.quPlatR.Close;
    fmEditPlatR.quTipNakl.Close;
    fmEditPlatR.Free;
  end;
end;

procedure TfmEditPlatR.bbOkClick(Sender: TObject);
var
  Summa: double;
begin
  if (fmEditPlatR.SummaDolg - quPlatR.FieldByName('Summa').AsFloat) < -0.01 then
  begin
    ShowMessage('Сумма долга меньше');
    fmEditPlatR.ActiveControl := fmEditPlatR.EditSumma;
    exit;
  end;
  if quPlatR.FieldByName('Summa').AsFloat > 0 then
  begin
    quPlatR.Post;
    Summa := quPlatR.FieldByName('Summa').AsFloat;
    quDolg.First;
    while (not quDolg.EOF) and (Summa > 0) do
    begin
      if Summa <= quDolgSummaDolg.AsFloat then
      begin
        quPlatToNakl.ParamByName('PlatNo').AsInteger := quPlatR.FieldByName('PlatNo').AsInteger;
        quPlatToNakl.ParamByName('NaklNo').AsInteger := quDolgNaklNo.AsInteger;
        quPlatToNakl.ParamByName('Summa').AsFloat := Summa;
        Summa := 0;
      end
      else
      begin
        quPlatToNakl.ParamByName('PlatNo').AsInteger := quPlatR.FieldByName('PlatNo').AsInteger;
        quPlatToNakl.ParamByName('NaklNo').AsInteger := quDolgNaklNo.AsInteger;
        quPlatToNakl.ParamByName('Summa').AsFloat := quDolgSummaDolg.AsFloat;
        Summa := Summa - quDolgSummaDolg.AsFloat;
      end;
      spModify_Plat_Nakl_link.Close;
      //      spModify_Plat_Nakl_link.Prepare;
      spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value := -1;
      spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value := quDolgNaklNo.AsInteger;
      spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value := quPlatR.FieldByName('PlatNo').AsInteger;
      spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value := 'NAKLP';
      spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value := 'PLATR';
      spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value := quPlatToNakl.ParamByName('Summa').AsFloat;
      spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value := data.UserNo;
      spModify_Plat_Nakl_link.ExecProc;

      quPlatToNakl.Execute;
      quDolg.Next;
    end;
  end;
  fmEditPlatR.Close;
  fmEditPlatR.ModalResult := mrOk;
end;

procedure TfmEditPlatR.quPlatRNewRecord(DataSet: TDataSet);
begin
  quPlatR.FieldByName('DatePlat').AsDateTime := Date();
  quPlatR.FieldByName('Summa').AsFloat := 0;
  quPlatR.FieldByName('Buh').AsInteger := 1;
  quPlatR.FieldByName('UserNo').AsInteger := data.UserNo;
  quPlatR.FieldByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;  
end;

procedure TfmEditPlatR.EditDateExit(Sender: TObject);
begin
  dmDataModule.quSetup.Close;
  dmDataModule.quSetup.Open;
  if StrToDate(EditDate.Text) < dmDataModule.quSetupDateBlock.AsDateTime then
  begin
    MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
    ActiveControl := EditDate;
  end;
  dmDataModule.quSetup.Close;
end;

procedure TfmEditPlatR.quDolgBeforeOpen(DataSet: TDataSet);
begin
  quDolg.ParamByName('OurFirmNo').AsInteger := dmDataModule.FirmNo;
end;

procedure TfmEditPlatR.quPlatRAfterPost(DataSet: TDataSet);
begin
  TMSQuery(DataSet).Close;
  TMSQuery(DataSet).ParamByName('pPkey').Value:=PKeyPlat;
  TMSQuery(DataSet).Open;
end;

procedure TfmEditPlatR.quPlatRAfterUpdateExecute(Sender: TCustomMSDataSet;
  StatementTypes: TStatementTypes; Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    PKeyPlat := Params.ParamByName('Pkey').Value;
  end;
end;

procedure TfmEditPlatR.quPlatRBeforeUpdateExecute(Sender: TCustomMSDataSet;
  StatementTypes: TStatementTypes; Params: TMSParams);
begin
  inherited;
  if stInsert in StatementTypes then
  begin
    Params.ParamByName('Pkey').ParamType := ptOutput;
  end;
end;

end.

