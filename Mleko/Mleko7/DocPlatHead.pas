unit DocPlatHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKMDIChild, GridsEh, DBGridEh, DB, DBAccess, MSAccess,
  MemDS, ComCtrls, ExtCtrls, ActnList, ToolWin, FR_DSet, FR_DBSet, FR_Class,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, Mask, DBCtrlsEh, DBLookupEh;

type
  TDocPlatHeadForm = class(TCFLMLKMDIChildForm)
    Panel1: TPanel;
    Panel3: TPanel;
    tbCreate: TToolButton;
    tbEdit: TToolButton;
    tdDel: TToolButton;
    tbRefresh: TToolButton;
    tbClose: TToolButton;
    quDocPlatHead: TMSQuery;
    dsDocPlatHead: TMSDataSource;
    DBGridEh1: TDBGridEh;
    quDocPlatHeadPlatNo: TIntegerField;
    quDocPlatHeadDocDate: TDateTimeField;
    quDocPlatHeadEntityType: TStringField;
    quDocPlatHeadDatePlat: TDateTimeField;
    quDocPlatHeadSumma: TFloatField;
    quDocPlatHeadtable_key: TLargeintField;
    quDocPlatHeadUserNo: TSmallintField;
    quDocPlatHeadSotrudNo: TIntegerField;
    quDocPlatHeadPostNo: TSmallintField;
    quDocPlatHeadIsApp: TBooleanField;
    quDocPlatHeadPostName: TStringField;
    quDocPlatHeadSotrudName: TStringField;
    quDocPlatHeadUserName: TStringField;
    quDocPlatHeadNotSignatureOtdel: TStringField;
    PrintDocPlat: TToolButton;
    frReport: TfrReport;
    quDocPlatHeadOtdelNo: TIntegerField;
    quDocPlatHeadOtdelName: TStringField;
    quDocPlatHeadSpravka: TStringField;
    quDocPlatHeadTipPlatName: TStringField;
    Label1: TLabel;
    DBLookupComboboxEhTipPlatFilter: TDBLookupComboboxEh;
    quTipPlatFilrer: TMSQuery;
    dsTipPlatFilrer: TMSDataSource;
    quPostFilter: TMSQuery;
    dsPostFilter: TMSDataSource;
    EdDateBeg: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdDateEnd: TcxDateEdit;
    DBLookupComboboxEhPostFilter: TDBLookupComboboxEh;
    dsVidRashodNoFilter: TMSDataSource;
    quVidRashodNoFilter: TMSQuery;
    quTipPlatFilrerTipPlat: TSmallintField;
    quTipPlatFilrerTipPlatName: TStringField;
    quVidRashodNoFilterVidRashodNo: TIntegerField;
    quVidRashodNoFilterVirDashodName: TStringField;
    quPostFilterPostNo: TSmallintField;
    quPostFilterPostName: TStringField;
    DBLookupComboboxEhVidRashodNoFilter: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    quDocPlatHeadVirDashodName: TStringField;
    ToolButton1: TToolButton;
    frDBDataSet1: TfrDBDataSet;
    quDocPlatHeadEntityTypeName: TStringField;
    quPrintPlat: TMSQuery;
    quPrintPlatDateEntity: TDateTimeField;
    quPrintPlatOtdelName: TStringField;
    quPrintPlatSumma: TFloatField;
    quPrintPlatPostName: TStringField;
    quPrintPlatSotrudName: TStringField;
    quPrintPlatDescription: TStringField;
    procedure tbCloseClick(Sender: TObject);
    procedure tbCreateClick(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure tdDelClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PrintDocPlatClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGridEh1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocPlatHeadForm: TDocPlatHeadForm;         
  VidNaklNo, IdVidDoc: integer;

procedure DocPlatHeadShow(IsApp : boolean);

implementation

uses data, MlekoSelectFIrm, UtilsDataConvert, EditDocPlat, UtilsCommon, main;

{$R *.dfm}

procedure DocPlatHeadShow(IsApp : boolean);
var
  Dlg : TDocPlatHeadForm;
  SqlText: String;
begin
  Screen.Cursor := crHourGlass;
  Dlg := TDocPlatHeadForm.Create(Application);

  VidNaklNo := 7;
  dmDataModule.OpenSQL('select id, VidNaklNo from VidDoc where VidNaklNo = :p1_VidNaklNo',[VidNaklNo]);
  IdVidDoc := dmDataModule.qfo.FieldByName('id').Value;

  if IsApp then Dlg.quDocPlatHead.MacroByName('_where').Value := ' isnull(u.isApp,0) = 1'
           else Dlg.quDocPlatHead.MacroByName('_where').Value := ' isnull(u.isApp,0) = 0';


  Dlg.quTipPlatFilrer.Open;
  Dlg.quPostFilter.Open;
  Dlg.quVidRashodNoFilter.Open;

  Dlg.quDocPlatHead.Open;
  Dlg.quDocPlatHead.First;

  SqlText := ' declare @IdVidDoc int '
            +' set @IdVidDoc = :p1_IdVidDoc '
            +' select * '
            +'  from (select UserNo from ListUserForVidDoc where IdVidDoc = @IdVidDoc '
            +'        union '
            +'        select UserNo from ListUserForConductingDoc where IdVidDoc = @IdVidDoc '
            +'        union '
            +'        select UserNo from ListUserForControlDoc where IdVidDoc = @IdVidDoc) u '
            +'   where u.UserNo = :p2_UserNo ';
  dmDataModule.OpenSQL(SqlText,[IdVidDoc,UserNo]);
  if dmDataModule.QFO.RecordCount = 0 then begin
                                             Dlg.dsDocPlatHead.DataSet.FieldByName('Summa').Visible := false;
                                             Dlg.dsDocPlatHead.DataSet.FieldByName('Spravka').Visible := false;
                                           end;

  Screen.Cursor := crDefault;

  Dlg.ActiveControl := Dlg.DBGridEh1;

  Dlg.Show;
end;

procedure TDocPlatHeadForm.tbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TDocPlatHeadForm.tbCreateClick(Sender: TObject);
var
  PostNo : integer;
  Dlg : TMlekoSelectFIrmDlg;
  IsRun : boolean;
  Id : integer;
begin
  Id := -1;
  Params := TParams.Create;
  try
    UtilsCommon.SetParamValue(Params, 'table_key', -1);
    if TEditDocPlatDlg.Add_Dlg(Params) then
    begin
      quDocPlatHead.Close;
      quDocPlatHead.Open;
    end;
  finally
    Params.Free;
  end;

end;

procedure TDocPlatHeadForm.tbRefreshClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := quDocPlatHead.FieldByName('PlatNo').AsInteger;
  quDocPlatHead.Close;
  quDocPlatHead.ParamByName('TipPlat').Value := DBLookupComboboxEhTipPlatFilter.KeyValue;

  if EdDateBeg.Text = '' then quDocPlatHead.ParamByName('DateBeg').Clear else quDocPlatHead.ParamByName('DateBeg').Value := EdDateBeg.Date;
  if EdDateEnd.Text = '' then quDocPlatHead.ParamByName('DateEnd').Clear else quDocPlatHead.ParamByName('DateEnd').Value := EdDateEnd.Date;

  quDocPlatHead.ParamByName('PostNo').Value := DBLookupComboboxEhPostFilter.KeyValue;
  quDocPlatHead.ParamByName('VidRashodNo').Value := DBLookupComboboxEhVidRashodNoFilter.KeyValue;
  quDocPlatHead.Open;
  quDocPlatHead.Locate('PlatNo', Id, []);
end;

procedure TDocPlatHeadForm.tbEditClick(Sender: TObject);
var
  ln_id : int64;
  SqlText: string;
begin
  ln_id := quDocPlatHead.FieldByName('table_key').Value;

  if (quDocPlatHead.fieldByName('EntityType').AsString = 'PLATP') or (quDocPlatHead.fieldByName('EntityType').AsString = 'PLATR') then
  begin
    Params := TParams.Create;
    try
      SqlText := ' declare @IdVidDoc int '
                +' set @IdVidDoc = :p1_IdVidDoc '
                +' select * '
                +'  from (select UserNo from ListUserForVidDoc where IdVidDoc = @IdVidDoc '
                +'        union '
                +'        select UserNo from ListUserForConductingDoc where IdVidDoc = @IdVidDoc '
                +'        union '
                +'        select UserNo from ListUserForControlDoc where IdVidDoc = @IdVidDoc) u '
                +'   where u.UserNo = :p2_UserNo ';
      dmDataModule.OpenSQL(SqlText,[IdVidDoc,UserNo]);

      if dmDataModule.QFO.RecordCount = 0 then if UserNo <> quDocPlatHeadUserNo.Value then raise Exception.Create('Вы не имеете права редакторовать документ платежа!');

      UtilsDataConvert.DataSetToParams(quDocPlatHead, Params);
      if TEditDocPlatDlg.Upd_Dlg(Params) then tbRefreshClick(Sender);
    finally
      Params.Free;
    end;
  end;
end;

procedure TDocPlatHeadForm.DBGridEh1DblClick(Sender: TObject);
begin
  tbEdit.Click;
end;

procedure TDocPlatHeadForm.tdDelClick(Sender: TObject);
begin

  inherited;
  if quDocPlatHeadIsApp.AsBoolean then ShowMessage ('Удаление проведенного документа не возможно')
                                  else if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then dmDataModule.ExecSQL('exec spDelDocPlat :p1_PlatNo, :p2_EntityType',[quDocPlatHeadPlatNo.AsInteger,quDocPlatHeadEntityType.Value]);
  tbRefresh.Click;

end;

procedure TDocPlatHeadForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  SqlText: String;
begin

end;

procedure TDocPlatHeadForm.PrintDocPlatClick(Sender: TObject);
var
  SecretKeyPressed: Boolean;
  i: integer;
  Pkey: string;
begin
  inherited;

  if (DBGridEh1.SelectedRows.Count > 0) then begin
                                               for i := 0 to DBGridEh1.SelectedRows.Count - 1 do begin
                                                                                                   DBGridEh1.DataSource.DataSet.GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[i]));
                                                                                                   Pkey := Pkey + quDocPlatHeadtable_key.AsString + ', ';
                                                                                                 end;
                                               delete (Pkey,Length(Pkey)-1,Length(Pkey));

                                               SecretKeyPressed:= Ctrl_Is_Down() and Shift_Is_Down();

                                               quPrintPlat.Close;
                                               quPrintPlat.MacroByName('_where').Value := 'table_key in ('+ Pkey +')';
                                               quPrintPlat.Open;

                                               frReport.LoadFromFile('DocPlat.frf');
                                               if SecretKeyPressed then frReport.DesignReport else frReport.ShowReport;
                                             end
                                        else begin
                                               SecretKeyPressed:= Ctrl_Is_Down() and Shift_Is_Down();

                                               quPrintPlat.Close;
                                               quPrintPlat.MacroByName('_where').Value := 'table_key in ('+ quDocPlatHeadtable_key.AsString +')';
                                               quPrintPlat.Open;

                                               frReport.LoadFromFile('DocPlat.frf');
                                               if SecretKeyPressed then frReport.DesignReport else frReport.ShowReport;
                                             end;

