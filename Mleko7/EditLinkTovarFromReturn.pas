unit EditLinkTovarFromReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, DB, DBAccess, MSAccess, MemDS, ExtCtrls;

type
  TEditLinkTovarFromReturnForm = class(TMlekoForm)
    quTypeReturn: TMSQuery;
    quTypeReturnTypeReturnNo: TIntegerField;
    quTypeReturnTypeReturnName: TStringField;
    quTypeReturnActive: TFloatField;
    dsTypeReturn: TMSDataSource;
    Panel1: TPanel;
    DBLookupComboboxEhTovarForReturn: TDBLookupComboboxEh;
    Label2: TLabel;
    Label1: TLabel;
    DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh;
    Panel2: TPanel;
    bOk: TButton;
    bCancel: TButton;
    dsTovarForReturn: TMSDataSource;
    quSelectTovarForReturn: TMSQuery;
    quSelectTovarForReturnTovarNo: TSmallintField;
    quSelectTovarForReturnNameTovar: TStringField;
    quSelectTovarForReturnNameTovarShort: TStringField;
    dsLinkTovarForReturn: TMSDataSource;
    quLinkTovarForReturn: TMSQuery;
    quLinkTovarForReturnid: TIntegerField;
    quLinkTovarForReturnTovarNo: TIntegerField;
    quLinkTovarForReturnTovarNoReturn: TIntegerField;
    quLinkTovarForReturnTypeReturnNo: TIntegerField;
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure quLinkTovarForReturnBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    TovarFromReturn :integer;
    { Public declarations }
  end;

var
  EditLinkTovarFromReturnForm: TEditLinkTovarFromReturnForm;

implementation

uses data, EditTovar0;

{$R *.dfm}


procedure TEditLinkTovarFromReturnForm.bOkClick(Sender: TObject);
begin
  inherited;

  quLinkTovarForReturn.ParamByName('TovarNo').AsInteger := TovarFromReturn;
  quLinkTovarForReturn.ParamByName('TovarNoReturn').AsInteger := DBLookupComboboxEhTovarForReturn.KeyValue;
  quLinkTovarForReturn.ParamByName('TypeReturnNo').AsInteger := DBLookupComboboxEhTypeReturn.KeyValue;
  quLinkTovarForReturn.Execute;

//  quTovarForReturn.Refresh;
{
  quLinkTovarForReturn.Edit;
  quLinkTovarForReturn.Post;
//  quLinkTovarForReturn.Close;
  EditLinkTovarFromReturnForm.Close;
}  
  ModalResult := mrOk; 
end;

procedure TEditLinkTovarFromReturnForm.bCancelClick(Sender: TObject);
begin
  inherited;
  EditLinkTovarFromReturnForm.Close;
end;

procedure TEditLinkTovarFromReturnForm.quLinkTovarForReturnBeforePost(
  DataSet: TDataSet);
 var
  TovarNoReturn : integer;
  TypeReturnNo : integer;
begin
  inherited;
  if (DBLookupComboboxEhTypeReturn.Text = '') then TypeReturnNo :=0
                                              else TypeReturnNo := DBLookupComboboxEhTypeReturn.Value;
  if (DBLookupComboboxEhTovarForReturn.Text = '') then TovarNoReturn :=0
                                                  else TovarNoReturn := DBLookupComboboxEhTovarForReturn.Value;


  quLinkTovarForReturnTovarNo.Value := TovarFromReturn;

  quLinkTovarForReturnTovarNoReturn.Value := TovarNoReturn;
  quLinkTovarForReturnTypeReturnNo.Value := TypeReturnNo;

  quLinkTovarForReturn.ParamByName('TovarNo').AsInteger := TovarFromReturn;
  quLinkTovarForReturn.ParamByName('TovarNoReturn').AsInteger := TovarNoReturn;
  quLinkTovarForReturn.ParamByName('TypeReturnNo').AsInteger := TypeReturnNo;

  
end;

end.
