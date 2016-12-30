unit TempTableForCreateBlank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, DB, DBAccess, MSAccess, MemDS, ActnList,
  GridsEh, DBGridEh, StdCtrls, Buttons;

type
  TTempTableForCreateBlankForm = class(TMlekoForm)
    quTempTableForCreateBlank: TMSQuery;
    dsTempTableForCreateBlank: TMSDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    quTempTableForCreateBlankpostno: TLargeintField;
    quTempTableForCreateBlankIs_Stop: TIntegerField;
    quTempTableForCreateBlankIs_Stop_Check: TIntegerField;
    quTempTableForCreateBlankIs_All_Group: TIntegerField;
    quTempTableForCreateBlankDay_Delay: TIntegerField;
    quTempTableForCreateBlankDay_Delay_Main: TIntegerField;
    quTempTableForCreateBlankDay_Delay_Ext: TIntegerField;
    quTempTableForCreateBlankSet_Name: TStringField;
    quTempTableForCreateBlankSet_Article_Group_id: TLargeintField;
    quTempTableForCreateBlankBuh: TIntegerField;
    quTempTableForCreateBlankBuh_Type_Name: TStringField;
    quTempTableForCreateBlankLastEnabledDey: TDateTimeField;
    quTempTableForCreateBlankFifrsDateDolg: TDateTimeField;
    quTempTableForCreateBlankcurdatenakl: TDateTimeField;
    quTempTableForCreateBlankis_Prosr: TIntegerField;
    quTempTableForCreateBlankIs_Enable_Stop_Period: TIntegerField;
    quTempTableForCreateBlankIs_Enable_Stop_Pay_Ban: TIntegerField;
    quTempTableForCreateBlankPayBan: TFloatField;
    quTempTableForCreateBlankDay_Prosr: TIntegerField;
    quTempTableForCreateBlankDay_Prosr_Nabor: TIntegerField;
    quTempTableForCreateBlankIs_Stop_Return_Blank: TBooleanField;
    quTempTableForCreateBlankDescription_Stop_Return_Blank: TStringField;
    quTempTableForCreateBlankLastDayStopControlDelay: TDateTimeField;
    quTempTableForCreateBlankLastDayStopControlPayBan: TDateTimeField;
    quTempTableForCreateBlankSET_ARTICLE_GROUP_IDforColnprice: TLargeintField;
    quTempTableForCreateBlankColnprice: TIntegerField;
    quTempTableForCreateBlankCreateDate: TDateTimeField;
    quTempTableForCreateBlankname: TStringField;
    quTempTableForCreateBlankGroupPrice: TStringField;
    quTempTableForCreateBlankColName: TStringField;
    quTempTableForCreateBlankSotrudNo: TSmallintField;
    quTempTableForCreateBlankSotrudName: TStringField;
    quTempTableForCreateBlankAddressPost_ID: TIntegerField;
    quTempTableForCreateBlankAddressNo: TSmallintField;
    quTempTableForCreateBlankAddress: TStringField;
    quTempTableForCreateBlankD_Firm_Contract_id: TIntegerField;
    quTempTableForCreateBlankD_Firm_Contract_num: TStringField;
    quTempTableForCreateBlankOtdelNo: TIntegerField;
    Panel2: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    quTempTableForCreateBlankOtdelName: TStringField;

    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  TempTableForCreateBlankForm: TTempTableForCreateBlankForm;

implementation
uses data;

{$R *.dfm}

procedure TTempTableForCreateBlankForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TTempTableForCreateBlankForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
 end;

end;

end.