end;

procedure TDocPlatHeadForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  SqlText: String;
begin

end;

procedure TDocPlatHeadForm.ToolButton1Click(Sender: TObject);
var
  SqlText : String;
begin
  inherited;

  SqlText := ' declare @IdVidDoc int '
            +' set @IdVidDoc = :p1_IdVidDoc '
            +' select * '
            +'  from (select UserNo from ListUserForVidDoc where IdVidDoc = @IdVidDoc '
            +'        union '
            +'        select UserNo from ListUserForConductingDoc where IdVidDoc = @IdVidDoc '
            +'        union '
            +'        select UserNo from ListUserForControlDoc where IdVidDoc = @IdVidDoc) u '
            +'   where u.UserNo = :p2_UserNo ';
  dmDataModule.OpenSQL(SqlText,[IdVidDoc,UserNo]);

  if dmDataModule.QFO.RecordCount = 0 then if UserNo <> quDocPlatHeadUserNo.Value then raise Exception.Create('Вы не имеете права копировать документ платежа!');


  if Application.MessageBox('Вы уверены?','Внимание! Копировать документ!',MB_YESNO)=IDYES then
   begin
     dmDataModule.ExecSQL('exec sp_CopyDocPlat :p1_pkey, :p2_DateEntity',[quDocPlatHeadtable_key.AsString,GlobalDateNakl-2]);
     ShowMessage('Документ № '+ IntToStr(quDocPlatHeadPlatNo.Value)+ ' скопирован.');
   end;
