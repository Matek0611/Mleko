unit CrossPaymentsFromPost0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, GridsEh, DBGridEh, ExtCtrls, StdCtrls,
  Mask, DBCtrlsEh, citCtrls, citmask, citDBComboEdit, DB, MemDS, DBAccess,
  MSAccess;

type
  TCrossPaymentsFromPost = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Flt_Post_buh: TcitDBComboEdit;
    dtDateBeg: TDBDateTimeEditEh;
    dtDateEnd: TDBDateTimeEditEh;
    Flt_Post_Buh_Minus: TcitDBComboEdit;
    quPaymentForPost: TMSQuery;
    dsPaymentForPost: TMSDataSource;
    spPaymentForPost: TMSStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    dbEditNaklNom: TDBEditEh;
    dbEditDayDelay: TDBEditEh;
    Recalculation: TButton;
    Label3: TLabel;
    Label4: TLabel;
    quPaymentDelay: TMSQuery;
    dsPaymentDelay: TMSDataSource;
    quPostName: TMSQuery;
    quPostNameName: TStringField;
    CreateGraph: TButton;
    quPaymentDelaySET_ARTICLE_GROUP_ID: TLargeintField;
    quPaymentDelayDay_Delay: TIntegerField;
    quPaymentDelayDay_Delay_Ext: TIntegerField;
    quPaymentDelayNaklNo: TLargeintField;
    Button1: TButton;
    Button2: TButton;
    InsInListPlusPostPayment: TMSStoredProc;
    InsInListMinusPostPayment: TMSStoredProc;
    CheckBoxPostPayment: TCheckBox;
    CheckBoxMinusPostPayment: TCheckBox;
    procedure dtDateBegChange(Sender: TObject);
    procedure dtDateEndChange(Sender: TObject);
    procedure RecalculationClick(Sender: TObject);
    procedure spPaymentForPostAfterOpen(DataSet: TDataSet);
    procedure Flt_Post_Buh_MinusChange(Sender: TObject);
    procedure Flt_Post_buhChange(Sender: TObject);
    procedure CreateGraphClick(Sender: TObject);
    procedure quPaymentForPostAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrossPaymentsFromPost: TCrossPaymentsFromPost;

implementation

uses main, data, ListMinusPostPayment, ListPlusPostPayment;

{$R *.dfm}

procedure TCrossPaymentsFromPost.dtDateBegChange(Sender: TObject);
begin
  inherited;
  quPaymentForPost.Close;
  quPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  quPaymentForPost.Open;

  quPaymentForPost.Refresh;
  DBGridEh1.Refresh;
end;

procedure TCrossPaymentsFromPost.dtDateEndChange(Sender: TObject);
begin
  inherited;
  quPaymentForPost.Close;
  quPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  quPaymentForPost.Open;

  quPaymentForPost.Refresh;
  DBGridEh1.Refresh;
end;

procedure TCrossPaymentsFromPost.RecalculationClick(Sender: TObject);
begin
  inherited;
  if dbEditNaklNom.Value > 0  then dsPaymentDelay.Edit;
  quPaymentDelayNaklNo.Value := dbEditNaklNom.Value;
  quPaymentDelayDay_Delay.Value := 0;
  quPaymentDelayDay_Delay_Ext.Value := dbEditDayDelay.Value;
  quPaymentDelay.Post;
  quPaymentDelay.Close;
  quPaymentDelay.Open;

  spPaymentForPost.Close;
  spPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  spPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  spPaymentForPost.Open;

  spPaymentForPost.Refresh;
  quPaymentForPost.Close;
  quPaymentForPost.Open;
  DBGridEh1.Refresh;

  dbEditNaklNom.Value := 0;
  dbEditDayDelay.Value := 0;

end;

procedure TCrossPaymentsFromPost.spPaymentForPostAfterOpen(
  DataSet: TDataSet);
  var
    PosChar,i : integer;
    PostNoChar : string;
