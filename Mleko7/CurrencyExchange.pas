unit CurrencyExchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, ComCtrls, ToolWin, Db,
  StdCtrls;

type
  TCurrencyExchangeForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolBtnRefresh: TToolButton;
    DBGridEh1: TDBGridEh;
    procedure ToolBtnRefreshClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CurrencyExchangeForm: TCurrencyExchangeForm;
  function ShowCurrencyExchange(Visible: Boolean): integer;

implementation

uses data, EditCurrencyExchange;

{$R *.dfm}

function ShowCurrencyExchange(Visible: Boolean): integer;
begin
 CurrencyExchangeForm := TCurrencyExchangeForm.Create(Application);
 try

 if Visible then dmDataModule.quCurrencyExchange.MacroByName('_where').Value:= ' and isnull(IsActive,0) = 1 '
            else dmDataModule.quCurrencyExchange.MacroByName('_where').Value:=' ';
 dmDataModule.quCurrencyExchange.Open;

 if CurrencyExchangeForm .ShowModal=mrOk then
  Result:=dmDataModule.quCurrencyExchangeId.AsInteger
 finally
  dmDataModule.quCurrencyExchange.Close;
  CurrencyExchangeForm.Free;
 end;
end;

procedure TCurrencyExchangeForm.ToolBtnRefreshClick(Sender: TObject);
begin
  inherited;
  dmDataModule.quCurrencyExchange.Close;
  dmDataModule.quCurrencyExchange.MacroByName('_where').Value:=' ';
  dmDataModule.quCurrencyExchange.Open;
end;

procedure TCurrencyExchangeForm.ToolButton1Click(Sender: TObject);
begin
  inherited;
  dmDataModule.quCurrencyExchange.Append;
  EditCurExchange;
end;

procedure TCurrencyExchangeForm.ToolButton2Click(Sender: TObject);
begin
  inherited;
  EditCurExchange;
end;

procedure TCurrencyExchangeForm.ToolButton3Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
  dmDataModule.quCurrencyExchange.Delete;
end;

end.
