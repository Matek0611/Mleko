unit OrdersPrih0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBAccess, MsAccess, MemDS, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, SelPlat, ActnList;

type
  TfmOrdersPrih = class(TMlekoForm)
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    quPlatP: TMSQuery;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dsPlat: TDataSource;
    UpdateSQL1: TMSUpdateSQL;
    quPlatPPlatNo: TIntegerField;
    quPlatPNom: TIntegerField;
    quPlatPPostNo: TSmallintField;
    quPlatPName: TStringField;
    quPlatPDatePlat: TDateTimeField;
    quPlatPBuh: TSmallintField;
    quBuhTipPlat: TMSQuery;
    quBuhTipPlatTipNo: TSmallintField;
    quBuhTipPlatTipName: TStringField;
    quPlatPBuhName: TStringField;
    quPlatPSumma: TFloatField;
    bbPrint: TBitBtn;
    quPlatPSpravka: TStringField;
    quPlatPkass_num: TIntegerField;
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure quPlatPBeforePost(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quPlatPBeforeDelete(DataSet: TDataSet);
    procedure quPlatPNewRecord(DataSet: TDataSet);
    procedure bbPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrdersPrih: TfmOrdersPrih;
  procedure OrdersPrih(RetSelPlat:TRetSelPlat);
implementation

uses EditOrdersPrih0, data, qrPLatP0;


{$R *.DFM}
procedure OrdersPrih(RetSelPlat:TRetSelPlat);
var
 TmpSQL:string;
begin
 fmOrdersPrih:=TfmOrdersPrih.Create(Application);
 try
 TmpSQL:='';
 if RetSelPlat.PostNo>0 then
  TmpSql:='(PlatP.PostNo='+IntToStr(RetSelPlat.PostNo)+')';
 if (RetSelPlat.DateBegin>0) then
  if (RetSelPlat.DateEnd=0) then
   begin
    if Length(TmpSql)>0 then
     TmpSql:=TmpSql+' and (DatePlat=:DateBegin) '
    else
     TmpSql:='(DatePlat=:DateBegin) ';
   end
  else
   begin
    if Length(TmpSql)>0 then
     TmpSql:=TmpSql+' and (DatePlat>=:DateBegin) and (DatePlat<=:DateEnd) '
    else
     TmpSql:=TmpSql+'(DatePlat>=:DateBegin) and (DatePlat<=:DateEnd) ';
   end;
 if Length(TmpSql)>0 then
  TmpSql:=TmpSql+'and (PlatP.Buh In '+RetSelPlat.BuhTip+')'
 else
  TmpSql:='(PlatP.Buh In '+RetSelPlat.BuhTip+')';
 //
 if Length(TmpSql)>0 then
  fmOrdersPrih.quPlatP.MacroByName('_where').Value:=TmpSQL;
 fmOrdersPrih.quPlatP.Prepare;
 if (RetSelPlat.DateBegin>0) then
  fmOrdersPrih.quPlatP.ParamByName('DateBegin').AsDate:=RetSelPlat.DateBegin;
 if (RetSelPlat.DateEnd>0) then
  fmOrdersPrih.quPlatP.ParamByName('DateEnd').AsDate:=RetSelPlat.DateEnd;
// fmOrdersPrih.quPlatP.MacroByName('Tip').Value:=RetSelPlat.BuhTip;
 fmOrdersPrih.quBuhTipPlat.Open;
 fmOrdersPrih.quPlatP.Open;
 fmOrdersPrih.ShowModal;
 finally
 fmOrdersPrih.quPlatP.Close;
 fmOrdersPrih.quBuhTipPlat.Close;
 fmOrdersPrih.Free;
 end;
end;
procedure TfmOrdersPrih.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
 PlatNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 PlatNo:=quPlatPPlatNo.AsInteger;
 quPlatP.Close;
 case ACol of
  0:quPlatP.MacroByName('_order').Value:='PlatNo';
  1:quPlatP.MacroByName('_order').Value:='Nom,DatePlat';
  2:quPlatP.MacroByName('_order').Value:='DatePlat,Name';
  3:quPlatP.MacroByName('_order').Value:='Buh,DatePlat,Name';
  4:quPlatP.MacroByName('_order').Value:='Name,DatePlat';
  5:quPlatP.MacroByName('_order').Value:='Summa';
 end;
 quPlatP.Prepare;
 quPlatP.Open;
 quPlatP.Locate('PlatNo',PlatNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmOrdersPrih.quPlatPBeforePost(DataSet: TDataSet);
begin
 if quPlatP.State in [dsInsert] then
  begin
   dmDataModule.quWork.SQL.Clear;
   dmDataModule.quWork.SQL.Add('select Max(PlatNo) PlatNo from PlatP ');
   dmDataModule.quWork.Open;
   quPlatPPlatNo.AsInteger:=dmDataModule.quWork.FieldByName('PlatNo').AsInteger+1;
   dmDataModule.quWork.Close;
   UpdateSQL1.Apply(ukInsert);
  end
 else
  UpdateSQL1.Apply(ukModify);
end;

procedure TfmOrdersPrih.RxDBGrid1DblClick(Sender: TObject);
begin
 EditOrdersPrih;
end;

procedure TfmOrdersPrih.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:EditOrdersPrih;
  VK_INSERT:begin
             Key:=0;
             quPlatP.Insert;
             EditOrdersPrih;
            end;
  VK_DELETE:if (Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO)=IDYES) then
             begin
              Key:=0;
               dmDataModule.quSetup.Close;
               dmDataModule.quSetup.Open;
               if quPlatPDatePlat.AsDateTime<dmDataModule.quSetupDateBlock.AsDateTime then
                MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0)
               else
                quPlatP.Delete;
               dmDataModule.quSetup.Close;
             end;
  VK_SPACE:RxDBGrid1.SelectedRows.CurrentRowSelected:=not RxDBGrid1.SelectedRows.CurrentRowSelected; 
 end;
end;

procedure TfmOrdersPrih.quPlatPBeforeDelete(DataSet: TDataSet);
begin
 UpdateSQL1.Apply(ukDelete);
end;

procedure TfmOrdersPrih.quPlatPNewRecord(DataSet: TDataSet);
begin
 quPlatPDatePlat.AsDateTime:=Date();
 quPlatPBuh.AsInteger:=1;
 quPlatPSumma.AsFloat:=0;
end;

procedure TfmOrdersPrih.bbPrintClick(Sender: TObject);
begin
 qrPlatP:=TqrPlatP.Create(Application);
 try
 qrPlatP.Preview;
 finally
 qrPlatP.Free;
 end;
end;



end.
