unit CloseReturnePlat0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, DB, DBAccess, MsAccess, MemDS, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ActnList, ExtCtrls;

type
  TfmCloseReturnePlat = class(TMlekoForm)
    Label2: TLabel;
    RxDBGrid2: TRxDBGrid;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quPlatP: TMSQuery;
    dsPlatP: TDataSource;
    Label1: TLabel;
    quZachet: TMSQuery;
    spModify_Plat_Plat_link: TMSStoredProc;
    quPlatPSummaDolg: TFloatField;
    quPlatPPlatNo: TIntegerField;
    quPlatPTipName: TStringField;
    quPlatPSumma: TFloatField;
    quPlatPDateNakl: TDateTimeField;
    quPlatPBuh: TSmallintField;
    quPlatPPostNo: TSmallintField;
    quPlatPOtdelName: TStringField;
    quPlatPNom: TIntegerField;
    quPlatPResponseDeptName: TStringField;
    quPlatPActivityTypeName: TStringField;
    quPlatPResponseDeptNameOtdel: TStringField;
    quPlatPActivityTypeNameOtdel: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    quPlatPSpravka: TStringField;
    procedure ListReturn;
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quPlatPBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCloseReturnePlat: TfmCloseReturnePlat;
  CloseReturnePlatNo, CloseReturnePlatPesult, CloseReturnePlatBuh, CloseReturnePlatPost: integer;
  SummaDolgPlat: Extended;
  CloseReturneEntityType, CloseReturneEntityTypeMain : string;
  function CloseReturnePlat(NaklNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;

  //0-отмена
  //1-закрыта полностью
  //2-закрыта частично

implementation

uses CloseReturn0, data;

{$R *.dfm}

procedure TfmCloseReturnePlat.ListReturn;
begin
 if StrToFloat(Label1.Caption)=0 then
  begin
   CloseReturnePlatPesult:=1;
   Close;
  end
 else
  begin
   quPlatP.Close;
   quPlatP.ParamByName('Buh').AsInteger:=CloseReturnePlatBuh;
   quPlatP.ParamByName('PostNo').AsInteger:=CloseReturnePlatPost;
   quPlatP.Open;
   if quPlatP.RecordCount=0 then
    begin
     CloseReturnePlatPesult:=2;
     Close;
    end;
  end;

end;

function CloseReturnePlat(NaklNo, Post, Buh: integer; SummaDolg: Extended; EntityType, EntityTypeMain: String):Integer;
begin
 fmCloseReturnePlat:=TfmCloseReturnePlat.Create(Application);
 try
 with fmCloseReturnePlat do
  begin
   CloseReturnePlatPesult:=0;
   CloseReturnePlatPost:=Post;
   CloseReturnePlatBuh:=Buh;
   CloseReturnePlatNo:=NaklNo;
   CloseReturneEntityType := EntityType;
   CloseReturneEntityTypeMain := EntityTypeMain;


   if (EntityTypeMain = 'NAKLR') then SummaDolgPlat := fmCloseReturn.quNaklRSummaDolg.AsFloat;
   if (EntityTypeMain = 'PLATR') then SummaDolgPlat := fmCloseReturn.quPlatRSummaDolg.AsFloat;


//   SummaDolgPlat := fmCloseReturn.quPlatRSummaDolg.AsFloat;

   Label1.Caption:=FloatToStr(SummaDolgPlat);
   fmCloseReturnePlat.ListReturn;
   if fmCloseReturnePlat.ShowModal=mrOk then
    Result:=CloseReturnePlatPesult;
//   fmCloseReturnePlat.Caption:=fmCloseReturn.Caption+' :'+RetPost.NamePost;
//   fmCloseReturn.ListReturn;

  end;
 finally
 Result:=CloseReturnePlatPesult;
 fmCloseReturnePlat.Free;
 end;
end;

procedure TfmCloseReturnePlat.RxDBGrid2DblClick(Sender: TObject);
var
 PlatNoSel, PlatNoFind: integer;
begin
 PlatNoSel:=quPlatPPlatNo.AsInteger;
 if quPlatP.Eof then quPlatP.Prior
 else quPlatP.Next;
 PlatNoFind:=quPlatPPlatNo.AsInteger;
 quPlatP.Locate('PlatNo',PlatNoSel,[]);

 if SummaDolgPlat>=abs(quPlatPSummaDolg.AsFloat) then
  begin

   spModify_Plat_Plat_link.Close;
//   spModify_Plat_Plat_link.Prepare;
   spModify_Plat_Plat_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Plat_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturnePlatNo;
   spModify_Plat_Plat_link.Params.ParamByName('p_entityNo_2').Value:=quPlatPPlatNo.AsInteger;
   spModify_Plat_Plat_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Plat_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Plat_link.Params.ParamByName('p_Link_Summa').Value:=abs(quPlatPSummaDolg.AsFloat);
   spModify_Plat_Plat_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Plat_link.ExecProc;


   SummaDolgPlat:=SummaDolgPlat-abs(quPlatPSummaDolg.AsFloat);
   Label1.Caption:=FloatToStr(SummaDolgPlat);
  end
 else
  begin

   spModify_Plat_Plat_link.Close;
//   spModify_Plat_Plat_link.Prepare;
   spModify_Plat_Plat_link.Params.ParamByName('p_ID').Value:=-1;
   spModify_Plat_Plat_link.Params.ParamByName('p_entityNo_1').Value:=CloseReturnePlatNo;
   spModify_Plat_Plat_link.Params.ParamByName('p_entityNo_2').Value:=quPlatPPlatNo.AsInteger;
   spModify_Plat_Plat_link.Params.ParamByName('p_Entity_Type_1').Value:=CloseReturneEntityTypeMain;
   spModify_Plat_Plat_link.Params.ParamByName('p_Entity_Type_2').Value:=CloseReturneEntityType;
   spModify_Plat_Plat_link.Params.ParamByName('p_Link_Summa').Value:=abs(SummaDolgPlat);
   spModify_Plat_Plat_link.Params.ParamByName('p_UserNo').Value:=data.UserNo;
   spModify_Plat_Plat_link.ExecProc;


   SummaDolgPlat:=0;
   Label1.Caption:=FloatToStr(SummaDolgPlat);
  end;
 fmCloseReturnePlat.ListReturn;
 quPlatP.First;
 quPlatP.Locate('PlatNo',PlatNoFind,[]);

end;

procedure TfmCloseReturnePlat.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_RETURN:RxDBGrid2DblClick(Sender);
 end;
end;

procedure TfmCloseReturnePlat.quPlatPBeforeOpen(DataSet: TDataSet);
begin
  quPlatP.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

end.
