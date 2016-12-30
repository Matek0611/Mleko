unit CrossReturne0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Db, DBGridEh, ExtCtrls, FR_Class,
  FR_DSet, FR_DBSet, DBAccess, MsAccess, MemDS,  Variants, RxMemDS, GridsEh,
  ActnList;

type
  TfmCrossReturne = class(TMlekoForm)
    Panel1: TPanel;
    bbExit: TBitBtn;
    DBGridEh1: TDBGridEh;
    dsCrossPostNaklR: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qKolR: TMSQuery;
    mdCrossReturne: TRxMemoryData;
    qSummR: TMSQuery;
    qSummRKol: TFloatField;
    qSummRName: TStringField;
    qSummRRashodSumm: TFloatField;
    mdCrossSumm: TRxMemoryData;
    mdCrossSummPostName: TStringField;
    mdCrossSummNaklNom: TStringField;
    mdCrossSummSumm: TFloatField;
    dsCrossPrintNakl: TDataSource;
    qSummRNaklNo: TIntegerField;
    BitBtn1: TBitBtn;
    mdCrossPrintNakl: TRxMemoryData;
    mdCrossPrintNaklPostName: TStringField;
    mdCrossPrintNaklNaklNom: TStringField;
    mdCrossPrintNaklSumm: TFloatField;
    qSummRNameLong: TStringField;
    qPostR: TMSQuery;
    dsPostR: TDataSource;
    qPostRName: TStringField;
    qPostRNameLong: TStringField;
    mdCrossSummPostNo: TIntegerField;
    qSummRPostNo: TSmallintField;
    qSummRNameTovar: TStringField;
    frDBDataSet2: TfrDBDataSet;
    dsSummaR: TDataSource;
    mdCrossPrintNaklPostNo: TIntegerField;
    mdCrossPrintTovar: TRxMemoryData;
    mdCrossPrintTovarPostNo: TIntegerField;
    mdCrossPrintTovarPostName: TStringField;
    mdCrossPrintTovarKol: TFloatField;
    mdCrossPrintTovarName: TStringField;
    mdCrossPrintTovarRashodSumm: TFloatField;
    dsCrossPrintTovar: TDataSource;
    frDBDataSet3: TfrDBDataSet;
    qPrintTovar: TMSQuery;
    mdCrossPrintTovarVidTovar: TStringField;
    qPostRAddressNo: TSmallintField;
    qPostRAddress: TStringField;
    qPostRPostNo: TSmallintField;
    qKolRVidName: TStringField;
    qKolRNameTovar: TStringField;
    qKolRKol: TFloatField;
    qKolRName: TStringField;
    qKolRPostNo: TSmallintField;
    qKolRAddressNo: TSmallintField;
    qKolRAddress: TStringField;
    mdCrossPrintNaklAddress: TStringField;
    qSummRAddress: TStringField;
    qSummRAddressNo: TSmallintField;
    mdCrossSummAddressNo: TIntegerField;
    mdCrossSummAddress: TStringField;
    mdCrossPrintNaklAddressNo: TIntegerField;
    qPrintTovarTovarNo: TSmallintField;
    qPrintTovarVidName: TStringField;
    qPrintTovarNameTovar: TStringField;
    qPrintTovarPostNo: TSmallintField;
    qPrintTovarName: TStringField;
    qPrintTovarNameLong: TStringField;
    qPrintTovarNaklNo: TIntegerField;
    qPrintTovarDateNaklFirst: TDateTimeField;
    qPrintTovarKol: TFloatField;
    qPrintTovarPriceOut: TFloatField;
    qPrintTovarRashodSumm: TFloatField;
    qPrintTovarAddressNo: TSmallintField;
    qPrintTovarAddress: TStringField;
    qPrintTovarNameOrder: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure mdCrossSummCreat;
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TPeriodDateCrossReturne = array [1..2] of tDateTime;
var
  fmCrossReturne: TfmCrossReturne;
  ReportTitle: String;
  PeriodCrossReturne: TPeriodDateCrossReturne;
  procedure CrossReturne;


