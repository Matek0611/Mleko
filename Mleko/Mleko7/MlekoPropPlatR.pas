unit MlekoPropPlatR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropCustomDialog, DBAccess, MsAccess, DB, ActnList, ComCtrls, StdCtrls,
  citCtrls, citmask, citDBComboEdit, PropFilerEh,
  MemDS, ToolWin, DBCtrls, Math;

type
  TMlekoPropPlatRDlg = class(TCFLMLKPropCustomDialogDlg)
    p_Nom: TcitDBComboEdit;
    p_PostNo: TcitDBComboEdit;
    p_DatePlat: TcitDBComboEdit;
    p_Summa: TcitDBComboEdit;
    p_Buh: TcitDBComboEdit;
    p_Spravka: TcitDBComboEdit;
    p_SotrudNo: TcitDBComboEdit;
    p_TipPlat: TcitDBComboEdit;
    quBuh: TMSQuery;
    quBuhbuh: TSmallintField;
    quBuhBuh_type_name: TStringField;
    quPlatType: TMSQuery;
    quPlatTypeID: TSmallintField;
    quPlatTypeName: TStringField;
    p_bank_invoice_id: TcitDBComboEdit;
    quBankInvoice: TMSQuery;
    quBankInvoiceid: TAutoIncField;
    quBankInvoiceinvoice_num: TFloatField;
    quBankInvoiceBank_Name: TStringField;
    quBankInvoiceDescription: TStringField;
    qu_otdelNo: TMSQuery;
    qu_otdelNoOtdelNo: TSmallintField;
    qu_otdelNoOtdelName: TStringField;
    p_is_econom: TcitDBComboEdit;
    qu_econom: TMSQuery;
    qu_economid: TIntegerField;
    qu_economname: TStringField;
    p_our_firmNo: TcitDBComboEdit;
    quOurFirm: TMSQuery;
    quOurFirmname: TStringField;
    quOurFirmPostNo: TSmallintField;
    p_Entity_Type: TcitDBComboEdit;
    Seq_PlatR_Nom: TMSStoredProc;
    Seq_PlatP_Nom: TMSStoredProc;
    quEntityType: TMSQuery;
    quEntityTypecode: TStringField;
    quEntityTypeName: TStringField;
    TabSheet2: TTabSheet;
    p_response_dept_id: TcitDBComboEdit;
    p_activity_type_id: TcitDBComboEdit;
    p_VidrashodNo: TcitDBComboEdit;
    p_OtdelNo: TcitDBComboEdit;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    quLoad: TMSQuery;
    dsLoad: TMSDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label7: TLabel;
    p_Rate: TcitDBComboEdit;
    p_l_code: TcitDBComboEdit;
    qu_D_Currency: TMSQuery;
    qu_D_CurrencyName: TStringField;
    qu_D_CurrencyL_Code: TStringField;
    p_CurrencyAccounting: TcitDBComboEdit;
    p_RateCurrencyAccounting: TcitDBComboEdit;
    p_SummaCurrencyAccounting: TcitDBComboEdit;
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
  private
    procedure set_Execute_param(DataSet: TDataSet); override;
    function EnabledEntitySelected: Boolean;
  public
    class function Add_Dlg(var params: TParams): boolean;
    class function Upd_Dlg(var params: TParams): boolean;
  end;

var
  ln_id: Int64;
  MlekoPropPlatRDlg: TMlekoPropPlatRDlg;

implementation

uses data, main,UtilsCommon;

{$R *.dfm}

procedure TMlekoPropPlatRDlg.set_Execute_param(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSStoredProc).Params.ParamByName('p_Pkey').Value := ln_id;
  (DataSet as TMSStoredProc).Params.ParamByName('p_UserNo').Value := data.UserNo;
  (DataSet as TMSStoredProc).Params.ParamByName('p_PostNoFirst').Value := p_PostNo.KeyFieldValue;  
  (DataSet as TMSStoredProc).Params.ParamByName('p_Entity_Type').Value := p_Entity_Type.KeyFieldValue;
end;

procedure TMlekoPropPlatRDlg.quUpdBegParamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).Params.ParamByName('table_key').Value := ln_id;
end;

class function TMlekoPropPlatRDlg.Add_Dlg(var params: TParams): boolean;
begin
  inherited;
  ln_id:=UtilsCommon.GetParamValue(params,'table_key',varInt64,-1);
  result := ShowDlg('ADD', params);
  if Result then UtilsCommon.SetParamValue(params,'table_key',ln_id);
end;


class function TMlekoPropPlatRDlg.Upd_Dlg(var params: TParams): boolean;
begin
  inherited;
  ln_id:=UtilsCommon.GetParamValue(params,'table_key',varInt64,-1);



  result := ShowDlg('EDIT', params);
end;

procedure TMlekoPropPlatRDlg.ActionOKExecute(Sender: TObject);
begin
  inherited;
  if EditType = 'ADD' then ln_id := spAdd.Params.ParamByName('p_Pkey').Value;
end;

procedure TMlekoPropPlatRDlg.quAddBegParamBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  (DataSet as TMSQuery).Params.ParamByName('p_date_plat').AsDateTime := Main.GlobalDateNakl;
  (DataSet as TMSQuery).Params.ParamByName('p_Entity_type').AsString := UtilsCommon.GetParamValue(Params,'Entity_type',varString,'');
  (DataSet as TMSQuery).Params.ParamByName('Summa').AsFloat := UtilsCommon.GetParamValue(Params,'MARKEDFREESUMMA',varSingle,0);
  (DataSet as TMSQuery).Params.ParamByName('table_key').Value := ln_id;
  (DataSet as TMSQuery).Params.ParamByName('Rate').AsFloat := 0;
