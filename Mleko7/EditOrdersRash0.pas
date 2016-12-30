unit EditOrdersRash0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB, FR_Class, 
  MemDS, DBAccess, MsAccess, ActnList;

type
  TfmEditOrdersRash = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    deNom: TDBEdit;
    deNamePost: TDBEdit;
    deDatePlat: TDBEdit;
    deSumma: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    lcNameBuh: TDBLookupComboBox;
    Label6: TLabel;
    bbPrint: TBitBtn;
    frReport1: TfrReport;
    quWork: TMSQuery;
    deSpravka: TDBMemo;
    procedure deNamePostEnter(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure deNamePostDblClick(Sender: TObject);
    procedure deNamePostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditOrdersRash: TfmEditOrdersRash;
  procedure EditOrdersRash;
implementation

uses OrdersRash0, data, post0, qrROrder, SelectItem0, qrPlatPoruch0, UtilsDataConvert;

{$R *.DFM}
procedure EditOrdersRash;
begin
 fmEditOrdersRash:=TfmEditOrdersRash.Create(Application);
 try
 dmDataModule.quSetup.Close;
 dmDataModule.quSetup.Open;
 if StrToDate(fmEditOrdersRash.deDatePlat.Text)<dmDataModule.quSetupDateBlock.AsDateTime then
  begin
   fmEditOrdersRash.deNom.ReadOnly:=True;
   fmEditOrdersRash.deDatePlat.ReadOnly:=True;
   fmEditOrdersRash.deNamePost.ReadOnly:=True;
   fmEditOrdersRash.deSumma.ReadOnly:=True;
   fmEditOrdersRash.lcNameBuh.ReadOnly:=True;
   fmEditOrdersRash.deSpravka.ReadOnly:=True;
  end;
 dmDataModule.quSetup.Close;
 if fmEditOrdersRash.ShowModal=mrOk then
  begin
   if fmOrdersRash.quPlatR.State in [dsInsert,dsEdit] then
    fmOrdersRash.quPlatR.Post;
  end
 else
  if fmOrdersRash.quPlatR.State in [dsInsert,dsEdit] then
    fmOrdersrash.quPlatR.Cancel;
 finally
 fmEditOrdersRash.Free;
 end;
end;
procedure TfmEditOrdersRash.deNamePostEnter(Sender: TObject);
var
 RetPost:TRetPost;
begin
 if fmOrdersRash.quPlatRPostNo.AsInteger=0 then
  begin
   RetPost:=Post(True, True);
   if RetPost.PostNo>0 then
    begin
     fmOrdersRash.quPlatR.Edit;
     fmOrdersRash.quPlatRPostNo.AsInteger:=RetPost.PostNo;
     fmOrdersRash.quPlatRName.AsString:=RetPost.NamePost;
     //fmOrdersRash.quPlatR.Post;
    end;
  end;
end;

procedure TfmEditOrdersRash.bbPrintClick(Sender: TObject);
var
 i:integer;
begin
 if fmOrdersRash.quPlatR.State in [dsInsert,dsEdit] then
  fmOrdersRash.quPlatR.Post;
 i:=SelectItem('Печать',['Ордер','Платежка','Объявка']);
 case i of
  0:PrintRashOrder(fmOrdersRash.quPlatRPlatNo.AsInteger);
  1:PrintPlatPoruch(fmOrdersRash.quPlatRPlatNo.AsInteger);
  2:begin
     frReport1.LoadFromFile('Objava0.frf');
     frReport1.ShowReport;
    end;
 end;
end;

procedure TfmEditOrdersRash.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
var
 Year,Month,Day:word;
begin
 if ParName='DateStr' then
  begin
   DecodeDate(fmOrdersRash.quPlatRDatePlat.AsDateTime,Year,Month,Day);
   ParValue:=format('%.2d %s %d р.',[ Day,MonthToStringUkr(Month,True),Year]);
  end;

 if ParName='SummaStr' then
  ParValue:=format('%s грн. %.2d коп.',[IntToStringUkr(Trunc(fmOrdersRash.quPlatRSumma.AsFloat)),
                         Round(Frac(fmOrdersRash.quPlatRSumma.AsFloat)*100)]);

 if ParName='Name' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select NameLong from Post '+
                  'where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quWork.Open;
   ParValue:=quWork.FieldByName('NameLong').AsString;
   quWork.Close;
  end;

 if ParName='OKPO' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select OKPO from Post '+
                  'where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quWork.Open;
   ParValue:=quWork.FieldByName('OKPO').AsString;
   quWork.Close;
  end;
  
 if ParName='NameBank' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select NameBank,RS from Post where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quWork.Open;
   ParValue:=quWork.FieldByName('NameBank').AsString;
   quWork.Close;
  end;

 if ParName='RS' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select NameBank,RS from Post where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=dmDataModule.FirmNo;
   quWork.Open;
   ParValue:=quWork.FieldByName('NameBank').AsString;
   quWork.Close;
  end;

 if ParName='OKPOBank' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select OKPO from Post '+
                  'where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=fmOrdersRash.quPlatRPostNo.AsInteger;
   quWork.Open;
   ParValue:=quWork.FieldByName('OKPO').AsString;
   quWork.Close;
  end;

 if ParName='MFOBank' then
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select MFO from Post '+
                  'where PostNo=:PostNo ');
   quWork.ParamByName('PostNo').AsInteger:=fmOrdersRash.quPlatRPostNo.AsInteger;
   quWork.Open;
   ParValue:=quWork.FieldByName('MFO').AsString;
   quWork.Close;
  end;

 if ParName='NameSotrud' then
  ParValue:='????';
end;

procedure TfmEditOrdersRash.deNamePostDblClick(Sender: TObject);
var
 RetPost:TRetPost;
begin
 RetPost:=Post(True, True);
 if RetPost.PostNo>0 then
  begin
   fmOrdersRash.quPlatR.Edit;
   fmOrdersRash.quPlatRPostNo.AsInteger:=RetPost.PostNo;
   fmOrdersRash.quPlatRName.AsString:=RetPost.NamePost;
   //fmOrdersRash.quPlatR.Post;
  end;
end;

procedure TfmEditOrdersRash.deNamePostKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  deNamePostDblClick(Sender);
end;

procedure TfmEditOrdersRash.Panel1Exit(Sender: TObject);
begin
 dmDataModule.quSetup.Close;
 dmDataModule.quSetup.Open;
 if StrToDate(deDatePlat.Text)>dmDataModule.quSetupDateBlock.AsDateTime then
  begin
   //
  end
 else
  begin
   MessageDlg('Период заблокирован!!!', mtError, [mbOk], 0);
   ActiveControl:=deDatePlat;
  end;
 dmDataModule.quSetup.Close;
end;

end.