implementation

{$R *.dfm}
uses GetDate0, SelectItem0, CrossReturnePost0;

function CaptionTitleDBGrid(CaptionTitle: string):string;
var
 i: integer;
begin
 Result:='';
 if Length(CaptionTitle)<10 then Result:=CaptionTitle
 else
  for i:=1 to Length(CaptionTitle) do
   begin
    case i of
      9:Result:=Result+' '+copy(CaptionTitle,i,1);
     18:Result:=Result+' '+copy(CaptionTitle,i,1);
     27:Result:=Result+' '+copy(CaptionTitle,i,1);
     36:Result:=Result+' '+copy(CaptionTitle,i,1)
    else
     Result:=Result+copy(CaptionTitle,i,1);
    end;
   end;

end;

procedure CrossReturne;
var
 Period: TPeriodDate;
 FindNameTovar: string;
 i: integer;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;
 PeriodCrossReturne[1]:=Period[1];
 PeriodCrossReturne[2]:=Period[2];
 ReportTitle:='за период: '+DateToStr(Period[1])+' - '+DateToStr(Period[2]);
 fmCrossReturne:=TfmCrossReturne.Create(Application);
 try
  fmCrossReturne.qPostR.Close;
  fmCrossReturne.qPostR.ParamByName('DatePostB').AsDate:=Period[1];
  fmCrossReturne.qPostR.ParamByName('DatePostE').AsDate:=Period[2];
  fmCrossReturne.qPostR.Open;
  fmCrossReturne.qKolR.Close;
  fmCrossReturne.qKolR.ParamByName('DatePostB').AsDate:=Period[1];
  fmCrossReturne.qKolR.ParamByName('DatePostE').AsDate:=Period[2];
  fmCrossReturne.qKolR.Open;
  fmCrossReturne.qSummR.Close;
  fmCrossReturne.qSummR.ParamByName('DatePostB').AsDate:=Period[1];
  fmCrossReturne.qSummR.ParamByName('DatePostE').AsDate:=Period[2];
  fmCrossReturne.qSummR.Open;

  if fmCrossReturne.qPostR.RecordCount=0 then exit;

  with fmCrossReturne.mdCrossReturne do begin
  Active := False;
  FieldDefs.Clear;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'VidTovar';
     DataType := ftString;
     Size := 40;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'NameTovar';
     DataType := ftString;
     Size := 40;
     Required := False;
    end;
   with FieldDefs.AddFieldDef do
    begin
     Name := 'Kolvo';
     DataType := ftFloat;
     Required := False;
    end;
   fmCrossReturne.qPostR.First;
   while not fmCrossReturne.qPostR.Eof do
    begin
     with FieldDefs.AddFieldDef do
      begin
       Name := IntToStr(fmCrossReturne.qPostRPostNo.AsInteger)+'_'+IntToStr(fmCrossReturne.qPostRAddressNo.AsInteger);
       DataType := ftFloat;
       Required := False;
       end;
    fmCrossReturne.qPostR.Next;
    end;
   Active:=True;
   end;

   fmCrossReturne.qKolR.First;
   FindNameTovar:='';
   While not fmCrossReturne.qKolR.Eof do
    begin
     if FindNameTovar<>fmCrossReturne.qKolRNameTovar.AsString then
      if not fmCrossReturne.mdCrossReturne.Locate('NameTovar',fmCrossReturne.qKolRNameTovar.AsString,[]) then
       begin
        fmCrossReturne.mdCrossReturne.Insert;
        fmCrossReturne.mdCrossReturne.FieldByName('VidTovar').AsString:=fmCrossReturne.qKolRVidName.AsString;
        fmCrossReturne.mdCrossReturne.FieldByName('NameTovar').AsString:=fmCrossReturne.qKolRNameTovar.AsString;
        fmCrossReturne.mdCrossReturne.Post;
        fmCrossReturne.mdCrossReturne.Refresh;

       end;
     FindNameTovar:=fmCrossReturne.qKolRNameTovar.AsString;
     fmCrossReturne.mdCrossReturne.Edit;
     fmCrossReturne.mdCrossReturne.FieldByName(IntToStr(fmCrossReturne.qKolRPostNo.AsInteger)+'_'+IntToStr(fmCrossReturne.qKolRAddressNo.AsInteger)).AsFloat:=fmCrossReturne.mdCrossReturne.FieldByName(IntToStr(fmCrossReturne.qKolRPostNo.AsInteger)+'_'+IntToStr(fmCrossReturne.qKolRAddressNo.AsInteger)).AsFloat+fmCrossReturne.qKolRKol.AsFloat;
     fmCrossReturne.mdCrossReturne.FieldByName('Kolvo').AsFloat:=fmCrossReturne.mdCrossReturne.FieldByName('Kolvo').AsFloat+fmCrossReturne.qKolRKol.AsFloat;
     fmCrossReturne.mdCrossReturne.Post;
     fmCrossReturne.mdCrossReturne.Refresh;
     fmCrossReturne.qKolR.Next;
    end;

  fmCrossReturne.mdCrossReturne.SortOnFields('VidTovar',True,False);
  fmCrossReturne.mdCrossReturne.Active:=True;
  fmCrossReturne.mdCrossReturne.First;

  fmCrossReturne.qPostR.First;
  i:=3;
   while not fmCrossReturne.qPostR.Eof do
    begin
