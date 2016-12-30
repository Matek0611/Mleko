unit ListTovarDateOfManufaktureForNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, GridsEh, DBGridEh,
  ExtCtrls, ActnList;

type
  TListTovarDateOfManufaktureForNaklForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    qul_DspecForTovarDateOfManufacture: TMSQuery;
    dsl_DspecForTovarDateOfManufacture: TMSDataSource;
    qul_DspecForTovarDateOfManufactureIdDspec: TLargeintField;
    qul_DspecForTovarDateOfManufactureTovarNo: TIntegerField;
    qul_DspecForTovarDateOfManufactureDateBeg: TDateTimeField;
    qul_DspecForTovarDateOfManufactureKolAll: TFloatField;
    qul_DspecForTovarDateOfManufactureKolDate: TFloatField;
    qul_DspecForTovarDateOfManufactureTovarName: TStringField;
    qul_DspecForTovarDateOfManufactureKolEnd: TFloatField;
    qul_DspecForTovarDateOfManufactureCreateDate: TDateTimeField;
    qul_DspecForTovarDateOfManufactureOstBeg: TFloatField;
    qul_DspecForTovarDateOfManufactureOstEnd: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListTovarDateOfManufaktureForNaklForm: TListTovarDateOfManufaktureForNaklForm;

implementation
uses data, PrihodTov;

{$R *.dfm}

end.

