unit EditDocPlat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropCustomDialog, DBAccess, MsAccess, DB, ActnList, ComCtrls, StdCtrls,
  citCtrls, citmask, citDBComboEdit, PropFilerEh,
  MemDS, ToolWin, DBCtrls, Math, GridsEh, DBGridEh, ExtCtrls, Buttons;

type
  TEditDocPlatDlg = class(TCFLMLKPropCustomDialogDlg)
    p_Nom: TcitDBComboEdit;
    p_PostNo: TcitDBComboEdit;
    p_DatePlat: TcitDBComboEdit;
    p_Summa: TcitDBComboEdit;
    p_Buh: TcitDBComboEdit;
    p_Spravka: TcitDBComboEdit;
    quBuh: TMSQuery;
    quBuhbuh: TSmallintField;
    quBuhBuh_type_name: TStringField;
    quPlatType: TMSQuery;
    quPlatTypeID: TSmallintField;
    quPlatTypeName: TStringField;
    quBankInvoice: TMSQuery;
    quBankInvoiceid: TAutoIncField;
    quBankInvoiceinvoice_num: TFloatField;
    quBankInvoiceBank_Name: TStringField;
    quBankInvoiceDescription: TStringField;
    qu_otdelNo: TMSQuery;
    qu_otdelNoOtdelNo: TSmallintField;
    qu_otdelNoOtdelName: TStringField;
    qu_econom: TMSQuery;
    qu_economid: TIntegerField;
    qu_economname: TStringField;
    quOurFirm: TMSQuery;
    quOurFirmname: TStringField;
    quOurFirmPostNo: TSmallintField;
    p_Entity_Type: TcitDBComboEdit;
    Seq_DocPlatR_Nom: TMSStoredProc;
    Seq_DocPlatP_Nom: TMSStoredProc;
    quEntityType: TMSQuery;
    quEntityTypecode: TStringField;
    quEntityTypeName: TStringField;
    p_response_dept_id: TcitDBComboEdit;
    p_activity_type_id: TcitDBComboEdit;
    p_VidrashodNo: TcitDBComboEdit;
    p_Rate: TcitDBComboEdit;
    p_l_code: TcitDBComboEdit;
    qu_D_Currency: TMSQuery;
    qu_D_CurrencyName: TStringField;
    qu_D_CurrencyL_Code: TStringField;
    p_CurrencyAccounting: TcitDBComboEdit;
    p_RateCurrencyAccounting: TcitDBComboEdit;
    p_SummaCurrencyAccounting: TcitDBComboEdit;
    p_SotrudNo: TcitDBComboEdit;
    p_TipPlat: TcitDBComboEdit;
    p_bank_invoice_id: TcitDBComboEdit;
    p_is_econom: TcitDBComboEdit;
    p_our_firmNo: TcitDBComboEdit;
    GroupBox4: TGroupBox;
    DBGridEhSignature: TDBGridEh;
    cbIsDocSignature: TCheckBox;
    quListUserForVidDoc: TMSQuery;
    quListUserForVidDocId: TIntegerField;
    quListUserForVidDocIdVidDoc: TIntegerField;
    quListUserForVidDocOtdelNo: TIntegerField;
    quListUserForVidDocUserNo: TIntegerField;
    quListUserForVidDocActive: TBooleanField;
    quListUserForVidDocOtdel: TStringField;
    quListUserForVidDocUser: TStringField;
    quListUserForVidDocis_signature: TBooleanField;
    dsListUserForVidDoc: TMSDataSource;
    Panel2: TPanel;
    bbConductingDoc: TBitBtn;
    dsV_DocPlatHead: TMSDataSource;
    quV_DocPlatHead: TMSQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    quV_DocPlatHeadPlatNo: TIntegerField;
    quV_DocPlatHeadDocDate: TDateTimeField;
    quV_DocPlatHeadEntityType: TStringField;
    quV_DocPlatHeadDatePlat: TDateTimeField;
    quV_DocPlatHeadSumma: TFloatField;
    quV_DocPlatHeadtable_key: TLargeintField;
    quV_DocPlatHeadUserNo: TSmallintField;
    quV_DocPlatHeadSotrudNo: TIntegerField;
    quV_DocPlatHeadPostNo: TSmallintField;
    quV_DocPlatHeadIsApp: TBooleanField;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    quV_DocPlatHeadPostName: TStringField;
    quV_DocPlatHeadUserName: TStringField;
    quV_DocPlatHeadEntityName: TStringField;
    DBText4: TDBText;
    quV_DocPlatHeadNotSignatureOtdel: TStringField;
    p_OtdelNo: TcitDBComboEdit;
    GroupBox1: TGroupBox;
    DBGridEhDocControl: TDBGridEh;
    quListUserForControlDoc: TMSQuery;
    dsListUserForControlDoc: TMSDataSource;
    quListUserForControlDocId: TIntegerField;
    quListUserForControlDocIdVidDoc: TIntegerField;
    quListUserForControlDocUserNo: TIntegerField;
    quListUserForControlDocActive: TBooleanField;
    quListUserForControlDocid_1: TIntegerField;
    quListUserForControlDocUserNo_1: TIntegerField;
    quListUserForControlDocDocId: TIntegerField;
    quListUserForControlDocIdVidDoc_1: TIntegerField;
    quListUserForControlDocis_control: TBooleanField;
    quListUserForControlDocUser: TStringField;
    cbIsDocControl: TCheckBox;
    procedure quUpdBegParamBeforeOpen(DataSet: TDataSet);
    procedure ActionOKExecute(Sender: TObject);
    procedure quAddBegParamBeforeOpen(DataSet: TDataSet);
    procedure p_BuhSelectOk(Sender: TObject);
    procedure p_Entity_TypeSelectOk(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure p_OtdelNoSelectOk(Sender: TObject);
    procedure p_l_codeExit(Sender: TObject);
    procedure p_l_codeChange(Sender: TObject);
    procedure p_RateCurrencyAccountingChange(Sender: TObject);
    procedure p_SummaChange(Sender: TObject);
    procedure p_RateChange(Sender: TObject);
    procedure DBGridEhSignatureDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure DBGridEhSignatureGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure cbIsDocSignatureClick(Sender: TObject);
    procedure quListUserForVidDocBeforeOpen(DataSet: TDataSet);
    procedure bbConductingDocClick(Sender: TObject);
    procedure spAddAfterPost(DataSet: TDataSet);
    procedure quListUserForControlDocBeforeOpen(DataSet: TDataSet);
    procedure cbIsDocControlClick(Sender: TObject);
    procedure DBGridEhDocControlDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure DBGridEhDocControlGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    procedure set_Execute_param(DataSet: TDataSet); override;
    function EnabledEntitySelected: Boolean;
  public
    class function Add_Dlg(var params: TParams): boolean;
    class function Upd_Dlg(var params: TParams): boolean;
  end;

var
  ln_id: Int64;
  EditDocPlatDlg: TEditDocPlatDlg;
  VidNaklNo, IdVidDoc: integer;

implementation

uses data, main,UtilsCommon;

{$R *.dfm}

procedure TEditDocPlatDlg.set_Execute_param(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSStoredProc).Params.ParamByName('p_Pkey').Value := ln_id;
  if p_Entity_Type.KeyFieldValue = 'PLATR' then begin
                                                  dmDataModule.OpenSQL('select UserNo from DocPlatR where pkey = :p1_pkey',[ln_id]);
                                                end;
  if p_Entity_Type.KeyFieldValue = 'PLATP' then begin
                                                  dmDataModule.OpenSQL('select UserNo from DocPlatP where pkey = :p1_pkey',[ln_id]);
                                                end;
  if dmDataModule.qfo.FieldByName('UserNo').IsNull then (DataSet as TMSStoredProc).Params.ParamByName('p_UserNo').Value := data.UserNo
                                                   else (DataSet as TMSStoredProc).Params.ParamByName('p_UserNo').Value := dmDataModule.qfo.FieldByName('UserNo').Value;
  (DataSet as TMSStoredProc).Params.ParamByName('p_PostNoFirst').Value := p_PostNo.KeyFieldValue;
  (DataSet as TMSStoredProc).Params.ParamByName('p_Entity_Type').Value := p_Entity_Type.KeyFieldValue;
end;

procedure TEditDocPlatDlg.quUpdBegParamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).Params.ParamByName('table_key').Value := ln_id;
end;