begin
  inherited;
  spPaymentForPost.DisableControls;
  i:=0;
  while i <= DBGridEh1.Columns.Count-1 do
   begin
     PosChar := pos('_',DBGridEh1.Columns[i].FieldName);
     PostNoChar := Copy(DBGridEh1.Columns[i].FieldName,2,PosChar-2);

     if DBGridEh1.Columns[i].FieldName = 'DayPayment' then begin
                                                             DBGridEh1.Columns[i].Title.Caption := 'Дата оплаты';
                                                             i:=i+1
                                                           end;
     if PosChar <> 0 then begin
                            quPostName.Close;
                            quPostName.ParamByName('PostNo').AsInteger := strtoint(PostNoChar);
                            quPostName.Open;
                            DBGridEh1.Columns[i].Title.Caption := quPostName.FieldByName('Name').AsString+'|Номер накладной';
                            DBGridEh1.Columns[i+1].Title.Caption := quPostName.FieldByName('Name').AsString+'|Дата накладной';
                            DBGridEh1.Columns[i+2].Title.Caption := quPostName.FieldByName('Name').AsString+'|Отсрочка';
                            DBGridEh1.Columns[i+3].Title.Caption := quPostName.FieldByName('Name').AsString+'|Доп. отсрочка';
                            DBGridEh1.Columns[i+4].Title.Caption := quPostName.FieldByName('Name').AsString+'|Полная отсрочка';
                            DBGridEh1.Columns[i+5].Title.Caption := quPostName.FieldByName('Name').AsString+'|Сумма накладной';
                            DBGridEh1.Columns[i+6].Title.Caption := quPostName.FieldByName('Name').AsString+'|Оплаченная сумма';
                            DBGridEh1.Columns[i+7].Title.Caption := quPostName.FieldByName('Name').AsString+'|Сумма долга';
                            i := i+8;
                          end;
//     DBGridEh.Columns[i].Title.Caption := 'Title1|SubTitle1'

   end;
  if DBGridEh1.Columns.Count>1 then
   begin
     DBGridEh1.FrozenCols:=1;
     DBGridEh1.Col:=2;
   end;
  spPaymentForPost.EnableControls;
  quPostName.Close;
end;

procedure TCrossPaymentsFromPost.Flt_Post_Buh_MinusChange(Sender: TObject);
begin
  inherited;
  spPaymentForPost.Close;
  if Flt_Post_Buh_Minus.Text = '' then spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 1
                                  else spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 0;
  spPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  spPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  spPaymentForPost.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spPaymentForPost.ParamByName('UserNo').AsInteger := data.UserNo;

  InsInListMinusPostPayment.Close;
  InsInListMinusPostPayment.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  InsInListMinusPostPayment.ParamByName('UserNo').AsInteger := data.UserNo;
  InsInListMinusPostPayment.Execute;

  DBGridEh1.Refresh;
end;

procedure TCrossPaymentsFromPost.Flt_Post_buhChange(Sender: TObject);
begin
  inherited;
  spPaymentForPost.Close;
  if Flt_Post_Buh.Text = '' then spPaymentForPost.ParamByName('isPostNo').AsInteger := 1
                            else spPaymentForPost.ParamByName('isPostNo').AsInteger := 0;
  spPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  spPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  spPaymentForPost.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spPaymentForPost.ParamByName('UserNo').AsInteger := data.UserNo;

  InsInListPlusPostPayment.Close;
  InsInListPlusPostPayment.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  InsInListPlusPostPayment.ParamByName('UserNo').AsInteger := data.UserNo;
  InsInListPlusPostPayment.Execute;
  
  DBGridEh1.Refresh;
end;

