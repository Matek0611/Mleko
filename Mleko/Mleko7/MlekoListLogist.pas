unit MlekoListLogist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKMDIChild, ActnList, Menus, ToolWin, ComCtrls,
  ExtCtrls , dbcgrids, DBGridEh, DB,
  DBAccess, MsAccess,  COMPSQLBuilder, StdCtrls, DBCtrls,
  MemDS, GridsEh;

type
  TMlekoListLogistForm = class(TCFLMLKMDIChildForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Splitter2: TSplitter;
    DBCtrlGrid1: TDBCtrlGrid;
    quFreeNakl: TMSQuery;
    dsFreeNakl: TDataSource;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    QuHodka: TMSQuery;
    DSHodka: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBMemo1: TDBMemo;
    procedure DBMemo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGridEh1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
  private
    { Private declarations }
  public
    class procedure ShowForm(const MultiCopy: boolean); override;
  end;

var
  MlekoListLogistForm: TMlekoListLogistForm;

implementation

uses data;

{$R *.dfm}

class procedure TMlekoListLogistForm.ShowForm(const MultiCopy: boolean);
var dlg:TMlekoListLogistForm;
begin
inherited;
dlg := TMlekoListLogistForm.Create(Application);
dlg.QuHodka.Open;
dlg.quFreeNakl.Open;
end;

procedure TMlekoListLogistForm.DBMemo1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
   ShowMessage((Sender as TDBMemo).DataSource.DataSet.FieldByName('ExpeditionNo').AsString);
end;

procedure TMlekoListLogistForm.DBGridEh1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
   ShowMessage('sdf');
end;

end.
