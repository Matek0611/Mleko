unit RequestForSupplyGoodsHead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, GridsEh, DBGridEh, MemDS, DBAccess,
  MSAccess, ExtCtrls, ComCtrls, ToolWin,Excel2000, Registry, ComObj, ActiveX,
  CFLMLKList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls;

type
  TRequestForSupplyGoodsHeadForm = class(TMlekoForm) // TCFLMLKListForm
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dsRequestForSupplyGoodsHead: TMSDataSource;
    quRequestForSupplyGoodsHead: TMSQuery;
    DBGridEh1: TDBGridEh;
    quRequestForSupplyGoodsHeadId: TIntegerField;
    quRequestForSupplyGoodsHeadDateRequest: TDateTimeField;
    odLoadRequest: TOpenDialog;
    ToolBarReguest: TToolBar;
    ToolButtonReguest1: TToolButton;
    ToolButtonReguest2: TToolButton;
    ToolButtonReguest3: TToolButton;
    quInsInRequestSpec: TMSQuery;
    ToolButtonReguest4: TToolButton;
    quRequestForSupplyGoodsHeadSummaRequest: TFloatField;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    function IsOLEObjectInstalled(Name:string):boolean;
    procedure ToolButtonReguest1Click(Sender: TObject);
    procedure ToolButtonReguest2Click(Sender: TObject);
    procedure ToolButtonReguest3Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure ToolButtonReguest4Click(Sender: TObject);
    procedure EdDateBegPropertiesCloseUp(Sender: TObject);
    procedure EdDateEndPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RequestForSupplyGoodsHeadForm: TRequestForSupplyGoodsHeadForm;

implementation

uses data, main, RequestForSupplyGoodsSpec, MlekoCrossRequestForGoods;

{$R *.dfm}
procedure TRequestForSupplyGoodsHeadForm.FormShow(Sender: TObject);
begin
  inherited;
  EdDateBeg.Date := Date();
  EdDateend.Date := Date()+1;

  quRequestForSupplyGoodsHead.Close;
  quRequestForSupplyGoodsHead.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quRequestForSupplyGoodsHead.ParamByName('DateEnd').Value := EdDateEnd.Date;
  quRequestForSupplyGoodsHead.Open;
  quRequestForSupplyGoodsHead.Refresh;

end;

function TRequestForSupplyGoodsHeadForm.IsOLEObjectInstalled(Name:string):boolean;
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

procedure TRequestForSupplyGoodsHeadForm.ToolButtonReguest1Click(Sender: TObject);
 var
   cls_ExcelObject: string;
   WorkSheet: Variant;
   Excel: Variant;
   RegData: TRegistry;
   index, i : integer;
   Qty : Double;
   QtyS : string;
   Date : TDateTime;
   SummaNakl : Double;
   SummaNaklS : string;