procedure TCrossPaymentsFromPost.CreateGraphClick(Sender: TObject);
begin
  inherited;

  DBGridEh1.FrozenCols:=0;
  DBGridEh1.Col:=1;

  spPaymentForPost.Close;



  if Flt_Post_Buh.Text = '' then spPaymentForPost.ParamByName('isPostNo').AsInteger := 1
                            else spPaymentForPost.ParamByName('isPostNo').AsInteger := 0;

  if CheckBoxPostPayment.Checked then begin
                                       // spPaymentForPost.ParamByName('isPostNo').AsInteger := 1;
                                        spPaymentForPost.ParamByName('isPostNoStat').AsInteger := 0;
                                      end
                                 else begin
                                   //     spPaymentForPost.ParamByName('isPostNo').AsInteger := 1;
                                        spPaymentForPost.ParamByName('isPostNoStat').AsInteger := 1;
                                      end;

  if Flt_Post_Buh_Minus.Text = '' then spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 1
                                  else spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 0;

  if CheckBoxMinusPostPayment.Checked then begin
                                    //         spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 1;
                                             spPaymentForPost.ParamByName('isPostNoMinusStat').AsInteger := 0;
                                           end
                                      else begin
                                     //        spPaymentForPost.ParamByName('isPostNoMinus').AsInteger := 1;
                                             spPaymentForPost.ParamByName('isPostNoMinusStat').AsInteger := 1;
                                           end;

  spPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  spPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  spPaymentForPost.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spPaymentForPost.ParamByName('UserNo').AsInteger := data.UserNo;
  spPaymentForPost.Open;


  quPaymentForPost.Close;
  quPaymentForPost.ParamByName('DateBegin').Value := dtDateBeg.Value;
  quPaymentForPost.ParamByName('DateEnd').Value := dtDateEnd.Value;
  quPaymentForPost.Open;


  DBGridEh1.Refresh;

end;

procedure TCrossPaymentsFromPost.quPaymentForPostAfterOpen(
  DataSet: TDataSet);
  var
    PosChar,i : integer;
    PostNoChar : string;
begin
  inherited;
  quPaymentForPost.ControlsDisabled;

  i:=0;
  while i <= DBGridEh1.Columns.Count-1 do
   begin
     PosChar := pos('_',DBGridEh1.Columns[i].FieldName);
     PostNoChar := Copy(DBGridEh1.Columns[i].FieldName,2,PosChar-2);

     if DBGridEh1.Columns[i].FieldName = 'DayPayment' then begin
                                                             DBGridEh1.Columns[i].Title.Caption := 'Дата оплаты';
                                                             i:=i+1
                                                           end;
     if PosChar <> 0 then begin
                            quPostName.Close;
                            quPostName.ParamByName('PostNo').AsInteger := strtoint(PostNoChar);
                            quPostName.Open;
                            DBGridEh1.Columns[i].Title.Caption := quPostName.FieldByName('Name').AsString+'|Номер накладной';
                            DBGridEh1.Columns[i+1].Title.Caption := quPostName.FieldByName('Name').AsString+'|Дата накладной';
                            DBGridEh1.Columns[i+2].Title.Caption := quPostName.FieldByName('Name').AsString+'|Отсрочка';
                            DBGridEh1.Columns[i+3].Title.Caption := quPostName.FieldByName('Name').AsString+'|Доп. отсрочка';
                            DBGridEh1.Columns[i+4].Title.Caption := quPostName.FieldByName('Name').AsString+'|Полная отсрочка';
                            DBGridEh1.Columns[i+5].Title.Caption := quPostName.FieldByName('Name').AsString+'|Сумма накладной';
                            DBGridEh1.Columns[i+6].Title.Caption := quPostName.FieldByName('Name').AsString+'|Оплаченная сумма';
                            DBGridEh1.Columns[i+7].Title.Caption := quPostName.FieldByName('Name').AsString+'|Сумма долга';
                            DBGridEh1.Columns[i+8].Title.Caption := quPostName.FieldByName('Name').AsString+'|Тип накладной';
                            i := i+9;
                          end;
//     DBGridEh.Columns[i].Title.Caption := 'Title1|SubTitle1'

   end;
  if DBGridEh1.Columns.Count>1 then
   begin
     DBGridEh1.FrozenCols:=1;
     DBGridEh1.Col:=2;
   end;
   quPaymentForPost.EnableControls;
end;

procedure TCrossPaymentsFromPost.Button1Click(Sender: TObject);
begin
  inherited;
  with TListMinusPostPaymentForm.Create(Application) do
    try
      quListMinusPostPayment.Open;
      ShowModal;
    finally
      quListMinusPostPayment.Close;
      Free;
    end;
end;

procedure TCrossPaymentsFromPost.Button2Click(Sender: TObject);
begin
  inherited;
  with TListPlusPostPaymentForm.Create(Application) do
    try
      quListPlusPostPayment.Open;
      ShowModal;
    finally
      quListPlusPostPayment.Close;
      Free;
    end;

end;

end.
