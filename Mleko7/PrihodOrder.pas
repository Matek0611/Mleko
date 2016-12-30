unit PrihodOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, ExtCtrls, StdCtrls, GridsEh, DBGridEh,
  Mask, DBCtrlsEh, DB, MemDS, DBAccess, MSAccess, COMPSQLBuilder, DBCtrls,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, citCtrls,
  citmask, citDBComboEdit, Buttons, Excel2000, ActiveX, Registry, ComObj, Math,
  DBLookupEh;

type
  TPrihodOrderForm = class(TCFLMLKCustomForm) // TCFLMLKMDIChildForm  , CFLMLKMDIChild
    paHead: TPanel;
    paGrid: TPanel;
    paButton: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeAnalisDateEnd: TDBDateTimeEditEh;
    dbeAnalisDateBeg: TDBDateTimeEditEh;
    dbeOrderDate: TDBDateTimeEditEh;
    DBGridEh: TDBGridEh;
    dsPrihodOrderHead: TMSDataSource;
    deNamePost: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    quDocType: TMSQuery;
    DsDocType: TDataSource;
    dblBuh: TcxDBLookupComboBox;
    quBuh: TMSQuery;
    DSBuh: TDataSource;
    is_all_Tovar: TCheckBox;
    is_all_TovarOrders: TCheckBox;
    EdTovar: TcitDBComboEdit;
    bbOK: TBitBtn;
    dblDocType: TcxDBLookupComboBox;
    quPrihodOrderHead: TMSQuery;
    quPrihodOrderHeadId: TIntegerField;
    quPrihodOrderHeadOrderNo: TIntegerField;
    quPrihodOrderHeadOrderDate: TDateTimeField;
    quPrihodOrderHeadPostNo: TSmallintField;
    quPrihodOrderHeadPostName: TStringField;
    quPrihodOrderHeadBuh: TSmallintField;
    quPrihodOrderHeadBuhName: TStringField;
    quPrihodOrderHeadSumma: TFloatField;
    quPrihodOrderHeadDoc_Type: TIntegerField;
    quPrihodOrderHeadDocTypeName: TStringField;
    quPrihodOrderHeadAnalisDateBeg: TDateTimeField;
    quPrihodOrderHeadAnalisDateEnd: TDateTimeField;
    quPrihodOrderHeadUserNo: TIntegerField;
    quPrihodOrderHeadUserName: TStringField;
    quPrihodOrderHeadEditUserNo: TIntegerField;
    quPrihodOrderHeadEditUserName: TStringField;
    quPrihodOrderHeadEditOrderDate: TDateTimeField;
    quPrihodOrderHeadPkey: TLargeintField;
    quPrihodOrderHeadOurFirmNo: TIntegerField;
    Flt_Post_Minus: TcitDBComboEdit;
    bbcancel: TBitBtn;
    Button1: TButton;
    InsInListMinusPrihodOrder: TMSStoredProc;
    DBEditEhSumma: TDBEditEh;
    Label7: TLabel;
    bCreateNaklP: TButton;
    quInsInNaklP: TMSQuery;
    Button2: TButton;
    od_ExportExcel: TOpenDialog;
    quPrihodOrderSpec: TMSQuery;
    dsPrihodOrderSpec: TMSDataSource;
    quPrihodOrderSpecTovarNo: TSmallintField;
    quPrihodOrderSpecNameTovar: TStringField;
    quPrihodOrderSpecKolOst: TFloatField;
    quPrihodOrderSpecQtyPricePeriod: TFloatField;
    quPrihodOrderSpecQtyPriceDay: TFloatField;
    quPrihodOrderSpecKolPerPak: TSmallintField;
    quPrihodOrderSpecExpirationDate: TIntegerField;
    quPrihodOrderSpecPrice: TFloatField;
    quPrihodOrderSpecPriceInInst: TFloatField;
    quPrihodOrderSpecKolOrder: TFloatField;
    quPrihodOrderSpecKolPak: TFloatField;
    quPrihodOrderSpecSumma: TFloatField;
    quPrihodOrderSpecDocument_Id: TIntegerField;
    quPrihodOrderSpecDocument_Pkey: TLargeintField;
    quPrihodOrderSpecOrderDate: TDateTimeField;
    quPrihodOrderSpecUserNom: TIntegerField;
    quPrihodOrderSpecEditUserNom: TIntegerField;
    quPrihodOrderSpecNo_pp: TIntegerField;
    DBLSablonName: TDBLookupComboboxEh;
    Button3: TButton;
    spEditPrihodOrderShablon: TMSStoredProc;
    quListShablonName: TMSQuery;
    dsListShablonName: TMSDataSource;
    Label8: TLabel;
    Button4: TButton;
    QuSetArtGroup: TMSQuery;
    QuSetArtGroupPOSTNO: TLargeintField;
    QuSetArtGroupDAY_DELAY: TIntegerField;
    QuSetArtGroupDAY_DELAY_EXT: TIntegerField;
    QuSetArtGroupExtDelay: TIntegerField;
    QuSetArtGroupNAME: TStringField;
    QuSetArtGroupNamePost: TStringField;
    QuSetArtGroupFullName: TStringField;
    QuSetArtGroupBuh: TLargeintField;
    QuSetArtGroupid: TStringField;
    QuSetArtGroupSET_ARTICLE_GROUP_ID: TLargeintField;
    dsSetArtGroup: TMSDataSource;
    Label9: TLabel;
    quDelayForNaklP: TMSQuery;
    dsDelayForNaklP: TMSDataSource;
    DBlDelayForNaklP: TDBLookupComboboxEh;
    quDelayForNaklPid: TStringField;
    quDelayForNaklPPOSTNO: TLargeintField;
    quDelayForNaklPDAY_DELAY: TIntegerField;
    quDelayForNaklPDAY_DELAY_EXT: TIntegerField;
    quDelayForNaklPExtDelay: TIntegerField;
    quDelayForNaklPSET_ARTICLE_GROUP_ID: TLargeintField;
    quDelayForNaklPNAME: TStringField;
    quDelayForNaklPNamePost: TStringField;
    quDelayForNaklPBuh: TLargeintField;
    quDelayForNaklPFullName: TStringField;
    procedure deNamePostDblClick(Sender: TObject);
    procedure ChangePost;
    procedure SelectTovarClick(Sender: TObject);
    procedure EdTovarChange(Sender: TObject);
    procedure is_all_TovarClick(Sender: TObject);
    procedure is_all_TovarOrdersClick(Sender: TObject);
    procedure DBGridEhKeyPress(Sender: TObject; var Key: Char);
    procedure bbOKClick(Sender: TObject);
    procedure quPrihodOrderHeadNewRecord(DataSet: TDataSet);
    procedure paHeadExit(Sender: TObject);
    procedure dblDocTypeExit(Sender: TObject);
    procedure dblDocTypePropertiesChange(Sender: TObject);
    procedure dblDocTypePropertiesNewLookupDisplayText(Sender: TObject;
      const AText: TCaption);
    procedure DBGridEhKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quPrihodOrderSpecBeforePost(DataSet: TDataSet);
    procedure dbeOrderDateClick(Sender: TObject);
    procedure dbeAnalisDateBegClick(Sender: TObject);
    procedure dbeAnalisDateEndClick(Sender: TObject);
    procedure EdTovarSelectOk(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Flt_Post_MinusChange(Sender: TObject);
    procedure bCreateNaklPClick(Sender: TObject);
    procedure quPrihodOrderSpecAfterPost(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEhTitleClick(Column: TColumnEh);
    procedure DBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure DBLSablonNameChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure dblBuhExit(Sender: TObject);

  private
     Pkey1 : Int64;
     SearchString:string;
     function IsOLEObjectInstalled(Name:string):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrihodOrderForm: TPrihodOrderForm;
  PostNo, Document_Id, UserNo : integer;
  PkeyPrihodOrder : Int64;
  OrderDate : TDateTime;
  Spid : integer;

procedure PrihodOrders(Action: String; var Pkey: Int64);
implementation

uses data, main, Post0, MlekoSelectTovar, ListMinusPrihodOrder, ShablonName,
     MlekoDbDsMSSQL, PatternPrihodOrder;

{$R *.dfm}

procedure PrihodOrders(Action: String; var Pkey: Int64);
var
  Dlg : TPrihodOrderForm;

begin
  Dlg := TPrihodOrderForm.Create(Application);

  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;
  dmDataModule.QFO.SQL.Add('select @@SPID as Spid');
  dmDataModule.QFO.Open;
  Spid := dmDataModule.QFO.FieldByName('Spid').Value;
  dmDataModule.QFO.Close;
  dmDataModule.QFO.SQL.Clear;

  Dlg.quDocType.Open;
  Dlg.quBuh.Open;
  Dlg.quListShablonName.Open;
  Dlg.quDelayForNaklP.Open;

  try
    if Action = 'Add' then
     begin
       Dlg.quPrihodOrderHead.Open;

       Dlg.bCreateNaklP.Visible := false;

       Dlg.dbeOrderDate.Value := GlobalDateNakl;
       Dlg.dbeAnalisDateBeg.Value := GlobalDateNakl - 30;
       Dlg.dbeAnalisDateEnd.Value := GlobalDateNakl - 1;

       Dlg.quPrihodOrderHead.FieldByName('UserNo').Value := Data.UserNo;
       Dlg.quPrihodOrderHead.FieldByName('EditUserNo').Value := Data.UserNo;
       Dlg.quPrihodOrderHead.FieldByName('EditOrderDate').Value := GlobalDateNakl - 1;
       Dlg.quPrihodOrderHead.FieldByName('OurFirmNo').Value := GlobalOurFirmNo;

       dmDataModule.QFO.Close;
       dmDataModule.QFO.SQL.Clear;
       dmDataModule.QFO.SQL.Add('select -1*cast(cast(newid() as binary(16)) as bigint) as new_id');
       dmDataModule.QFO.Open;
       PkeyPrihodOrder := dmDataModule.QFO.FieldByName('new_id').Value;
       Dlg.quPrihodOrderHead.FieldByName('Pkey').Value := PkeyPrihodOrder;
       dmDataModule.QFO.Close;
       dmDataModule.QFO.SQL.Clear;

       dmDataModule.spGetPrihodOrderNo.Open;
       Dlg.quPrihodOrderHead.FieldByName('OrderNo').Value := dmDataModule.spGetPrihodOrderNoOrderNo.AsInteger;
       dmDataModule.spGetPrihodOrderNo.Close;

       dlg.Pkey1 := Pkey;
       Dlg.quPrihodOrderSpec.ParamByName('Document_Pkey').Value := Pkey;
       Dlg.quPrihodOrderSpec.ParamByName('UserNo').Value := data.UserNo;
       Dlg.quPrihodOrderSpec.ParamByName('SPID').Value := Spid;
       Dlg.quPrihodOrderSpec.ParamByName('DataBeg').Value := Dlg.dbeAnalisDateBeg.Value;
       Dlg.quPrihodOrderSpec.ParamByName('DataEnd').Value := Dlg.dbeAnalisDateEnd.Value;
       Dlg.quPrihodOrderSpec.Open;
       Dlg.is_all_TovarOrders.Checked := true;
     end;
    if Action = 'Edit' then
     begin
       Dlg.quPrihodOrderHead.ParamByName('Pkey').Value := Pkey;
       PkeyPrihodOrder := Pkey;




       Dlg.bCreateNaklP.Visible := true;

       Dlg.quPrihodOrderHead.Open;

       OrderDate := Dlg.quPrihodOrderHead.FieldByName('OrderDate').Value;

       Dlg.dbeOrderDate.Value := Dlg.quPrihodOrderHead.FieldByName('OrderDate').Value;
       Dlg.dbeAnalisDateBeg.Value := Dlg.quPrihodOrderHead.FieldByName('AnalisDateBeg').Value;
       Dlg.dbeAnalisDateEnd.Value := Dlg.quPrihodOrderHead.FieldByName('AnalisDateEnd').Value;

       Dlg.deNamePost.Text := Dlg.quPrihodOrderHead.FieldByName('PostName').AsString;
       Dlg.dblDocType.Text := Dlg.quPrihodOrderHead.FieldByName('DocTypeName').AsString;
       Dlg.dblBuh.Text := Dlg.quPrihodOrderHead.FieldByName('BuhName').AsString;

       Dlg.quPrihodOrderHead.FieldByName('EditUserNo').Value := Data.UserNo;

       Dlg.quPrihodOrderSpec.ParamByName('Document_Pkey').Value := Pkey;
       Dlg.quPrihodOrderSpec.ParamByName('UserNo').Value := data.UserNo;
       Dlg.quPrihodOrderSpec.ParamByName('SPID').Value := Spid;
       Dlg.quPrihodOrderSpec.ParamByName('DataBeg').Value := Dlg.quPrihodOrderHead.FieldByName('AnalisDateBeg').Value;
       Dlg.quPrihodOrderSpec.ParamByName('DataEnd').Value := Dlg.quPrihodOrderHead.FieldByName('AnalisDateEnd').Value;
       Dlg.is_all_TovarOrders.Checked := true;
       Dlg.quPrihodOrderSpec.Open;

       Dlg.quDelayForNaklP.Close;
       Dlg.quDelayForNaklP.ParamByName('PostNo').Value := Dlg.quPrihodOrderHead.FieldByName('PostNo').Value;
       Dlg.quDelayForNaklP.ParamByName('Buh').Value := Dlg.quPrihodOrderHead.FieldByName('Buh').Value;
       Dlg.quDelayForNaklP.Open;
       Dlg.quDelayForNaklP.Refresh;

//       Dlg.is_all_TovarOrders.Checked := true;
       Dlg.is_all_Tovar.Checked := false;

//       showmessage(inttostr(dlg.quPrihodOrderSpec.RecordCount));
       Dlg.DBGridEh.Refresh;
     end;
    Dlg.ShowModal;
  finally
    Dlg.quPrihodOrderSpec.Close;
    Dlg.quPrihodOrderHead.Close;
    Dlg.quBuh.Close;
    Dlg.quDocType.Close;
    Dlg.quListShablonName.Close;
    Dlg.Free;
  end;
end;

function TPrihodOrderForm.IsOLEObjectInstalled(Name:string):boolean;
var
  ClassID : TCLSID;
  Rez     : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)),ClassID);
  if Rez=S_OK then
  // Объект найден
                Result := true
              else
                Result := false;