//     fmCrossReturne.DBGridEh1.Columns[i].Title.Caption:=CaptionTitleDBGrid(fmCrossReturne.qPostRName.AsString);
     fmCrossReturne.DBGridEh1.Columns[i].Title.Caption:=fmCrossReturne.qPostRName.AsString;
     fmCrossReturne.DBGridEh1.Columns[i].Title.Orientation:=tohVertical;
     fmCrossReturne.DBGridEh1.Columns[i].Width:=22;
     i:=i+1;
     fmCrossReturne.qPostR.Next;
    end;


  fmCrossReturne.DBGridEh1.Columns[0].Title.Caption:='Вид';
  fmCrossReturne.DBGridEh1.Columns[0].Width:=80;
  fmCrossReturne.DBGridEh1.Columns[1].Title.Caption:='Наименование';
  fmCrossReturne.DBGridEh1.Columns[1].Width:=180;
//  fmCrossReturne.DBGridEh1.Columns[1].Color:=clSilver;
  fmCrossReturne.DBGridEh1.Columns[2].Title.Caption:='Всего';
  fmCrossReturne.DBGridEh1.Columns[2].Width:=45;
//  fmCrossReturne.DBGridEh1.Columns[2].Color:=clRed;
  if fmCrossReturne.DBGridEh1.FieldCount>1 then fmCrossReturne.DBGridEh1.FrozenCols:=3;
  fmCrossReturne.Caption:='Возврат товара: '+DateToStr(Period[1])+'-'+DateToStr(Period[2]);
  fmCrossReturne.ShowModal;

 finally
  fmCrossReturne.qKolR.Close;
  fmCrossReturne.qPostR.Close;
  fmCrossReturne.qSummR.Close;
  fmCrossReturne.Free;
 end;
//
end;

procedure TfmCrossReturne.mdCrossSummCreat;
var
 PostNoFind: string;
 NaklNomFind: Integer;
