unit MlekoListRoute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKMDIChild, ActnList, ToolWin, ComCtrls, 
  DB,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, MemDS, DBAccess, MsAccess, cxGraphics,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxCalc,
  cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData;

type
  TMlekoListRouteForm = class(TCFLMLKMDIChildForm)
    DS: TDataSource;
    quRoute: TMSQuery;
    DBGrid: TcxGrid;
    DBGridDBTableView1: TcxGridDBTableView;
    DBGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    DBGridDBTableView1id: TcxGridDBColumn;
    DBGridDBTableView1Name: TcxGridDBColumn;
    DBGridDBTableView1PayDriving: TcxGridDBColumn;
    DBGridDBTableView1PayForwarding: TcxGridDBColumn;
    DBGridDBTableView1Code: TcxGridDBColumn;
    DBGridDBTableView1Distance: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoListRouteForm: TMlekoListRouteForm;

implementation

uses data;

{$R *.dfm}

procedure TMlekoListRouteForm.FormShow(Sender: TObject);
begin
  inherited;
  quRoute.Open;
end;

end.
