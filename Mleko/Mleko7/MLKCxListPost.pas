unit MLKCxListPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MLKCxList, cxGraphics, cxEdit, cxGridCustomPopupMenu,
  cxGridPopupMenu, DB, MemDS, VirtualTable, Menus, cxPropertiesStore,
  dxBar, cxClasses, ActnList, cxVGrid, cxDBVGrid, Grids, ValEdit,
  cxInplaceContainer, cxSplitter, DBGrids, citDbGrid, ExtCtrls,
  cxFilterControl, cxPC, cxControls, 
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxStyles, cxCustomData, cxFilter, cxData, cxDBLookupComboBox;

type
  TMLKCxListPostFrame = class(TMLKCxListFrame)
    ClnDBCxGridDBTableView1Name: TcxGridDBColumn;
    ClnDBCxGridDBTableView1NameLong: TcxGridDBColumn;
    ClnDBCxGridDBTableView1Address: TcxGridDBColumn;
    ClnDBCxGridDBTableView1AddressFact: TcxGridDBColumn;
    ClnDBCxGridDBTableView1DayDelay: TcxGridDBColumn;
    ClnDBCxGridDBTableView1Visible: TcxGridDBColumn;
    ClnDBCxGridDBTableView1trash: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure Open; override;
    { Public declarations }
  end;

var
  MLKCxListPostFrame: TMLKCxListPostFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMLKCxListPostFrame }

procedure TMLKCxListPostFrame.Open;
begin
  inherited;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuTrash.Active then TMlekoDbDsMSSQLDm(CustomDM).QuTrash.Open; 
end;

end.
