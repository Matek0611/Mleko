unit MlekoBlankSpecOutSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, GridsEh, DBGridEh, ExtCtrls, DB, MemDS,
  DBAccess, MSAccess;

type
  TMlekoBlankSpecOutSideForm = class(TMlekoForm)
    dsOrderSpec: TDataSource;
    quOrderSpec: TMSQuery;
    Panel1: TPanel;
    DBGridEhOrderSpec: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     class procedure ShowForm(document_id: integer);
    { Public declarations }
  end;

var
  MlekoBlankSpecOutSideForm: TMlekoBlankSpecOutSideForm;

implementation

uses MlekoBlankListOutSide, data;

class procedure TMlekoBlankSpecOutSideForm.ShowForm(document_id: integer);

begin
  with TMlekoBlankSpecOutSideForm.Create(Application) do
   try
     quOrderSpec.Close;
     quOrderSpec.Params.ParamByName('OdrerNo').Value:=Document_ID;
     quOrderSpec.Open;
     if quOrderSpec.RecordCount > 0 then ShowModal;
   finally
     quOrderSpec.Close;
     free;
   end;
end;

{$R *.dfm}


procedure TMlekoBlankSpecOutSideForm.FormCreate(Sender: TObject);
begin
  inherited;
  DBGridEhOrderSpec.ReadOnly := True;
end;

procedure TMlekoBlankSpecOutSideForm.FormShow(Sender: TObject);
begin
  inherited;
  DBGridEhOrderSpec.ReadOnly := True;
end;

end.
