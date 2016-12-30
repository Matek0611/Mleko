unit MlekoRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeels, cxStyles, cxEdit, cxContainer,
  ImgList, cxExtEditRepositoryItems, cxGraphics, cxClasses, cxVGrid, DB,
  MemDS, VirtualTable, cxEditRepositoryItems, cxDBEdit, DDRes;

type
  TMlekoResDm = class(TDDResDm)
    RpDbEdAction: TcxEditRepositoryButtonItem;
    RpDbEdExchange: TcxEditRepositoryButtonItem;
    RpDbEdFtable: TcxEditRepositoryButtonItem;
    procedure RpDbEdActionPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoResDm: TMlekoResDm;

implementation

uses BCCommon;

{$R *.dfm}

procedure TMlekoResDm.RpDbEdActionPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  BCCommon.ChangePropFieldValue(Sender,'TMlekoSelectActionDlg',TcxDBButtonEdit(Sender).DataBinding.Field);
end;


initialization
  RegisterClass(TMlekoResDm);

finalization
  UnRegisterClass(TMlekoResDm);

end.

