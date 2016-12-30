unit MlekoPropDbPriceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLMLKPropDb, StdCtrls, citCtrls, citmask, citDBCtrls, DB,
  MemDS, DBAccess, ActnList, ComCtrls, citDBCalendar, 
  DBCtrls, comp_Target_DBCtrls, MsAccess,ToolWin;

type
  TMlekoPropDbPriceTypeDlg = class(TCFLMLKPropDbDlg)
    ActionCalcBalances: TAction;
    GroupBox2: TGroupBox;
    citDBEdit9: TcitDBEdit;
    citDBEdit1: TcitDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    qu_otdel: TMSQuery;
    ds_otdel: TDataSource;
    citDBEdit3: TcitDBEdit;
    quParentType: TMSQuery;
    DsParentType: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    private
      edit_type: String;
      procedure NextControl;
    public
      class function Add(var aColnPrice: Integer): boolean;
      class function Edit(const aColnPrice: Integer): boolean;
      class function Del(const aColnPrice: Integer): boolean;
      class function Copy(const aSourceColnPrice: Integer;var aDestColnPrice: Integer): boolean;
    end;

implementation

uses data;


{$R *.dfm}
class function TMlekoPropDbPriceTypeDlg.Add(var aColnPrice: Integer): boolean;
var
  Dlg: TMlekoPropDbPriceTypeDlg;
  l_Parent_ColnPrice: Integer;
  l_Parent_colnPrice_name: String;
begin
  Dlg := TMlekoPropDbPriceTypeDlg.Create(Application);
  try
    Dlg.edit_type:='ADD';
//    Dlg.Query.ParamByName('p_ColNPrice').AsInteger := aColnPrice;
    Dlg.Query.Open;
    Dlg.Query.Insert;
    Dlg.Query.FieldByName('Parent_ColnPrice').AsInteger:=aColnPrice;
//    Dlg.Query.FieldByName('ColnPrice').AsInteger:=aColnPrice;    
    Dlg.quParentType.Open;
    Result := Dlg.ShowModal = mrOk;
    if result then
      aColnPrice := Dlg.Query.FieldByName('ColnPrice').AsInteger;
//      aColnPrice := Dlg.Query.ParamByName('ColNPrice').AsInteger;
  finally
    Dlg.Free;
  end;
end;

class function TMlekoPropDbPriceTypeDlg.Copy(const aSourceColnPrice: Integer;var aDestColnPrice: Integer): boolean;
var
  Dlg: TMlekoPropDbPriceTypeDlg;
begin
  Dlg := TMlekoPropDbPriceTypeDlg.Create(Application);
  try
    Dlg.edit_type:='COPY';
    Dlg.Query.ParamByName('p_ColNPrice').AsInteger := aSourceColnPrice;
    Dlg.Query.Open;
    Dlg.Query.Refresh;
    Result := Dlg.ShowModal = mrOk;
    if result then
      aDestColnPrice := Dlg.Query.FieldByName('ID').AsInteger;
  finally
    Dlg.Free;
  end;
end;

class function TMlekoPropDbPriceTypeDlg.Edit(const aColnPrice: Integer): boolean;
var
  Dlg: TMlekoPropDbPriceTypeDlg;
begin
  Dlg := TMlekoPropDbPriceTypeDlg.Create(Application);
  try
    Dlg.edit_type:='EDIT';
    Dlg.Query.ParamByName('p_ColNPrice').AsInteger := aColnPrice;
    Dlg.Query.Open;
    Dlg.Query.Edit;
    Result := Dlg.ShowModal = mrOk;
  finally
    Dlg.Free;
  end;
end;

class function TMlekoPropDbPriceTypeDlg.Del(const aColnPrice: Integer): boolean;
var
  Dlg: TMlekoPropDbPriceTypeDlg;
begin
  Dlg := TMlekoPropDbPriceTypeDlg.Create(Application);
  try
    Dlg.edit_type:='DEL';
    Dlg.Query.ParamByName('p_ColNPrice').AsInteger := aColnPrice;
    Dlg.Query.Open;
    Result := false;
    if MessageDlg('Вы уверены, что хотите удалить ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dlg.Query.Delete;
      Result := true;
    end;
  finally
    Dlg.Free;
  end;
end;

procedure TMlekoPropDbPriceTypeDlg.FormShow(Sender: TObject);
begin
  inherited;
  qu_otdel.Open;
end;

procedure TMlekoPropDbPriceTypeDlg.NextControl;
var
  lControl: TWinControl;
begin
  lControl := FindNextControl(ActiveControl, True, True, False);
  if lControl.CanFocus then lControl.SetFocus;
end;

end.
