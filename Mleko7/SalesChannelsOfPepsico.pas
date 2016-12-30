unit SalesChannelsOfPepsico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, ActnList, StdCtrls, Buttons, GridsEh, DB,
  DBGridEh;

type
  TSalesChannelsOfPepsicoForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  SalesChannelsOfPepsicoForm: TSalesChannelsOfPepsicoForm;
  function SalesChannelsPepsico(Visible: Boolean):integer;

implementation

uses data, EditSalesChannelsOfPepsico;

{$R *.dfm}

function SalesChannelsPepsico(Visible: Boolean):integer;
begin
 Result:=0;
 SalesChannelsOfPepsicoForm := TSalesChannelsOfPepsicoForm.Create(Application);
 try
 SalesChannelsOfPepsicoForm.DBGridEh1.Col:=1;
 if Visible then dmDataModule.quSalesChannelsOfPepsico.MacroByName('_where').Value:='where Active = 1 '
 else dmDataModule.quSalesChannelsOfPepsico.MacroByName('_where').Value:=' ';
 dmDataModule.quSalesChannelsOfPepsico.Open;
 if SalesChannelsOfPepsicoForm.ShowModal=mrOk then
  Result:=dmDataModule.quSalesChannelsOfPepsico.FieldByName('Code').AsInteger
 finally
 dmDataModule.quSalesChannelsOfPepsico.Close;
 SalesChannelsOfPepsicoForm.Free;
 end;
end;

procedure TSalesChannelsOfPepsicoForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN: begin
                 Key:=0;
                 EditSalesChannelsPepsico;
               end;
    VK_INSERT: begin
                 Key:=0;
                 dmDataModule.quSalesChannelsOfPepsico.Append;
                 EditSalesChannelsPepsico;
               end;
    VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
                dmDataModule.quSalesChannelsOfPepsico.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end
end;

procedure TSalesChannelsOfPepsicoForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  EditSalesChannelsPepsico;
end;

procedure TSalesChannelsOfPepsicoForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEh1.Columns[DBGridEh1.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TSalesChannelsOfPepsicoForm.DBGridEh1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top) then
    DBGridEh1.Canvas.Brush.Color := $00E9E9E9;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if not dmDataModule.quSalesChannelsOfPepsico.FieldByName('Active').AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.


