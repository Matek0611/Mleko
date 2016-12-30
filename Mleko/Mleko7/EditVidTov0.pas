unit EditVidTov0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, DB, ComCtrls, ActnList,
  DBGridEh, ToolWin, DBAccess, MsAccess, MemDS, GridsEh;

type
  TfmEditVidTov = class(TMlekoForm)
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    deVidName: TDBEdit;
    cbPriceWithNDS: TDBCheckBox;
    cbPrintToPrice: TDBCheckBox;
    cbPrintToPriceExpidition: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    ToolBar: TToolBar;
    ToolBtnAdd: TToolButton;
    DBGridEh2: TDBGridEh;
    ActionList1: TActionList;
    ActionViewRefresh: TAction;
    qu_Prop: TMSQuery;
    qu_PropName: TStringField;
    qu_Propis_prop: TBooleanField;
    qu_Propid: TAutoIncField;
    ds_Prop: TDataSource;
    spSetVidTovGroup: TMSStoredProc;
    procedure ActionViewRefreshExecSQL(Sender: TObject);
    procedure DBGridEh2Columns1UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditVidTov: TfmEditVidTov;
  procedure EditVidTov;
implementation

uses data;

{$R *.DFM}

procedure EditVidTov;
begin
 fmEditVidTov:=TfmEditVidTov.Create(Application);
 fmEditVidTov.qu_Prop.Close;
 fmEditVidTov.qu_Prop.Params.ParamByName('p_VidNo').Value:=dmDataModule.quVidTovVidNo.AsInteger;
 fmEditVidTov.qu_Prop.Open;   
 try
 if fmEditVidTov.ShowModal=mrOk then
  begin
   if dmDataModule.quVidTov.State in [dsEdit,dsInsert] then
    dmDataModule.quVidTov.Post;
  end
 else
  begin
   if dmDataModule.quVidTov.State in [dsEdit,dsInsert] then
    dmDataModule.quVidTov.Cancel;
  end
 finally
 fmEditVidTov.Free;
 end;
end;

procedure TfmEditVidTov.ActionViewRefreshExecSQL(Sender: TObject);
begin
 qu_Prop.Close;
 qu_Prop.Open;
end;

procedure TfmEditVidTov.DBGridEh2Columns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var prop:Integer;  
begin
  If Value then prop:=1 else prop:=0;
  spSetVidTovGroup.Close;
//  spSetVidTovGroup.Prepare;
  spSetVidTovGroup.Params.ParamByName('p_VidTovGroupId').Value:=qu_Prop.FieldByName('ID').AsInteger;
  spSetVidTovGroup.Params.ParamByName('p_VidNo').Value:=dmDataModule.quVidTovVidNo.AsInteger;
  spSetVidTovGroup.Params.ParamByName('p_Value').Value:=prop;
  spSetVidTovGroup.ExecProc;
end;

end.
