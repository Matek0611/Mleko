unit ListPostForMail0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, MSAccess, StdCtrls,
  GridsEh, DBGridEh;

type
  TListPostForMail = class(TForm)
    quListPostForMail: TMSQuery;
    dsListPostForMail: TDataSource;
    quListPostForMailNameLong: TStringField;
    quListPostForMailAddress: TStringField;
    quListPostForMailDateBeg: TWideStringField;
    quListPostForMailDateEnd: TWideStringField;
    quListPostForMailCheck1: TBooleanField;
    Ok: TButton;
    DBGridEh1: TDBGridEh;
    Cencel: TButton;
    quListPostForMailPostNo: TSmallintField;
    quListPostForMailAddresNo: TSmallintField;
    procedure OkClick(Sender: TObject);
    procedure CencelClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListPostForMail: TListPostForMail;
  Is_send : boolean;
implementation

uses data;

{$R *.dfm}

procedure TListPostForMail.OkClick(Sender: TObject);
begin
  if quListPostForMail.State in [dsInsert, dsEdit] then quListPostForMail.Post;
  ModalResult := mrOk;
end;

procedure TListPostForMail.CencelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
