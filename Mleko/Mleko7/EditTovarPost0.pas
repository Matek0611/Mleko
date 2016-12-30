unit EditTovarPost0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, data, citCtrls, citmask, citDBComboEdit, MlekoForm, MemDS,
  DBAccess, MSAccess,MlekoSelectFIrm, StdCtrls, Mask,comp_TargetFilter_LookupFilter,
  comp_TargetFilter_CustomFilter, comp_TargetFilter_DateFilter, DBCtrls;

type
  TfmEditTovarPost = class(TMlekoForm)
    quTovarPost: TMSQuery;
    quTovarPostid: TIntegerField;
    quTovarPostPostNo: TSmallintField;
    quTovarPostTovarNo: TSmallintField;
    quTovarPostTovarNoPost: TIntegerField;
    quTovarPostNameTovarPost: TStringField;
    quTovarPostNameTovar: TStringField;
    quTovarPostNameTovarShort: TStringField;
    quTovarPostBarCode: TLargeintField;
    dsTovarPost: TDataSource;
    cbPostForTovar: TDBLookupComboBox;
    Label14: TLabel;
    dsPostForTovar: TDataSource;
    quPostForTovar: TMSQuery;
    quPostForTovarPostNo: TSmallintField;
    quPostForTovarName: TStringField;
    quPostForTovarNameLong: TStringField;
    Label15: TLabel;
    TovarNoPost: TDBEdit;
    Label16: TLabel;
    NameTovarPost: TDBEdit;
    ftTovar: TcitDBComboEdit;
    function ftTovarIsSelect(Sender: TObject): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditTovarPost: TfmEditTovarPost;

implementation

uses MlekoSelectTovar;

{$R *.dfm}

function TfmEditTovarPost.ftTovarIsSelect(Sender: TObject): Boolean;
var
  ID: Integer;
begin
  inherited;
  result := TMlekoSelectTovarDlg.SelectTovar(ID);
  if Result then
  begin
    dmDataModule.quWork.SQL.Clear;
    dmDataModule.quWork.SQL.Add('select NameTovar from Tovar where TovarNo=' + IntToStr(ID));
    dmDataModule.quWork.Open;
    (Sender as TcitCustomEdit).Text := dmDataModule.quWork.FieldByName('NameTovar').AsString;
    (Sender as TcitDBComboEdit).KeyFieldValue := IntToStr(ID);
  end;
end;

end.
