unit Currency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ExtCtrls, GridsEh, DBGridEh, StdCtrls, ActnList, DB,
  MemDS, DBAccess, MSAccess, ComCtrls, ToolWin, Buttons;

type
  TCurrencyForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    ToolBar: TToolBar;
    ToolBtnRefresh: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CurrencyForm: TCurrencyForm;
  function ShowCurrency(Visible: Boolean): integer;

implementation

uses data, EditCurrency;

{$R *.dfm}

function ShowCurrency(Visible: Boolean): integer;
begin
 CurrencyForm := TCurrencyForm.Create(Application);
 try

 if Visible then dmDataModule.quCurrency.MacroByName('_where').Value:= ' and isTrash = 0 '
            else dmDataModule.quCurrency.MacroByName('_where').Value:=' ';
 dmDataModule.quCurrency.Open;

 if CurrencyForm.ShowModal=mrOk then
  Result:=dmDataModule.quCurrencyId.AsInteger
 finally
  dmDataModule.quCurrency.Close;
  CurrencyForm.Free;
 end;
end;

procedure TCurrencyForm.ToolBtnRefreshClick(Sender: TObject);
begin
  inherited;
  dmDataModule.quCurrency.Close;
  dmDataModule.quCurrency.MacroByName('_where').Value:=' ';
  dmDataModule.quCurrency.Open;
end;

procedure TCurrencyForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quCurrency.Append;
  EditCurren;
end;

procedure TCurrencyForm.ToolButton2Click(Sender: TObject);
begin
  inherited;
  EditCurren;
  
  dmDataModule.quCurrency.Close;
  dmDataModule.quCurrency.Open;
end;

procedure TCurrencyForm.ToolButton3Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quCurrency.Delete;

  dmDataModule.quCurrency.Close;
  dmDataModule.quCurrency.Open;
end;

procedure TCurrencyForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if dmDataModule.quCurrencyIsTrash.AsBoolean then
    DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);   
end;

end.
