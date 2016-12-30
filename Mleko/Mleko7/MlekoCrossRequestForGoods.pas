unit MlekoCrossRequestForGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLEhList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, DBGridEh, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, 
  PrnDbgeh,StdCtrls, DBCtrls, DBCtrlsEh, cxGraphics, VirtualTable,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, PropStorageEh, MemDS,
  GridsEh, ToolWin;

type
  TSumRec = record
    ID: Integer;
    Summa: Real;
    SummaTT: Real;
  end;

type
  TMlekoCrossRequestForGoodsForm = class(TCFLEHListForm)
    SP: TMSStoredProc;
    spGetColInfoForBlankOrder: TMSStoredProc;
    DBText1: TDBText;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label5: TLabel;
    quBrand: TMSQuery;
    DsListBrand: TDataSource;
    EdPodr: TCxDBLookupCombobox;
    DSVtBrand: TDataSource;
    ActionRegim: TAction;
    ToolButton3: TToolButton;
    ActionRegimSet: TAction;
    Progress: TProgressBar;
    SPSummaBlankTovPos: TMSStoredProc;
    spEditBlankPosition: TMSStoredProc;
    Label7: TLabel;
    DBText2: TDBText;
    quInfo: TMSStoredProc;
    DBText7: TDBText;
    Label8: TLabel;
    VtBrand: TVirtualTable;
    CBAllTovar: TCheckBox;
    ToolButton6: TToolButton;
    CBIsOnlyRequest: TCheckBox;
    DBText3: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBText4: TDBText;
    procedure DBGridColEnter(Sender: TObject);
    procedure ActionViewRefreshExecute(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPAfterPost(DataSet: TDataSet);
    procedure ActionRegimExecute(Sender: TObject);
    procedure ActionRegimSetExecute(Sender: TObject);
    procedure DBGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridColExit(Sender: TObject);
    procedure DBGridGetFooterParams(Sender: TObject; DataCol, Row: Integer;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      var Alignment: TAlignment; State: TGridDrawState; var Text: String);

  private
    sums : Array[0..600] of TSumRec;
    ld_date:TDAte;
    lRequest_id : integer;
    isFirst : boolean;
    procedure rebuild_column(is_pack:boolean);
  public
    class procedure ShowFormBrand(p_date: TDATE; Request_Id: integer);
  end;

var
  ln_tovarNo: integer=-1;
  ln_CellValue:real;
  is_reopen:boolean = true;
  MlekoCrossRequestForGoodsForm: TMlekoCrossRequestForGoodsForm;

implementation

uses data, main;

{$R *.dfm}

class procedure TMlekoCrossRequestForGoodsForm.ShowFormBrand(p_date: TDATE; Request_Id: integer);
var
    NewForm: TCFLEHListForm;
    IsNew: boolean;
begin
    with Create(Application) do begin
     ld_date:=p_date;
     lRequest_id := Request_Id;
     isFirst := True;
     StatusBar.Panels[0].Text:='Рабочая дата:'+DateToStr(ld_date);
     VtBrand.Open;
     quBrand.Close;
     quBrand.ParamByName('DateNakl').AsDate:=p_date;
     quBrand.Open;
     VtBrand.Insert;
     VtBrand.FieldByName('TipNo').Value:=quBrand.FieldByName('TipNo').Value;
//  if VtBrand.State in [dsInsert,dsEdit] then VtBrand.Post;
//     showmessage (inttostr(vtbrand.RecordCount));
     ActionViewRefreshExecute(nil);
    end;
//    quBrand.Close;
end;


procedure TMlekoCrossRequestForGoodsForm.DBGridColEnter(Sender: TObject);
begin
  inherited;
  if (Sender as TDBGridEh).SelectedIndex<(Sender as TDBGridEh).FrozenCols then (Sender as TDBGridEh).SelectedIndex:=(Sender as TDBGridEh).FrozenCols;
  spGetColInfoForBlankOrder.Close;
  spGetColInfoForBlankOrder.ParamByName('Request_id').Value := lRequest_id;
  spGetColInfoForBlankOrder.ParamByName('NaklNo').Value := (Sender as TDBGridEh).Columns[(Sender as TDBGridEh).SelectedIndex].Field.Tag;
  spGetColInfoForBlankOrder.Open;
end;

procedure TMlekoCrossRequestForGoodsForm.ActionViewRefreshExecute(
  Sender: TObject);
var
    i:integer;
    l_fieldName: String;
    l_str_tmp:string;
    l_document_id:integer;
    l_old_id: integer;
    is_locate: boolean;
begin
  Screen.Cursor:=crHourGlass;
  is_locate:=false;
  if VtBrand.State in [dsInsert,dsEdit] then VtBrand.Post;

//       showmessage (inttostr(vtbrand.RecordCount));

  if DS.DataSet.Active then begin
    l_old_id := DS.DataSet.FieldByName('ID').AsInteger;
    is_locate := true;
  end;

  quInfo.Close;
  quInfo.ParamByName('p_dateNakl').Value := ld_date;
  quInfo.ParamByName('p_TipNo').Value := VtBrand.FieldByName('TipNo').Value;
  quInfo.ParamByName('p_article_id').Value := ln_tovarNo;
  quInfo.ParamByName('Request_Id').Value := lRequest_id;
  if CBAllTovar.Checked then quInfo.ParamByName('only_minus').AsString := 'N' else quInfo.ParamByName('only_minus').AsString := 'Y';
  quInfo.Open;

  SP.Close;
  SP.ParamByName('p_dateNakl').Value := ld_date;
  if isFirst then SP.ParamByName('p_TipNo').Value := -1
             else SP.ParamByName('p_TipNo').Value := VtBrand.FieldByName('TipNo').Value;
  SP.ParamByName('p_article_id').Value := ln_tovarNo;
  SP.ParamByName('Request_id').Value := lRequest_id;
  SP.ParamByName('isOnlyRequest').Value := CBIsOnlyRequest.Checked;
  if CBAllTovar.Checked then begin
                               SP.Params.ParamByName('only_minus').AsString := 'Y';
                               SP.ParamByName('p_TipNo').Value := -1;
                             end
                        else begin
                               SP.Params.ParamByName('only_minus').AsString := 'N';
//                               SP.ParamByName('p_TipNo').Value := -1;
                             end;

  if CBIsOnlyRequest.Checked then begin
                                    SP.ParamByName('p_TipNo').Value := -1;
                                    SP.Params.ParamByName('only_minus').AsString := 'N';
                                  end;
  SP.Open;
  isFirst := false;
  if is_locate then DS.DataSet.Locate('ID',l_old_id,[]);  
  rebuild_column(ActionRegim.Checked);
  ActiveControl:=DBGrid;
  Screen.Cursor:=crDefault;
end;

procedure TMlekoCrossRequestForGoodsForm.DBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var i:integer;
begin
  inherited;

  if (Key=VK_RETURN) then
  begin
    if SP.State=dsEdit then begin
      SP.Post;
      i:=(Sender as TDBGridEh).SelectedIndex+1;
      if i<(Sender as TDBGridEh).FieldCount then begin
         while (not (Sender as TDBGridEh).Columns[i].Visible) and (i<(Sender as TDBGridEh).FieldCount-1) do
           begin
            i:=i+1;
           end;
       if i<(Sender as TDBGridEh).FieldCount-1 then (Sender as TDBGridEh).SelectedIndex:=i;
      end;
    end;
  end;

end;

procedure TMlekoCrossRequestForGoodsForm.SPAfterPost(DataSet: TDataSet);
var i:integer;
ln_summa_pos:Real;
Index:Integer;
l_summa: Real;
begin
  inherited;
   Index:=DbGrid.SelectedIndex;
  IF ((DbGrid.SelectedField.FieldName[1]='C') and Edit_CrossBlankOrder = True )  then begin
     spEditBlankPosition.Close;
//     spEditBlankPosition.Prepare;
     spEditBlankPosition.ParamByName('Request_id').Value := lRequest_id;
     spEditBlankPosition.ParamByName('NaklNo').Value:=DbGrid.Columns[Index].Field.Tag;
     spEditBlankPosition.ParamByName('TovarNo').Value:=SP.FieldByName('ID').AsInteger;
     spEditBlankPosition.ParamByName('QtyFirst').Value:=null;
     spEditBlankPosition.ParamByName('Qty').Value:=SP.FieldByName('C'+IntToStr(DbGrid.Columns[Index].Field.Tag)).AsFloat;
     spEditBlankPosition.ExecProc;
     l_summa:=spEditBlankPosition.ParamByName('Summa').AsFloat;
     sums[DbGrid.Columns[Index].Field.Index].Summa:=l_summa;
     dmDataModule.QFO.Close;
     dmDataModule.QFO.Sql.Clear;
     dmDataModule.QFO.SQL.Add('select sum(Qty) as KolOrd from RequestForSupplyGoodsSpec s where s.TovarNo=:p_TovarNo and s.DateNakl=:p_dateNakl');
     dmDataModule.QFO.ParamByName('p_TovarNo').AsInteger:=SP.FieldByName('ID').AsInteger;
     dmDataModule.QFO.ParamByName('p_dateNakl').AsDate:=ld_date;
     dmDataModule.QFO.Open;
     Sp.AfterPost:=nil;
     SP.Edit;
     SP.FieldByName('KolRashod').AsFloat:=dmDataModule.QFO.FieldByName('KolOrd').AsFloat;
     SP.Post;
     Sp.AfterPost:=SPAfterPost;
 end;
end;


procedure TMlekoCrossRequestForGoodsForm.ActionRegimExecute(Sender: TObject);
begin
  inherited;
  is_reopen:=false;
  ActionRegim.Checked := not ActionRegim.Checked;
  if ActionRegim.Checked then ln_tovarNo:=SP.FieldByName('ID').AsInteger else ln_tovarNo:=-1;
  rebuild_column(ActionRegim.Checked);
  ActiveControl:=DBGrid;
  DS.DataSet.Prior;
  IF not DS.DataSet.BOF then DS.DataSet.Next;
end;

procedure TMlekoCrossRequestForGoodsForm.ActionRegimSetExecute(Sender: TObject);
var i:integer;
begin
  inherited;
  Progress.Min:=0;
  Progress.Max:=DBGrid.Columns.Count-1;
  DBGrid.Visible:=False;
  SP.DisableControls;
  DBGrid.DataSource:=nil;
  IF ActionRegim.Checked then
  begin
    for i := DBGrid.FrozenCols to DBGrid.Columns.Count-1 do begin
      Progress.Position:=Progress.Position+1;
      IF DBGrid.Columns[i].Field.Value=0 then DBGrid.Columns[i].Visible:=false;
    end
  end else
    for i := DBGrid.FrozenCols to DBGrid.Columns.Count-1 do
    begin
      Progress.Position:=Progress.Position+1;
      DBGrid.Columns[i].Visible:=true;
    end;

  Progress.Position:=0;
  DBGrid.DataSource:=DS;  
  SP.EnableControls;
  DBGrid.Visible:=True;
end;

procedure TMlekoCrossRequestForGoodsForm.DBGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (sp.FieldByName('KolRashod').AsFloat>sp.FieldByName('KolOst').AsFloat) then AFont.Color:=clRed;
  if (sp.FieldByName('ID').AsInteger=ln_tovarNo) then Background:=clLtGray else
  begin
    Background:=StrToInt(Column.Field.Origin);
  end;
end;


procedure TMlekoCrossRequestForGoodsForm.DBGridColExit(Sender: TObject);
begin
  inherited;
   IF Sp.State=dsEdit then Sp.Post;
end;

procedure TMlekoCrossRequestForGoodsForm.rebuild_column(is_pack:boolean);
var fld: TField;
col: TColumnEh;
i:integer;
color:String;
begin
  dbgrid.FrozenCols:=0;
  dbgrid.Visible:=false;
  sp.DisableControls;
  if is_pack then ln_tovarNo:=SP.FIeldByName('ID').AsInteger else ln_tovarNo:=-1;
  for i := 0 to sp.FieldCount-1 do
  begin
   sp.Fields[i].Visible:=false;
   sums[i].ID:=0;
   sums[i].Summa:=0;
   sums[i].SummaTT:=0;
  end;
  Progress.Min:=0;
  Progress.Max:=quInfo.RecordCount;
  i:=0;
  quInfo.First;
  while not quInfo.Eof do begin
    fld:=sp.FieldByName(quInfo.FieldByName('FieldName').AsString);
    if is_pack then
    begin
      if (fld.FieldName[1]='C') then
      begin
        fld.Visible:=(fld.AsFloat>0);
      end else fld.Visible:=true;
    end else fld.Visible:=true;
    if fld.Visible then
    begin
      fld.Tag:=quInfo.FieldByName('ID').AsInteger;
      fld.Origin:=quInfo.FieldByName('Color').asString;
      fld.DisplayWidth:=quInfo.FieldByName('Width').AsInteger;
      fld.DisplayLabel:=quInfo.FieldByName('ColumnName').AsString;
      fld.ReadOnly:=(quInfo.FieldByName('is_read_only').AsInteger=1);
    end;
    sums[fld.Index].ID:=fld.Tag;
    sums[fld.Index].Summa:=quInfo.FieldByName('Summa').AsFloat;
    sums[fld.Index].SummaTT:=quInfo.FieldByName('SummaTT').AsFloat;
    Progress.Position:=Progress.Position+1;
    inc(i);
    quInfo.Next;
  end;

  sp.EnableControls;
  dbgrid.Visible:=true;
  dbgrid.Columns[0].HideDuplicates:=true;
  Progress.Position:=0;
  IF dbgrid.Columns.Count <=5 then dbgrid.FrozenCols:=dbgrid.Columns.Count-1 else dbgrid.FrozenCols:=5;
end;

procedure TMlekoCrossRequestForGoodsForm.DBGridGetFooterParams(Sender: TObject;
  DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState;
  var Text: String);
  var index:integer;
begin
  inherited;
  if column.FieldName[1]='C' then
  begin
   index:=Sp.FieldByName(column.FieldName).Index;
   Text:=FloatToStr(sums[index].Summa);
   if sums[index].SummaTT<150 then Background:=clRed;
  end;
{  if column.FieldName[1]='C' then
  begin
    dmDataModule.QFO.Close;
    dmDataModule.QFO.Sql.Clear;
    dmDataModule.QFO.SQL.Add('select round(summa,1) as Summa,(select sum(summa) from e_blank_head where dateNakl=h.dateNakl and postNo=h.postNo and AddressNo=h.AddressNo and status<>-1) as SummaTT from e_blank_head h where h.id='+IntToStr(Column.Field.Tag));
    dmDataModule.QFO.Open;
    Text:=dmDataModule.QFO.fieldbyName('summa').asString;
    if dmDataModule.QFO.fieldbyName('summaTT').AsFloat<150 then Background:=clRed;
  end;}
end;


end.