end;

procedure TPrihodOrderForm.deNamePostDblClick(Sender: TObject);
begin
  inherited;
  ChangePost;
end;

procedure TPrihodOrderForm.ChangePost;
var
  RetPost: TRetPost;
begin
  RetPost := Post(True, True);
  if RetPost.PostNo <> 0 then
  begin
    if not (quPrihodOrderHead.State in [dsInsert, dsEdit]) then
    quPrihodOrderHead.Edit;
    quPrihodOrderHead.FieldByName('PostNo').AsInteger := RetPost.PostNo;
    quPrihodOrderHead.FieldByName('PostName').AsString := RetPost.NamePost;
    deNamePost.Text := RetPost.NamePost;
    PostNo := RetPost.PostNo;
    ActiveControl := dblDocType;

    quDelayForNaklP.Close;
    quDelayForNaklP.ParamByName('PostNo').Value := RetPost.PostNo;
    quDelayForNaklP.Open;
    quDelayForNaklP.Refresh;

  end;
end;


procedure TPrihodOrderForm.SelectTovarClick(Sender: TObject);
begin
  inherited;
  begin
     with TMlekoSelectTovarDlg.Create(Application) do
       try
         is_multiselect := true;
         ShowModal;
       finally
         Free;
       end;
  end;
end;


