unit AddressPostActive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, ExtCtrls, ActnList,
  GridsEh, DBGridEh;

type
  TAddressPostActiveForm = class(TMlekoForm)
    Panel1: TPanel;
    quL_AddressPostActive: TMSQuery;
    dsL_AddressPostActive: TMSDataSource;
    quL_AddressPostActiveAddress: TStringField;
    quL_AddressPostActiveDateBeg: TDateTimeField;
    quL_AddressPostActiveUserNoBeg: TIntegerField;
    quL_AddressPostActiveUserNameBeg: TStringField;
    quL_AddressPostActiveDateEnd: TDateTimeField;
    quL_AddressPostActiveUserNoEnd: TIntegerField;
    quL_AddressPostActiveUserNameEnd: TStringField;
    DBGridEh1: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddressPostActiveForm: TAddressPostActiveForm;

implementation

uses data;

{$R *.dfm}

end.
