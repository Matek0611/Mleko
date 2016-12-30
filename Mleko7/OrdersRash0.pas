unit OrdersRash0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBAccess, MsAccess, MemDS, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, SelPlat, ActnList;

type
  TfmOrdersRash = class(TMlekoForm)
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    quPlatR: TMSQuery;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dsPlat: TDataSource;
    UpdateSQL1: TMSUpdateSQL;
    quPlatRPlatNo: TIntegerField;
    quPlatRNom: TIntegerField;
    quPlatRPostNo: TSmallintField;
    quPlatRName: TStringField;
    quPlatRDatePlat: TDateTimeField;
    quBuhTipPlat: TMSQuery;
    quBuhTipPlatTipNo: TSmallintField;
    quBuhTipPlatTipName: TStringField;
    quPlatRBuh: TSmallintField;
    quPlatRNameBuh: TStringField;
    quPlatRSumma: TFloatField;
    quPlatRSpravka: TStringField;
    bbPrint: TBitBtn;
    quPlatRkass_num: TIntegerField;
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure quPlatRBeforePost(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure quPlatRBeforeDelete(DataSet: TDataSet);
    procedure quPlatRNewRecord(DataSet: TDataSet);
    procedure bbPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrdersRash: TfmOrdersRash;
  procedure OrdersRash(RetSelPlat:TRetSelPlat);
implementation

uses EditOrdersRash0, data, qrPLatR0;



{$R *.DFM}
procedure OrdersRash(RetSelPlat:TRetSelPlat);
var
 TmpSQL:string;
begin
 fmOrdersRash:=TfmOrdersRash.Create(Application);
 try
 TmpSQL:='';
 if RetSelPlat.PostNo>0 then
  TmpSql:='(PlatR.PostNo='+IntToStr(RetSelPlat.PostNo)+')';
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
     TmpSql:='(DatePlat>=:DateBegin) and (DatePlat<=:DateEnd) ';
   end;
 if Length(TmpSql)>0 then
  TmpSql:=TmpSql+'and (PlatR.Buh In '+RetSelPlat.BuhTip+')'
 else
  TmpSql:='(PlatR.Buh In '+RetSelPlat.BuhTip+')';
 //
 if Length(TmpSql)>0 then
  fmOrdersRash.quPlatR.MacroByName('_where').Value:=TmpSQL;
 fmOrdersRash.quPlatR.Prepare;
 if RetSelPlat.DateBegin>0 then
  fmOrdersRash.quPlatR.ParamByName('DateBegin').AsDate:=RetSelPlat.DateBegin;
 if RetSelPlat.DateEnd>0 then
  fmOrdersRash.quPlatR.ParamByName('DateEnd').AsDate:=RetSelPlat.DateEnd;

 fmOrdersRash.quBuhTipPlat.Open;
 fmOrdersRash.quPlatR.Open;
 fmOrdersRash.ShowModal;
 finally
 fmOrdersRash.quPlatR.Close;
 fmOrdersRash.quBuhTipPlat.Close;
 fmOrdersRash.Free;
 end;
end;

procedure TfmOrdersRash.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
var
 PlatNo:integer;
begin
 Screen.Cursor:=crHourGlass;
 PlatNo:=quPlatRPlatNo.AsInteger;
 quPlatR.Close;
 case ACol of
  0:quPlatR.MacroByName('_order').Value:='PlatNo';
  1:quPlatR.MacroByName('_order').Value:='Nom';
  2:quPlatR.MacroByName('_order').Value:='DatePlat,Name';
  3:quPlatR.MacroByName('_order').Value:='Buh,DatePlat,Name';
  4:quPlatR.MacroByName('_order').Value:='Name,DatePlat';
  5:quPlatR.MacroByName('_order').Value:='Summa';
 end;
 quPlatR.Prepare;
 quPlatR.Open;
 quPlatR.Locate('PlatNo',PlatNo,[]);
 Screen.Cursor:=crDefault;
end;

procedure TfmOrdersRash.quPlatRBeforePost(DataSet: TDataSet);
begin
 if quPlatR.State in [dsInsert] then
  begin
   dmDataModule.quWork.SQL.Clear;
   dmDataModule.quWork.SQL.Add('select Max(PlatNo) PlatNo from PlatR ');
   dmDataModule.quWork.Open;
   quPlatRPlatNo.AsInteger:=dmDataModule.quWork.FieldByName('PlatNo').AsInteger+1;
   dmDataModule.quWork.Close;
   UpdateSQL1.Apply(ukInsert);
  end
 else
  UpdateSQL1.Apply(ukModify);
end;

procedure TfmOrdersRash.RxDBGrid1DblClick(Sender: TObject);
begin
 EditOrdersRash;
end;

procedure TfmOrdersRash.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_SPACE:RxDBGrid1.SelectedRows.CurrentRowSelected:=not RxDBGrid1.SelectedRows.CurrentRowSelected;
  VK_RETURN:EditOrdersRash;
  VK_INSERT:begin
             Key:=0;
             quPlatR.Insert;
             EditOrdersRash;
            end;
  VK_DELETE:if (Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO)=IDYES) then
             begin
              Key:=0;
              dmDataModule.quSetup.Close;
              dmDataModule.quSetup.Open;
              if quPlatRDatePlat.AsDateTime<dmDataModule.quSetupDateBlock.AsDateTime then
               MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0)
              else
               quPlatR.Delete;
              dmDataModule.quSetup.Close;
             end;
 end;
end;

procedure TfmOrdersRash.quPlatRBeforeDelete(DataSet: TDataSet);
begin
 UpdateSQL1.Apply(ukDelete);
end;

procedure TfmOrdersRash.quPlatRNewRecord(DataSet: TDataSet);
begin
 quPlatRDatePlat.AsDateTime:=Date();
 quPlatRSumma.AsFloat:=0;
 quPlatRBuh.AsInteger:=1;
end;

procedure TfmOrdersRash.bbPrintClick(Sender: TObject);
var
 PlatNo,c: integer;
begin
 for c:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
   quPlatR.Bookmark:=RxDBGrid1.SelectedRows[c];
   PlatNo:=quPlatRPlatNo.AsInteger;
  end;
 qrPlatR:=TqrPlatR.Create(Application);
 try
 qrPlatR.Preview;
 finally
 qrPlatR.Free;
 end;
 quPlatR.Locate('PlatNo',PlatNo,[]);
 ActiveControl:=RxDBGrid1;
end;

end.
