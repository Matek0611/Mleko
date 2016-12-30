unit SotrudSalary0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, FR_DSet, FR_DBSet,
  FR_Class, Excel97, ComCtrls, ComObj, MsAccess, MemDS, DBAccess, ActnList;

type
  TfmSotrudSalary = class(TMlekoForm)
    quWork: TMSQuery;
    dsSotrudSalary3: TDataSource;
    frDBDataSet3: TfrDBDataSet;
    frReport3: TfrReport;
    quNaklR: TMSQuery;
    quNaklRVidName: TStringField;
    quNaklRNameTovar: TStringField;
    dsNaklR: TDataSource;
    frDBDataSet4: TfrDBDataSet;
    frReport4: TfrReport;
    quNaklRKol: TFloatField;
    quNaklRSumma: TFloatField;
    spSotrudSalary3: TMSStoredProc;
    spSotrudSalary3Summa1: TFloatField;
    spSotrudSalary3Summa2: TFloatField;
    spSotrudSalary3Summa3: TFloatField;
    spSotrudSalary3Summa4: TFloatField;
    spSotrudSalary3Summa5: TFloatField;
    spSotrudSalary3Summa6: TFloatField;
    spSotrudSalary3Summa7: TFloatField;
    spSotrudSalary3Summa8: TFloatField;
    spSotrudSalary3DatePlat: TDateTimeField;
    spSotrudSalary3DateNakl: TDateTimeField;
    spSotrudSalary3NomNakl: TIntegerField;
    spSotrudSalary3ColnPrice: TSmallintField;
    spSotrudSalary3Name: TStringField;
    spSotrudSalary3TipName: TStringField;
    quNaklR2: TMSQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    dsNaklR2: TDataSource;
    frDBDataSet5: TfrDBDataSet;
    frReport5: TfrReport;
    ProgressBar1: TProgressBar;
    procedure frReport3GetValue(const ParName: String;
      var ParValue: Variant);
  private
    { Private declarations }
    RepTitle:string;
  public
    { Public declarations }
  end;

var
  fmSotrudSalary: TfmSotrudSalary;
  procedure SotrudSalary3;
  procedure SaleSotrud;
  procedure SaleSotrudExcel;
  procedure SaleGroupVid(SelectOtdel: String);
implementation

uses GetDate0, Sotrud0;

{$R *.DFM}

procedure SotrudSalary3;
var
 Period:TPeriodDate;
 SotrudNo:integer;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmSotrudSalary:=TfmSotrudSalary.Create(Application);
 try
 with fmSotrudSalary do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   RepTitle:=quWork.FieldByName('SotrudName').AsString+'   '+DateToStr(Period[1])+
             ' - '+DateToStr(Period[2]);
   quWork.Close;
   spSotrudSalary3.ParamByName('DateBegin').AsDate:=Period[1];
   spSotrudSalary3.ParamByName('DateEnd').AsDate:=Period[2];
   spSotrudSalary3.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   spSotrudSalary3.Open;
   frReport3.LoadFromFile('SotrudSalary2.frf');
   Screen.Cursor:=crDefault;
   frReport3.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmSotrudSalary.spSotrudSalary3.Close;
 fmSotrudSalary.Free;
 end
end;


procedure TfmSotrudSalary.frReport3GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if ParName='RepTitle' then
  ParValue:=RepTitle;
end;

