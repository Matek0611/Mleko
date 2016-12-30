unit MlekoListColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess,
  MSAccess, ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, ToolWin, StdCtrls, MlekoListSimple, cxStyles, cxCustomData,
  cxFilter, cxData;

type
  TMlekoListColumnsForm = class(TMlekoListSimpleForm)
    DBGridDBTableView1TYPE_NAME: TcxGridDBColumn;
    DBGridDBTableView1PRECISION: TcxGridDBColumn;
    DBGridDBTableView1SCALE: TcxGridDBColumn;
    DBGridDBTableView1colorder: TcxGridDBColumn;
    DBGridDBTableView1table_id: TcxGridDBColumn;
    DBGridDBTableView1IS_PKEY: TcxGridDBColumn;
    DBGridDBTableView1IS_LOCAL_LOG: TcxGridDBColumn;
    DBGridDBTableView1IS_REMOTE_LOG_IN: TcxGridDBColumn;
    DBGridDBTableView1IS_REMOTE_LOG_OUT: TcxGridDBColumn;
    DBGridDBTableView1META_DATA_TYPE: TcxGridDBColumn;
    DBGridDBTableView1display_name: TcxGridDBColumn;
    DBGridDBTableView1script_display_value: TcxGridDBColumn;
  protected
    procedure OnSetKeyFieds; override;  
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowForm;overload;    
  end;

var
  MlekoListColumnsForm: TMlekoListColumnsForm;

implementation

{$R *.dfm}

class procedure TMlekoListColumnsForm.ShowForm;
begin
  With Create(Application) do
  begin
     OnSetKeyFieds;
     ActionViewRefresh.Execute;
  end;
end;

procedure TMlekoListColumnsForm.OnSetKeyFieds;
begin
  inherited;
  KeyFields.Add('ID');
end;

end.
