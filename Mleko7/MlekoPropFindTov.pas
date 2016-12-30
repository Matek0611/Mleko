unit MlekoPropFindTov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKProp, ActnList, ComCtrls, StdCtrls, ExtCtrls;

type
  TMlekoPropFindTovDlg = class(TCFLMLKPropDlg)
    edName: TLabeledEdit;
    edVid: TLabeledEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    class function GetFindTov(var aTovName:String; var aVidTov:String): boolean;
  end;

var
  MlekoPropFindTovDlg: TMlekoPropFindTovDlg;

implementation

{$R *.dfm}

class function TMlekoPropFindTovDlg.GetFindTov(var aTovName:String;var aVidTov:String): boolean;
var    Dlg: TMlekoPropFindTovDlg;
begin
    Dlg := TMlekoPropFindTovDlg.Create(Application);
    try
        Result := ( Dlg.ShowModal = mrOk );
        aTovName:=dlg.edName.Text;
        aVidTov:=dlg.edVid.Text;
    finally
        Dlg.Free;
    end;
end;

procedure TMlekoPropFindTovDlg.ActionOKExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;

procedure TMlekoPropFindTovDlg.ActionCancelExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrCancel;
end;

end.
