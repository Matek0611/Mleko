unit PostForNaklRUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, ExtCtrls, Grids, DBGrids,  
  DBAccess, MsAccess, MemDS, ActnList, citDbGrid;

type
  TfmPostForNaklR = class(TMlekoForm)
    quPost: TMSQuery;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dsPost: TDataSource;
    quPostPostNo: TSmallintField;
    quPostName: TStringField;
    quPostNameLong: TStringField;
    quPostAddressNo: TSmallintField;
    quPostAddress: TStringField;
    quPostSotrudNo: TSmallintField;
    quPostDayDelay: TSmallintField;
    quPostSotrudName: TStringField;
    quPostOtdelName: TStringField;
    quPostOtdelNo: TSmallintField;
    DbGrid: TcitDBGrid;
    quPostcontract_num: TStringField;
    CBAllPost: TCheckBox;
    quPostrealdaydelay: TIntegerField;
    quPostpostdaydelay: TSmallintField;
    quPostis_strem: TStringField;
    quPostis_stop: TStringField;
    procedure DbGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridKeyPress(Sender: TObject; var Key: Char);
    procedure quPostBeforeClose(DataSet: TDataSet);
    procedure quPostAfterOpen(DataSet: TDataSet);
    procedure quPostBeforeOpen(DataSet: TDataSet);
    procedure CBAllPostClick(Sender: TObject);
    function DbGridGetKey(Sender: TObject; DataSet: TDataSet): String;
    function DbGridIsDisabled(Sender: TObject; DataSet: TDataSet): Boolean;
    function DbGridIsLighted(Sender: TObject; DataSet: TDataSet): Boolean;
  private
    { Private declarations }
    SearchString:string;
    DateNakl:TDate;
  public
    { Public declarations }
  end;

type TRetPostForNaklR=record
  PostNo    : integer;
  NamePost  : string;
  NameLong  : string;
  AddressNo : SmallInt;
  Address   : string;
  SotrudNo  : SmallInt;
  DayDelay  : SmallInt;
  OtdelNo   : SmallInt;
  NameOtdel : string;
end;

var
  fmPostForNaklR: TfmPostForNaklR;
  function PostForNaklR(pDateNakl:TDate):TRetPostForNaklR;
  function PostForBlank(p_SotrudNo: integer;pDateNakl:TDate):TRetPostForNaklR;
implementation

uses data;

{$R *.DFM}

function PostForNaklR(pDateNakl:TDate):TRetPostForNaklR;
begin
 Result.PostNo:=0;
 fmPostForNaklR:=TfmPostForNaklR.Create(Application);
 try
 fmPostForNaklR.DateNakl:=pDateNakl;
 fmPostForNaklR.quPost.Open;
 fmPostForNaklR.DBGrid.SelectedIndex:=2;
 if fmPostForNaklR.ShowModal=mrOk then
  begin
   Result.PostNo:=fmPostForNaklR.quPostPostNo.AsInteger;
   Result.NamePost:=fmPostForNaklR.quPostName.AsString;
   Result.NameLong:=fmPostForNaklR.quPostNameLong.AsString;
   Result.AddressNo:=fmPostForNaklR.quPostAddressNo.AsInteger;
   Result.SotrudNo:=fmPostForNaklR.quPostSotrudNo.AsInteger;
   Result.DayDelay:=fmPostForNaklR.quPostDayDelay.AsInteger;
   Result.Address:=fmPostForNaklR.quPostAddress.AsString;
   Result.OtdelNo:=fmPostForNaklR.quPostOtdelNo.AsInteger;
   Result.NameOtdel:=fmPostForNaklR.quPostOtdelName.AsString;
  end;
 finally
 fmPostForNaklR.quPost.Close;
 fmPostForNaklR.Free;
 end;
end;

function PostForBlank(p_SotrudNo: integer;pDateNakl:TDate):TRetPostForNaklR;
begin
 Result.PostNo:=0;
 fmPostForNaklR:=TfmPostForNaklR.Create(Application);
 try
 fmPostForNaklR.DateNakl:=pDateNakl; 
 fmPostForNaklR.quPost.SQL.Strings[5]:=' and AddressPost.SotrudNo='+IntToStr(p_SotrudNo);
 fmPostForNaklR.quPost.Open;
 fmPostForNaklR.DBGrid.SelectedIndex:=2;
 fmPostForNaklR.DateNakl:=pDateNakl;
 if fmPostForNaklR.ShowModal=mrOk then
  begin
   Result.PostNo:=fmPostForNaklR.quPostPostNo.AsInteger;
   Result.NamePost:=fmPostForNaklR.quPostName.AsString;
   Result.NameLong:=fmPostForNaklR.quPostNameLong.AsString;
   Result.AddressNo:=fmPostForNaklR.quPostAddressNo.AsInteger;
   Result.SotrudNo:=fmPostForNaklR.quPostSotrudNo.AsInteger;
   Result.DayDelay:=fmPostForNaklR.quPostDayDelay.AsInteger;
   Result.Address:=fmPostForNaklR.quPostAddress.AsString;
   Result.OtdelNo:=fmPostForNaklR.quPostOtdelNo.AsInteger;
   Result.NameOtdel:=fmPostForNaklR.quPostOtdelName.AsString;
  end;
 finally
 fmPostForNaklR.quPost.Close;
 fmPostForNaklR.Free;
 end;
end;

procedure TfmPostForNaklR.DbGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:begin
             SearchString:='';
             Key:=0;
            end;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TfmPostForNaklR.DbGridKeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;  
begin
 if Key in data.SearchSet then
  begin
   Found:=False;
   SearchString:=SearchString+Key;
   try
   Found:=DBGrid.DataSource.DataSet.Locate(DBGrid.Columns[DBGrid.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
   except
   SearchString:='';
   end;
   if DBGrid.Columns[DBGrid.SelectedIndex].Field.DataType=ftString then
    if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
   Key:=Chr(0);
  end;

end;

procedure TfmPostForNaklR.quPostBeforeClose(DataSet: TDataSet);
begin
 dmDataModule.PrevPostNo:=quPostPostNo.AsInteger;
end;

procedure TfmPostForNaklR.quPostAfterOpen(DataSet: TDataSet);
begin
 quPost.Locate('PostNo',dmDataModule.PrevPostNo,[]);
end;

procedure TfmPostForNaklR.quPostBeforeOpen(DataSet: TDataSet);
var is_all:Integer;
begin
  if CBAllPost.Checked then is_all:=1 else is_all:=0;
  quPost.ParamByName('is_all').AsInteger:=is_all;
  quPost.ParamByName('DateNakl').AsDate:= DateNakl;
//  quPost.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmPostForNaklR.CBAllPostClick(Sender: TObject);
var oldPostNo: Int64;
begin
  inherited;
  oldPostNo:=quPost.FieldByName('PostNo').Value;
  quPost.Close;
  quPost.Open;
  quPost.Locate('PostNo',oldPostNo,[]);
end;

function TfmPostForNaklR.DbGridGetKey(Sender: TObject;
  DataSet: TDataSet): String;
begin
  inherited;
  Result:=DataSet.FieldByName('postno').AsString;
end;

function TfmPostForNaklR.DbGridIsDisabled(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result:=DataSet.FieldByName('is_stop').AsString = 'Y';
end;

function TfmPostForNaklR.DbGridIsLighted(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result:=DataSet.FieldByName('is_strem').AsString = 'Y';
end;

end.
