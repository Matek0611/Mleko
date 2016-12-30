unit MlekoBlankSpecWithKPK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, ExtCtrls, DB, MemDS,
  DBAccess, MSAccess;

type
  TMlekoBlankSpecWithKPKForm = class(TMlekoForm)
    dse_blanks_online: TDataSource;
    que_blanks_online: TMSQuery;
    Panel1: TPanel;
    DBGridEhe_blanks_online: TDBGridEh;
    que_blanks_onlineRasNo: TIntegerField;
    que_blanks_onlineDocument_id: TIntegerField;
    que_blanks_onlineTovarNo: TSmallintField;
    que_blanks_onlineNameTovar: TStringField;
    que_blanks_onlineBoss_price: TFloatField;
    que_blanks_onlineweight: TFloatField;
    que_blanks_onlineKolOrd: TFloatField;
    que_blanks_onlineDateNakl: TDateTimeField;
    que_blanks_onlineStatus: TSmallintField;
    que_blanks_onlineCreateUser: TSmallintField;
    que_blanks_onlineCreateUserName: TStringField;
    que_blanks_onlineLastEditUser: TSmallintField;
    que_blanks_onlineLastEditUserName: TStringField;
    que_blanks_onlineKolBegin: TFloatField;
    que_blanks_onlineAvgPriceIn: TFloatField;
    que_blanks_onlineKolOst: TFloatField;
    que_blanks_onlinevidNaklNo: TIntegerField;
    que_blanks_onlineVidNaklName: TStringField;
    que_blanks_onlineEmployeeNo: TSmallintField;
    que_blanks_onlineEmploeeName: TStringField;
    que_blanks_onlineHostName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     class procedure ShowForm(document_id: integer);
    { Public declarations }
  end;

var
  MlekoBlankSpecWithKPKForm: TMlekoBlankSpecWithKPKForm;

implementation

uses MlekoBlankListOutSide, data;

class procedure TMlekoBlankSpecWithKPKForm.ShowForm(document_id: integer);

begin
  with TMlekoBlankSpecWithKPKForm.Create(Application) do
   try
     que_blanks_online.Close;
     que_blanks_online.Params.ParamByName('Document_id').Value:=Document_ID;
     que_blanks_online.Open;
     if que_blanks_online.RecordCount > 0 then ShowModal;
   finally
     que_blanks_online.Close;
     free;
   end;
end;

{$R *.dfm}


procedure TMlekoBlankSpecWithKPKForm.FormCreate(Sender: TObject);
begin
  inherited;
  DBGridEhe_blanks_online.ReadOnly := True;
end;

procedure TMlekoBlankSpecWithKPKForm.FormShow(Sender: TObject);
begin
  inherited;
  DBGridEhe_blanks_online.ReadOnly := True;
end;

end.
