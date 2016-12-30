unit Ostatok1Head;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, GridsEh, DBGridEh, MemDS, DBAccess,
  MSAccess, ExtCtrls, ComCtrls, ToolWin,Excel2000, Registry, ComObj, ActiveX,
  CFLMLKList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls;

type
  TOstatok1HeadForm = class(TMlekoForm)
    Panel1: TPanel;
    ToolBarOstatok1: TToolBar;
    ToolButtonOstatok11: TToolButton;
    ToolButtonOstatok12: TToolButton;
    ToolButtonOstatok13: TToolButton;
    ToolButtonOstatok14: TToolButton;
    Panel2: TPanel;
    gBPeriod: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    dsOstatok1Head: TMSDataSource;
    quOstatok1Head: TMSQuery;
    quOstatok1HeadId: TIntegerField;
    quOstatok1HeadDateOstatok1: TDateTimeField;
    odLoadOstatok: TOpenDialog;
    quInsInOstatok1Spec: TMSQuery;
    CorrectOstatoc1: TMSQuery;
    procedure FormShow(Sender: TObject);
    function IsOLEObjectInstalled(Name:string):boolean;
    procedure ToolButtonOstatok11Click(Sender: TObject);
    procedure ToolButtonOstatok12Click(Sender: TObject);
    procedure ToolButtonOstatok13Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure ToolButtonOstatok14Click(Sender: TObject);
    procedure EdDateBegPropertiesCloseUp(Sender: TObject);
    procedure EdDateEndPropertiesCloseUp(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ostatok1HeadForm: TOstatok1HeadForm;

implementation

uses data, main, Ostatok1Spec, MlekoCrossOstatok1;

{$R *.dfm}
procedure TOstatok1HeadForm.FormShow(Sender: TObject);
begin
  inherited;
  EdDateBeg.Date := Date();
  EdDateend.Date := Date()+1;

  quOstatok1Head.Close;
  quOstatok1Head.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quOstatok1Head.ParamByName('DateEnd').Value := EdDateEnd.Date;
  quOstatok1Head.Open;
  quOstatok1Head.Refresh;

end;

function TOstatok1HeadForm.IsOLEObjectInstalled(Name:string):boolean;
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

procedure TOstatok1HeadForm.ToolButtonOstatok11Click(Sender: TObject);
 var
   cls_ExcelObject: string;
   WorkSheet: Variant;
   Excel: Variant;
   RegData: TRegistry;
   index, i : integer;
   Qty : Double;
   QtyS : string;
   TovarNo : integer;
   TovarNoS : string;
   Date : TDateTime;
   SummaNakl : Double;
   SummaNaklS : string;

begin
  inherited;
  // Формируем шапку запроса на поставку товара
  // Получаем новый номер запроса на поставку товара
  dmDataModule.quWork.SQL.Clear;
  dmDataModule.quWork.SQL.Add('select isnull(max(id),0)+1 as NewId from Ostatok1Head ');
  dmDataModule.quWork.Open;

  quOstatok1Head.Open;
  quOstatok1Head.Append;
  quOstatok1HeadId.Value := dmDataModule.quWork.FieldByName('NewId').AsInteger; // Номер запроса на поставку товара
  quOstatok1HeadDateOstatok1.Value := GlobalDateNakl; // Дата запроса на поставку товара - рабочая дата программы
  quOstatok1Head.Post;

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


  odLoadOstatok.DefaultExt := '.xls';   // Выбираем файл для экспорта данных
  odLoadOstatok.Filter := 'Excel (*.xls)|*.xls'; // Устанавливаем фильтер

  if odLoadOstatok.Execute then
   begin
     Excel.Workbooks.Open(odLoadOstatok.FileName);
     WorkSheet := Excel.Workbooks[1].WorkSheets[1];
     i := Excel.ActiveSheet.UsedRange.Rows.Count;

     for index := 2 to i do
     begin
       if (WorkSheet.Cells[index,1].Text <> '') then
        begin

          WorkSheet.Cells[index,1].EntireColumn.AutoFit;
          WorkSheet.Cells[index,2].EntireColumn.AutoFit;

          DecimalSeparator := '.';

          QtyS := StringReplace(WorkSheet.Cells[index,2].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          QtyS := StringReplace(QtyS, ' ', '',[rfReplaceAll, rfIgnoreCase]);
          QtyS := StringReplace(QtyS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          Qty := StrToFloat(QtyS);

          TovarNoS := StringReplace(WorkSheet.Cells[index,1].Text, '''', '',[rfReplaceAll, rfIgnoreCase]);
          TovarNoS := StringReplace(TovarNoS, ' ', '',[rfReplaceAll, rfIgnoreCase]);
          TovarNoS := StringReplace(TovarNoS, ',', '.',[rfReplaceAll, rfIgnoreCase]);
          TovarNo := StrToInt(TovarNoS);

          quInsInOstatok1Spec.Close;
          quInsInOstatok1Spec.ParamByName('Ostatok1Head_Id').Value := dmDataModule.quWork.FieldByName('NewId').AsInteger; // Номер Остатка - 1
          quInsInOstatok1Spec.ParamByName('TovarNo').Value := TovarNo; //WorkSheet.Cells[index,1].Text; // Код товара
          quInsInOstatok1Spec.ParamByName('BegVirtKol').Value :=  Qty; // Начальное кол-во виртуальных остатков

          DmDataModule.OpenSQL('select * from Tovar where TovarNo = :p1_TovarNo',[TovarNo]);

          if DmDataModule.QFO.RecordCount = 0 then begin
                                                     dmDataModule.ExecSQL('delete Ostatok1Spec where Ostatok1Head_Id = :p1_Ostatok1Head_Id',[dmDataModule.quWork.FieldByName('NewId').AsInteger]);
                                                     dmDataModule.ExecSQL('delete Ostatok1Head where id = :p1_Id',[dmDataModule.quWork.FieldByName('NewId').AsInteger]);
                                                     quOstatok1Head.Refresh;
                                                     raise Exception.Create(' Товар не существует в базе!'+ #10#13 +
                                                                            'Номер товара : '+ WorkSheet.Cells[index,1].Text + #10#13 +
                                                                            'Необходимо удалить товар из файла и повторить попытку!' + #10#13 +
                                                                            'Остаток-1 № '+ dmDataModule.quWork.FieldByName('NewId').AsString +' удален.');
                                                   end;

          DmDataModule.OpenSQL('select convert(decimal(18,2),AvgPriceIn) as AvgPriceIn from Ostatok where TovarNo = :p1_TovarNo',[TovarNo]);

          if ((DmDataModule.QFO.FieldByName('AvgPriceIn').IsNull) or (DmDataModule.QFO.FieldByName('AvgPriceIn').Value = 0) or (DmDataModule.QFO.RecordCount = 0))
           then begin
                  dmDataModule.ExecSQL('delete Ostatok1Spec where Ostatok1Head_Id = :p1_Ostatok1Head_Id',[dmDataModule.quWork.FieldByName('NewId').AsInteger]);
                  dmDataModule.ExecSQL('delete Ostatok1Head where id = :p1_Id',[dmDataModule.quWork.FieldByName('NewId').AsInteger]);
                  quOstatok1Head.Refresh;
                  raise Exception.Create(' Товар не расценен!'+ #10#13 +
                                         'Номер товара : '+ WorkSheet.Cells[index,1].Text + #10#13 +
                                         'Необходимо удалить товар из файла или установить входную цену больше нуля и повторить попытку!'+ #10#13 +
                                         'Остаток-1 № '+ dmDataModule.quWork.FieldByName('NewId').AsString +' удален.');
                end;

          quInsInOstatok1Spec.ParamByName('AvgPriceIn').Value := DmDataModule.QFO.FieldByName('AvgPriceIn').Value;


          quInsInOstatok1Spec.Execute;
        end;
     end;
   end;

  DecimalSeparator := ',';

  Excel.Quit;
  Excel := Unassigned;

  ShowMessage('Загрузка данных завершена'+ #10#13 +'Обработано ' + IntToStr(index)+' записей.');

  dmDataModule.quWork.Close;
end;

procedure TOstatok1HeadForm.ToolButtonOstatok12Click(Sender: TObject);
begin
  inherited;
  with TOstatok1SpecForm.Create(Application) do
   try
     CorrectOstatoc1.ParamByName('id').Value := quOstatok1HeadId.Value;
     CorrectOstatoc1.Execute;

     quOstatok1Spec.ParamByName('Ostatok1Head_Id').Value := quOstatok1HeadId.Value;
     quOstatok1Spec.Open;
     ShowModal;
   finally
     quOstatok1Spec.Close;
     Free;
   end;
end;

procedure TOstatok1HeadForm.ToolButtonOstatok13Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Вы уверены что хотите удалить ?', mtConfirmation, [mbNo,mbYes], 0) in [mrYes])
   then begin
          DmDataModule.OpenSQL('select * from Ostatok1Nakl where NaklNo is not null and Ostatok1Id = :p1_Ostatok1Id',[quOstatok1HeadId.Value]);

          if DmDataModule.QFO.RecordCount = 0 then begin
                                                     dmDataModule.quWork.SQL.Clear;
                                                     dmDataModule.quWork.SQL.Add('delete Ostatok1Spec where Ostatok1Head_Id = :Id ');
                                                     dmDataModule.quWork.ParamByName('id').Value := quOstatok1HeadId.Value;
                                                     dmDataModule.quWork.Execute;
                                                     quOstatok1Head.Delete;
                                                   end
                                              else Showmessage(' Удаление не возможно!'+ #10#13 +
                                                               'По этому Остатку-1 уже были созданы накладные!'+ #10#13 +
                                                               'Для удаления этого остатка необходимо удалить все расходные накладные'+ #10#13 +
                                                               'созданные по этому остатку.')
        end;
end;

procedure TOstatok1HeadForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  ToolButtonOstatok12.Click;
end;

procedure TOstatok1HeadForm.ToolButtonOstatok14Click(Sender: TObject);
begin
  inherited;
  Edit_CrossBlankOrder := True;
  TMlekoCrossOstatok1Form.ShowFormBrand(quOstatok1HeadDateOstatok1.Value,quOstatok1HeadId.Value);
end;

procedure TOstatok1HeadForm.EdDateBegPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  quOstatok1Head.Close;
  quOstatok1Head.ParamByName('DateBeg').Value := EdDateBeg.Date;
  quOstatok1Head.Open;
end;

procedure TOstatok1HeadForm.EdDateEndPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  quOstatok1Head.Close;
  quOstatok1Head.ParamByName('DateEnd').Value := EdDateEnd.Date;
  quOstatok1Head.Open;
end;

end.