end;

procedure TMlekoPropPlatRDlg.p_BuhSelectOk(Sender: TObject);
begin
  inherited;
  p_bank_invoice_id.Enabled := (quBuh.FieldByName('buh').AsInteger = 2);
end;

function TMlekoPropPlatRDlg.EnabledEntitySelected: boolean;
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
  if p_Entity_Type.KeyFieldValue = 'PLATR' then begin
                                                  caption := 'Расход денег';
 {
                                                  quLoad.Close;
                                                  quLoad.ParamByName('Pkey').Value := ln_id;
                                                  quLoad.ParamByName('EntityType').Value := 'PLATR';
                                                  quLoad.Open;
}
                                                end;
  if p_Entity_Type.KeyFieldValue = 'PLATP' then begin
                                                  caption := 'Приход денег';
 {
                                                  quLoad.Close;
                                                  quLoad.ParamByName('Pkey').Value := ln_id;
                                                  quLoad.ParamByName('EntityType').Value := 'PLATP';
                                                  quLoad.Open;
  }
                                                end;
end;

procedure TMlekoPropPlatRDlg.p_Entity_TypeSelectOk(Sender: TObject);
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
        Seq_PlatP_Nom.ExecProc;
        Nom := Seq_PlatP_Nom.ParamByName('id').AsString;
      end;
      if p_Entity_Type.KeyFieldValue = 'PLATR' then
      begin
        Seq_PlatR_Nom.ExecProc;
        Nom := Seq_PlatR_Nom.ParamByName('id').AsString;
      end;
      p_Nom.KeyFieldValue := Nom;
      p_Nom.Text := Nom;
    end;
  end;
end;

procedure TMlekoPropPlatRDlg.FormShow(Sender: TObject);
var   Nom: string;
begin
  inherited;
  EnabledEntitySelected;
  if (caption = 'Приход денег') then begin
                                        quLoad.Close;
                                        quLoad.ParamByName('Pkey').Value := ln_id;
                                        quLoad.ParamByName('EntityType').Value := 'PLATP';
                                        quLoad.Open;
                                      end;
  if (caption = 'Расход денег') then begin
                                        quLoad.Close;
                                        quLoad.ParamByName('Pkey').Value := ln_id;
                                        quLoad.ParamByName('EntityType').Value := 'PLATR';
                                        quLoad.Open;
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
  end;
  if (EditType='ADD') and (ln_id>0) then
  begin
      if p_Entity_Type.KeyFieldValue = 'PLATP' then
      begin
        Seq_PlatP_Nom.ExecProc;
        Nom := Seq_PlatP_Nom.ParamByName('id').AsString;
      end;
      if p_Entity_Type.KeyFieldValue = 'PLATR' then
      begin
        Seq_PlatR_Nom.ExecProc;
        Nom := Seq_PlatR_Nom.ParamByName('id').AsString;
      end;
      p_Nom.KeyFieldValue := Nom;
      p_Nom.Text := Nom;
  end;
end;


procedure TMlekoPropPlatRDlg.p_OtdelNoSelectOk(Sender: TObject);
var
  D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID : integer;
  D_RESPONSE_DEPT_IDSTR, D_ACTIVITY_TYPE_IDSTR : string;
begin
  inherited;
  dmDataModule.OpenSQL('select D_RESPONSE_DEPT_ID, D_ACTIVITY_TYPE_ID from l_VidOtdelProp s where s.OtdelNo= :p1_OtdelNo', [qu_otdelNoOtdelNo.AsInteger]);
  D_RESPONSE_DEPT_ID := dmDataModule.qfo.FieldByName('D_RESPONSE_DEPT_ID').AsInteger;
  D_ACTIVITY_TYPE_ID := dmDataModule.qfo.FieldByName('D_ACTIVITY_TYPE_ID').AsInteger;

  p_response_dept_id.KeyFieldValue := IntToStr(D_RESPONSE_DEPT_ID);
  p_activity_type_id.KeyFieldValue := IntToStr(D_ACTIVITY_TYPE_ID);

  dmDataModule.OpenSQL('select (select Name from D_RESPONSE_DEPT where id = :p1_D_RESPONSE_DEPT_ID) as ResponseDeptName,(select Name from D_ACTIVITY_TYPE where id = :p2_D_ACTIVITY_TYPE_ID) as ActivityTypeName', [D_RESPONSE_DEPT_ID,D_ACTIVITY_TYPE_ID]);
  p_response_dept_id.Text := dmDataModule.qfo.FieldByName('ResponseDeptName').AsString;
  p_activity_type_id.Text := dmDataModule.qfo.FieldByName('ActivityTypeName').AsString;
end;

procedure TMlekoPropPlatRDlg.p_l_codeExit(Sender: TObject);
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

procedure TMlekoPropPlatRDlg.p_l_codeChange(Sender: TObject);
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

procedure TMlekoPropPlatRDlg.p_RateCurrencyAccountingChange(
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

procedure TMlekoPropPlatRDlg.p_SummaChange(Sender: TObject);
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

procedure TMlekoPropPlatRDlg.p_RateChange(Sender: TObject);
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

end.