procedure SaleSotrudExcel;
var
 Period:TPeriodDate;
 i, SotrudNo, RowCount:integer;
 XLApp,Sheet,Colum:Variant;
 RowSumm_1,RowSumm_2,RowSumm_All_1,RowSumm_All_2: Extended;
 GroupTovar: string;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmSotrudSalary:=TfmSotrudSalary.Create(Nil);
 try
 with fmSotrudSalary do
  begin
   Width:=388;
   Height:=61;
   Position:=poScreenCenter;
   Caption:='Продажи по менеджерам';
   XLApp:= CreateOleObject('Excel.Application');
   XLApp.Workbooks.Add(-4167);
   XLApp.Workbooks[1].WorkSheets[1].Name:='Отчёт "Продажи по менеджерам"';
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт "Продажи по менеджерам"'].Columns;
   Colum.Columns[1].ColumnWidth:=55;
   Colum.Columns[2].ColumnWidth:=10;
   Colum.Columns[3].ColumnWidth:=10;
   Colum:=XLApp.Workbooks[1].WorkSheets['Отчёт "Продажи по менеджерам"'].Rows;
   Colum.Rows[1].Font.Bold:=true;
   Colum.Rows[1].Font.Color:=clNavy;
   Colum.Rows[1].Font.Size:=14;

   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   RepTitle:=quWork.FieldByName('SotrudName').AsString+'   '+DateToStr(Period[1])+
             ' - '+DateToStr(Period[2]);
   quWork.Close;

   Sheet:=XLApp.Workbooks[1].WorkSheets['Отчёт "Продажи по менеджерам"'];
   Sheet.Cells[1,1]:='Продажи '+RepTitle;
   for i:=1 to 3 do
    begin
     Sheet.Cells.Item[2, i].Interior.Color := clSilver;
     Sheet.Cells.Item[2, i].Font.Bold:=true;
     Sheet.Cells.Item[2, i].HorizontalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].VerticalAlignment := xlCenter;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[2, i].WrapText := True;
    end;

   Sheet.Cells[2,1]:='Наименование';
   Sheet.Cells[2,2]:='Кол-во';
   Sheet.Cells[2,3]:='Сумма';

   quNaklR.ParamByName('DateBegin').AsDate:=Period[1];
   quNaklR.ParamByName('DateEnd').AsDate:=Period[2];
   quNaklR.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quNaklR.Open;

   ProgressBar1.Min := 0;
   ProgressBar1.Max := quNaklR.RecordCount;
   Show;
   Update;

   RowSumm_All_1:=0.00;
   RowSumm_All_2:=0.00;
   RowSumm_1:=0.00;
   RowSumm_2:=0.00;
   RowCount:=3;
   GroupTovar:='';
   quNaklR.First;
   while not quNaklR.Eof do
    begin
     if GroupTovar=quNaklRVidName.AsString then
      begin
       for i:=1 to 3 do
        begin
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeRight].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
         case i of
          1: Sheet.Cells[RowCount,i]:=quNaklRNameTovar.AsString;
          2: begin
              Sheet.Cells[RowCount,i]:=Format('%.2f',[quNaklRKol.AsFloat]);
              Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
             end;
          3: begin
              Sheet.Cells[RowCount,i]:=Format('%.2f',[quNaklRSumma.AsFloat]);
              Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
             end;
         end;
        end;
       RowSumm_1:=RowSumm_1+quNaklRKol.AsFloat;
       RowSumm_2:=RowSumm_2+quNaklRSumma.AsFloat;
       ProgressBar1.StepBy(1);
       Update;
       quNaklR.Next;
      end
     else
      begin
       if not (RowSumm_1=0.00) then
        begin
         for i:=1 to 3 do
          begin
           Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
           Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
           Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
           Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
          end;
         Sheet.Cells[RowCount,1]:='Итого:';
         Sheet.Cells[RowCount,2]:=Format('%.2f',[RowSumm_1]);
         Sheet.Cells[RowCount,3]:=Format('%.2f',[RowSumm_2]);
         Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, 3].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

         RowSumm_All_1:=RowSumm_All_1+RowSumm_1;
         RowSumm_All_2:=RowSumm_All_2+RowSumm_2;

         RowSumm_1:=0.00;
         RowSumm_2:=0.00;
         RowCount:=RowCount+1;
        end;
       GroupTovar:=quNaklRVidName.AsString;
       for i:=1 to 3 do
        begin
         Sheet.Cells.Item[RowCount, i].Interior.Color := clSkyBlue;
         Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
         Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
         Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
        end;
       Sheet.Cells[RowCount,1]:=GroupTovar;
       Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
       Sheet.Cells.Item[RowCount, 3].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

      end;

     RowCount:=RowCount+1;

    end;

   for i:=1 to 3 do
    begin
     Sheet.Cells.Item[RowCount, i].Interior.Color := clYellow;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
    end;
   Sheet.Cells[RowCount,1]:='Итого:';
   Sheet.Cells[RowCount,2]:=Format('%.2f',[RowSumm_1]);
   Sheet.Cells[RowCount,3]:=Format('%.2f',[RowSumm_2]);
   Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[RowCount, 3].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

   RowSumm_All_1:=RowSumm_All_1+RowSumm_1;
   RowSumm_All_2:=RowSumm_All_2+RowSumm_2;

   RowCount:=RowCount+1;

   for i:=1 to 3 do
    begin
     Sheet.Cells.Item[RowCount, i].Interior.Color := clSilver;
     Sheet.Cells.Item[RowCount, i].Font.Italic:=true;
     Sheet.Cells.Item[RowCount, i].Font.Bold:=true;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeTop].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].Borders.Item[xlEdgeBottom].Linestyle := xlSolid;
     Sheet.Cells.Item[RowCount, i].HorizontalAlignment := xlRight;
    end;
   Sheet.Cells[RowCount,1]:='Всего';
   Sheet.Cells[RowCount,2]:=Format('%.2f',[RowSumm_All_1]);
   Sheet.Cells[RowCount,3]:=Format('%.2f',[RowSumm_All_2]);
   Sheet.Cells.Item[RowCount, 1].Borders.Item[xlEdgeLeft].Linestyle := xlSolid;
   Sheet.Cells.Item[RowCount, 3].Borders.Item[xlEdgeRight].Linestyle := xlSolid;

  end;
 finally
 XLApp.Visible:=true;
 Screen.Cursor:=crDefault;
 fmSotrudSalary.quNaklR.Close;
 fmSotrudSalary.Free;
 end;
