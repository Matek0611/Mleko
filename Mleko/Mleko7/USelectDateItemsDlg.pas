unit USelectDateItemsDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TfrmSelectDateItemsDlg = class(TForm)
    pnlTop: TPanel;
    dtPicker: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lvDates: TListView;
    btnDelete: TBitBtn;
    btnAdd: TBitBtn;
    procedure dtPickerCloseUp(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dtPickerChange(Sender: TObject);
    procedure lvDatesClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure InputDateItems(DateItems: TStrings);
    procedure OutputDateItems(DateItems, DateKeys: TStrings);
    function AddDateItemStr(DateStr: String): Boolean;
    function EnableDateInt(ADate: TDate): Integer;
    procedure UpdateButtons;
    procedure ChangeSelectedItem;
    function ChangeListItem(Item: TListItem; ADate: TDate;
      ID: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectDateItemsDlg: TfrmSelectDateItemsDlg;

  function SelectDateItemsDlg(DateItems, DateKeys: TStrings; AStartDate: TDate; DateAttribute: String = ''): Integer;

implementation
uses DateUtils;

{$R *.dfm}

const
  DefaultCaption = 'Выбор списка дат '; // one space for attribute appending

var
  BadDate: TDate;
  StartDate: TDate;

function SelectDateItemsDlg(DateItems, DateKeys: TStrings; AStartDate: TDate; DateAttribute: String = ''): Integer;
begin
  Result:= -1;
  if (frmSelectDateItemsDlg=nil) then
     frmSelectDateItemsDlg:= TfrmSelectDateItemsDlg.Create(Application);
     if DateAttribute<>'' then
        frmSelectDateItemsDlg.Caption:= DefaultCaption + DateAttribute;
     BadDate:= StrToDate('01.01.1900');
     StartDate:= AStartDate;
     frmSelectDateItemsDlg.InputDateItems(DateItems);
  if frmSelectDateItemsDlg.ShowModal = mrOk then
  begin
    frmSelectDateItemsDlg.OutputDateItems(DateItems, DateKeys);
    Result:= DateItems.Count;
  end;
end;

procedure TfrmSelectDateItemsDlg.btnDeleteClick(Sender: TObject);
var Item: TListItem;
begin
  Item:= lvDates.Selected;
  if (Item<>nil) then
  begin
    Item.Free;
    UpdateButtons();
  end;
end;

function TfrmSelectDateItemsDlg.EnableDateInt(ADate: TDate): Integer;
var ID: String; Item: TListItem;
begin
  Result:= DaysBetween(StartDate, ADate);
  ID:= IntToStr(Result);
  Item:= lvDates.FindCaption(0, ID, False, False, True);
  if (Item<>nil) then Result:= -1;
end;

function TfrmSelectDateItemsDlg.ChangeListItem(Item: TListItem; ADate: TDate; ID: Integer): Boolean;
begin
  Result:= False;
  if (ADate<>BadDate) then
  begin
    if (ID<0) then ID:= EnableDateInt(ADate);
    if (ID>=0) then
    begin
      if (Item=nil) then Item:= lvDates.Items.Add;
      Item.Caption:= IntToStr(ID);
      Item.SubItems.Add(DateToStr(ADate));
      lvDates.Selected:= Item;
      Item.Focused:= True;
      Result:= True;
    end;
  end;
end;

procedure TfrmSelectDateItemsDlg.ChangeSelectedItem();
var Item: TListItem;
begin
  Item:= lvDates.Selected;
  if (Item<>nil) then
  begin
    ChangeListItem(Item, dtPicker.Date, -1);
    UpdateButtons();
  end;
end;


function TfrmSelectDateItemsDlg.AddDateItemStr(DateStr: String): Boolean;
begin
  Result:= ChangeListItem(nil, StrToDateDef(DateStr, BadDate), -1);
end;

procedure TfrmSelectDateItemsDlg.InputDateItems(DateItems: TStrings);
var i: Integer;
begin
  lvDates.Items.Clear;
  for i := 0 to DateItems.Count-1 do
    AddDateItemStr(DateItems[i]);
  UpdateButtons();
end;

procedure TfrmSelectDateItemsDlg.OutputDateItems(DateItems, DateKeys: TStrings);
var i: Integer; Item: TListItem;
begin
  DateItems.Clear; DateKeys.Clear;
for i := 0 to lvDates.Items.Count-1 do
    with lvDates.Items[i] do
    begin
      DateItems.Add(SubItems[0]);
      DateKeys.Add(Caption);
    end;
end;

procedure TfrmSelectDateItemsDlg.UpdateButtons();
begin
  btnAdd.Enabled:= EnableDateInt(dtPicker.Date)>=0;
end;

procedure TfrmSelectDateItemsDlg.dtPickerCloseUp(Sender: TObject);
begin
  UpdateButtons();
end;

procedure TfrmSelectDateItemsDlg.dtPickerChange(Sender: TObject);
begin
  //ChangeSelectedItem;
  UpdateButtons();
end;

procedure TfrmSelectDateItemsDlg.lvDatesClick(Sender: TObject);
var Item: TListItem;
begin
  Item:= lvDates.Selected;
  if (Item<>nil) then
  begin
   dtPicker.DateTime:= StrToDate(Item.SubItems[0]);
   UpdateButtons();
  end;
  
end;

procedure TfrmSelectDateItemsDlg.btnAddClick(Sender: TObject);
begin
  if AddDateItemStr(DateToStr(dtPicker.DateTime)) then
  btnAdd.Enabled:= False;
end;

procedure TfrmSelectDateItemsDlg.FormCreate(Sender: TObject);
begin
  Caption:= DefaultCaption;
end;

end.
