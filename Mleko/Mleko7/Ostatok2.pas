unit Ostatok2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons, DB, 
  DBCtrls, DBAccess, MsAccess, MemDS, ActnList;

type
  TfmOstatok2 = class(TMlekoForm)
    paBottom: TPanel;
    RxDBGrid1: TRxDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quOstatok: TMSQuery;
    dsOstatok: TDataSource;
    quOstatokTovarNo: TSmallintField;
    quOstatokNameTovar: TStringField;
    UpdateSQL1: TMSUpdateSQL;
    quOstatokNameEnableSkidka: TStringField;
    Panel1: TPanel;
    cbAll: TCheckBox;
    quOstatokPrice1: TFloatField;
    quOstatokPrice2: TFloatField;
    quOstatokKolHold: TFloatField;
    quOstatokLastPriceIn: TFloatField;
    quOstatokAVGPriceIn: TFloatField;
    quOstatokEnableSkidka: TBooleanField;
    quOstatokNameCompany: TStringField;
    quOstatokSrokReal: TSmallintField;
    quOstatokPrice3: TFloatField;
    quOstatokPercent1: TFloatField;
    quOstatokPercent2: TFloatField;
    quOstatokKol: TFloatField;
    quOstatokPrice: TFloatField;
    quOstatokPrice4: TFloatField;
    quOstatokPrice5: TFloatField;
    quOstatokPrice6: TFloatField;
    quOstatokPrice7: TFloatField;
    quOstatokPrice8: TFloatField;
    quOstatokPrice9: TFloatField;
    quOstatokPrice10: TFloatField;
    Button1: TButton;
    spReCalcPriceIn: TMSStoredProc;
    quOstatokPrice13: TFloatField;
    quOstatokPrice14: TFloatField;
    quOstatokPrice15: TFloatField;
    sp_force_rest: TMSStoredProc;
    Button2: TButton;
    ActionList1: TActionList;
    ActionFind: TAction;
    SpeedButton1: TSpeedButton;
    quOstatokPriceForVeb: TFloatField;
    quOstatokPriceInInst: TFloatField;
    quOstatokvisible: TBooleanField;
    quOstatokVidName: TStringField;
    bHistoryChangePriceAll: TButton;
    bHistoryPriceForTovar: TButton;
    quOstatokPriceOld: TFloatField;
    quOstatokPriceValidDate: TDateTimeField;
    quOstatokCurrency: TStringField;
    quOstatokCurrencyCode: TStringField;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure quOstatokBeforePost(DataSet: TDataSet);
    procedure quOstatokAfterInsert(DataSet: TDataSet);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure quOstatokPercent1Change(Sender: TField);
    procedure quOstatokPercent2Change(Sender: TField);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure quOstatokPriceChange(Sender: TField);
    procedure quOstatokCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure quOstatokBeforeDelete(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ActionFindExecSQL(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bHistoryChangePriceAllClick(Sender: TObject);
    procedure bHistoryPriceForTovarClick(Sender: TObject);
  private
    
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  fmOstatok2: TfmOstatok2;
  procedure ShowOstatki(OtdelNo: integer);
implementation

uses data, GetPercent0, main,
  MlekoPropFindTov, HistoryOfPriceChenge;

{$R *.DFM}
procedure ShowOstatki(OtdelNo: integer);
begin
  fmOstatok2:=TfmOstatok2.Create(Application);
  try
   if OtdelNo<>3 then fmOstatok2.quOstatok.MacroByName('_OtdelNo').Value:=' and (Tovar.OtdelNo <> 3)'
                 else fmOstatok2.quOstatok.MacroByName('_OtdelNo').Value:=' and (Tovar.OtdelNo = 3)';

   fmOstatok2.quOstatok.Open;
   dmDataModule.quCurrency.Open;
   fmOstatok2.ShowModal;
  finally
   fmOstatok2.quOstatok.Close;
   dmDataModule.quCurrency.Close;
   fmOstatok2.Free;
  end;
end;

procedure TfmOstatok2.bbOkClick(Sender: TObject);
begin
 if RxDBGrid1.DataSource.DataSet.State in [dsInsert,dsEdit] then
  UpdateSQL1.Apply(ukModify);
end;

procedure TfmOstatok2.FormShow(Sender: TObject);
begin
 fmOstatok2.SearchString:='';
 fmOstatok2.ActiveControl:=RxDBGrid1;
 RxDBGrid1.Col:=1;
 if data.CodeAccess<>1 then
  begin
   RxDBGrid1.Columns[1].ReadOnly:=True;//Kol
  end;
 if EditPriceInInst = false then RxDBGrid1.Columns[23].ReadOnly:=true
                            else RxDBGrid1.Columns[23].ReadOnly:=false;
 if data.CodeAccess > -2 then begin
                                bHistoryChangePriceAll.Visible := False;
                                bHistoryPriceForTovar.Visible := False;
                              end;
end;

procedure TfmOstatok2.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:fmOstatok2.SearchString:='';
  VK_CONTROL + VK_DELETE:begin
                           Key:=0;
                           if abs(quOstatokKol.AsFloat)<0.01 then
                           begin
                             if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then quOstatok.Delete;
                           end;
                         end;
 end;
end;

procedure TfmOstatok2.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 Found:=False;
 if (Key in ['A'..'Z','a'..'z','а'..'я','А'..'Я','0'..'9']) and
    ((RxDBGrid1.Col=1)or(RxDBGrid1.Col=13)or(RxDBGrid1.Col=26)) then
  begin
   fmOstatok2.SearchString:=SearchString+Key;
   case RxDBGrid1.Col of
    1:Found:=quOstatok.Locate('NameTovar',fmOstatok2.SearchString,[loPartialKey,loCaseInsensitive]);
    13:Found:=quOstatok.Locate('NameCompany',fmOstatok2.SearchString,[loPartialKey,loCaseInsensitive]);
    26:Found:=quOstatok.Locate('TovarNo',fmOstatok2.SearchString,[loPartialKey,loCaseInsensitive]);
   end;
   if not Found then
    begin
     Beep;
     fmOstatok2.SearchString:=Copy(fmOstatok2.SearchString,1,length(Trim(fmOstatok2.SearchString))-1);
    end;
   Key:=Chr(0);
  end
 else
  fmOstatok2.SearchString:='';
end;

procedure TfmOstatok2.quOstatokBeforePost(DataSet: TDataSet);
begin
 if fmOstatok2.quOstatok.State = dsEdit then UpdateSQL1.Apply(ukModify);
end;

procedure TfmOstatok2.quOstatokAfterInsert(DataSet: TDataSet);
begin
 fmOstatok2.quOstatok.Cancel;
end;

procedure TfmOstatok2.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
 if ACol in [0,3,5,12] then Enabled:=True else Enabled:=False;
end;

procedure TfmOstatok2.quOstatokPercent1Change(Sender: TField);
begin
 quOstatokPrice1.AsFloat:=round((quOstatokPrice.AsFloat*(1+(quOstatokPercent1.AsFloat/100)))*100)/100;
end;

procedure TfmOstatok2.quOstatokPercent2Change(Sender: TField);
begin
 quOstatokPrice2.AsFloat:=round((quOstatokPrice.AsFloat*(1+(quOstatokPercent2.AsFloat/100)))*100)/100;
end;

procedure TfmOstatok2.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
 Rec:TBookMarkStr;
 Percent:double;
 TovarNo:integer;
begin
 case ACol of
  3,5:begin
       Percent:=GetPercent;
       if Percent=0 then Exit;
       Screen.Cursor:=crHourGlass;
       Rec:=quOstatok.Bookmark;
       quOstatok.DisableControls;
       quOstatok.First;
       while not quOstatok.EOF do
        begin
         quOstatok.Edit;

         if ACol=3 then
          quOstatokPercent1.AsFloat:=Percent
         else
          quOstatokPercent2.AsFloat:=Percent;

         quOstatok.Post;
         quOstatok.Next;
        end;
       quOstatok.Bookmark:=Rec;
       quOstatok.EnableControls;
       Screen.Cursor:=crDefault;
      end;
  0:begin
     Screen.Cursor:=crHourGlass;
     TovarNo:=quOstatokTovarNo.AsInteger;
     quOstatok.Close;
     quOstatok.MacroByName('_order').Value:='NameTovar';
     quOstatok.Prepare;
     quOstatok.Open;
     quOstatok.Locate('TovarNo',TovarNo,[]);
     Screen.Cursor:=crDefault;
    end;
  12:begin
     Screen.Cursor:=crHourGlass;
     TovarNo:=quOstatokTovarNo.AsInteger;
     quOstatok.Close;
     quOstatok.MacroByName('_order').Value:='NameCompany,NameTovar';
     quOstatok.Prepare;
     quOstatok.Open;
     quOstatok.Locate('TovarNo',TovarNo,[]);
     Screen.Cursor:=crDefault;
    end;
 end;
end;

procedure TfmOstatok2.quOstatokPriceChange(Sender: TField);
begin
 quOstatokPercent1Change(quOstatokPrice);
 quOstatokPercent2Change(quOstatokPrice);
end;

procedure TfmOstatok2.quOstatokCalcFields(DataSet: TDataSet);
begin
 if quOstatokEnableSkidka.AsBoolean then
  quOstatokNameEnableSkidka.AsString:='+'
 else
  quOstatokNameEnableSkidka.AsString:='-';
end;

procedure TfmOstatok2.RxDBGrid1DblClick(Sender: TObject);
begin
 if RxDBGrid1.Col=13 then
  begin
   quOstatok.Edit;
   quOstatokEnableSkidka.AsBoolean:=not quOstatokEnableSkidka.AsBoolean;
   quOstatok.Post;
  end;
end;

procedure TfmOstatok2.cbAllClick(Sender: TObject);
begin
 Screen.Cursor:=crHourGlass;
 quOstatok.Close;
 if cbAll.Checked then
  quOstatok.MacroByName('_Kol').Value:=''
 else
  quOstatok.MacroByName('_Kol').Value:=' and (Kol<>0)';
 quOstatok.Prepare;
 quOstatok.Open;
 Screen.Cursor:=crDefault;
end;

procedure TfmOstatok2.quOstatokBeforeDelete(DataSet: TDataSet);
begin
 UpdateSQL1.Apply(ukDelete);
end;

procedure TfmOstatok2.Button1Click(Sender: TObject);
begin
try
 Screen.Cursor:=crHourGlass;
 spReCalcPriceIn.ExecProc;
finally
 Screen.Cursor:=crDefault;
end;
end;

procedure TfmOstatok2.Button2Click(Sender: TObject);
begin
 Screen.Cursor:=crHourGlass;
 sp_force_rest.ExecProc;
 Screen.Cursor:=crDefault;
end;

procedure TfmOstatok2.ActionFindExecSQL(Sender: TObject);
var tov,vid,str_flt:String;
begin
  IF TMlekoPropFindTovDlg.GetFindTov(tov,vid) then begin
     str_flt:='';
     quOstatok.Close;
     quOstatok.MacroByName('_flt').Value:=' (Tovar.TovarNo=Ostatok.TovarNo) and ((OtdelNo<>3))';
     if vid<>'' then str_flt:=str_flt+' and Company.NameCompany like ''%'+vid+'%'' ';
     if tov<>'' then str_flt:=str_flt+' and Tovar.NameTovar like ''%'+tov+'%'' ';
     quOstatok.MacroByName('_flt').Value:=Str_flt;
     quOstatok.Open;
  end;
end;

procedure TfmOstatok2.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 KolDay : integer;
begin
  inherited;

  KolDay := round(dsOstatok.DataSet.FieldByName('PriceValidDate').AsDateTime) - round(Date);

  if dsOstatok.DataSet.FieldByName('visible').Value = true then
   begin
      RxDBGrid1.Canvas.Brush.Color := clInactiveCaptionText;
      RxDBGrid1.Canvas.Font.Color := ClBlack;
    end;
   if not dsOstatok.DataSet.FieldByName('PriceValidDate').IsNull then
    begin
      if (KolDay <= 5) and (KolDay > 0) then begin
                                               RxDBGrid1.Canvas.Brush.Color := clYellow;
                                               RxDBGrid1.Canvas.Font.Color := ClBlack;
                                             end;
    end;

   if not dsOstatok.DataSet.FieldByName('PriceValidDate').IsNull then
    begin
      if (KolDay <= 0) then begin
                              RxDBGrid1.Canvas.Brush.Color := clRed;
                              RxDBGrid1.Canvas.Font.Color := ClBlack;
                       end;
    end;

   RxDBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfmOstatok2.bHistoryChangePriceAllClick(Sender: TObject);
var
 Dlg : THistoryOfPriceChengeForm;
begin
  inherited;
  with THistoryOfPriceChengeForm.Create(Application) do
   try
     quHistoriPrice.Open;
     quListVidTovName.Open;
     ShowModal;
   finally
     quHistoriPrice.Close;
     quListVidTovName.Close;
     Free;
   end
end;

procedure TfmOstatok2.bHistoryPriceForTovarClick(Sender: TObject);
begin
  inherited;
  with THistoryOfPriceChengeForm.Create(Application) do
   try
     quHistoriPrice.ParamByName('TovarNo').Value := quOstatokTovarNo.Value ;
     quHistoriPrice.Open;
     quListVidTovName.Open;
     ShowModal;
   finally
     quHistoriPrice.Close;
     quListVidTovName.Close;
     Free;
   end

end;

end.