end;

procedure SaleSotrud;
var
 Period:TPeriodDate;
 SotrudNo:integer;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;

 SotrudNo:=Sotrud(True);
 if SotrudNo=0 then exit;

 Screen.Cursor:=crHourGlass;
 fmSotrudSalary:=TfmSotrudSalary.Create(Application);
 try
 with fmSotrudSalary do
  begin
   quWork.SQL.Clear;
   quWork.SQL.Add('select SotrudName from Sotrud where SotrudNo=:SotrudNo');
   quWork.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quWork.Open;
   RepTitle:=quWork.FieldByName('SotrudName').AsString+'   '+DateToStr(Period[1])+
             ' - '+DateToStr(Period[2]);
   quWork.Close;


   quNaklR.ParamByName('DateBegin').AsDate:=Period[1];
   quNaklR.ParamByName('DateEnd').AsDate:=Period[2];
   quNaklR.ParamByName('SotrudNo').AsInteger:=SotrudNo;
   quNaklR.Open;
   frReport3.LoadFromFile('SaleSotrud0.frf');
   Screen.Cursor:=crDefault;
   frReport3.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmSotrudSalary.quNaklR.Close;
 fmSotrudSalary.Free;
 end;
end;

procedure SaleGroupVid(SelectOtdel: String);
var
 Period:TPeriodDate;
begin
 Period:=ZapDate(4);
 if Period[1]=0 then exit;


 Screen.Cursor:=crHourGlass;
 fmSotrudSalary:=TfmSotrudSalary.Create(Application);
 try
 with fmSotrudSalary do
  begin
   RepTitle:=DateToStr(Period[1])+' - '+DateToStr(Period[2]);

   quNaklR2.Close;
   quNaklR2.SQL.Clear;
   quNaklR2.SQL.Add('select VidTov.VidName,Tovar.NameTovar,Sum(Rashod.Kol) Kol,Sum(Rashod.Kol*Rashod.PriceOut) Summa ');
   quNaklR2.SQL.Append('from NaklR,Rashod,Tovar left outer join VidTov on VidTov.VidNo=Tovar.VidNo ');
   quNaklR2.SQL.Append('where (NaklR.DateNaklFirst>=:DateBegin) and ');
   quNaklR2.SQL.Append('(NaklR.DateNaklFirst<=:DateEnd)  and ');
   quNaklR2.SQL.Append('(NaklR.NaklNo=Rashod.NaklNo) and ');
   quNaklR2.SQL.Append('(Rashod.TovarNo=Tovar.TovarNo)  ');
   quNaklR2.SQL.Append('AND (NaklR.OtdelNo in '+SelectOtdel+')  ');
   quNaklR2.SQL.Append('group by VidTov.VidName,Tovar.NameTovar ');
   quNaklR2.SQL.Append('order by VidTov.VidName,Tovar.NameTovar ');

   quNaklR2.ParamByName('DateBegin').AsDate:=Period[1];
   quNaklR2.ParamByName('DateEnd').AsDate:=Period[2];
   quNaklR2.Open;
   frReport5.LoadFromFile('SaleGroupVid0.frf');
   Screen.Cursor:=crDefault;
   frReport5.ShowReport;
  end;
 finally
 Screen.Cursor:=crDefault;
 fmSotrudSalary.quNaklR2.Close;
 fmSotrudSalary.Free;
 end;
end;


end.