procedure TPrihodOrderForm.EdTovarChange(Sender: TObject);
begin
  inherited;
{
  if is_all_TovarOrders.Checked then quPrihodOrderSpec.ParamByName('is_all_TovarOrders').Value := 1
                                else quPrihodOrderSpec.ParamByName('is_all_TovarOrders').Value := 0;
  quPrihodOrderSpec.Open;
  DBGridEh.Refresh;
  }
end;

procedure TPrihodOrderForm.is_all_TovarClick(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.Close;
  if is_all_Tovar.Checked then begin
                                 is_all_TovarOrders.Checked := false;
                                 DBLSablonName.Text := '';
                                 quPrihodOrderSpec.MacroByName('_where').Value := ''
                               end
                          else if is_all_TovarOrders.Checked then begin
                                                                    quPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
                                                                    quPrihodOrderSpec.MacroByName('_where').Value := 'and t.TovarNo in (select TovarNo from E_PrihodOrderSpec where Document_Pkey = @Document_Pkey)'
                                                                  end
                                                             else begin
                                                                    quPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
                                                                    quPrihodOrderSpec.MacroByName('_where').Value := 'and t.TovarNo in (select cast(Param_Value as int)    '+
                                                                                                                     '                   from e_Session_Params               '+
                                                                                                                     '                    where Userno = @UserNo             '+
                                                                                                                     '                      and Owner_Name = ''PrihodOrder'' '+
                                                                                                                     '                      and Param_Name = ''EDTOVAR''     '+
                                                                                                                     '                      and Spid = @SPID)                ';
                                                                    end;
  quPrihodOrderSpec.Open;
  DBGridEh.Refresh;
end;

procedure TPrihodOrderForm.is_all_TovarOrdersClick(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.Close;
  if is_all_TovarOrders.Checked then begin
                                       is_all_Tovar.Checked := false;
                                       DBLSablonName.Text := '';
                                       quPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
                                       quPrihodOrderSpec.MacroByName('_where').Value := 'and t.TovarNo in (select TovarNo from E_PrihodOrderSpec where Document_Pkey = @Document_Pkey)'
                                     end
                                else begin
                                       quPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
                                       quPrihodOrderSpec.MacroByName('_where').Value := 'and t.TovarNo in (select cast(Param_Value as int)    '+
                                                                                      '                   from e_Session_Params               '+
                                                                                      '                    where Userno = @UserNo             '+
                                                                                      '                      and Owner_Name = ''PrihodOrder'' '+
                                                                                      '                      and Param_Name = ''EDTOVAR''     '+
                                                                                      '                      and Spid = @SPID)                ';
                                       if is_all_Tovar.Checked then quPrihodOrderSpec.MacroByName('_where').Value := '';
                                     end;
  quPrihodOrderSpec.Open;
  DBGridEh.Refresh;
end;

procedure TPrihodOrderForm.DBGridEhKeyPress(Sender: TObject;
  var Key: Char);
var
  Price, KolOrder, Summa : real;
  KolPak, KolPerPak : integer;
  Found : boolean;
begin
  inherited;
  quPrihodOrderSpec.Edit;
  Price := quPrihodOrderSpec.FieldByName('Price').Value;
  KolPerPak := quPrihodOrderSpec.FieldByName('KolPerPak').Value;
  if DBGridEh.SelectedField.DisplayLabel = 'KolOrder' then begin
                                                             KolOrder := DBGridEh.SelectedField.Value; //quPrihodOrderSpec.FieldByName('KolOrder').Value;
                                                             quPrihodOrderSpec.FieldByName('KolPak').Value := RoundTo(KolOrder/KolPerPak,-2);
                                                           end;
  Summa := Price * KolOrder;
  quPrihodOrderSpec.FieldByName('Summa').Value :=  Summa;

  if DBGridEh.SelectedField.DisplayLabel = 'KolPak' then begin
                                                           KolPak := DBGridEh.SelectedField.Value;
                                                           quPrihodOrderSpec.FieldByName('KolOrder').Value := KolPak * KolPerPak;
                                                           quPrihodOrderSpec.FieldByName('Summa').Value := KolPak * KolPerPak * Price;
                                                         end;

  if DBGridEh.SelectedField.DisplayLabel = 'NameTovar' then begin
                                                               if (Key in Data.SearchSet) then
                                                                begin
                                                                  SearchString:=SearchString+Key;
                                                                  Key:=Chr(0);
                                                                  Found:=False;
                                                                  try
                                                                    Found:=DBGridEh.DataSource.DataSet.Locate(DBGridEh.Columns[DBGridEh.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
                                                                  except
                                                                    SearchString:='';
                                                                  end;
                                                                  if (not Found) and (DBGridEh.Columns[DBGridEh.Col].Field.DataType=ftString) then
                                                                   SearchString:=Copy(SearchString,1,length(SearchString)-1);
                                                                end;
                                                            end;

  DBGridEh.Refresh;
end;

procedure TPrihodOrderForm.bbOKClick(Sender: TObject);
var
  InsInPrihodOrderSpec : TMSQuery;
begin
  inherited;
  if quPrihodOrderHead.State in [dsInsert, dsEdit] then quPrihodOrderHead.Post;
  if quPrihodOrderSpec.State in [dsInsert, dsEdit] then quPrihodOrderSpec.Post;
{
  if quPrihodOrderSpec.State = dsInsert then
   begin
     quPrihodOrderHead.Close;
     quPrihodOrderHead.ParamByName('Pkey').Value := PkeyPrihodOrder;
     quPrihodOrderHead.Open;
     Document_Id := quPrihodOrderHead.FieldByName('Id').AsInteger;
     OrderDate := quPrihodOrderHead.FieldByName('OrderDate').AsDateTime;
     UserNo := quPrihodOrderHead.FieldByName('UserNo').AsInteger;
     quPrihodOrderHead.Close;


     quPrihodOrderSpec.First;
     while not quPrihodOrderSpec.Eof do
       begin
         InsInPrihodOrderSpec := TMSQuery.Create(nil);
         InsInPrihodOrderSpec.Connection:= dmDataModule.DB;
         InsInPrihodOrderSpec.SQL.Clear;
         InsInPrihodOrderSpec.SQL.Text:='insert into PrihodOrderSpec ( Document_Id    '+
                                        '                            ,OrderDate      '+
                                        '                            ,TovarNo        '+
                                        '                            ,Kol            '+
                                        '                            ,Price          '+
                                        '                            ,PriceInInst    '+
                                        '                            ,KolOstatok     '+
                                        '                            ,KolSalePeriod  '+
                                        '                            ,UserNo         '+
                                        '                            ,EditUserNo     '+
                                        '                            ,EditDate       '+
                                        '                            ,OurFirmNo      '+
                                        '                            ,Document_Pkey) '+
                                        '                    values ( :Document_Id   '+
                                        '                            ,:OrderDate     '+
                                        '                            ,:TovarNo       '+
                                        '                            ,:Kol           '+
                                        '                            ,:Price         '+
                                        '                            ,:PriceInInst   '+
                                        '                            ,:KolOstatok    '+
                                        '                            ,:KolSalePeriod '+
                                        '                            ,:UserNo        '+
                                        '                            ,:EditUserNo    '+
                                        '                            ,getdate()      '+
                                        '                            ,:OurFirmNo     '+
                                        '                            ,:Document_Pkey)';
         InsInPrihodOrderSpec.Prepare;
         InsInPrihodOrderSpec.ParamByName('Document_Id').Value := Document_Id;
         InsInPrihodOrderSpec.ParamByName('OrderDate').Value := OrderDate;
         InsInPrihodOrderSpec.ParamByName('TovarNo').Value :=  quPrihodOrderSpec.FieldByName('TovarNo').Value;
         InsInPrihodOrderSpec.ParamByName('Kol').Value := quPrihodOrderSpec.FieldByName('KolOrder').Value;
         InsInPrihodOrderSpec.ParamByName('Price').Value := quPrihodOrderSpec.FieldByName('PriceInInst').Value;
         InsInPrihodOrderSpec.ParamByName('PriceInInst').Value := quPrihodOrderSpec.FieldByName('PriceInInst').Value;
         InsInPrihodOrderSpec.ParamByName('KolOstatok').Value := quPrihodOrderSpec.FieldByName('KolOst').Value;
         InsInPrihodOrderSpec.ParamByName('KolSalePeriod').Value := quPrihodOrderSpec.FieldByName('QtyPricePeriod').Value;
         InsInPrihodOrderSpec.ParamByName('UserNo').Value := data.UserNo;
         InsInPrihodOrderSpec.ParamByName('EditUserNo').Value := data.UserNo;
         InsInPrihodOrderSpec.ParamByName('OurFirmNo').Value := GlobalOurFirmNo;
         InsInPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
         if quPrihodOrderSpec.FieldByName('KolOrder').Value > 0 then InsInPrihodOrderSpec.Execute;
         InsInPrihodOrderSpec.Close;

         quPrihodOrderSpec.Next;
       end;
   end;
}
end;

procedure TPrihodOrderForm.quPrihodOrderHeadNewRecord(DataSet: TDataSet);
var
  OrderDate, AnalisDateBeg, AnalisDateEnd : TDateTime;
  formattedDateTime : String;
begin
  inherited;
{
  DateTimeToString(formattedDateTime, 'c', dbeOrderDate.da);
  OrderDate := StrToDateTime(formattedDateTime);
  quPrihodOrderHead.FieldByName('OrderDate').Value := OrderDate;

  DateTimeToString(formattedDateTime, 'c', dbeAnalisDateBeg.Date);
  AnalisDateBeg := StrToDateTime(formattedDateTime);
  quPrihodOrderHead.FieldByName('AnalisDateBeg').Value := AnalisDateBeg;

  DateTimeToString(formattedDateTime, 'c', dbeAnalisDateEnd.Date);
  AnalisDateEnd := StrToDateTime(formattedDateTime);
  quPrihodOrderHead.FieldByName('AnalisDateEnd').Value := AnalisDateEnd;

  quPrihodOrderHead.FieldByName('UserNo').Value := Data.UserNo;
  quPrihodOrderHead.FieldByName('EditUserNo').Value := Data.UserNo;
  quPrihodOrderHead.FieldByName('EditOrderDate').Value := GlobalDateNakl - 1;
  quPrihodOrderHead.FieldByName('OurFirmNo').Value := GlobalOurFirmNo;




  quPrihodOrderHead.FieldByName('PostNo').Value := PostNo;
  quPrihodOrderHead.FieldByName('Buh').Value := dblBuh.
  quPrihodOrderHead.FieldByName('EditUserNo').Value :=
}
end;

procedure TPrihodOrderForm.paHeadExit(Sender: TObject);
var
 isPost : boolean;
begin
  inherited;
  isPost := true;
  quPrihodOrderHead.ParamByName('Pkey').Value := PkeyPrihodOrder;
  quPrihodOrderHead.Edit;
  if deNamePost.Text = '' then begin
                                 ShowMessage('Не заполнено обязательное поле: ''Поставщик''!');
                                 ActiveControl := deNamePost;
                                 isPost := false;
                               end;
  if dblDocType.Text = '' then begin
                                 ShowMessage('Не заполнено обязательное поле: ''Вид документа''!');
                                 ActiveControl := dblDocType;
                                 isPost := false;
                               end;
  if dblBuh.Text = '' then begin
                             ShowMessage('Не заполнено обязательное поле: ''Бухгалтерский тип''!');
                             ActiveControl := dblBuh;
                             isPost := false;
                           end;
  if DBlDelayForNaklP.Text = '' then begin
                                       ShowMessage('Не заполнено обязательное поле: ''Набор отсрочки''!');
                                       ActiveControl := DBlDelayForNaklP;
                                       isPost := false;
                                     end;
  if isPost then quPrihodOrderHead.Post;

end;

procedure TPrihodOrderForm.dblDocTypeExit(Sender: TObject);
begin
  inherited;
  ActiveControl := dblBuh;
end;

procedure TPrihodOrderForm.dblDocTypePropertiesChange(Sender: TObject);
begin
  inherited;
  dblDocType.Text := quDocType.FieldByName('name').AsString;
end;



procedure TPrihodOrderForm.dblDocTypePropertiesNewLookupDisplayText(
  Sender: TObject; const AText: TCaption);
begin
  inherited;
  dblDocType.Text := quDocType.FieldByName('name').AsString;  //dblDocType
end;

procedure TPrihodOrderForm.DBGridEhKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{
  if ((Key = VK_DOWN) or (Key = VK_INSERT)) and (DBGridEh.DataSource.DataSet.State in [dsInsert]) then
    quPrihodOrderSpec.Post;
 }
end;

procedure TPrihodOrderForm.quPrihodOrderSpecBeforePost(DataSet: TDataSet);
begin
  inherited;
  quPrihodOrderHead.Close;
  quPrihodOrderHead.ParamByName('Pkey').Value := PkeyPrihodOrder;
  quPrihodOrderHead.Open;
  Document_Id := quPrihodOrderHead.FieldByName('Id').AsInteger;
  OrderDate := quPrihodOrderHead.FieldByName('OrderDate').AsDateTime;
  UserNo := quPrihodOrderHead.FieldByName('UserNo').AsInteger;
//  quPrihodOrderHead.Close;

  quPrihodOrderSpec.FieldByName('Document_Pkey').Value := PkeyPrihodOrder;
  quPrihodOrderSpec.FieldByName('Document_Id').Value := Document_Id;
  quPrihodOrderSpec.FieldByName('OrderDate').Value := OrderDate;
  quPrihodOrderSpec.FieldByName('UserNom').Value := UserNo;
  quPrihodOrderSpec.FieldByName('EditUserNom').Value := Data.UserNo;

end;


procedure TPrihodOrderForm.dbeOrderDateClick(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.FieldByName('OrderDate').Value := dbeOrderDate.Value;
end;

procedure TPrihodOrderForm.dbeAnalisDateBegClick(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.FieldByName('AnalisDateBeg').Value := dbeAnalisDateBeg.Value;
end;

procedure TPrihodOrderForm.dbeAnalisDateEndClick(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.FieldByName('AnalisDateEnd').Value := dbeAnalisDateEnd.Value;
end;


procedure TPrihodOrderForm.EdTovarSelectOk(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.Close;
  quPrihodOrderSpec.ParamByName('Document_Pkey').Value := Pkey1;
  quPrihodOrderSpec.ParamByName('UserNo').Value := data.UserNo;
  quPrihodOrderSpec.ParamByName('SPID').Value := Spid;
  quPrihodOrderSpec.ParamByName('DataBeg').Value := dbeAnalisDateBeg.Value;
  quPrihodOrderSpec.ParamByName('DataEnd').Value := dbeAnalisDateEnd.Value;
  is_all_TovarOrders.Checked := false;
  quPrihodOrderSpec.Open;
  DBGridEh.Refresh;
end;

procedure TPrihodOrderForm.bbcancelClick(Sender: TObject);
begin
  inherited;
  if quPrihodOrderHead.State in [dsInsert, dsEdit] then quPrihodOrderHead.Cancel;
  if quPrihodOrderSpec.State in [dsInsert, dsEdit] then quPrihodOrderSpec.Cancel;
end;

procedure TPrihodOrderForm.Button1Click(Sender: TObject);
begin
  inherited;
  with TListMinusPrihodOrderForm.Create(Application) do
    try
      quListMinusPrihodOrder.Open;
      ShowModal;
    finally
      quListMinusPrihodOrder.Close;
      Free;
    end;
end;

procedure TPrihodOrderForm.Flt_Post_MinusChange(Sender: TObject);
begin
  inherited;
  InsInListMinusPrihodOrder.Close;
  InsInListMinusPrihodOrder.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  InsInListMinusPrihodOrder.ParamByName('UserNo').AsInteger := data.UserNo;
  InsInListMinusPrihodOrder.Execute;
end;

procedure TPrihodOrderForm.bCreateNaklPClick(Sender: TObject);
var
  quPrihodOrderSpecForCreateNaklP : TMSQuery;
  quInsInD_Control_PriceInInst : TMSQuery;
  quPriceInInst                : TMSQuery;
  quNaklP                      : TMSQuery;
  a,b,c,PriceInInst            : Currency;
  Delta                        : Boolean;
  l_str                        : string;
  is_Post                      : Boolean;
begin
  inherited;

  quInsInNaklP.Close;
  quInsInNaklP.ParamByName('PostNo').Value := quPrihodOrderHeadPostNo.Value;
  quInsInNaklP.ParamByName('Buh').Value := quPrihodOrderHeadBuh.Value;
  quInsInNaklP.ParamByName('Doc_Type').Value := quPrihodOrderHeadDoc_Type.Value;
  quInsInNaklP.ParamByName('UserNo').Value := data.UserNo;
  quInsInNaklP.ParamByName('DateNakl').Value := OrderDate;
  quInsInNaklP.ParamByName('DatePrih').Value := OrderDate;
  quInsInNaklP.ParamByName('SET_ARTICLE_GROUP_ID').Value := quDelayForNaklPSET_ARTICLE_GROUP_ID.Value;
  quInsInNaklP.ParamByName('Day_Delay').Value := QuSetArtGroupDAY_DELAY.Value;
  quInsInNaklP.ParamByName('Day_Delay_Ext').Value := quDelayForNaklPDAY_DELAY_EXT.Value;
//  quInsInNaklP.ParamByName('').Value :=
  quInsInNaklP.Prepare;
  quInsInNaklP.Execute;

  quNaklP := TMSQuery.Create(nil);
  quNaklP.Connection:= dmDataModule.DB;
  quNaklP.SQL.Clear;
  quNaklP.SQL.Text := 'select NaklNo, Pkey from NaklP where NaklNo = (select max(NaklNo) from NaklP)';
  quNaklP.Prepare;
  quNaklP.Open;

  quPrihodOrderSpecForCreateNaklP := TMSQuery.Create(nil);
  quPrihodOrderSpecForCreateNaklP.Connection:= dmDataModule.DB;
  quPrihodOrderSpecForCreateNaklP.SQL.Clear;
  quPrihodOrderSpecForCreateNaklP.SQL.Text:='select *                      '+
                                            ' from E_PrihodOrderSpec       '+
                                            '  where Document_Pkey = :Pkey ';
  quPrihodOrderSpecForCreateNaklP.Prepare;
  quPrihodOrderSpecForCreateNaklP.ParamByName('Pkey').Value := quPrihodOrderHeadPkey.Value;
  quPrihodOrderSpecForCreateNaklP.Open;
  quPrihodOrderSpecForCreateNaklP.First;

  while not quPrihodOrderSpecForCreateNaklP.Eof do
   begin
     is_Post := True;
     quPriceInInst:=TMSQuery.Create(nil);
     quPriceInInst.Connection:=dmDataModule.DB;
     quPriceInInst.SQL.Clear;
     quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo ';
     quPriceInInst.ParamByName('TovarNo').Value := quPrihodOrderSpecForCreateNaklP.FieldByName('TovarNo').Value;
     quPriceInInst.Open;

     a:=  quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst;
     b:=  quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst;
     c:=  quPrihodOrderSpecForCreateNaklP.FieldByName('Price').Value;

     if ((a <= c) and (c <= b)) then Delta := True
                                else Delta := False;

     if Delta = False
      then begin
             l_str := 'Цена '+floattostr(c)+ 'не входит в допустимый интервал цены.' + #10#13 +
                      'Допустимый интервал: с ' + floattostr(a) +
                      ' по ' + floattostr(b) + #10#13 +
                      'Продолжить (Да) отменить (Нет)?';
             if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then begin
                                                                                           quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
                                                                                           quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
                                                                                           quInsInD_Control_PriceInInst.SQL.Clear;
                                                                                           quInsInD_Control_PriceInInst.SQL.Text:= 'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName,Dhead_id)'
                                                                                                                                  +'values (:UserNo,:TovarNo,:PriceInInst,:Price_ECO,GetDate(),:PostNo,HOST_NAME(),:Dhead_id)';
                                                                                           quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := quPrihodOrderSpecForCreateNaklP.FieldByName('TovarNo').Value;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Dhead_id').Value := quNaklP.FieldByName('Pkey').Value;
                                                                                           quInsInD_Control_PriceInInst.Execute;
                                                                                           is_Post := True;
                                                                                         end
                                                                                    else begin
                                                                                           is_Post := False;
                                                                                           ShowMessage('Отменено пользователем');

                                                                                         end;

           end;

     quPriceInInst.Close;

     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Open;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Insert;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger := quPrihodOrderSpecForCreateNaklP.FieldByName('TovarNo').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('qty').AsFloat := quPrihodOrderSpecForCreateNaklP.FieldByName('Kol').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat := quPrihodOrderSpecForCreateNaklP.FieldByName('Price').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value := quNaklP.FieldByName('Pkey').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('DateOfManufacture').Value := DateOfManufacture;

//     showmessage (quPrihodOrderSpecForCreateNaklP.FieldByName('Kol').AsString);

     if is_Post = True then begin
//                              dmDataModule.ExecSQL('insert into l_PriceInInstForNaklP (Dhead_ID,TovarNo,PriceInInst) values (:p1_Dhead_ID,:p2_TovarNo,:p3_PriceInInst)',[TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value,quPrihodOrderSpecForCreateNaklP.FieldByName('TovarNo').Value,PriceInInst]);
                              TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
                            end
                       else TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;

     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Close;

     quPrihodOrderSpecForCreateNaklP.Next;
   end;
   ShowMessage('Создана приходная накладная номер :' + quNaklP.FieldByName('NaklNo').AsString );
end;

procedure TPrihodOrderForm.quPrihodOrderSpecAfterPost(DataSet: TDataSet);
begin
  inherited;
  quPrihodOrderHead.Close;
  quPrihodOrderHead.ParamByName('Pkey').Value := PkeyPrihodOrder;
  quPrihodOrderHead.Open;
end;

procedure TPrihodOrderForm.Button2Click(Sender: TObject);
 var
   cls_ExcelObject: string;
   WorkSheet: Variant;
   Excel: Variant;
   RegData: TRegistry;
   index, i : integer;
begin
  inherited;
  // Это для того, чтобы не применять локальные
  // для каждой версии
  // названия "Excel.Application.8", "Excel.Application.9".

  cls_ExcelObject := 'Excel.Application';
  RegData := TRegistry.Create;
  RegData.RootKey := HKEY_CLASSES_ROOT;
  try
    if RegData.OpenKey('\Excel.Application\CurVer', False) then
    begin
      cls_ExcelObject := regData.ReadString('');
      RegData.CloseKey;
    end
  finally
    regData.Free;
  end;

  if not IsOLEObjectInstalled(cls_ExcelObject) then
   begin
     ShowMessage('Excel не установлен.');
     exit;
   end;

  // Вот теперь откроем Excel
  Excel := CreateOleObject(cls_ExcelObject);

  // Отключаем реакцию Excel на события,
  // чтобы ускорить обработку информации информации
  // и делаем процесс невидимым

  Excel.Application.ScreenUpdating := False;
  Excel.Application.EnableEvents := false;
  Excel.Application.Interactive := False;
  Excel.Application.DisplayAlerts := False;
//  Excel.ActiveSheet.DisplayPageBreaks := False;
  Excel.Application.DisplayStatusBar := False;
  Excel.Visible := false;



  // Создаем новую таблицу

  Excel.Workbooks.Add;

  WorkSheet := Excel.Workbooks[1].WorkSheets[1];

  index := 1;

  WorkSheet.Cells[index,1] := 'Номер товара';
  WorkSheet.Cells[index,2] := 'Наименование товара';
  WorkSheet.Cells[index,3] := 'Кол-во на остатках';
  WorkSheet.Cells[index,4] := 'Кол-во продаж за период';
  WorkSheet.Cells[index,5] := 'Кол-по продаж за день';
  WorkSheet.Cells[index,6] := 'Кол-во товара в упаковке';
  WorkSheet.Cells[index,7] := 'Срок годности товара';
  WorkSheet.Cells[index,8] := 'Цена товара в заказе';
  WorkSheet.Cells[index,9] := 'Входная установленная цена товара';
  WorkSheet.Cells[index,10] := 'Кол-во товара в заказе';
  WorkSheet.Cells[index,11] := 'Ко-во целых упаковок в заказе';
  WorkSheet.Cells[index,12] := 'Сумма по товару';

  quPrihodOrderSpec.First;



  if quPrihodOrderSpec.RecordCount > 0 then
   while not quPrihodOrderSpec.Eof do
    begin

      index := index + 1;

      WorkSheet.Cells[index,1] := quPrihodOrderSpecTovarNo.Value;
      WorkSheet.Cells[index,2] := quPrihodOrderSpecNameTovar.Value;
      WorkSheet.Cells[index,3] := quPrihodOrderSpecKolOst.Value;
      WorkSheet.Cells[index,4] := quPrihodOrderSpecQtyPricePeriod.Value;
      WorkSheet.Cells[index,5] := quPrihodOrderSpecQtyPriceDay.Value;
      WorkSheet.Cells[index,6] := quPrihodOrderSpecKolPerPak.Value;
      WorkSheet.Cells[index,7] := quPrihodOrderSpecExpirationDate.Value;
      WorkSheet.Cells[index,8] := quPrihodOrderSpecPrice.Value;
      WorkSheet.Cells[index,9] := quPrihodOrderSpecPriceInInst.Value;
      WorkSheet.Cells[index,10] := quPrihodOrderSpecKolOrder.Value;
      WorkSheet.Cells[index,11] := quPrihodOrderSpecKolPak.Value;
      WorkSheet.Cells[index,12] := quPrihodOrderSpecSumma.Value;



      quPrihodOrderSpec.Next;
    end;

  od_ExportExcel.DefaultExt := '.xls';   // Выбираем файл для экспорта данных
  od_ExportExcel.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if od_ExportExcel.Execute then
   begin
     Excel.Application.EnableEvents := true;
     Excel.Application.Interactive := true;
     Excel.Application.DisplayAlerts := true;
     Excel.ActiveWorkBook.SaveCopyAs(od_ExportExcel.FileName);
     Excel.ActiveWorkBook.Close(0); // xlDontSaveChanges
     Excel.Quit;
     Excel := Unassigned;

     ShowMessage('Выгрузка завершена'+ #10#13 +'Выгружено ' + IntToStr(index-1)+' позиций.');
   end;


end;

procedure TPrihodOrderForm.DBGridEhTitleClick(Column: TColumnEh);
var
  TovarNo: Integer;
begin
  Screen.Cursor := crHourGlass;
  TovarNo := quPrihodOrderSpecTovarNo.Value;
  quPrihodOrderSpec.Close;
  case Column.Index of
    0: quPrihodOrderSpec.MacroByName('_order').Value := 'tnp.NO_pp';
    1: quPrihodOrderSpec.MacroByName('_order').Value := 't.TovarNo';
    2: quPrihodOrderSpec.MacroByName('_order').Value := 't.NameTovar';
    3: quPrihodOrderSpec.MacroByName('_order').Value := 'o.Kol';
    4: quPrihodOrderSpec.MacroByName('_order').Value := 's.QtyPricePeriod';
    5: quPrihodOrderSpec.MacroByName('_order').Value := 's.QtyPriceDay';
  end;
  quPrihodOrderSpec.Open;
  quPrihodOrderSpec.Locate('TovarNo', TovarNo, []);
  Screen.Cursor := crDefault;
end;

procedure TPrihodOrderForm.DBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_ESCAPE: begin
              Key:=0;
              bbCancelClick(Sender);
             end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TPrihodOrderForm.Button3Click(Sender: TObject);
var
  NameShablon : string;
  Dlg : TShablonNameForm;
  CheckShablon : TMSQuery;
  DelShablon : TMSQuery;
begin
  inherited;
  NameShablon := DBLSablonName.Text;

  if NameShablon = '' then begin
                             Dlg := TShablonNameForm.Create(Application);
                             try
                              if Dlg.ShowModal = mrok Then begin
                                                             NameShablon := Dlg.edShablonName.Text;
                                                           end;
                             finally
                               Dlg.Free;
                             end;
                           end;

  CheckShablon :=TMSQuery.Create(nil);
  CheckShablon.Connection:=dmDataModule.DB;
  CheckShablon.SQL.Clear;
  CheckShablon.SQL.Text := 'select count(*) as cnt from PrihodOrderShablon where NameShablon = :NameShablon';
  CheckShablon.Prepare;
  CheckShablon.ParamByName('NameShablon').Value := NameShablon;
  CheckShablon.Open;

  if ((CheckShablon.FieldByName('cnt').Value > 0) and (NameShablon <> '')) then begin
                                                                                  DelShablon :=TMSQuery.Create(nil);
                                                                                  DelShablon.Connection:=dmDataModule.DB;
                                                                                  DelShablon.SQL.Clear;
                                                                                  DelShablon.SQL.Text := 'delete PrihodOrderShablon where NameShablon = :NameShablon';
                                                                                  DelShablon.Prepare;
                                                                                  DelShablon.ParamByName('NameShablon').Value := NameShablon;
                                                                                  DelShablon.Execute;
                                                                                end;

  if (NameShablon <> '') then begin
                                quPrihodOrderSpec.First;

                                  while not quPrihodOrderSpec.Eof do
                                   begin
                                     spEditPrihodOrderShablon.Close;
                                     spEditPrihodOrderShablon.ParamByName('TovarNo').AsInteger := quPrihodOrderSpecTovarNo.Value;
                                     spEditPrihodOrderShablon.ParamByName('NameShablon').AsString := NameShablon;
                                     spEditPrihodOrderShablon.Prepare;
                                     spEditPrihodOrderShablon.Execute;

                                     quPrihodOrderSpec.Next;
                                   end;

                              end;

  quListShablonName.Close;
  quListShablonName.Open;


end;

procedure TPrihodOrderForm.DBLSablonNameChange(Sender: TObject);
begin
  inherited;
  quPrihodOrderSpec.Close;
  quPrihodOrderSpec.ParamByName('Document_Pkey').Value := PkeyPrihodOrder;
  quPrihodOrderSpec.ParamByName('NameShablon').Value := DBLSablonName.Text;
  quPrihodOrderSpec.MacroByName('_where').Value := 'and t.TovarNo in (select TovarNo from PrihodOrderShablon where NameShablon = @NameShablon)';
  quPrihodOrderSpec.MacroByName('_order').Value := 'pos.TovarNoPP';
  quPrihodOrderSpec.Open;

  is_all_Tovar.Checked := false;
  is_all_TovarOrders.Checked := false;

  DBGridEh.Refresh;
end;

procedure TPrihodOrderForm.Button4Click(Sender: TObject);
begin
  inherited;
  begin
     with TPatternPrihodOrderForm.Create(Application) do
       try
         quListShablonName.Open;
         ShowModal;
       finally
         Free;
       end;
  end;
end;

procedure TPrihodOrderForm.dblBuhExit(Sender: TObject);
begin
  inherited;
  quDelayForNaklP.Close;
  quDelayForNaklP.ParamByName('Buh').Value := quPrihodOrderHeadBuh.Value;
  quDelayForNaklP.Open;
  quDelayForNaklP.Refresh;

  ActiveControl := DBlDelayForNaklP;
end;

end.
