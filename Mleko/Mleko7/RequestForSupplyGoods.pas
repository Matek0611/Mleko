unit RequestForSupplyGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, ExtCtrls, DB, MemDS,
  DBAccess, MSAccess, StdCtrls, Excel2000, Registry, ComObj, ActiveX;

type
  TRequestForSupplyGoodsForm = class(TMlekoForm)
    dsRequestForSupplyGoods: TMSDataSource;
    quRequestForSupplyGoods: TMSQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    quRequestForSupplyGoodsNaklNo: TIntegerField;
    quRequestForSupplyGoodsDeliveryGoodsName: TStringField;
    quRequestForSupplyGoodsTovarNo: TSmallintField;
    quRequestForSupplyGoodsNameTovar: TStringField;
    quRequestForSupplyGoodsQTY: TFloatField;
    quRequestForSupplyGoodsName: TStringField;
    sdRequestForSupply: TSaveDialog;
    ExportInFile: TButton;
    quRequestForSupplyGoodsDOC_DATE: TDateTimeField;
    quRequestForSupplyGoodsPostNo: TSmallintField;
    quRequestForSupplyGoodsSummaNakl: TFloatField;
    procedure ExportInFileClick(Sender: TObject);
    function IsOLEObjectInstalled(Name:string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RequestForSupplyGoodsForm: TRequestForSupplyGoodsForm;

procedure RequestForSupply (Nakls: string; DeliveryTovarNo : integer);

implementation

uses Data;

{$R *.dfm}


procedure RequestForSupply (Nakls: string; DeliveryTovarNo : integer);
var
  Dlg : TRequestForSupplyGoodsForm;
begin
  Dlg := TRequestForSupplyGoodsForm.Create(Application);

  Dlg.quRequestForSupplyGoods.Close;
  Dlg.quRequestForSupplyGoods.ParamByName('DeliveryTovarNo').Value := DeliveryTovarNo;
  Dlg.quRequestForSupplyGoods.MacroByName('_where').Value := ' and NaklNo in ' + Nakls;
  Dlg.quRequestForSupplyGoods.Open;

  Dlg.Show;
end;

function TRequestForSupplyGoodsForm.IsOLEObjectInstalled(Name:string):boolean;
var
  ClassID : TCLSID;
  Rez     : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)),ClassID);
  if Rez=S_OK then
  // Объект найден
                Result := true
              else
                Result := false;
end;

procedure TRequestForSupplyGoodsForm.ExportInFileClick(Sender: TObject);
var
  cls_ExcelObject: string;
  WorkSheet: Variant;
  Excel: Variant;
  RegData: TRegistry;
  index, i : integer;
begin
  inherited;
  // Чтобы не применять локальные
  // для каждой версии
  // названия "Excel.Application.8", "Excel.Application.9".

  cls_ExcelObject := 'Excel.Application';
  RegData := TRegistry.Create;
  RegData.RootKey := HKEY_CLASSES_ROOT;
  try
    if RegData.OpenKey('\Excel.Application\CurVer', False) then
    begin
      cls_ExcelObject := regData.ReadString('');
      RegData.CloseKey;
    end
  finally
    regData.Free;
  end;

  if not IsOLEObjectInstalled(cls_ExcelObject) then
   begin
     ShowMessage('Excel не установлен.');
     exit;
   end;

  // Вот теперь откроем Excel
  Excel := CreateOleObject(cls_ExcelObject);

  // Отключаем реакцию Excel на события,
  // чтобы ускорить обработку информации информации
  // и делаем процесс невидимым

  Excel.Application.ScreenUpdating := False;
  Excel.Application.EnableEvents := false;
  Excel.Application.Interactive := False;
  Excel.Application.DisplayAlerts := False;
//  Excel.ActiveSheet.DisplayPageBreaks := False;
  Excel.Application.DisplayStatusBar := False;
  Excel.Visible := false;


  // Создаем новую таблицу

  Excel.Workbooks.Add;

  WorkSheet := Excel.Workbooks[1].WorkSheets[1];

  index := 0;

  if quRequestForSupplyGoods.RecordCount > 0 then
  while not quRequestForSupplyGoods.Eof do
    begin
      index := index + 1;

      WorkSheet.Cells[index,1] := quRequestForSupplyGoodsNaklNo.Value; // Номер накладной
      WorkSheet.Cells[index,2] := quRequestForSupplyGoodsDOC_DATE.Value; // Дата накладной
      WorkSheet.Cells[index,3] := quRequestForSupplyGoodsDeliveryGoodsName.Value; // Поставка товара
      WorkSheet.Cells[index,4] := quRequestForSupplyGoodsTovarNo.Value; // Код товара
      WorkSheet.Cells[index,5] := quRequestForSupplyGoodsNameTovar.Value; // Наименование товара
      WorkSheet.Cells[index,6] := quRequestForSupplyGoodsQTY.Value; // Кол-во
      WorkSheet.Cells[index,7] := quRequestForSupplyGoodsPostNo.Value; // Номер контрагента
      WorkSheet.Cells[index,8] := quRequestForSupplyGoodsName.Value; // Контрагент
      WorkSheet.Cells[index,9] := quRequestForSupplyGoodsSummaNakl.Value; // Сумма по накладной
      quRequestForSupplyGoods.Next;

    end;




  sdRequestForSupply.DefaultExt := '.xls';   // Выбираем файл для импорта данных
  sdRequestForSupply.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

if sdRequestForSupply.Execute then
   begin
     Excel.Application.EnableEvents := true;
     Excel.Application.Interactive := true;
     Excel.Application.DisplayAlerts := true;
     Excel.ActiveWorkBook.SaveCopyAs(sdRequestForSupply.FileName);
     Excel.ActiveWorkBook.Close(0); // xlDontSaveChanges
     Excel.Quit;
     Excel := Unassigned;
     ShowMessage('Выгрузка поставок завершено'+ #10#13 +'Выгружено ' + IntToStr(index)+' позиций.');
   end;


end;

end.