class function TEditDocPlatDlg.Add_Dlg(var params: TParams): boolean;
var
  SqlText, NoSignatureOtdel, EntityType: String;
  quNoSignatureOtdel: TMSQuery;
  Id: integer;
begin
  inherited;
  VidNaklNo := 7;
  dmDataModule.OpenSQL('select id, VidNaklNo from VidDoc where VidNaklNo = :p1_VidNaklNo',[VidNaklNo]);
  IdVidDoc := dmDataModule.qfo.FieldByName('id').Value;


  ln_id:=UtilsCommon.GetParamValue(params,'table_key',varInt64,-1);
  result := ShowDlg('ADD', params);
  if Result then begin
                   UtilsCommon.SetParamValue(params,'table_key',ln_id);

                   dmDataModule.OpenSQL('select * from V_List_entity_Doc where table_key = :p1_table_key',[ln_id]);
                   Id := dmDataModule.qfo.FieldByName('id').Value;
                   EntityType := dmDataModule.qfo.FieldByName('Entity_Type').Value;

                   SqlText := 'select  OtdelNo '
                             +'      , sum(is_signature) '
                             +'      , (select OtdelName from VidOtdel where OtdelNo = g.OtdelNo) as OtdelName '
                             +' from (select OtdelNo '
                             +'            , Case when l.id is null then cast(0 as int) '
                             +'                                     else cast(1 as int) end as is_signature '
                             +'        from ListUserForVidDoc u left join '
                             +'             l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id and l.IdVidDoc = u.IdVidDoc'
                             +'         where u.IdVidDoc = :IdVidDoc '
                             +'           and Active = 1) g '
                             +'group by OtdelNo '
                             +'having sum(is_signature) = 0 ';

                   quNoSignatureOtdel:=TMSQuery.Create(nil);
                   quNoSignatureOtdel.Connection:=dmDataModule.DB;
                   quNoSignatureOtdel.SQL.Clear;
                   quNoSignatureOtdel.SQL.Text:= SqlText;
                   quNoSignatureOtdel.ParamByName('Id').Value := Id;
                   quNoSignatureOtdel.ParamByName('IdVidDoc').Value := IdVidDoc;
                   quNoSignatureOtdel.Open;

                   quNoSignatureOtdel.First;

                   while not quNoSignatureOtdel.Eof do begin
                                                         NoSignatureOtdel := NoSignatureOtdel + quNoSignatureOtdel.FieldByName('OtdelName').AsString + ', ';
                                                         quNoSignatureOtdel.Next;
                                                       end;
                   delete (NoSignatureOtdel,Length(NoSignatureOtdel)-1,Length(NoSignatureOtdel));

                   if EntityType = 'PLATR' then dmDataModule.ExecSQL('Update DocPlatR set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,Id]);
                   if EntityType = 'PLATP' then dmDataModule.ExecSQL('Update DocPlatP set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,Id]);
                 end;
end;


class function TEditDocPlatDlg.Upd_Dlg(var params: TParams): boolean;
begin
  inherited;
  ln_id:=UtilsCommon.GetParamValue(params,'table_key',varInt64,-1);

  VidNaklNo := 7;
  dmDataModule.OpenSQL('select id, VidNaklNo from VidDoc where VidNaklNo = :p1_VidNaklNo',[VidNaklNo]);
  IdVidDoc := dmDataModule.qfo.FieldByName('id').Value;

  result := ShowDlg('EDIT', params);
end;

procedure TEditDocPlatDlg.ActionOKExecute(Sender: TObject);
var
  SqlText, NoSignatureOtdel: String;
  quNoSignatureOtdel: TMSQuery;
begin
  inherited;
  if EditType = 'ADD' then ln_id := spAdd.Params.ParamByName('p_Pkey').Value;


    SqlText := 'select  OtdelNo '
            +'      , sum(is_signature) '
            +'      , (select OtdelName from VidOtdel where OtdelNo = g.OtdelNo) as OtdelName '
            +' from (select OtdelNo '
            +'            , Case when l.id is null then cast(0 as int) '
            +'                                     else cast(1 as int) end as is_signature '
            +'        from ListUserForVidDoc u left join '
            +'             l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id and l.IdVidDoc = u.IdVidDoc'
            +'         where u.IdVidDoc = :IdVidDoc '
            +'           and Active = 1) g '
            +'group by OtdelNo '
            +'having sum(is_signature) = 0 ';

  quNoSignatureOtdel:=TMSQuery.Create(nil);
  quNoSignatureOtdel.Connection:=dmDataModule.DB;
  quNoSignatureOtdel.SQL.Clear;
  quNoSignatureOtdel.SQL.Text:= SqlText;
  quNoSignatureOtdel.ParamByName('Id').Value := quV_DocPlatHeadPlatNo.Value;
  quNoSignatureOtdel.ParamByName('IdVidDoc').Value := IdVidDoc;
  quNoSignatureOtdel.Open;

  quNoSignatureOtdel.First;

  while not quNoSignatureOtdel.Eof do begin
                                        NoSignatureOtdel := NoSignatureOtdel + quNoSignatureOtdel.FieldByName('OtdelName').AsString + ', ';
                                        quNoSignatureOtdel.Next;
                                      end;
  delete (NoSignatureOtdel,Length(NoSignatureOtdel)-1,Length(NoSignatureOtdel));

  if quV_DocPlatHeadEntityType.Value = 'PLATR' then dmDataModule.ExecSQL('Update DocPlatR set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,quV_DocPlatHeadPlatNo.Value]);
  if quV_DocPlatHeadEntityType.Value = 'PLATP' then dmDataModule.ExecSQL('Update DocPlatP set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,quV_DocPlatHeadPlatNo.Value]);

  quV_DocPlatHead.Close;
  quListUserForVidDoc.Close;
  quListUserForControlDoc.Close;

end;

procedure TEditDocPlatDlg.quAddBegParamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).Params.ParamByName('p_date_plat').AsDateTime := Main.GlobalDateNakl;
  (DataSet as TMSQuery).Params.ParamByName('p_Entity_type').AsString := UtilsCommon.GetParamValue(Params,'Entity_type',varString,'');
  (DataSet as TMSQuery).Params.ParamByName('Summa').AsFloat := UtilsCommon.GetParamValue(Params,'MARKEDFREESUMMA',varSingle,0);
  (DataSet as TMSQuery).Params.ParamByName('table_key').Value := ln_id;
  (DataSet as TMSQuery).Params.ParamByName('Rate').AsFloat := 0;
end;

procedure TEditDocPlatDlg.p_BuhSelectOk(Sender: TObject);
begin
  inherited;
  p_bank_invoice_id.Enabled := (quBuh.FieldByName('buh').AsInteger = 2);
end;

function TEditDocPlatDlg.EnabledEntitySelected: boolean;
var
  is_type_selected: Boolean;

begin
  inherited;
  is_type_selected := p_Entity_Type.KeyFieldValue <> '';
  p_Nom.Enabled := is_type_selected;
  p_PostNo.Enabled := is_type_selected;
  p_DatePlat.Enabled := is_type_selected;
  p_Summa.Enabled := is_type_selected;
  p_Buh.Enabled := is_type_selected;
  p_Spravka.Enabled := is_type_selected;
  p_SotrudNo.Enabled := is_type_selected;
  p_TipPlat.Enabled := is_type_selected;
  p_bank_invoice_id.Enabled := is_type_selected;
  p_OtdelNo.Enabled := is_type_selected;
  p_activity_type_id.Enabled := is_type_selected;
  p_is_econom.Enabled := is_type_selected;
  p_VidrashodNo.Enabled := is_type_selected;
  p_our_firmNo.Enabled := is_type_selected;
  p_response_dept_id.Enabled := is_type_selected;
  p_l_code.Enabled := is_type_selected;
  p_Rate.Enabled := is_type_selected;


end;

procedure TEditDocPlatDlg.p_Entity_TypeSelectOk(Sender: TObject);
var
  Nom: string;
  c: Integer;
begin
  if EnabledEntitySelected then
  begin
    if (p_Nom.Text = '') or (p_Nom.Text='0') then
    begin
      if p_Entity_Type.KeyFieldValue = 'PLATP' then
      begin
        Seq_DocPlatP_Nom.ExecProc;
        Nom := Seq_DocPlatP_Nom.ParamByName('id').AsString;
      end;
      if p_Entity_Type.KeyFieldValue = 'PLATR' then
      begin
        Seq_DocPlatR_Nom.ExecProc;
        Nom := Seq_DocPlatR_Nom.ParamByName('id').AsString;
      end;
      p_Nom.KeyFieldValue := Nom;
      p_Nom.Text := Nom;
      p_Buh.KeyFieldValue := '1';
      p_Buh.Text := 'Касса';
      p_TipPlat.KeyFieldValue := '1';
      p_TipPlat.Text := 'Платеж';
      p_bank_invoice_id.Enabled := (quBuh.FieldByName('buh').AsInteger = 2);
    end;
  end;
end;

procedure TEditDocPlatDlg.FormShow(Sender: TObject);
var   Nom, SqlText: string;
 CheckbbConductingDoc : TMSQuery;
 IsCanEdit : Boolean;
begin
  inherited;
  EnabledEntitySelected;
  quV_DocPlatHead.ParamByName('pkey').Value := ln_id;
  quV_DocPlatHead.Open;

  quListUserForVidDoc.Open;
  quListUserForControlDoc.Open;

  if (EditType='EDIT') then begin
                              dmDataModule.OpenSQL('select * from ListUserForVidDoc where Active = 1 and IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc, UserNo]);

                              if dmDataModule.QFO.RecordCount = 0 then begin
                                                                         cbIsDocSignature.Visible := False;
                                                                         p_response_dept_id.Enabled := False;
                                                                         p_activity_type_id.Enabled := False;
                                                                       end
                                                                  else begin
                                                                         cbIsDocSignature.Visible := True;
                                                                         p_response_dept_id.Enabled := True;
                                                                         p_activity_type_id.Enabled := True;
                                                                         dmDataModule.OpenSQL('select * from l_doc_signature where DocId = :p1_DocId and UserNo = :p2_UserNo and IdVidDoc = :p3_IdVidDoc',[quV_DocPlatHeadPlatNo.Value, UserNo, IdVidDoc]);
                                                                         if dmDataModule.QFO.RecordCount = 1 then cbIsDocSignature.Checked := True;
                                                                       end;

                              dmDataModule.OpenSQL('select * from ListUserForControlDoc where Active = 1 and IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc, UserNo]);

                              if dmDataModule.QFO.RecordCount = 0 then begin
                                                                         cbIsDocControl.Visible := False;
                                                                         p_response_dept_id.Enabled := False;
                                                                         p_activity_type_id.Enabled := False;
                                                                       end
                                                                  else begin
                                                                         cbIsDocControl.Visible := True;
                                                                         p_response_dept_id.Enabled := True;
                                                                         p_activity_type_id.Enabled := True;
                                                                         dmDataModule.OpenSQL('select * from l_doc_control where DocId = :p1_DocId and UserNo = :p2_UserNo and IdVidDoc = :p3_IdVidDoc',[quV_DocPlatHeadPlatNo.Value, UserNo, IdVidDoc]);
                                                                         if dmDataModule.QFO.RecordCount = 1 then cbIsDocControl.Checked := True;
                                                                       end;

                              dmDataModule.OpenSQL('select * from ListUserForConductingDoc where Active = 1 and IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc, UserNo]);

                              if dmDataModule.QFO.RecordCount = 0 then bbConductingDoc.Visible := False
                                                                  else bbConductingDoc.Visible := True;

                              SqlText := 'select  OtdelNo '
                                        +'      , sum(is_signature) '
                                        +' from (select OtdelNo '
                                        +'            , Case when l.id is null then cast(0 as int) '
                                        +'                                     else cast(1 as int) end as is_signature '
                                        +'        from ListUserForVidDoc u left join '
                                        +'             l_doc_signature l on l.UserNo = u.UserNo and l.IdVidDoc = u.IdVidDoc and l.DocId = :Id '
                                        +'         where u.IdVidDoc = :IdVidDoc '
                                        +'           and Active = 1) g '
                                        +'group by OtdelNo '
                                        +'having sum(is_signature) = 0 ';

                              CheckbbConductingDoc:=TMSQuery.Create(nil);
                              CheckbbConductingDoc.Connection:=dmDataModule.DB;
                              CheckbbConductingDoc.SQL.Clear;
                              CheckbbConductingDoc.SQL.Text:= SqlText;
                              CheckbbConductingDoc.ParamByName('Id').Value := quV_DocPlatHeadPlatNo.Value;
                              CheckbbConductingDoc.ParamByName('IdVidDoc').Value := IdVidDoc;
                              CheckbbConductingDoc.Open;

                              if CheckbbConductingDoc.RecordCount = 0 then begin
                                                                             bbConductingDoc.Enabled := True;

                                                                           end
                                                                      else begin
                                                                             bbConductingDoc.Enabled := False;

                                                                           end;


                              if quV_DocPlatHeadEntityType.Value = 'PLATR' then dmDataModule.OpenSQL('select isnull(isApp,0) as isApp from DocPlatR where PlatNo = :p1_PlatNo',[quV_DocPlatHeadPlatNo.Value]);
                              if quV_DocPlatHeadEntityType.Value = 'PLATP' then dmDataModule.OpenSQL('select isnull(isApp,0) as isApp from DocPlatP where PlatNo = :p1_PlatNo',[quV_DocPlatHeadPlatNo.Value]);

                              if dmDataModule.QFO.FieldByName('isApp').AsBoolean then bbConductingDoc.Enabled := False;

                              dmDataModule.OpenSQL('select isnull(IsCanEdit,0) as IsCanEdit from ListUserForVidDoc where IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc,UserNo]);

                              if dmDataModule.QFO.RecordCount > 0 then IsCanEdit := dmDataModule.QFO.FieldByName('IsCanEdit').Value
                                                                  else IsCanEdit := false;

                              if quV_DocPlatHeadUserNo.Value <> UserNo then if IsCanEdit = True then begin
                                                                                                        p_Entity_Type.Enabled := True;
                                                                                                        p_Nom.Enabled := True;
                                                                                                        p_Buh.Enabled := True;
                                                                                                        p_PostNo.Enabled := True;
                                                                                                        p_DatePlat.Enabled := True;
                                                                                                        p_Summa.Enabled := True;
                                                                                                        p_OtdelNo.Enabled := True;
                                                                                                        p_response_dept_id.Enabled := True;
                                                                                                        p_activity_type_id.Enabled := True;
                                                                                                        p_VidrashodNo.Enabled := True;
                                                                                                        p_Spravka.Enabled := True;
                                                                                                        p_l_code.Enabled := True;
                                                                                                        p_Rate.Enabled := True;
                                                                                                        p_CurrencyAccounting.Enabled := True;
                                                                                                        p_RateCurrencyAccounting.Enabled := True;
                                                                                                        p_SummaCurrencyAccounting.Enabled := True;
                                                                                                        p_SotrudNo.Enabled := True;
                                                                                                        p_TipPlat.Enabled := True;
                                                                                                        p_bank_invoice_id.Enabled := True;
                                                                                                        p_is_econom.Enabled := True;
                                                                                                        p_our_firmNo.Enabled := True;
                                                                                                      end
                                                                                                 else begin
                                                                                                        p_Entity_Type.Enabled := False;
                                                                                                        p_Nom.Enabled := False;
                                                                                                        p_Buh.Enabled := False;
                                                                                                        p_PostNo.Enabled := False;
                                                                                                        p_DatePlat.Enabled := False;
                                                                                                        p_Summa.Enabled := False;
                                                                                                        p_OtdelNo.Enabled := False;
                                                                                                        p_response_dept_id.Enabled := False;
                                                                                                        p_activity_type_id.Enabled := False;
                                                                                                        p_VidrashodNo.Enabled := False;
                                                                                                        p_Spravka.Enabled := False;
                                                                                                        p_l_code.Enabled := False;
                                                                                                        p_Rate.Enabled := False;
                                                                                                        p_CurrencyAccounting.Enabled := False;
                                                                                                        p_RateCurrencyAccounting.Enabled := False;
                                                                                                        p_SummaCurrencyAccounting.Enabled := False;
                                                                                                        p_SotrudNo.Enabled := False;
                                                                                                        p_TipPlat.Enabled := False;
                                                                                                        p_bank_invoice_id.Enabled := False;
                                                                                                        p_is_econom.Enabled := False;
                                                                                                        p_our_firmNo.Enabled := False;
                                                                                                      end;
                            end;

  if (EditType='ADD') and (ln_id=-1) then
  begin
    p_TipPlat.Text:='';
    p_TipPlat.KeyFieldValue:='';
    p_bank_invoice_id.Text:='';
    p_bank_invoice_id.KeyFieldValue:='';
    p_Buh.KeyFieldValue:='';
    p_Buh.Text:='';
    p_OtdelNo.Text:='';
    p_OtdelNo.KeyFieldValue:='';
    p_our_firmNo.KeyFieldValue:=IntToStr(dmDataModule.FirmNo);
    p_our_firmNo.GetLocateKey;
    p_is_econom.KeyFieldValue:='0';
    p_is_econom.GetLocateKey;
    dmDataModule.OpenSQL('select c.Name, c.l_code, ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
    p_l_code.KeyFieldValue := dmDataModule.qfo.FieldByName('l_code').Value;
    p_l_code.Text := dmDataModule.qfo.FieldByName('Name').Value;
    p_Rate.Text := dmDataModule.qfo.FieldByName('Rate').Value;
    bbConductingDoc.Visible := false;
    cbIsDocSignature.Visible := false;

    if p_Entity_Type.KeyFieldValue = 'PLATR' then begin
                                                    caption := 'Расход денег';
                                                  end;
    if p_Entity_Type.KeyFieldValue = 'PLATP' then begin
                                                    caption := 'Приход денег';
                                                  end;

    dmDataModule.OpenSQL('select * from ListUserForVidDoc where Active = 1 and IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc, UserNo]);

    if dmDataModule.QFO.RecordCount = 0 then begin
                                               cbIsDocSignature.Visible := False;
                                               p_response_dept_id.Enabled := False;
                                               p_activity_type_id.Enabled := False;
                                             end
                                        else begin
                                               cbIsDocSignature.Visible := True;
                                               p_response_dept_id.Enabled := True;
                                               p_activity_type_id.Enabled := True;
                                               dmDataModule.OpenSQL('select * from l_doc_signature where DocId = :p1_DocId and UserNo = :p2_UserNo and IdVidDoc = :p3_IdVidDoc',[quV_DocPlatHeadPlatNo.Value, UserNo, IdVidDoc]);
                                               if dmDataModule.QFO.RecordCount = 1 then cbIsDocSignature.Checked := True;
                                             end;

    dmDataModule.OpenSQL('select * from ListUserForControlDoc where Active = 1 and IdVidDoc = :p1_IdVidDoc and UserNo = :p2_UserNo',[IdVidDoc, UserNo]);

    if dmDataModule.QFO.RecordCount = 0 then begin
                                               cbIsDocControl.Visible := False;
                                               p_response_dept_id.Enabled := False;
                                               p_activity_type_id.Enabled := False;
                                             end
                                        else begin
                                               cbIsDocControl.Visible := True;
                                               p_response_dept_id.Enabled := True;
                                               p_activity_type_id.Enabled := True;
                                               dmDataModule.OpenSQL('select * from l_doc_control where DocId = :p1_DocId and UserNo = :p2_UserNo and IdVidDoc = :p3_IdVidDoc',[quV_DocPlatHeadPlatNo.Value, UserNo, IdVidDoc]);
                                               if dmDataModule.QFO.RecordCount = 1 then cbIsDocControl.Checked := True;
                                             end;

  end;

  if (EditType='ADD') and (ln_id>0) then
  begin
      if p_Entity_Type.KeyFieldValue = 'PLATP' then
      begin
        Seq_DocPlatP_Nom.ExecProc;
        Nom := Seq_DocPlatP_Nom.ParamByName('id').AsString;
      end;
      if p_Entity_Type.KeyFieldValue = 'PLATR' then
      begin
        Seq_DocPlatR_Nom.ExecProc;
        Nom := Seq_DocPlatR_Nom.ParamByName('id').AsString;
      end;
      p_Nom.KeyFieldValue := Nom;
      p_Nom.Text := Nom;
  end;
end;


procedure TEditDocPlatDlg.p_OtdelNoSelectOk(Sender: TObject);
var
  D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID : integer;
  D_RESPONSE_DEPT_IDSTR, D_ACTIVITY_TYPE_IDSTR : string;
begin
  inherited;
  dmDataModule.OpenSQL('select D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID from l_VidOtdelProp s where s.OtdelNo= :p1_OtdelNo', [p_OtdelNo.KeyFieldValue]);            // qu_otdelNoOtdelNo.AsInteger
  D_RESPONSE_DEPT_ID := dmDataModule.qfo.FieldByName('D_RESPONSE_DEPT_ID').AsInteger;
  D_ACTIVITY_TYPE_ID := dmDataModule.qfo.FieldByName('D_ACTIVITY_TYPE_ID').AsInteger;

  p_response_dept_id.KeyFieldValue := IntToStr(D_RESPONSE_DEPT_ID);
  p_activity_type_id.KeyFieldValue := IntToStr(D_ACTIVITY_TYPE_ID);

  dmDataModule.OpenSQL('select (select Name from D_RESPONSE_DEPT where id = :p1_D_RESPONSE_DEPT_ID) as ResponseDeptName,(select Name from D_ACTIVITY_TYPE where id = :p2_D_ACTIVITY_TYPE_ID) as ActivityTypeName', [D_RESPONSE_DEPT_ID,D_ACTIVITY_TYPE_ID]);
  p_response_dept_id.Text := dmDataModule.qfo.FieldByName('ResponseDeptName').AsString;
  p_activity_type_id.Text := dmDataModule.qfo.FieldByName('ActivityTypeName').AsString;
end;

procedure TEditDocPlatDlg.p_l_codeExit(Sender: TObject);
var
  SummaCurrencyAccounting : real;
  Summa, Rate, RateCurrencyAccounting : real;
begin
  inherited;
  if (EditType='ADD') or ((EditType='EDIT') and (p_Rate.Text = '')) then begin
                                                                           dmDataModule.OpenSQL('select Rate from CurrencyExchange ce left join D_CURRENCY c on c.id = ce.currencyid where IsActive = 1 and ((l_code = :p1_l_code) or Name = (:p2_l_code))',[p_l_code.Text,p_l_code.Text]);
                                                                           p_Rate.Text := dmDataModule.qfo.FieldByName('Rate').AsString;

                                                                           Summa := StrToFloat(p_Summa.Text);
                                                                           if ((p_Rate.Text = '')or(p_Rate.Text = 'p_Rate')) then Rate := 0 else Rate := StrToFloat(p_Rate.Text);
                                                                           if ((p_RateCurrencyAccounting.Text = '') or (p_RateCurrencyAccounting.Text = 'p_RateCurrencyAccounting')) then RateCurrencyAccounting := 1 else RateCurrencyAccounting := StrToFloat(p_RateCurrencyAccounting.Text);
                                                                           SummaCurrencyAccounting := RoundTo (Summa*Rate/RateCurrencyAccounting,-1);

                                                                           p_SummaCurrencyAccounting.Text := FloatToStr(SummaCurrencyAccounting);
                                                                           p_SummaCurrencyAccounting.KeyFieldValue := FloatToStr(SummaCurrencyAccounting);
//                                                                           showmessage(p_Rate.Text+' '+dmDataModule.qfo.FieldByName('Rate').AsString);
//                                                                           p_Rate.Refresh;
                                                                         end;
end;

procedure TEditDocPlatDlg.p_l_codeChange(Sender: TObject);
var
  SummaCurrencyAccounting : real;
  Summa, Rate, RateCurrencyAccounting : real;
begin
  inherited;
  if (EditType='EDIT') then p_Rate.Text := '';
  if (EditType='ADD') or ((EditType='EDIT') and (p_Rate.Text = '')) then begin
                                                                           dmDataModule.OpenSQL('select Rate from CurrencyExchange ce left join D_CURRENCY c on c.id = ce.currencyid where IsActive = 1 and ((l_code = :p1_l_code) or Name = (:p2_l_code))',[p_l_code.Text,p_l_code.Text]);
                                                                           p_Rate.Text := dmDataModule.qfo.FieldByName('Rate').AsString;
                                                                           Summa := StrToFloat(p_Summa.Text);
                                                                           if ((p_Rate.Text = '')or(p_Rate.Text = 'p_Rate')) then Rate := 0 else Rate := StrToFloat(p_Rate.Text);
                                                                           if ((p_RateCurrencyAccounting.Text = '') or (p_RateCurrencyAccounting.Text = 'p_RateCurrencyAccounting')) then RateCurrencyAccounting := 1 else RateCurrencyAccounting := StrToFloat(p_RateCurrencyAccounting.Text);
                                                                           SummaCurrencyAccounting := RoundTo (Summa*Rate/RateCurrencyAccounting,-1);
                                                                           p_SummaCurrencyAccounting.Text := FloatToStr(SummaCurrencyAccounting);
                                                                           p_SummaCurrencyAccounting.KeyFieldValue := FloatToStr(SummaCurrencyAccounting);
//                                                                           showmessage(p_Rate.Text+' '+dmDataModule.qfo.FieldByName('Rate').AsString);
//                                                                           p_Rate.Refresh;
                                                                         end;
end;

procedure TEditDocPlatDlg.p_RateCurrencyAccountingChange(
  Sender: TObject);
var
  SummaCurrencyAccounting : real;
  Summa, Rate, RateCurrencyAccounting : real;
begin
  inherited;
  if (EditType='EDIT') then p_SummaCurrencyAccounting.Text := '';
  if (EditType='ADD') or ((EditType='EDIT') and (p_SummaCurrencyAccounting.Text = '')) then begin
                                                                                              Summa := StrToFloat(p_Summa.Text);
                                                                                              if ((p_Rate.Text = '')or(p_Rate.Text = 'p_Rate')) then Rate := 0 else Rate := StrToFloat(p_Rate.Text);
                                                                                              if ((p_RateCurrencyAccounting.Text = 'p_RateCurrencyAccounting') or (p_RateCurrencyAccounting.Text = '')) then RateCurrencyAccounting := 1 else RateCurrencyAccounting := StrToFloat(p_RateCurrencyAccounting.Text);
                                                                                              SummaCurrencyAccounting := RoundTo (Summa*Rate/RateCurrencyAccounting,-1);
                                                                                              p_SummaCurrencyAccounting.Text := FloatToStr(SummaCurrencyAccounting);
                                                                                              p_SummaCurrencyAccounting.KeyFieldValue := FloatToStr(SummaCurrencyAccounting);
                                                                                            end

end;

procedure TEditDocPlatDlg.p_SummaChange(Sender: TObject);
var
  SummaCurrencyAccounting : real;
  Summa, Rate, RateCurrencyAccounting : real;
begin
  inherited;
  if (EditType='EDIT') then p_SummaCurrencyAccounting.Text := '';
  if (EditType='ADD') or ((EditType='EDIT') and (p_SummaCurrencyAccounting.Text = '')) then begin
                                                                                              Summa := StrToFloat(p_Summa.Text);
                                                                                              if ((p_Rate.Text = '')or(p_Rate.Text = 'p_Rate')) then Rate := 0 else Rate := StrToFloat(p_Rate.Text);
                                                                                              if ((p_RateCurrencyAccounting.Text = 'p_RateCurrencyAccounting') or (p_RateCurrencyAccounting.Text = '')) then RateCurrencyAccounting := 1 else RateCurrencyAccounting := StrToFloat(p_RateCurrencyAccounting.Text);
                                                                                              SummaCurrencyAccounting := RoundTo (Summa*Rate/RateCurrencyAccounting,-1);
                                                                                              p_SummaCurrencyAccounting.Text := FloatToStr(SummaCurrencyAccounting);
                                                                                              p_SummaCurrencyAccounting.KeyFieldValue := FloatToStr(SummaCurrencyAccounting);
                                                                                            end
end;

procedure TEditDocPlatDlg.p_RateChange(Sender: TObject);
var
  SummaCurrencyAccounting : real;
  RateCurrencyAccounting : real;
  Summa, Rate : real;
begin
  inherited;
  if (EditType='EDIT') then p_SummaCurrencyAccounting.Text := '';
  if (EditType='ADD') or ((EditType='EDIT') and (p_SummaCurrencyAccounting.Text = '')) then begin
                                                                                              Summa := StrToFloat(p_Summa.Text);
                                                                                              if ((p_Rate.Text = '')or(p_Rate.Text = 'p_Rate')) then Rate := 0 else Rate := StrToFloat(p_Rate.Text);
                                                                                              if ((p_RateCurrencyAccounting.Text = '') or (p_RateCurrencyAccounting.Text = 'p_RateCurrencyAccounting')) then RateCurrencyAccounting := 1 else RateCurrencyAccounting := StrToFloat(p_RateCurrencyAccounting.Text);
                                                                                              SummaCurrencyAccounting := RoundTo (Summa*Rate/RateCurrencyAccounting,-1);
                                                                                              p_SummaCurrencyAccounting.Text := FloatToStr(SummaCurrencyAccounting);
                                                                                              p_SummaCurrencyAccounting.KeyFieldValue := FloatToStr(SummaCurrencyAccounting);
                                                                                            end
end;

procedure TEditDocPlatDlg.DBGridEhSignatureDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if quListUserForVidDocis_signature.AsBoolean then begin
                                                      DBGridEhSignature.Canvas.Font.Color := clLime;
                                                    end;
  DBGridEhSignature.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TEditDocPlatDlg.DBGridEhSignatureGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if Column = nil then exit;
  if (Column.FieldName = 'is_signature') and quListUserForVidDoc.FieldByName('is_signature').Value = true then
   Background:= clLime;
end;

procedure TEditDocPlatDlg.cbIsDocSignatureClick(Sender: TObject);
begin
  inherited;
  dmDataModule.ExecSQL('exec sp_IsDocSignature :p1_UserNo, :p2_DocId, :p3_Value, :p4_IdVidDoc',[UserNo, quV_DocPlatHeadPlatNo.Value, cbIsDocSignature.Checked, IdVidDoc]);
  quListUserForVidDoc.Close;
  quListUserForVidDoc.Open;
end;

procedure TEditDocPlatDlg.quListUserForVidDocBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quListUserForVidDoc.ParamByName('id').Value := quV_DocPlatHeadPlatNo.Value;
  quListUserForVidDoc.ParamByName('IdVidDoc').Value := IdVidDoc;
end;

procedure TEditDocPlatDlg.bbConductingDocClick(Sender: TObject);
begin
  inherited;

  if Application.MessageBox('Вы уверены?','Внимание! Провести документ!',MB_YESNO)=IDYES then
   begin
     dmDataModule.ExecSQL('exec sp_CreateDocPlat :p1_pkey',[IntToStr(ln_id)]);
     ShowMessage('Документ № '+ IntToStr(quV_DocPlatHeadPlatNo.Value)+ ' проведен.');
   end;
end;

procedure TEditDocPlatDlg.spAddAfterPost(DataSet: TDataSet);
var
  SqlText, NoSignatureOtdel: String;
  quNoSignatureOtdel: TMSQuery;
begin
  inherited;
  if EditType = 'ADD' then ln_id := spAdd.Params.ParamByName('p_Pkey').Value;


  SqlText := 'select  OtdelNo '
            +'      , sum(is_signature) '
            +'      , (select OtdelName from VidOtdel where OtdelNo = g.OtdelNo) as OtdelName '
            +' from (select OtdelNo '
            +'            , Case when l.id is null then cast(0 as int) '
            +'                                     else cast(1 as int) end as is_signature '
            +'        from ListUserForVidDoc u left join '
            +'             l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id and l.IdVidDoc = u.IdVidDoc'
            +'         where u.IdVidDoc = :IdVidDoc '
            +'           and Active = 1) g '
            +'group by OtdelNo '
            +'having sum(is_signature) = 0 ';

  quNoSignatureOtdel:=TMSQuery.Create(nil);
  quNoSignatureOtdel.Connection:=dmDataModule.DB;
  quNoSignatureOtdel.SQL.Clear;
  quNoSignatureOtdel.SQL.Text:= SqlText;
  quNoSignatureOtdel.ParamByName('Id').Value := ln_id;
  quNoSignatureOtdel.ParamByName('IdVidDoc').Value := IdVidDoc;
  quNoSignatureOtdel.Open;

  quNoSignatureOtdel.First;

  while not quNoSignatureOtdel.Eof do begin
                                        NoSignatureOtdel := NoSignatureOtdel + quNoSignatureOtdel.FieldByName('OtdelName').AsString + ', ';
                                        quNoSignatureOtdel.Next;
                                      end;
  delete (NoSignatureOtdel,Length(NoSignatureOtdel)-1,Length(NoSignatureOtdel));

  if quV_DocPlatHeadEntityType.Value = 'PLATR' then dmDataModule.ExecSQL('Update DocPlatR set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,quV_DocPlatHeadPlatNo.Value]);
  if quV_DocPlatHeadEntityType.Value = 'PLATP' then dmDataModule.ExecSQL('Update DocPlatP set NotSignatureOtdel = :p1_NotSignatureOtdel where PlatNo = :p2_PlatNo',[NoSignatureOtdel,quV_DocPlatHeadPlatNo.Value]);
end;

procedure TEditDocPlatDlg.quListUserForControlDocBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  quListUserForControlDoc.ParamByName('id').Value := quV_DocPlatHeadPlatNo.Value;
  quListUserForControlDoc.ParamByName('IdVidDoc').Value := IdVidDoc;
end;

procedure TEditDocPlatDlg.cbIsDocControlClick(Sender: TObject);
begin
  inherited;
  dmDataModule.ExecSQL('exec sp_IsDocControl :p1_UserNo, :p2_DocId, :p3_Value, :p4_IdVidDoc',[UserNo, quV_DocPlatHeadPlatNo.Value, cbIsDocControl.Checked, IdVidDoc]);
  quListUserForControlDoc.Close;
  quListUserForControlDoc.Open;
end;

procedure TEditDocPlatDlg.DBGridEhDocControlDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if quListUserForControlDocis_control.AsBoolean then begin
                                                        DBGridEhDocControl.Canvas.Font.Color := clLime;
                                                      end;
  DBGridEhDocControl.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TEditDocPlatDlg.DBGridEhDocControlGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if Column = nil then exit;
  if (Column.FieldName = 'is_control') and quListUserForControlDoc.FieldByName('is_control').Value = true then
   Background:= clLime;
end;

end.

