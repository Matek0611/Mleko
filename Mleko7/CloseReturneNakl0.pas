unit CloseReturneNakl0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ActnList, ExtCtrls;

type
  TfmCloseReturneNakl = class(TMlekoForm)
    Label2: TLabel;
    RxDBGrid2: TRxDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quNaklR: TMSQuery;
    quNaklRNaklNo: TIntegerField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    dsNaklR: TDataSource;
    Label1: TLabel;
    quNaklRTipName: TStringField;
    quZachet: TMSQuery;
    quNaklROtdelName: TStringField;
    spModify_Plat_Nakl_link: TMSStoredProc;
    quNaklRBuh: TSmallintField;
    quNaklRPostNo: TSmallintField;
    quNaklRNom: TIntegerField;
    quNaklRSET_ARTICLE_GROUP_ID: TLargeintField;
    quNaklRNAME: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure ListReturn;
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCloseReturneNakl: TfmCloseReturneNakl;
  CloseReturneNaklNo, CloseReturneNaklResult, CloseReturneNaklBuh, CloseReturneNaklPost: integer;
  CloseReturneEntityType, CloseReturneEntityTypeMain : string;
  SummaDolgNakl: Extended;

  function CloseReturneNakl(NaklNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;

  //0-отмена
  //1-закрыта полностью
  //2-закрыта частично

implementation

uses CloseReturn0, data;

{$R *.dfm}

procedure TfmCloseReturneNakl.ListReturn;
begin
 if StrToFloat(Label1.Caption)=0 then
  begin
   CloseReturneNaklResult:=1;
   Close;
  end
 else
  begin
   quNaklR.Close;
   quNaklR.ParamByName('Buh').AsInteger:=CloseReturneNaklBuh;
   quNaklR.ParamByName('PostNo').AsInteger:=CloseReturneNaklPost;
   quNaklR.Open;
   if quNaklR.RecordCount=0 then
    begin
     CloseReturneNaklResult:=2;
     Close;
    end;
  end;

end;

function CloseReturneNakl(NaklNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;
begin
 fmCloseReturneNakl:=TfmCloseReturneNakl.Create(Application);
 try
 with fmCloseReturneNakl do
  begin
   CloseReturneNaklResult:=0;
   CloseReturneNaklPost:=Post;
   CloseReturneNaklBuh:=Buh;
   CloseReturneNaklNo:=NaklNo;
   CloseReturneEntityType := EntityType;
   CloseReturneEntityTypeMain := EntityTypeMain;

   if (EntityTypeMain = 'NAKLR') then SummaDolgNakl:=fmCloseReturn.quNaklRSummaDolg.AsFloat;
   if (EntityTypeMain = 'PLATR') then SummaDolgNakl:=fmCloseReturn.quPlatRSummaDolg.AsFloat;

//   SummaDolgNakl:=fmCloseReturn.quNaklRSummaDolg.AsFloat;
   
   Label1.Caption:=FloatToStr(SummaDolgNakl);
   fmCloseReturneNakl.ListReturn;
   if fmCloseReturneNakl.ShowModal=mrOk then
    Result:=CloseReturneNaklResult;
//   fmCloseReturneNakl.Caption:=fmCloseReturn.Caption+' :'+RetPost.NamePost;
//   fmCloseReturn.ListReturn;

  end;
 finally
 Result:=CloseReturneNaklResult;
 fmCloseReturneNakl.Free;
 end;
end;

procedure TfmCloseReturneNakl.RxDBGrid2DblClick(Sender: TObject);
var
 NaklNoSel, NaklNoFind: integer;

begin
 NaklNoSel:=quNaklRNaklNo.AsInteger;
 if quNaklR.Eof then quNaklR.Prior
 else quNaklR.Next;
 NaklNoFind:=quNaklRNaklNo.AsInteger;
 quNaklR.Locate('NaklNo',NaklNoSel,[]);

 if SummaDolgNakl>=abs(quNaklRSummaDolg.AsFloat) then
  begin

   spModify_Plat_Nakl_link.Close;
//   spModify_Plat_Nakl_link.Prepare;
   spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturneNaklNo;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value:=quNaklRNaklNo.AsInteger;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value:=abs(quNaklRSummaDolg.AsFloat);
   spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Nakl_link.ExecProc;


   SummaDolgNakl:=SummaDolgNakl-abs(quNaklRSummaDolg.AsFloat);
   Label1.Caption:=FloatToStr(SummaDolgNakl);
  end
 else
  begin

   spModify_Plat_Nakl_link.Close;
//   spModify_Plat_Nakl_link.Prepare;
   spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturneNaklNo;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value:=quNaklRNaklNo.AsInteger;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value:=abs(SummaDolgNakl);
   spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Nakl_link.ExecProc;


   SummaDolgNakl:=0;
   Label1.Caption:=FloatToStr(SummaDolgNakl);
  end;
 fmCloseReturneNakl.ListReturn;
 quNaklR.First;
 quNaklR.Locate('NaklNo',NaklNoFind,[]);

end;

procedure TfmCloseReturneNakl.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_RETURN:RxDBGrid2DblClick(Sender);
 end;
end;

procedure TfmCloseReturneNakl.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  quNaklR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