end;

procedure TDocPlatHeadForm.DBGridEh1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
  var
    SqlText: String;
    is_signature, is_control: boolean;
begin
  SqlText := 'select  OtdelNo '
            +'      , sum(is_signature) '
            +' from (select OtdelNo '
            +'            , Case when l.id is null then cast(0 as int) '
            +'                                     else cast(1 as int) end as is_signature '
            +'        from ListUserForVidDoc u left join '
            +'             l_doc_signature l on l.UserNo = u.UserNo and l.IdVidDoc = u.IdVidDoc and l.DocId = :p1_DocId '
            +'         where u.IdVidDoc = :p2_IdVidDoc '
            +'           and Active = 1) g '
            +'group by OtdelNo '
            +'having sum(is_signature) = 0 ';

  dmDataModule.OpenSQL(SqlText,[quDocPlatHeadPlatNo.Value, IdVidDoc]);

  if dmDataModule.QFO.RecordCount = 0 then is_signature := true else is_signature := false;

  SqlText := 'select  u.UserNo '
            +'      , Case when l.id is null then cast(0 as int) '
            +'                          else cast(1 as int) end as is_control '
            +' from ListUserForControlDoc u left join '
            +'      l_doc_control l on l.UserNo = u.UserNo and l.IdVidDoc = u.IdVidDoc and l.DocId = :p1_DocId '
            +'  where u.IdVidDoc = :p2_IdVidDoc '
            +'    and Active = 1 '
            +'    and Case when l.id is null then cast(0 as int) '
            +'                               else cast(1 as int) end <> 0 ';

    dmDataModule.OpenSQL(SqlText,[quDocPlatHeadPlatNo.Value, IdVidDoc]);

    if dmDataModule.QFO.RecordCount = 0 then is_control := false else is_control := true;

    if is_signature then DBGridEh1.Canvas.Brush.Color := clLime else if is_control then DBGridEh1.Canvas.Brush.Color := clYellow;


  DBGridEh1.DefaultDrawDataCell(Rect,Field,State);  //DBGridEhOrders.DefaultDrawDataCell(Rect,Field,State);
end;

end.
