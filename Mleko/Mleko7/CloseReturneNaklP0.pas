unit CloseReturneNaklP0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ActnList, ExtCtrls;

type
  TfmCloseReturneNaklP = class(TMlekoForm)
    Label2: TLabel;
    RxDBGrid2: TRxDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quNaklP: TMSQuery;
    dsNaklP: TDataSource;
    Label1: TLabel;
    quZachet: TMSQuery;
    spModify_Plat_Nakl_link: TMSStoredProc;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    quNaklPSummaDolg: TFloatField;
    quNaklPNaklNo: TIntegerField;
    quNaklPTipName: TStringField;
    quNaklPSumma: TFloatField;
    quNaklPDateNakl: TDateTimeField;
    quNaklPBuh: TSmallintField;
    quNaklPPostNo: TSmallintField;
    quNaklPOtdelName: TStringField;
    quNaklPNom: TIntegerField;
    quNaklPSET_ARTICLE_GROUP_ID: TLargeintField;
    quNaklPNAME: TStringField;
    procedure ListReturn;
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quNaklPBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCloseReturneNaklP: TfmCloseReturneNaklP;
  CloseReturneNaklPNo, CloseReturneNaklPesult, CloseReturneNaklPBuh, CloseReturneNaklPPost: integer;
  CloseReturneEntityType, CloseReturneEntityTypeMain : string;
  SummaDolgNaklP: Extended;

  function CloseReturneNaklP(NaklPNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;

  //0-отмена
  //1-закрыта полностью
  //2-закрыта частично

implementation

uses CloseReturn0, data;

{$R *.dfm}

procedure TfmCloseReturneNaklP.ListReturn;
begin
 if StrToFloat(Label1.Caption)=0 then
  begin
   CloseReturneNaklPesult:=1;
   Close;
  end
 else
  begin
   quNaklP.Close;
   quNaklP.ParamByName('Buh').AsInteger:=CloseReturneNaklPBuh;
   quNaklP.ParamByName('PostNo').AsInteger:=CloseReturneNaklPPost;
   quNaklP.Open;
   if quNaklP.RecordCount=0 then
    begin
     CloseReturneNaklPesult:=2;
     Close;
    end;
  end;

end;

function CloseReturneNaklP(NaklPNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;
begin
 fmCloseReturneNaklP:=TfmCloseReturneNaklP.Create(Application);
 try
 with fmCloseReturneNaklP do
  begin
   CloseReturneNaklPesult:=0;
   CloseReturneNaklPPost:=Post;
   CloseReturneNaklPBuh:=Buh;
   CloseReturneNaklPNo:=NaklPNo;
   CloseReturneEntityType := EntityType;
   CloseReturneEntityTypeMain := EntityTypeMain;

   if (EntityTypeMain = 'NAKLR') then SummaDolgNaklP:=fmCloseReturn.quNaklRSummaDolg.AsFloat;
   if (EntityTypeMain = 'PLATR') then SummaDolgNaklP:=fmCloseReturn.quPlatRSummaDolg.AsFloat;

//   SummaDolgNaklP:=fmCloseReturn.quNaklPSummaDolg.AsFloat;
   
   Label1.Caption:=FloatToStr(SummaDolgNaklP);
   fmCloseReturneNaklP.ListReturn;
   if fmCloseReturneNaklP.ShowModal=mrOk then
    Result:=CloseReturneNaklPesult;
//   fmCloseReturneNaklP.Caption:=fmCloseReturn.Caption+' :'+RetPost.NamePost;
//   fmCloseReturn.ListReturn;

  end;
 finally
 Result:=CloseReturneNaklPesult;
 fmCloseReturneNaklP.Free;
 end;
end;

procedure TfmCloseReturneNaklP.RxDBGrid2DblClick(Sender: TObject);
var
 NaklNoSel, NaklNoFind: integer;

begin
 NaklNoSel:=quNaklPNaklNo.AsInteger;
 if quNaklP.Eof then quNaklP.Prior
 else quNaklP.Next;
 NaklNoFind:=quNaklPNaklNo.AsInteger;
 quNaklP.Locate('NaklNo',NaklNoSel,[]);

 if SummaDolgNaklP>=abs(quNaklPSummaDolg.AsFloat) then
  begin

   spModify_Plat_Nakl_link.Close;
   spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturneNaklPNo;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value:=quNaklPNaklNo.AsInteger;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value:=abs(quNaklPSummaDolg.AsFloat);
   spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Nakl_link.ExecProc;


   SummaDolgNaklP:=SummaDolgNaklP-abs(quNaklPSummaDolg.AsFloat);
   Label1.Caption:=FloatToStr(SummaDolgNaklP);
  end
 else
  begin

   spModify_Plat_Nakl_link.Close;
   spModify_Plat_Nakl_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturneNaklPNo;
   spModify_Plat_Nakl_link.Params.ParamByName('p_entityNo_2').Value:=quNaklPNaklNo.AsInteger;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Nakl_link.Params.ParamByName('p_Link_Summa').Value:=abs(SummaDolgNaklP);
   spModify_Plat_Nakl_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Nakl_link.ExecProc;


   SummaDolgNaklP:=0;
   Label1.Caption:=FloatToStr(SummaDolgNaklP);
  end;
 fmCloseReturneNaklP.ListReturn;
 quNaklP.First;
 quNaklP.Locate('NaklNo',NaklNoFind,[]);

end;

procedure TfmCloseReturneNaklP.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_RETURN:RxDBGrid2DblClick(Sender);
 end;
end;

procedure TfmCloseReturneNaklP.quNaklPBeforeOpen(DataSet: TDataSet);
begin
  quNaklP.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