begin
 mdCrossSumm.Active:=False;
 mdCrossSumm.Active:=True;
 PostNoFind:='';
 NaklNomFind:=0;
 qSummR.First;
 while not qSummR.Eof do
  begin
   if PostNoFind<>IntToStr(qSummRPostNo.AsInteger)+'_'+IntToStr(qSummRAddressNo.AsInteger) then
    begin
     mdCrossSumm.Insert;
     mdCrossSummPostNo.AsInteger:=qSummRPostNo.Asinteger;
     mdCrossSummAddressNo.AsInteger:=qSummRAddressNo.Asinteger;
     mdCrossSummPostName.AsString:=qSummRName.AsString;
     mdCrossSummAddress.AsString:=qSummRAddress.AsString;
     mdCrossSummNaklNom.AsString:=IntToStr(qSummRNaklNo.AsInteger);
     mdCrossSummSumm.AsFloat:=qSummRRashodSumm.AsFloat;
     mdCrossSumm.Post;
     mdCrossSumm.Refresh;
     PostNoFind:=IntToStr(qSummRPostNo.AsInteger)+'_'+IntToStr(qSummRAddressNo.AsInteger);
     NaklNomFind:=qSummRNaklNo.AsInteger;
    end
   else
    begin
     mdCrossSumm.Locate('PostNo; AddressNo', VarArrayOf([qSummRPostNo.AsInteger, qSummRAddressNo.AsInteger]) ,[]);
     mdCrossSumm.Edit;
     if NaklNomFind<>qSummRNaklNo.AsInteger then
      mdCrossSummNaklNom.AsString:=mdCrossSummNaklNom.AsString+', '+IntToStr(qSummRNaklNo.AsInteger);
     mdCrossSummSumm.AsFloat:=mdCrossSummSumm.AsFloat+qSummRRashodSumm.AsFloat;
     mdCrossSumm.Post;
     mdCrossSumm.Refresh;
     PostNoFind:=IntToStr(qSummRPostNo.AsInteger)+'_'+IntToStr(qSummRAddressNo.AsInteger);
     NaklNomFind:=qSummRNaklNo.AsInteger;
    end;
   qSummR.Next;
  end;
 mdCrossSumm.SortOnFields('PostName',True,False);

end;

procedure TfmCrossReturne.BitBtn1Click(Sender: TObject);
var
 SqlText: string;
begin
 SqlText:='';
 qPostR.First;
 case SelectItem('Печать',['Печать по накладным','Печать по товару']) of
  -1:begin
      //
     end;
  0:begin
     mdCrossSummCreat;
     SqlText:=CrossReturnePost(0);
     if SqlText<>'' then
      begin
       qPostR.First;
//       mdCrossSummCreat;
       mdCrossPrintNakl.SortOnFields('PostName',True,False);
       frReport1.LoadFromFile('CrossReturne.frf');
       frReport1.ShowReport;
      end;
    end;
  1:begin
     SqlText:=CrossReturnePost(1);
     if SqlText<>'' then
      begin
       fmCrossReturne.qPrintTovar.Close;
       fmCrossReturne.qPrintTovar.ParamByName('DatePostB').AsDate:=PeriodCrossReturne[1];
       fmCrossReturne.qPrintTovar.ParamByName('DatePostE').AsDate:=PeriodCrossReturne[2];
       fmCrossReturne.qPrintTovar.MacroByName('SQLString').Value:=SqlText;
       fmCrossReturne.qPrintTovar.Open;
       {fmCrossReturne.qPrintVid.Close;
       fmCrossReturne.qPrintVid.ParamByName('DatePostB').AsDate:=PeriodCrossReturne[1];
       fmCrossReturne.qPrintVid.ParamByName('DatePostE').AsDate:=PeriodCrossReturne[2];
       fmCrossReturne.qPrintVid.Open;}
       frReport1.LoadFromFile('CrossReturne0.frf');
       fmCrossReturne.qPrintTovarVidName.AsString;
       frReport1.ShowReport;
      end;
    end;
 end;
end;

procedure TfmCrossReturne.DBGridEh1ColEnter(Sender: TObject);
var
 i: Integer;
begin
 if DBGridEh1.Col>3 then
  begin
   fmCrossReturne.qPostR.First;
   for i:=1 to DBGridEh1.Col-4 do
     fmCrossReturne.qPostR.Next;
   DBGridEh1.Hint:=fmCrossReturne.qPostRNameLong.AsString+' '+fmCrossReturne.qPostRAddress.AsString;
  end
 else
  DBGridEh1.Hint:='';
end;

procedure TfmCrossReturne.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='ReportTitle' then
  ParValue:=ReportTitle;
end;

end.

