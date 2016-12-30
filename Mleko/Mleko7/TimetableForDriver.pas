unit TimetableForDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, StdCtrls, Buttons, DB, MemDS, DBAccess,
  MSAccess, GridsEh, DBGridEh, Mask, DBCtrlsEh, ComObj, ComCtrls, ExtCtrls,
  DBLookupEh;

type
  TTimetableForDriver0 = class(TMlekoForm)
    od_TimetableForDriver: TOpenDialog;
    bb_OpenFile: TBitBtn;
    dbListTimeTable: TDBGridEh;
    quListTimeTable: TMSQuery;
    quListTimeTableDateDeparture: TDateTimeField;
    quListTimeTablePostNo: TSmallintField;
    quListTimeTableNameLong: TStringField;
    quListTimeTableAddress: TStringField;
    quListTimeTableDriver: TStringField;
    quListTimeTableCar: TStringField;
    dsListTimeTable: TMSDataSource;
    lbTimeTable: TLabel;
    Label1: TLabel;
    quTmpTimeTable: TMSQuery;
    quTmpTimeTableId: TLargeintField;
    quTmpTimeTablePostNo: TSmallintField;
    quTmpTimeTableAddressNo: TSmallintField;
    quTmpTimeTableCar: TStringField;
    quTmpTimeTableDriver: TStringField;
    quTmpTimeTableDateDeparture: TDateTimeField;
    DateTimePickerBeg: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    dsTmpTimeTable: TMSDataSource;
    spInsInCarForAdressPost: TMSStoredProc;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    dsFilterPost: TMSDataSource;
    quFilterPost: TMSQuery;
    DBLookupComboboxEhForPost: TDBLookupComboboxEh;
    bb_ListTimeTable: TBitBtn;
    quListTimeTableAddressId: TIntegerField;
    quListTimeTableAddressNo: TSmallintField;
    quListTimeTableApId: TIntegerField;
    quListTimeTableId: TLargeintField;
    procedure bb_OpenFileClick(Sender: TObject);
    procedure DateTimePickerBegChange(Sender: TObject);
    procedure DateTimePickerEndChange(Sender: TObject);
    procedure DBLookupComboboxEhForPostChange(Sender: TObject);
    procedure bb_ListTimeTableClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimetableForDriver0: TTimetableForDriver0;

implementation

uses data, main;

{$R *.dfm}

procedure TTimetableForDriver0.bb_OpenFileClick(Sender: TObject);
var XLS: variant;//приложение Excel
   i,index:integer;
begin
  od_TimetableForDriver.DefaultExt := '.xls';   // пользователь выбирает файл для импорта данных
  od_TimetableForDriver.Filter := 'Excel (*.xls)|*.xls';
  if od_TimetableForDriver.Execute then
  begin
    XLS:= CreateOLEObject('Excel.Application');
    XLS.Visible:=False;
    XLS.Workbooks.Open(od_TimetableForDriver.FileName);
    i:=XLS.ActiveSheet.UsedRange.Rows.Count; //количество строк в таблице
    for index:=2 to i do
     begin
       quTmpTimeTable.Open;
       quTmpTimeTable.insert;
       quTmpTimeTable.Fields[1].value:=XLS.Sheets[1].cells[index,2].Text;
       quTmpTimeTable.Fields[2].Value:=XLS.Sheets[1].cells[index,5].Text;
       quTmpTimeTable.Fields[3].Value:=XLS.Sheets[1].cells[index,8].Text;
       quTmpTimeTable.Fields[4].Value:=XLS.Sheets[1].cells[index,7].Text;
       quTmpTimeTable.Fields[5].Value:=XLS.Sheets[1].cells[index,1].Text;
       quTmpTimeTable.Post;
     end;


    dbListTimeTable.Refresh;
    spInsInCarForAdressPost.Execute;
    quTmpTimeTable.Close;
    XLS.Application.Quit;
    quListTimeTable.Close;
    quListTimeTable.Open;
    quListTimeTable.Refresh;
  end;

end;


procedure TTimetableForDriver0.DateTimePickerBegChange(Sender: TObject);
begin
  inherited;
  quListTimeTable.Close;
  quListTimeTable.ParamByName('DateBeg').Value := DateTimePickerBeg.Date;
  quListTimeTable.ParamByName('DateEnd').Value := DateTimePickerEnd.Date;
  quListTimeTable.Open;
  dbListTimeTable.Refresh;
end;

procedure TTimetableForDriver0.DateTimePickerEndChange(Sender: TObject);
begin
  inherited;
  quListTimeTable.Close;
  quListTimeTable.ParamByName('DateBeg').Value := DateTimePickerBeg.Date;
  quListTimeTable.ParamByName('DateEnd').Value := DateTimePickerEnd.Date;
  quListTimeTable.Open;
  dbListTimeTable.Refresh;
end;

procedure TTimetableForDriver0.DBLookupComboboxEhForPostChange(Sender: TObject);
begin
  inherited;
  quListTimeTable.Close;
  if DBLookupComboboxEhForPost.Text = '' Then quListTimeTable.ParamByName('PostNo').Clear
                                         Else quListTimeTable.ParamByName('PostNo').Value := DBLookupComboboxEhForPost.KeyValue;
  quListTimeTable.Open;
  dbListTimeTable.Refresh;

end;

procedure TTimetableForDriver0.bb_ListTimeTableClick(Sender: TObject);
begin
  inherited;
  if quListTimeTable.State in [dsInsert, dsEdit] then quListTimeTable.Post;
  dbListTimeTable.Refresh;
end;



end.