begin
  inherited;
  // Формируем шапку запроса на поставку товара
  // Получаем новый номер запроса на поставку товара
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select isnull(max(id),0)+1 as NewId from RequestForSupplyGoodsHead ');
  dmDataModule.quWork.Open;

  quRequestForSupplyGoodsHead.Open;
  quRequestForSupplyGoodsHead.Append;
  quRequestForSupplyGoodsHeadId.Value := dmDataModule.quWork.FieldByName('NewId').AsInteger; // Номер запроса на поставку товара
  quRequestForSupplyGoodsHeadDateRequest.Value := GlobalDateNakl; // Дата запроса на поставку товара - рабочая дата программы
  quRequestForSupplyGoodsHead.Post;

  DBGridEh1.Refresh;

  ShowMessage('Выберите файл из которого создастся запрос на поставку товара');

  // Это для того, чтобы не применять локальные
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


  odLoadRequest.DefaultExt := '.xls';   // Выбираем файл для экспорта данных
  odLoadRequest.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if odLoadRequest.Execute then
   begin
     Excel.Workbooks.Open(odLoadRequest.FileName);
     WorkSheet := Excel.Workbooks[1].WorkSheets[1];
     i := Excel.ActiveSheet.UsedRange.Rows.Count;

     for index := 1 to i do
     begin
       if (WorkSheet.Cells[index,1].Text <> '') then
        begin

          WorkSheet.Cells[index,1].EntireColumn.AutoFit;
          WorkSheet.Cells[index,2].EntireColumn.AutoFit;
          WorkSheet.Cells[index,3].EntireColumn.AutoFit;
          WorkSheet.Cells[index,4].EntireColumn.AutoFit;
          WorkSheet.Cells[index,5].EntireColumn.AutoFit;
          WorkSheet.Cells[index,6].EntireColumn.AutoFit;
          WorkSheet.Cells[index,7].EntireColumn.AutoFit;
          WorkSheet.Cells[index,8].EntireColumn.AutoFit;
          WorkSheet.Cells[index,9].EntireColumn.AutoFit;

          DecimalSeparator := '.';

          SummaNaklS := StringReplace(WorkSheet.Cells[index,9].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          SummaNaklS := StringReplace(SummaNaklS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          SummaNakl := StrToFloat(SummaNaklS);

          QtyS := StringReplace(WorkSheet.Cells[index,6].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          QtyS := StringReplace(QtyS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          Qty := StrToFloat(QtyS);

          quInsInRequestSpec.Close;
          quInsInRequestSpec.ParamByName('RequestForSupplyGoods_Id').Value := dmDataModule.quWork.FieldByName('NewId').AsInteger; // Номер запроса на поставку товара
          quInsInRequestSpec.ParamByName('NaklNo').Value := WorkSheet.Cells[index,1].Text; // Номер накладной
          quInsInRequestSpec.ParamByName('DateNakl').Value := WorkSheet.Cells[index,2].Text ; // Дата накладной
          quInsInRequestSpec.ParamByName('DeliveryGoodsName').Value := WorkSheet.Cells[index,3].Text; // Поставка товара
          quInsInRequestSpec.ParamByName('TovarNo').Value := WorkSheet.Cells[index,4].Text; // Код товара
          quInsInRequestSpec.ParamByName('NameTovar').Value := WorkSheet.Cells[index,5].Text;  // Наименование товара
          quInsInRequestSpec.ParamByName('Qty').Value := Qty; //WorkSheet.Cells[index,6].Text; // Кол-во
          quInsInRequestSpec.ParamByName('QtyFirst').Value := Qty; //WorkSheet.Cells[index,6].Text; // Кол-во
          quInsInRequestSpec.ParamByName('PostNo').Value := WorkSheet.Cells[index,7].Text; // Номер контрагента
          quInsInRequestSpec.ParamByName('PostName').Value := WorkSheet.Cells[index,8].Text; // Контрагент
          quInsInRequestSpec.ParamByName('SummaNakl').Value := SummaNakl; //WorkSheet.Cells[index,9].Text; // Cумма по накладной

          quInsInRequestSpec.Execute;
        end;
     end;
   end;

  DecimalSeparator := ',';

  Excel.Quit;
  Excel := Unassigned;

  ShowMessage('Загрузка данных завершена'+ #10#13 +'Обработано ' + IntToStr(index)+' записей.');

  quRequestForSupplyGoodsHead.Open;
  quRequestForSupplyGoodsHead.Edit;
  quRequestForSupplyGoodsHeadId.Value := dmDataModule.quWork.FieldByName('NewId').AsInteger; // Номер запроса на поставку товара
  quRequestForSupplyGoodsHeadDateRequest.Value := GlobalDateNakl; // Дата запроса на поставку товара - рабочая дата программы
  quRequestForSupplyGoodsHead.Post;

  quRequestForSupplyGoodsHead.Refresh;

  dmDataModule.quWork.Close;

end;

procedure TRequestForSupplyGoodsHeadForm.ToolButtonReguest2Click(Sender: TObject);
begin
  inherited;
  with TRequestForSupplyGoodsSpecForm.Create(Application) do
   try
     quRequestForSupplyGoodsSpec.ParamByName('RequestForSupplyGoods_Id').Value := quRequestForSupplyGoodsHeadId.Value;
     quRequestForSupplyGoodsSpec.Open;
     ShowModal;
   finally
     quRequestForSupplyGoodsSpec.Close;
     Free;
   end;
end;

procedure TRequestForSupplyGoodsHeadForm.ToolButtonReguest3Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Вы уверены что хотите удалить запрос на поставку товара ?', mtConfirmation, [mbNo,mbYes], 0) in [mrYes])
   then begin
          dmDataModule.quWork.SQL.Clear;
          dmDataModule.quWork.SQL.Add('delete RequestForSupplyGoodsSpec where RequestForSupplyGoods_Id = :Id ');
          dmDataModule.quWork.ParamByName('id').Value := quRequestForSupplyGoodsHeadId.Value;
          dmDataModule.quWork.Execute;

          quRequestForSupplyGoodsHead.Delete;
        end;
end;

procedure TRequestForSupplyGoodsHeadForm.DBGridEh1DblClick(
  Sender: TObject);
begin
  inherited;
  ToolButtonReguest2.Click;
end;

procedure TRequestForSupplyGoodsHeadForm.ToolButtonReguest4Click(Sender: TObject);
begin
  inherited;
//  TRequestForSupplyGoodsHeadForm.
//  Edit_CrossBlankOrder := True;
  TMlekoCrossRequestForGoodsForm.ShowFormBrand(quRequestForSupplyGoodsHeadDateRequest.Value,quRequestForSupplyGoodsHeadId.Value);
end;

procedure TRequestForSupplyGoodsHeadForm.EdDateBegPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  quRequestForSupplyGoodsHead.Close;
  quRequestForSupplyGoodsHead.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quRequestForSupplyGoodsHead.Open;
  quRequestForSupplyGoodsHead.Refresh;
end;

procedure TRequestForSupplyGoodsHeadForm.EdDateEndPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  quRequestForSupplyGoodsHead.Close;
  quRequestForSupplyGoodsHead.ParamByName('DateEND').Value := EdDateEnd.Date;
  quRequestForSupplyGoodsHead.Open;
  quRequestForSupplyGoodsHead.Refresh;
end;

end.
