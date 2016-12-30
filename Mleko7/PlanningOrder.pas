unit PlanningOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, DBCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls, Buttons,
  citCtrls, citmask, citDBComboEdit, Mask, DBCtrlsEh, DBLookupEh,
  DateUtils;

type
  TPlanningOrderForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    DBGridEhAdd: TDBGridEh;
    dsPlanningOrder: TMSDataSource;
    quPlanningOrder: TMSQuery;
    bbOK: TBitBtn;
    bbcancel: TBitBtn;
    DBLookupComboboxEhSotrud: TDBLookupComboboxEh;
    cbIsNotNullOrZerroProd: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    spAddPlanningOrderSpec: TMSStoredProc;
    EdDatePlanning: TcxDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBGridEhEdit: TDBGridEh;
    quPlanningOrderEdit: TMSQuery;
    dsPlanningOrderEdit: TMSDataSource;
    quPlanningOrderEditOtdelName: TStringField;
    quPlanningOrderEditOtdelNo: TSmallintField;
    quPlanningOrderEditTovarNo: TSmallintField;
    quPlanningOrderEditNameTovarShort: TStringField;
    quPlanningOrderEditQty: TFloatField;
    quPlanningOrderEditSumma: TFloatField;
    quPlanningOrderEditColName: TStringField;
    quPlanningOrderEditPriceNow: TFloatField;
    quPlanningOrderEditPlanProdag: TFloatField;
    quPlanningOrderEditSummaProdag: TFloatField;
    quPlanningOrderEditPlanningOrderHeadId: TIntegerField;
    quPlanningOrderEditVidName: TStringField;
    quPlanningOrderEditSotrudName: TStringField;
    quPlanningOrderEditid: TLargeintField;
    quPlanningOrderOtdelName: TStringField;
    quPlanningOrderOtdelNo: TIntegerField;
    quPlanningOrderTovarNo: TIntegerField;
    quPlanningOrderVidName: TStringField;
    quPlanningOrderSotrudNo: TIntegerField;
    quPlanningOrderSotrudName: TStringField;
    quPlanningOrderNameTovarShort: TStringField;
    quPlanningOrderQty: TFloatField;
    quPlanningOrderSumma: TFloatField;
    quPlanningOrderColName: TStringField;
    quPlanningOrderPriceNow: TFloatField;
    quPlanningOrderVisible: TBooleanField;
    quPlanningOrderPlanningOrderHeadId: TIntegerField;
    quPlanningOrderPlanProdag: TFloatField;
    quPlanningOrderSummaProdag: TFloatField;
    quPlanningOrderEditSotrudNo: TIntegerField;
    quPlanningOrderCnt: TIntegerField;
    quPlanningOrderEditVisible: TBooleanField;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    quPlanningOrderPrognozProdag: TIntegerField;
    bInsPlanProd: TButton;
    quPlanningOrderpkey: TStringField;
    cbIsIzmPlanProdag: TCheckBox;
    quPlanningOrderEditPrognozProdag: TIntegerField;
    quPlanningOrderEditIzmPlanProdag: TFloatField;
    quPlanningOrderIzmPlanProdag: TFloatField;
    quPlanningOrderIncrementRate: TIntegerField;
    Button4: TButton;
    quPlanningOrderTipName: TStringField;
    ftTovar: TcitDBComboEdit;
    Label7: TLabel;
    edNamePlanningOrder: TEdit;
    fltVidTov: TcitDBComboEdit;
    Button5: TButton;
    procedure EdDateBegPropertiesChange(Sender: TObject);
    procedure EdDateEndPropertiesChange(Sender: TObject);
    procedure DBLookupComboboxEhSotrudChange(Sender: TObject);
    procedure cbIsNotNullOrZerroProdClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGridEhAddDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure bbOKClick(Sender: TObject);
    procedure quPlanningOrderBeforePost(DataSet: TDataSet);
    procedure Panel1Exit(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
    procedure DBGridEhEditDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure quPlanningOrderEditAfterPost(DataSet: TDataSet);
    procedure quPlanningOrderAfterPost(DataSet: TDataSet);
    procedure DBGridEhEditTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEhAddTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure quPlanningOrderEditBeforePost(DataSet: TDataSet);
    procedure bInsPlanProdClick(Sender: TObject);
    procedure EdDatePlanningPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbIsIzmPlanProdagClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ftTovarSelectOk(Sender: TObject);
    procedure fltVidTovSelectOk(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  PlanningOrderForm: TPlanningOrderForm;
  ActionForm : string;
  IsDelete : boolean;
  MaxPlanningId : integer;                             

procedure PlanningOrders(Action: String; var Pkey: Int64);
implementation

uses data, main, ListMinusPostForPlanningOrder, ListMinusVidTovForPlanningOrder,
     ListVidOtdelForPlanningOrder, ListTipNoIncrementRateForPlanProdag, ListTovarNoForPlanningOrder;

{$R *.dfm}

procedure PlanningOrders(Action: String; var Pkey: Int64);
var
  Dlg : TPlanningOrderForm;
  KolDayInNextMons : Integer;
  Year, Month, Day: word;
  s : string;
begin
  Dlg := TPlanningOrderForm.Create(Application);

  DecodeDate(Date(), Year, Month, Day);

  IsDelete := true;

  Dlg.EdDateBeg.Date := Date();
  Dlg.EdDateEnd.Date := Date();
//  Dlg.EdDatePlanning.Date := EncodeDate(Year, Month+1, 01);

  if (Month = 12) then begin
                         KolDayInNextMons := 31;
                         Dlg.EdDatePlanning.Date := EncodeDate(Year+1, 01, 01);
                       end
                  else begin
                         KolDayInNextMons := DaysInMonth(EncodeDate(Year, Month+1, 01));
                         Dlg.EdDatePlanning.Date := EncodeDate(Year, Month+1, 01);
                       end;

  dmDataModule.quSotrud.Open;

  try
    if Action = 'Add' then
     begin
       ActionForm := Action;

       Dlg.DBGridEhEdit.Enabled := false;
       Dlg.DBGridEhEdit.Visible := false;
       dlg.dsPlanningOrderEdit.Enabled := false;
       Dlg.ftTovar.Visible := false;
       Dlg.fltVidTov.Visible := false;

       Dlg.DBGridEhAdd.Enabled := true;
       Dlg.DBGridEhAdd.Visible := true;

       dmDataModule.OpenSQL('select isnull(max(Id),0) +1 as Id from s_PlanningOrderHead');

       MaxPlanningId := DmDataModule.QFO.FieldByName('Id').AsInteger;

       s := DmDataModule.QFO.FieldByName('Id').AsString + IntToStr(data.UserNo);

       Pkey := StrToInt(s);
       Dlg.Label6.Caption := s;//IntToStr(Pkey);


       Dlg.quPlanningOrder.Close;
       Dlg.quPlanningOrder.ParamByName('DateBeg').Value := Dlg.EdDateBeg.Date;
       Dlg.quPlanningOrder.ParamByName('DateEnd').Value := Dlg.EdDateEnd.Date;
       Dlg.quPlanningOrder.ParamByName('DayInMonth').Value := KolDayInNextMons;
       Dlg.quPlanningOrder.ParamByName('UserNo').Value := data.UserNo;
       Dlg.quPlanningOrder.ParamByName('IsNotNullOrZerroProd').Value := Dlg.cbIsNotNullOrZerroProd.Checked;
       Dlg.quPlanningOrder.ParamByName('PlanningOrderHeadId').value := Pkey;
       Dlg.quPlanningOrder.Open;

       Dlg.Label9.Caption := Dlg.quPlanningOrderCnt.AsString;
       Dlg.Label10.Caption := IntToStr(Dlg.quPlanningOrder.RecordCount);


     end;
    if Action = 'Edit' then
     begin
       ActionForm := Action;

       Dlg.DBGridEhEdit.Enabled := true;
       Dlg.DBGridEhEdit.Visible := true;

       Dlg.DBGridEhAdd.Enabled := false;
       Dlg.DBGridEhAdd.Visible := false;
       dlg.dsPlanningOrder.Enabled := false;

       Dlg.Button1.Enabled := false;
       Dlg.Button2.Enabled := false;
       Dlg.Button3.Enabled := false;
       Dlg.bInsPlanProd.Enabled := false;


       dmDataModule.OpenSQL('select Id, DatePlanning, DatePlanningBeg, DatePlanningEnd, UserNo from PlanningOrderHead where id = :p1_id',[Pkey]);


//       dmDataModule.OpenSQL('select isnull(max(Id),0) as Id from PlanningOrderHead');
//       Pkey := DmDataModule.QFO.FieldByName('Id').Value;
       if DmDataModule.QFO.FieldByName('UserNo').Value <> data.UserNo then Dlg.DBGridEhEdit.ReadOnly := true;

       Dlg.Label6.Caption := DmDataModule.QFO.FieldByName('Id').AsString;
       Dlg.EdDatePlanning.Date := DmDataModule.QFO.FieldByName('DatePlanning').AsDateTime;
       Dlg.EdDateBeg.Date := DmDataModule.QFO.FieldByName('DatePlanningBeg').AsDateTime;
       Dlg.EdDateEnd.Date := DmDataModule.QFO.FieldByName('DatePlanningEnd').AsDateTime;

       Dlg.EdDatePlanning.Enabled := false;
       Dlg.EdDateBeg.Enabled := false;
       Dlg.EdDateEnd.Enabled := false;


       Dlg.quPlanningOrderEdit.Close;
       Dlg.quPlanningOrderEdit.ParamByName('PlanningOrderHeadId').value := Pkey;
       Dlg.quPlanningOrderEdit.ParamByName('IsNotNullOrZerroProd').Value := Dlg.cbIsNotNullOrZerroProd.Checked;
       Dlg.quPlanningOrderEdit.Open;

       Dlg.Label9.Caption := IntToStr(Dlg.quPlanningOrderEdit.RecordCount);
       Dlg.Label10.Caption := IntToStr(Dlg.quPlanningOrderEdit.RecordCount);


     end;
    Dlg.ShowModal;
  finally
    Dlg.quPlanningOrder.Close;
    dmDataModule.quVidTov.Close;
    Dlg.Free;
  end;
end;

procedure TPlanningOrderForm.EdDateBegPropertiesChange(Sender: TObject);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     quPlanningOrder.Close;
     quPlanningOrder.ParamByName('DateBeg').Value := EdDateBeg.Date;
     quPlanningOrder.Open;
     Label9.Caption := quPlanningOrderCnt.AsString;
     Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
   end;
end;

procedure TPlanningOrderForm.EdDateEndPropertiesChange(Sender: TObject);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     quPlanningOrder.Close;
     quPlanningOrder.ParamByName('DateEnd').Value := EdDateEnd.Date;
     quPlanningOrder.Open;
     Label9.Caption := quPlanningOrderCnt.AsString;
     Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
   end;
end;

procedure TPlanningOrderForm.DBLookupComboboxEhSotrudChange(
  Sender: TObject);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     quPlanningOrder.Close;
     if DBLookupComboboxEhSotrud.Text = '' then quPlanningOrder.ParamByName('SotrudNo').Clear
                                           else quPlanningOrder.ParamByName('SotrudNo').Value := DBLookupComboboxEhSotrud.KeyValue;
     quPlanningOrder.Open;
     Label9.Caption := quPlanningOrderCnt.AsString;
     Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
   end;
  if ActionForm = 'Edit' then
   begin
     quPlanningOrderEdit.Close;
     if DBLookupComboboxEhSotrud.Text = '' then quPlanningOrderEdit.ParamByName('SotrudNo').Clear
                                           else quPlanningOrderEdit.ParamByName('SotrudNo').Value := DBLookupComboboxEhSotrud.KeyValue;
     quPlanningOrderEdit.Open;
   end;
end;

procedure TPlanningOrderForm.cbIsNotNullOrZerroProdClick(Sender: TObject);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     quPlanningOrder.Close;
     quPlanningOrder.ParamByName('IsNotNullOrZerroProd').Value := cbIsNotNullOrZerroProd.Checked;
     quPlanningOrder.Open;
     Label9.Caption := quPlanningOrderCnt.AsString;
     Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
   end;
  if ActionForm = 'Edit' then
   begin
     quPlanningOrderEdit.Close;
     quPlanningOrderEdit.ParamByName('IsNotNullOrZerroProd').Value := cbIsNotNullOrZerroProd.Checked;
     quPlanningOrderEdit.Open;
   end;
end;

procedure TPlanningOrderForm.Button1Click(Sender: TObject);
begin
  inherited;
  with TListMinusPostForPlanningOrderaForm.Create(Application) do
  try
    quListMinusPostForPlanningOrdera.Open;
    ShowModal;
  finally
    quListMinusPostForPlanningOrdera.Close;
    Free;
  end;
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  Label9.Caption := quPlanningOrderCnt.AsString;
  Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
end;

procedure TPlanningOrderForm.Button2Click(Sender: TObject);
begin
  inherited;
  with TListMinusVidTovForPlanningOrderaForm.Create(Application) do
  try
    quListMinusVidTovForPlanningOrdera.ParamByName('UserNo').Value := Data.UserNo;
    quListMinusVidTovForPlanningOrdera.Open;
    ShowModal;
  finally
    quListMinusVidTovForPlanningOrdera.Close;
    Free;
  end;
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  Label9.Caption := quPlanningOrderCnt.AsString;
  Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
end;

procedure TPlanningOrderForm.Button3Click(Sender: TObject);
begin
  inherited;
  with TListVidOtdelForPlanningOrderaForm.Create(Application) do
  try
    quListVidOtdelForPlanningOrdera.ParamByName('UserNo').Value := Data.UserNo;
    quListVidOtdelForPlanningOrdera.Open;
    ShowModal;
  finally
    quListVidOtdelForPlanningOrdera.Close;
    Free;
  end;
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  Label9.Caption := quPlanningOrderCnt.AsString;
  Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
end;

procedure TPlanningOrderForm.DBGridEhAddDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if quPlanningOrderVisible.AsBoolean then
    DBGridEhAdd.Canvas.Font.Color := clRed;
  DBGridEhAdd.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TPlanningOrderForm.bbOKClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i :=0;
  if ActionForm = 'Add' then begin
//                               quPlanningOrder.DisableControls;
                               dmDataModule.ExecSQL('insert into PlanningOrderHead (id, DatePlanning, DatePlanningBeg, DatePlanningEnd, UserNo, NamePlanning) values (:p1_id, :p2_DatePlanning, :p3_DatePlanningBeg, :p4_DatePlanningEnd, :p5_UserNo, :p6_NamePlanning) ',[StrToInt(Label6.Caption), EdDatePlanning.Date-2, EdDateBeg.Date-2, EdDateEnd.Date-2, Data.UserNo, edNamePlanningOrder.Text]);

                               IsDelete := false;

                               quPlanningOrder.First;
{
                               showmessage(inttostr(quPlanningOrder.RecordCount));
                               showmessage(quPlanningOrderCnt.AsString);
}
                               while not quPlanningOrder.Eof do begin
                                                                  spAddPlanningOrderSpec.ParamByName('PlanningOrderHeadId').Value := StrToInt(Label6.Caption);
                                                                  spAddPlanningOrderSpec.ParamByName('TovarNo').Value := quPlanningOrderTovarNo.value;
                                                                  spAddPlanningOrderSpec.ParamByName('OtdelNo').Value := quPlanningOrderOtdelNo.value;
                                                                  spAddPlanningOrderSpec.ParamByName('TovarName').Value := quPlanningOrderNameTovarShort.value;
                                                                  spAddPlanningOrderSpec.ParamByName('Qty').Value :=  quPlanningOrderQty.value;
                                                                  spAddPlanningOrderSpec.ParamByName('Summa').Value :=  quPlanningOrderSumma.value;
                                                                  spAddPlanningOrderSpec.ParamByName('ColName').Value :=  quPlanningOrderColName.Value;
                                                                  spAddPlanningOrderSpec.ParamByName('PriceNow').Value :=  quPlanningOrderPriceNow.Value;
                                                                  spAddPlanningOrderSpec.ParamByName('PlanProdag').Value :=  quPlanningOrderPlanProdag.Value;
                                                                  spAddPlanningOrderSpec.ParamByName('SummaProdag').Value := quPlanningOrderSummaProdag.Value;
                                                                  spAddPlanningOrderSpec.ParamByName('SotrudNo').Value := quPlanningOrderSotrudNo.Value;
                                                                  spAddPlanningOrderSpec.ParamByName('PrognozProdag').Value := quPlanningOrderPrognozProdag.Value;
                                                                  spAddPlanningOrderSpec.Execute;
                                                                  i := i+1;

                                                                  quPlanningOrder.Next;
                                                                end;
                               dmDataModule.ExecSQL('update s_PlanningOrderHead set id = :p1_id ',[MaxPlanningId]);
                               ShowMessage ('Обработано '+IntToStr(i)+' строк.');
                               Showmessage('Создано планирование № '+Label6.Caption+ #10#13 +
                                           'Содержащщее '+inttostr(quPlanningOrder.RecordCount)+' строк планирования.');
                             end;

end;

procedure TPlanningOrderForm.quPlanningOrderBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     spAddPlanningOrderSpec.Close;
     spAddPlanningOrderSpec.ParamByName('PlanningOrderHeadId').Value := StrToInt(Label6.Caption);
     spAddPlanningOrderSpec.ParamByName('TovarNo').Value := quPlanningOrderTovarNo.value;
     spAddPlanningOrderSpec.ParamByName('OtdelNo').Value := quPlanningOrderOtdelNo.value;
     spAddPlanningOrderSpec.ParamByName('TovarName').Value := quPlanningOrderNameTovarShort.value;
     spAddPlanningOrderSpec.ParamByName('Qty').Value :=  quPlanningOrderQty.value;
     spAddPlanningOrderSpec.ParamByName('Summa').Value :=  quPlanningOrderSumma.value;
     spAddPlanningOrderSpec.ParamByName('ColName').Value :=  quPlanningOrderColName.Value;
     spAddPlanningOrderSpec.ParamByName('PriceNow').Value :=  quPlanningOrderPriceNow.Value;
     spAddPlanningOrderSpec.ParamByName('PlanProdag').Value :=  quPlanningOrderPlanProdag.Value;
     spAddPlanningOrderSpec.ParamByName('SummaProdag').Value := quPlanningOrderSummaProdag.Value;
     spAddPlanningOrderSpec.ParamByName('SotrudNo').Value := quPlanningOrderSotrudNo.Value;
     spAddPlanningOrderSpec.ParamByName('PrognozProdag').Value := quPlanningOrderPrognozProdag.Value;
     spAddPlanningOrderSpec.Execute;
   end;
//  quPlanningOrder.ParamByName('PlanningOrderHeadId').Value := StrToInt(Label6.Caption);
//  quPlanningOrderPlanningOrderHeadId.Value := StrToInt(Label6.Caption);

//  if quPlanningOrder.State in [dsInsert, dsEdit] then quPlanningOrder.Cancel;

//  (qu_Contract.State in [dsInsert, dsEdit]) and (is_save = true)

end;

procedure TPlanningOrderForm.Panel1Exit(Sender: TObject);
begin
  inherited;
  if EdDatePlanning.Text = '' then begin
                                     ActiveControl := EdDatePlanning;
                                     raise Exception.Create('Не заполнено обязательное поле Дата планирования');
                                   end;
  if EdDateBeg.Text = '' then begin
                                ActiveControl := EdDateBeg;
                                raise Exception.Create('Не заполнено обязательное поле Начало периода продаж');
                              end;
  if EdDateEnd.Text = '' then begin
                                ActiveControl := EdDateEnd;
                                raise Exception.Create('Не заполнено обязательное поле Окончание периода продаж');
                              end;
end;

procedure TPlanningOrderForm.bbcancelClick(Sender: TObject);
begin
  inherited;
  if ((ActionForm = 'Add') and (IsDelete = true)) then begin
                                                         dmDataModule.ExecSQL('delete PlanningOrderSpec where PlanningOrderHeadId = :p1_PlanningOrderHeadId',[StrToInt(Label6.Caption)]);
                                                         dmDataModule.ExecSQL('delete PlanningOrderHead where Id = :p1_Id',[StrToInt(Label6.Caption)]);
                                                       end;
end;

procedure TPlanningOrderForm.DBGridEhEditDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if quPlanningOrderEditVisible.AsBoolean then
    DBGridEhEdit.Canvas.Font.Color := clRed;
  DBGridEhEdit.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TPlanningOrderForm.quPlanningOrderEditAfterPost(
  DataSet: TDataSet);
var
  Pkey : Int64;
begin
  inherited;
  Pkey := quPlanningOrderEditid.Value;
  quPlanningOrderEdit.Close;
  quPlanningOrderEdit.Open;
  quPlanningOrderEdit.Locate('Id', Pkey, []);
end;

procedure TPlanningOrderForm.quPlanningOrderAfterPost(DataSet: TDataSet);
var
  Pkey : String;
begin
  inherited;
  Pkey := quPlanningOrderpkey.Value;
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  quPlanningOrder.Locate('Pkey', Pkey, []);
end;

procedure TPlanningOrderForm.DBGridEhEditTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  Pkey : Int64;
begin
  inherited;
  Pkey := quPlanningOrderEditid.Value;
  quPlanningOrderEdit.Close;
  case ACol of
    0: quPlanningOrderEdit.MacroByName('_order').Value := 'pos.TovarNo';
    1: quPlanningOrderEdit.MacroByName('_order').Value := 'pos.OtdelNo';
    2: quPlanningOrderEdit.MacroByName('_order').Value := 'SotrudName';
    3: quPlanningOrderEdit.MacroByName('_order').Value := 'VidName';
    4: quPlanningOrderEdit.MacroByName('_order').Value := 'NameTovarShort';
    7: quPlanningOrderEdit.MacroByName('_order').Value := 'pos.ColName';
  end;
  quPlanningOrderEdit.Open;
  quPlanningOrderEdit.Locate('Id', Pkey, []);
end;

procedure TPlanningOrderForm.DBGridEhAddTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  Pkey : String;
begin
  inherited;
  Pkey := quPlanningOrderpkey.Value;
  quPlanningOrder.Close;
  case ACol of
    0: quPlanningOrder.MacroByName('_order').Value := 't.TovarNo';
    1: quPlanningOrder.MacroByName('_order').Value := 'OtdelName';
    2: quPlanningOrder.MacroByName('_order').Value := 'ds.SotrudName';
    3: quPlanningOrder.MacroByName('_order').Value := 'VidName';
    4: quPlanningOrder.MacroByName('_order').Value := 't.NameTovarShort';
    7: quPlanningOrder.MacroByName('_order').Value := 't.ColName';
  end;
  quPlanningOrder.Open;
  quPlanningOrder.Locate('Pkey', Pkey, []);
end;

procedure TPlanningOrderForm.quPlanningOrderEditBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if ActionForm = 'Edit' then
   begin
     spAddPlanningOrderSpec.Close;
     spAddPlanningOrderSpec.ParamByName('PlanningOrderHeadId').Value := StrToInt(Label6.Caption);
     spAddPlanningOrderSpec.ParamByName('TovarNo').Value := quPlanningOrderEditTovarNo.value;
     spAddPlanningOrderSpec.ParamByName('OtdelNo').Value := quPlanningOrderEditOtdelNo.value;
     spAddPlanningOrderSpec.ParamByName('TovarName').Value := quPlanningOrderEditNameTovarShort.value;
     spAddPlanningOrderSpec.ParamByName('Qty').Value :=  quPlanningOrderEditQty.value;
     spAddPlanningOrderSpec.ParamByName('Summa').Value :=  quPlanningOrderEditSumma.value;
     spAddPlanningOrderSpec.ParamByName('ColName').Value :=  quPlanningOrderEditColName.Value;
     spAddPlanningOrderSpec.ParamByName('PriceNow').Value :=  quPlanningOrderEditPriceNow.Value;
     spAddPlanningOrderSpec.ParamByName('PlanProdag').Value :=  quPlanningOrderEditPlanProdag.Value;
     spAddPlanningOrderSpec.ParamByName('SummaProdag').Value := quPlanningOrderEditSummaProdag.Value;
     spAddPlanningOrderSpec.ParamByName('SotrudNo').Value := quPlanningOrderEditSotrudNo.Value;
     spAddPlanningOrderSpec.ParamByName('PrognozProdag').Value := quPlanningOrderEditPrognozProdag.Value;
     spAddPlanningOrderSpec.Execute;
   end;
end;

procedure TPlanningOrderForm.bInsPlanProdClick(Sender: TObject);
var
  Pkey : String;
  i : integer;
begin
  inherited;
  Pkey := quPlanningOrderpkey.Value;
  i := 0;
  quPlanningOrder.DisableControls;
  quPlanningOrder.First;
//  ShowMessage (IntToStr(quPlanningOrder.RecordCount));
  while not quPlanningOrder.Eof do begin
                                     if not quPlanningOrderVisible.AsBoolean then
                                      begin
                                        spAddPlanningOrderSpec.ParamByName('PlanningOrderHeadId').Value := StrToInt(Label6.Caption);
                                        spAddPlanningOrderSpec.ParamByName('TovarNo').Value := quPlanningOrderTovarNo.value;
                                        spAddPlanningOrderSpec.ParamByName('OtdelNo').Value := quPlanningOrderOtdelNo.value;
                                        spAddPlanningOrderSpec.ParamByName('TovarName').Value := quPlanningOrderNameTovarShort.value;
                                        spAddPlanningOrderSpec.ParamByName('Qty').Value :=  quPlanningOrderQty.value;
                                        spAddPlanningOrderSpec.ParamByName('Summa').Value :=  quPlanningOrderSumma.value;
                                        spAddPlanningOrderSpec.ParamByName('ColName').Value :=  quPlanningOrderColName.Value;
                                        spAddPlanningOrderSpec.ParamByName('PriceNow').Value :=  quPlanningOrderPriceNow.Value;
                                        spAddPlanningOrderSpec.ParamByName('PlanProdag').Value := quPlanningOrderPrognozProdag.Value;
                                        spAddPlanningOrderSpec.ParamByName('SummaProdag').Value := quPlanningOrderSummaProdag.Value;
                                        spAddPlanningOrderSpec.ParamByName('SotrudNo').Value := quPlanningOrderSotrudNo.Value;
                                        spAddPlanningOrderSpec.ParamByName('PrognozProdag').Value := quPlanningOrderPrognozProdag.Value;
                                        spAddPlanningOrderSpec.Execute;
                                        i := i+1
                                      end;
                                     quPlanningOrder.Next;
                                   end;
  ShowMessage ('Обработано '+IntToStr(i)+' строк.');
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  quPlanningOrder.Locate('Pkey', Pkey, []);
  quPlanningOrder.EnableControls;
end;

procedure TPlanningOrderForm.EdDatePlanningPropertiesChange(
  Sender: TObject);
begin
  inherited;
  quPlanningOrder.Close;
  quPlanningOrder.ParamByName('DayInMonth').Value := DaysInMonth(EdDatePlanning.Date);
  quPlanningOrder.Open;
end;

procedure TPlanningOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ((ActionForm = 'Add') and (IsDelete = true)) then begin
                                                         dmDataModule.ExecSQL('delete PlanningOrderSpec where PlanningOrderHeadId = :p1_PlanningOrderHeadId',[StrToInt(Label6.Caption)]);
                                                         dmDataModule.ExecSQL('delete PlanningOrderHead where Id = :p1_Id',[StrToInt(Label6.Caption)]);
                                                       end;
end;

procedure TPlanningOrderForm.cbIsIzmPlanProdagClick(Sender: TObject);
begin
  inherited;
  if ActionForm = 'Add' then
   begin
     quPlanningOrder.Close;
     quPlanningOrder.ParamByName('IzmPlanProdag').Value := cbIsIzmPlanProdag.Checked;
     quPlanningOrder.Open;
     Label9.Caption := quPlanningOrderCnt.AsString;
     Label10.Caption := IntToStr(quPlanningOrder.RecordCount);
   end;
  if ActionForm = 'Edit' then
   begin
     quPlanningOrderEdit.Close;
     quPlanningOrderEdit.ParamByName('IzmPlanProdag').Value := cbIsIzmPlanProdag.Checked;
     quPlanningOrderEdit.Open;
   end;
end;

procedure TPlanningOrderForm.Button4Click(Sender: TObject);
begin
  inherited;
  with TListTipNoIncrementRateForPlanProdagForm.Create(Application) do
  try
    quListTipNoIncrementRateForPlanProdag.ParamByName('UserNo').Value := Data.UserNo;
    quListTipNoIncrementRateForPlanProdag.Open;
    quListTipNoIncrementRateForPlanProdag.Edit;
    ShowModal;
  finally
    quListTipNoIncrementRateForPlanProdag.Close;
    Free;
  end;

  quPlanningOrder.Close;
  quPlanningOrder.Open;
  Label9.Caption := quPlanningOrderCnt.AsString;
  Label10.Caption := IntToStr(quPlanningOrder.RecordCount);

end;

procedure TPlanningOrderForm.ftTovarSelectOk(Sender: TObject);
begin
  inherited;
  if ftTovar.Text = '' then begin
                              quPlanningOrderEdit.Close;
                              quPlanningOrderEdit.ParamByName('IsSelectedTovar').Value := 0;
                              quPlanningOrderEdit.Open;
                            end
                       else begin
                              quPlanningOrderEdit.Close;
                              quPlanningOrderEdit.ParamByName('IsSelectedTovar').Value := 1;
                              quPlanningOrderEdit.ParamByName('UserNo').Value := Data.UserNo;
                              quPlanningOrderEdit.ParamByName('SPID').Value := dmDataModule.SPID;
                              quPlanningOrderEdit.Open;
                            end;
end;

procedure TPlanningOrderForm.fltVidTovSelectOk(Sender: TObject);
begin
  inherited;
  if fltVidTov.Text = '' then begin
                                quPlanningOrderEdit.Close;
                                quPlanningOrderEdit.ParamByName('IsSelectedVid').Value := 0;
                                quPlanningOrderEdit.Open;
                              end
                         else begin
                                quPlanningOrderEdit.Close;
                                quPlanningOrderEdit.ParamByName('IsSelectedVid').Value := 1;
                                quPlanningOrderEdit.ParamByName('UserNo').Value := Data.UserNo;
                                quPlanningOrderEdit.ParamByName('SPID').Value := dmDataModule.SPID;
                                quPlanningOrderEdit.Open;
                              end;
end;

procedure TPlanningOrderForm.Button5Click(Sender: TObject);
begin
  inherited;
  with TListTovarNoForPlanningOrderaForm.Create(Application) do
  try
    quListTovarNoForPlanningOrdera.ParamByName('UserNo').Value := Data.UserNo;
    quListTovarNoForPlanningOrdera.Open;
    ShowModal;
  finally
    quListTovarNoForPlanningOrdera.Close;
    Free;
  end;
  quPlanningOrder.Close;
  quPlanningOrder.Open;
  Label9.Caption := quPlanningOrderCnt.AsString;
  Label10.Caption := IntToStr(quPlanningOrder.RecordCount);

end;

end.
