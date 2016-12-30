unit PostForRashod0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, ExtCtrls, Grids, DBGrids,  
  DBAccess, MsAccess, MemDS, ActnList, citDbGrid, cxControls, cxContainer,
  cxEdit, cxLabel, cxDBLabel, Spin;

type
  TfmPostForRashod = class(TMlekoForm)
    quPost: TMSQuery;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dsPost: TDataSource;
    DbGrid: TcitDBGrid;
    CBAllPost: TCheckBox;
    dbLbDelayPost: TcxDBLabel;
    dbLbDelayReal: TcxDBLabel;
    dbLbContract: TcxDBLabel;
    dbLbPosTNo: TcxDBLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Panel2: TPanel;
    quPostpostno: TSmallintField;
    quPostname: TStringField;
    quPostnamelong: TStringField;
    quPostaddressno: TSmallintField;
    quPostaddress: TStringField;
    quPostsotrudno: TSmallintField;
    quPostsotrudname: TStringField;
    quPostotdelname: TStringField;
    quPostotdelno: TSmallintField;
    quPostcontract_num: TStringField;
    quPostrealdaydelay: TIntegerField;
    quPostpostdaydelay: TIntegerField;
    quPostis_stop: TStringField;
    quPostSET_ARTICLE_GROUP_NAME: TStringField;
    quPostSET_ARTICLE_GROUP_ID: TLargeintField;
    quPostBUH: TIntegerField;
    quPostDAY_DELAY: TIntegerField;
    quPostDAY_DELAY_EXT: TIntegerField;
    quPostBuh_type_name: TStringField;
    quPostAddressID: TIntegerField;
    procedure DbGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridKeyPress(Sender: TObject; var Key: Char);
    procedure quPostBeforeClose(DataSet: TDataSet);
    procedure quPostAfterOpen(DataSet: TDataSet);
    procedure quPostBeforeOpen(DataSet: TDataSet);
    procedure CBAllPostClick(Sender: TObject);
    function DbGridGetKey(Sender: TObject; DataSet: TDataSet): String;
    function DbGridIsDisabled(Sender: TObject; DataSet: TDataSet): Boolean;
    procedure DbGridTitleClick(Column: TColumn);
  private
    { Private declarations }
    SearchString:string;

  public
    PostNo:Int64;
    SotrudNo:Integer;
    SArticleGroupDouble:Int64;
    DateNakl:TDate;
  end;

type TRetPostForRashod=record
  PostNo    : integer;
  NamePost  : string;
  NameLong  : string;
  AddressNo : SmallInt;
  Address   : string;
  SotrudNo  : SmallInt;
  DayDelay  : SmallInt;
  OtdelNo   : SmallInt;
  NameOtdel : string;
  SET_ARTICLE_GROUP: Int64;
  AddressID : Int64;
  Buh: Integer;
end;

var
  fmPostForRashod: TfmPostForRashod;
  function PostForRashod(pDateNakl:TDate;pPostNo:Int64=-1;pSotrudNo:integer=0;pSArticleGroupDouble:Int64=0):TRetPostForRashod;
implementation

uses data;

{$R *.DFM}

function PostForRashod(pDateNakl:TDate;pPostNo:Int64=-1;pSotrudNo:integer=0;pSArticleGroupDouble:Int64=0):TRetPostForRashod;
begin
 Result.PostNo:=0;
 fmPostForRashod:=TfmPostForRashod.Create(Application);
 try
 fmPostForRashod.DateNakl:=pDateNakl;
 fmPostForRashod.PostNo:=pPostNo;
 fmPostForRashod.SotrudNo := pSotrudNo;
 fmPostForRashod.SArticleGroupDouble := pSArticleGroupDouble;
 fmPostForRashod.quPost.Open;
 fmPostForRashod.DBGrid.SelectedIndex:=2;
 if fmPostForRashod.ShowModal=mrOk then
  begin
   Result.PostNo:=fmPostForRashod.quPost.FieldByName('PostNo').AsInteger;
   Result.NamePost:=fmPostForRashod.quPost.FieldByName('Name').AsString;
   Result.NameLong:=fmPostForRashod.quPost.FieldByName('NameLong').AsString;
   Result.AddressNo:=fmPostForRashod.quPost.FieldByName('AddressNo').AsInteger;
   Result.SotrudNo:=fmPostForRashod.quPost.FieldByName('SotrudNo').AsInteger;
   Result.DayDelay:=fmPostForRashod.quPost.FieldByName('postdaydelay').AsInteger;
   Result.Address:=fmPostForRashod.quPost.FieldByName('Address').AsString;
   Result.OtdelNo:=fmPostForRashod.quPost.FieldByName('OtdelNo').AsInteger;
   Result.NameOtdel:=fmPostForRashod.quPost.FieldByName('OtdelName').AsString;
   Result.SET_ARTICLE_GROUP:=fmPostForRashod.quPost.FieldByName('SET_ARTICLE_GROUP_ID').Value;
   Result.AddressID:=fmPostForRashod.quPost.FieldByName('AddressID').Value;
   Result.buh:=fmPostForRashod.quPost.FieldByName('Buh').Value;
  end;
 finally
 fmPostForRashod.quPost.Close;
 fmPostForRashod.Free;
 end;
end;


procedure TfmPostForRashod.DbGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmPostForRashod.DbGridKeyPress(Sender: TObject;
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

procedure TfmPostForRashod.quPostBeforeClose(DataSet: TDataSet);
begin
 dmDataModule.PrevPostNo:=PostNo;
end;

procedure TfmPostForRashod.quPostAfterOpen(DataSet: TDataSet);
begin
 quPost.Locate('PostNo',dmDataModule.PrevPostNo,[]);
end;

procedure TfmPostForRashod.quPostBeforeOpen(DataSet: TDataSet);
var is_all:Integer;
begin
  if CBAllPost.Checked then is_all:=1 else is_all:=0;
  quPost.ParamByName('is_all').AsInteger:=is_all;
  quPost.ParamByName('DateNakl').AsDate:= DateNakl;
  quPost.ParamByName('PostNo').Value:= PostNo;
  quPost.ParamByName('SotrudNo').Value:= SotrudNo;
  quPost.ParamByName('SET_ARTICLE_GROUP_ID').Value:= SArticleGroupDouble;
//  quPost.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmPostForRashod.CBAllPostClick(Sender: TObject);
var oldPostNo: Int64;
begin
  inherited;
  oldPostNo:=quPost.FieldByName('PostNo').Value;
  quPost.Close;
  quPost.Open;
  quPost.Locate('PostNo',oldPostNo,[]);
end;

function TfmPostForRashod.DbGridGetKey(Sender: TObject;
  DataSet: TDataSet): String;
begin
  inherited;
  Result:=DataSet.FieldByName('postno').AsString;
end;

function TfmPostForRashod.DbGridIsDisabled(Sender: TObject;
  DataSet: TDataSet): Boolean;
begin
  inherited;
  result:=DataSet.FieldByName('is_stop').AsString = 'Y';
end;

procedure TfmPostForRashod.DbGridTitleClick(Column: TColumn);
begin
  inherited;
  quPost.Close;
  case Column.Index of
    0:quPost.MacroByName('_order').Value:='u.name';
    1:quPost.MacroByName('_order').Value:='u.sotrudname';
    2:quPost.MacroByName('_order').Value:='u.address';
    3:quPost.MacroByName('_order').Value:='u.otdelname';
    4:quPost.MacroByName('_order').Value:='SET_ARTICLE_GROUP_NAME';
    5:quPost.MacroByName('_order').Value:='BUH';
 end;
 quPost.Open;
end;

end.
