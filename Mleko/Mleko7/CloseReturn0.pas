unit CloseReturn0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBAccess, MsAccess, MemDS, Grids, DBGrids, RXDBCtrl,
  ActnList, ExtCtrls, ComCtrls, GridsEh, DBGridEh;

type
  TfmCloseReturn = class(TMlekoForm)
    RxDBGrid2: TRxDBGrid;
    quNaklR: TMSQuery;
    dsNaklR: TDataSource;
    quNaklRNaklNo: TIntegerField;
    quNaklRDateNakl: TDateTimeField;
    quNaklRSumma: TFloatField;
    quNaklRSummaDolg: TFloatField;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quNaklRTipName: TStringField;
    quNaklRDolg: TMSQuery;
    quNaklRDolgSumm: TFloatField;
    quNaklROplat: TMSQuery;
    quNaklRBuh: TSmallintField;
    quNaklRPostNo: TSmallintField;
    quNaklROplatSumm: TFloatField;
    quNaklROtdelName: TStringField;
    quNaklRNom: TIntegerField;
    quNaklRSET_ARTICLE_GROUP_ID: TLargeintField;
    quNaklRNAME: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    quPlatR: TMSQuery;
    dsPlatR: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    quPlatRDolg: TMSQuery;
    quPlatROplat: TMSQuery;
    quPlatRSummaDolg: TFloatField;
    quPlatRNaklNo: TIntegerField;
    quPlatRNom: TIntegerField;
    quPlatRTipName: TStringField;
    quPlatRSumma: TFloatField;
    quPlatRDatePlat: TDateTimeField;
    quPlatROtdelName: TStringField;
    quPlatRResponseDeptName: TStringField;
    quPlatRActivityTypeName: TStringField;
    quPlatROplatSumm: TFloatField;
    quPlatRDolgSumm: TFloatField;
    quPlatRSpravka: TStringField;
    quPlatRBuh: TSmallintField;
    quPlatRPostNo: TSmallintField;
    quPlatRResponseDeptNameOtdel: TStringField;
    quPlatRActivityTypeNameOtdel: TStringField;
    quPlatRVidRashodName: TStringField;
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListReturnNaklR;
    procedure ListReturnPlatR;
    procedure quNaklRBeforeOpen(DataSet: TDataSet);
    procedure quNaklRDolgBeforeOpen(DataSet: TDataSet);
    procedure quNaklROplatBeforeOpen(DataSet: TDataSet);
    procedure quPlatRBeforeOpen(DataSet: TDataSet);
    procedure quPlatRDolgBeforeOpen(DataSet: TDataSet);
    procedure quPlatROplatBeforeOpen(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCloseReturn: TfmCloseReturn;
  PostNoSelect: integer;
//  NaklRDolgKassa, NaklRDolgBank, NaklRDolgKassaB: Extended;
  procedure CloseReturn;
implementation

uses post0, data, CloseReturneNakl0, CloseReturnePlat0, CloseReturneNaklP0,
     MlekoSelectEntityTypeFromCloseReturn;

{$R *.DFM}

procedure TfmCloseReturn.ListReturnNaklR;
var
 i: integer;
 MyTempVar: Extended;
begin
 for i:=1 to 3 do
  begin
   quNaklRDolg.Close;
   quNaklRDolg.ParamByName('Buh').AsInteger:=i;
   quNaklRDolg.ParamByName('PostNo').AsInteger:=PostNoSelect;
   quNaklRDolg.Open;
   if quNaklRDolg.RecordCount<>0 then
    MyTempVar:=Abs(quNaklRDolgSumm.AsFloat)
   else
    MyTempVar:=0;
   case i of
    1:Label6.Caption:=FloatToStr(MyTempVar);
    2:Label7.Caption:=FloatToStr(MyTempVar);
    3:Label8.Caption:=FloatToStr(MyTempVar);
   end;
  end;
 for i:=1 to 3 do
  begin
   quNaklROplat.Close;
   quNaklROplat.ParamByName('Buh').AsInteger:=i;
   quNaklROplat.ParamByName('PostNo').AsInteger:=PostNoSelect;
   quNaklROplat.Open;
   if quNaklROplat.RecordCount<>0 then
    MyTempVar:=Abs(quNaklROplatSumm.AsFloat)
   else
    MyTempVar:=0;
   case i of
    1:Label1.Caption:=FloatToStr(MyTempVar);
    2:Label9.Caption:=FloatToStr(MyTempVar);
    3:Label10.Caption:=FloatToStr(MyTempVar);
   end;
  end;
 quNaklR.Close;
 quNaklR.ParamByName('PostNo').AsInteger:=PostNoSelect;
 quNaklR.ParamByName('SummaDolg1').AsFloat:=StrToFloat(Label6.Caption);
 quNaklR.ParamByName('SummaDolg2').AsFloat:=StrToFloat(Label7.Caption);
 quNaklR.ParamByName('SummaDolg3').AsFloat:=StrToFloat(Label8.Caption);
 quNaklR.Open;
end;

procedure TfmCloseReturn.ListReturnPlatR;
var
 i: integer;
 MyTempVar: Extended;
begin
 for i:=1 to 3 do
  begin
   quPlatRDolg.Close;
   quPlatRDolg.ParamByName('Buh').AsInteger:=i;
   quPlatRDolg.ParamByName('PostNo').AsInteger:=PostNoSelect;
   quPlatRDolg.Open;
   if quPlatRDolg.RecordCount<>0 then
    MyTempVar:=Abs(quPlatRDolgSumm.AsFloat)
   else
    MyTempVar:=0;
   case i of
    1:Label15.Caption:=FloatToStr(MyTempVar);
    2:Label14.Caption:=FloatToStr(MyTempVar);
    3:Label13.Caption:=FloatToStr(MyTempVar);
   end;
  end;
 for i:=1 to 3 do
  begin
   quPlatROplat.Close;
   quPlatROplat.ParamByName('Buh').AsInteger:=i;
   quPlatROplat.ParamByName('PostNo').AsInteger:=PostNoSelect;
   quPlatROplat.Open;
   if quPlatROplat.RecordCount<>0 then
    MyTempVar:=Abs(quPlatROplatSumm.AsFloat)
   else
    MyTempVar:=0;
   case i of
    1:Label22.Caption:=FloatToStr(MyTempVar);
    2:Label2.Caption:=FloatToStr(MyTempVar);
    3:Label21.Caption:=FloatToStr(MyTempVar);
   end;
  end;
 quPlatR.Close;
 quPlatR.ParamByName('PostNo').AsInteger:=PostNoSelect;
{
 quPlatR.ParamByName('SummaDolg1').AsFloat:=StrToFloat(Label15.Caption);
 quPlatR.ParamByName('SummaDolg2').AsFloat:=StrToFloat(Label14.Caption);
 quPlatR.ParamByName('SummaDolg3').AsFloat:=StrToFloat(Label13.Caption);
}
 quPlatR.Open;

end;


procedure CloseReturn;
var
 RetPost:TRetPost;
begin
 RetPost:=Post(True, True);
 if RetPost.PostNo=0 then exit;

 PostNoSelect:=RetPost.PostNo;

 fmCloseReturn:=TfmCloseReturn.Create(Application);
 try
 with fmCloseReturn do
  begin
   fmCloseReturn.Caption:=fmCloseReturn.Caption+' :'+RetPost.NamePost;
   fmCloseReturn.ListReturnNaklR;
   fmCloseReturn.ShowModal;
  end;
 finally
 fmCloseReturn.quNaklR.Close;
 end;
end;

procedure TfmCloseReturn.RxDBGrid2DblClick(Sender: TObject);
var
 NaklRDolg, NaklRDolgClose, NaklRClose: Extended;
 NaklNoSel, NaklNoFind: integer;
 Dlg : TMlekoSelectEntityTypeFromCloseReturnForm;
 EntityType, EntityTypeMain : string;
begin

 if (quNaklR.RecordCount = 0) then raise Exception.Create('Нет накладных для списания!');

 EntityTypeMain := 'NAKLR';

 NaklNoSel:=quNaklRNaklNo.AsInteger;
 if quNaklR.Eof then quNaklR.Prior
 else quNaklR.Next;
 NaklNoFind:=quNaklRNaklNo.AsInteger;
 quNaklR.Locate('NaklNo',NaklNoSel,[]);



 fmCloseReturn.Hide;

 Dlg := TMlekoSelectEntityTypeFromCloseReturnForm.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk : begin
               if Dlg.rbNaklR.Checked then EntityType := 'NAKLR';
               if Dlg.rbPlatP.Checked then EntityType := 'PLATP';
               if Dlg.rbNaklP.Checked then EntityType := 'NAKLP';
             end;
      mrCancel : raise Exception.Create('Отменено пользователем!');
    end;
  finally
     Dlg.Free;
  end;

 if (EntityType = 'NAKLR') then
  begin
    case CloseReturneNakl(NaklNoSel, PostNoSelect, quNaklRBuh.AsInteger, quNaklRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 if (EntityType = 'PLATR') then
  begin
    case CloseReturnePlat(NaklNoSel, PostNoSelect, quNaklRBuh.AsInteger, quNaklRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 if (EntityType = 'NAKLP') then
  begin
    case CloseReturneNaklP(NaklNoSel, PostNoSelect, quNaklRBuh.AsInteger, quNaklRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 fmCloseReturn.ListReturnNaklR;
 quNaklR.First;
 quNaklR.Locate('NaklNo',NaklNoFind,[]);
 fmCloseReturn.Show;

 quNaklRDolg.Close;
 quNaklRDolg.ParamByName('Buh').AsInteger:=quNaklRBuh.AsInteger;
 quNaklRDolg.ParamByName('PostNo').AsInteger:=PostNoSelect;
 quNaklRDolg.Open;
end;

procedure TfmCloseReturn.RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:RxDBGrid2DblClick(Sender);
 end;
end;

procedure TfmCloseReturn.quNaklRBeforeOpen(DataSet: TDataSet);
begin
  quNaklR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.quNaklRDolgBeforeOpen(DataSet: TDataSet);
begin
  quNaklRDolg.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.quNaklROplatBeforeOpen(DataSet: TDataSet);
begin
  quNaklROplat.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.quPlatRBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatR.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.quPlatRDolgBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatRDolg.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.quPlatROplatBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  quPlatROplat.ParamByName('OurFirmNo').AsInteger:=dmDataModule.FirmNo;
end;

procedure TfmCloseReturn.PageControl1Change(Sender: TObject);
begin
  inherited;
  fmCloseReturn.ListReturnPlatR;
end;

procedure TfmCloseReturn.DBGridEh1DblClick(Sender: TObject);
var
 PlatRDolg, PlatRDolgClose, PlatRClose: Extended;
 PlatNoSel, PlatNoFind: integer;
 Dlg : TMlekoSelectEntityTypeFromCloseReturnForm;
 EntityType, EntityTypeMain : string;
begin

 if (quPlatR.RecordCount = 0) then raise Exception.Create('Нет накладных для списания!');

 EntityTypeMain := 'PLATR';

 PlatNoSel:=quPlatRNaklNo.AsInteger;
 if quPlatR.Eof then quPlatR.Prior
 else quPlatR.Next;
 PlatNoFind:=quPlatRNaklNo.AsInteger;
 quPlatR.Locate('NaklNo',PlatNoSel,[]);

 fmCloseReturn.Hide;
 Dlg := TMlekoSelectEntityTypeFromCloseReturnForm.Create(Application);
  try
    case Dlg.ShowModal of
      mrOk : begin
               if Dlg.rbNaklR.Checked then EntityType := 'NAKLR';
               if Dlg.rbPlatP.Checked then EntityType := 'PLATP';
               if Dlg.rbNaklP.Checked then EntityType := 'NAKLP';
             end;
      mrCancel : begin
                   fmCloseReturn.Show;
                   raise Exception.Create('Отменено пользователем!');
                 end;
    end;
  finally
     Dlg.Free;
  end;

 if (EntityType = 'NAKLR') then
  begin
    case CloseReturneNakl(PlatNoSel, PostNoSelect, quPlatRBuh.AsInteger, quPlatRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 if (EntityType = 'PLATP') then
  begin
    case CloseReturnePlat(PlatNoSel, PostNoSelect, quPlatRBuh.AsInteger, quPlatRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 if (EntityType = 'NAKLP') then
  begin
    case CloseReturneNaklP(PlatNoSel, PostNoSelect, quPlatRBuh.AsInteger, quPlatRSummaDolg.AsFloat, EntityType, EntityTypeMain) of
      1: ShowMessage('Накладная закрыта!!!');
      2: ShowMessage('Накладная закрыта частично!!!');
    end;
  end;

 fmCloseReturn.ListReturnPlatR;
 quPlatR.First;
 quPlatR.Locate('NaklNo',PlatNoFind,[]);
 fmCloseReturn.Show;

 quPlatRDolg.Close;
 quPlatRDolg.ParamByName('Buh').AsInteger:=quPlatRBuh.AsInteger;
 quPlatRDolg.ParamByName('PostNo').AsInteger:=PostNoSelect;
 quPlatRDolg.Open;

// fmCloseReturn.Show;
 
end;

procedure TfmCloseReturn.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:DBGridEh1DblClick(Sender);
  end;
end;

end.

