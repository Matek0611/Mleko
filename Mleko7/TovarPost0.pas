unit TovarPost0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MSAccess, Grids, DBGrids, StdCtrls, MlekoForm,
  DBGridEh, Mask, DBCtrlsEh, DBLookupEh, GridsEh, Buttons;

type
  TfmTovarPost = class(TMlekoForm)
    dsTovarPost: TDataSource;
    quTovarPost: TMSQuery;
    quTovarPostid: TIntegerField;
    quTovarPostPostNo: TSmallintField;
    quTovarPostTovarNo: TSmallintField;
    quTovarPostTovarNoPost: TIntegerField;
    quTovarPostNameTovarPost: TStringField;
    quTovarPostNameTovar: TStringField;
    quTovarPostNameTovarShort: TStringField;
    quTovarPostBarCode: TLargeintField;
    bbOk: TButton;
    bbCancel: TButton;
    bbApply: TButton;
    dbgTovarPost: TDBGridEh;
    dsFilterPost: TDataSource;
    quFilterPost: TMSQuery;
    dsFilterBarCode: TDataSource;
    quFilterBarCode: TMSQuery;
    dsFilterNameTovar: TDataSource;
    quFilterNameTovar: TMSQuery;
    quTovarPostNameLong: TStringField;
    quFilterPostPostNo: TSmallintField;
    quFilterPostNameLong: TStringField;
    cbFilterPost: TDBLookupComboboxEh;
    cbFilterBarCode: TDBLookupComboboxEh;
    cbFilterNameTovar: TDBLookupComboboxEh;
    quFilterBarCodeBarCode: TLargeintField;
    quFilterNameTovarNameTovar: TStringField;
    quFilterNameTovarTovarNo: TSmallintField;
    lbFilterPost: TLabel;
    lbFilterBarCode: TLabel;
    lbFilterNameTovar: TLabel;
    sbNewItems: TSpeedButton;
    procedure cbFilterPostExit(Sender: TObject);
    procedure cbFilterBarCodeExit(Sender: TObject);
    procedure cbFilterNameTovarExit(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sbNewItemsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTovarPost: TfmTovarPost;

implementation

uses data, Main, EditTovarPost0 ;

{$R *.dfm}

procedure TfmTovarPost.cbFilterPostExit(Sender: TObject);
begin

  quTovarPost.Close;
  if cbFilterPost.Text = '' then quTovarPost.ParamByName('PostNo').Clear
                            else quTovarPost.ParamByName('PostNo').AsInteger := cbFilterPost.KeyValue;
  quTovarPost.Open;
  dbgTovarPost.Refresh;
end;

procedure TfmTovarPost.cbFilterBarCodeExit(Sender: TObject);
begin

  quTovarPost.Close;
  if cbFilterBarCode.Text = '' then quTovarPost.ParamByName('BarCode').Clear
                                else quTovarPost.ParamByName('BarCode').AsInteger := cbFilterBarCode.KeyValue;
  quTovarPost.Open;
  dbgTovarPost.Refresh;

end;

procedure TfmTovarPost.cbFilterNameTovarExit(Sender: TObject);
begin

  quTovarPost.Close;
  if cbFilterNameTovar.Text = '' then quTovarPost.ParamByName('TovarNo').Clear
                                 else quTovarPost.ParamByName('TovarNo').AsInteger := cbFilterNameTovar.KeyValue;
  quTovarPost.Open;
  dbgTovarPost.Refresh;

end;

procedure TfmTovarPost.bbOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  if quTovarPost.State in [dsInsert, dsEdit] then quTovarPost.Post;
end;

procedure TfmTovarPost.bbApplyClick(Sender: TObject);
begin
  if quTovarPost.State in [dsInsert, dsEdit] then quTovarPost.Post;
end;

procedure TfmTovarPost.bbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmTovarPost.sbNewItemsClick(Sender: TObject);
begin
  begin
  with TfmEditTovarPost.Create(Application) do
  try
    quTovarPost.Open;
    ShowModal;
  finally
    quTovarPost.Close;

    Free;
  end;
end;
end;

end.
