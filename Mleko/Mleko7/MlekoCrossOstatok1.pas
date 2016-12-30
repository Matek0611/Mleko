unit MlekoCrossOstatok1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, CFLEhList, Menus, citComponentProps, DB,   DBAccess, MsAccess,
  COMPSQLBuilder, ActnList, DBGridEh, ExtCtrls,
  comp_TargetFilter_Panel, ComCtrls, 
  PrnDbgeh,StdCtrls, DBCtrls, DBCtrlsEh, cxGraphics, VirtualTable,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, PropStorageEh, MemDS,
  GridsEh, ToolWin, DateUtils;

type
  TSumRec = record
    ID: Integer;
    Summa: Real;
    SummaTT: Real;
  end;

type
  TMlekoCrossOstatok1Form = class(TCFLEHListForm)
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
    CBOrderTovar: TCheckBox;
    ToolButton6: TToolButton;
    CBIsOnlyOstatok1: TCheckBox;
    DBText3: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBText4: TDBText;
    CBOverOstatok: TCheckBox;
    CBNotOrderTovar: TCheckBox;
    RBIsOnlyOstatok1: TRadioButton;
    RBOrderTovar: TRadioButton;
    RBOverOstatok: TRadioButton;
    RBNotOrderTovar: TRadioButton;
    btCreateNakls: TButton;
    quInsInNaklP: TMSQuery;
    quNaklR: TMSQuery;
    quSpec: TMSQuery;
    quSpecTovarNo: TIntegerField;
    quSpecqty: TFloatField;
    quSpecAvgPriceIn: TFloatField;
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
    procedure btCreateNaklsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    sums : Array[0..600] of TSumRec;
    ld_date:TDAte;
    lOstatok1_id : integer;
    isFirst : boolean;
    procedure rebuild_column(is_pack:boolean);
  public
    class procedure ShowFormBrand(p_date: TDATE; Ostatok1_id: integer);
  end;

var
  ln_tovarNo: integer=-1;
  ln_CellValue:real;
  is_reopen:boolean = true;
  MlekoCrossOstatok1Form: TMlekoCrossOstatok1Form;

implementation

uses data, main, MlekoDbDsMSSQL;

{$R *.dfm}

class procedure TMlekoCrossOstatok1Form.ShowFormBrand(p_date: TDATE; Ostatok1_id: integer);
var
    NewForm: TCFLEHListForm;
    IsNew: boolean;
begin
    with Create(Application) do begin
     ld_date:=p_date;
     lOstatok1_id := Ostatok1_id;
     isFirst := True;
     StatusBar.Panels[0].Text:='Рабочая дата:'+DateToStr(ld_date);
     VtBrand.Open;
     quBrand.Close;
     quBrand.ParamByName('DateNakl').AsDate:=p_date;
     quBrand.Open;
     VtBrand.Insert;
     VtBrand.FieldByName('VidNo').Value:=quBrand.FieldByName('VidNo').Value;
     EdPodr.Clear;
     RBIsOnlyOstatok1.Checked := true;
//  if VtBrand.State in [dsInsert,dsEdit] then VtBrand.Post;
//     showmessage (inttostr(vtbrand.RecordCount));
     ActionViewRefreshExecute(nil);
    end;
//    quBrand.Close;
end;


procedure TMlekoCrossOstatok1Form.DBGridColEnter(Sender: TObject);
begin
  inherited;
  if (Sender as TDBGridEh).SelectedIndex<(Sender as TDBGridEh).FrozenCols then (Sender as TDBGridEh).SelectedIndex:=(Sender as TDBGridEh).FrozenCols;
{
  spGetColInfoForBlankOrder.Close;
  spGetColInfoForBlankOrder.ParamByName('Ostatok1_id').Value := lOstatok1_id;
//  spGetColInfoForBlankOrder.ParamByName('NaklNo').Value := (Sender as TDBGridEh).Columns[(Sender as TDBGridEh).SelectedIndex].Field.Tag;
  spGetColInfoForBlankOrder.Open;
}  
end;

procedure TMlekoCrossOstatok1Form.ActionViewRefreshExecute(
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
  quInfo.ParamByName('p_article_id').Value := ln_tovarNo;
  quInfo.ParamByName('Ostatok1_Id').Value := lOstatok1_Id;
  quInfo.Open;

  SP.Close;
  if VtBrand.FieldByName('VidNo').IsNull then SP.ParamByName('VidNo').Value := -1
                                         else SP.ParamByName('VidNo').Value := VtBrand.FieldByName('VidNo').Value;
  SP.ParamByName('Ostatok1_Id').Value := lOstatok1_Id;
{
  if CBIsOnlyOstatok1.Checked then begin
                                     SP.ParamByName('VidNo').Value := -1;
                                     SP.ParamByName('OnlyOrderTovar').Value := 0;
                                     SP.ParamByName('NotOrderTovar').Value := 0;
                                     SP.ParamByName('OrderOverOst').Value := 0;
                                     CBOrderTovar.Checked := false;
                                     CBOverOstatok.Checked := false;
                                     CBNotOrderTovar.Checked := false;
                                   end;

  if CBOrderTovar.Checked then begin
                                 SP.ParamByName('VidNo').Value := -1;
                                 SP.ParamByName('OnlyOrderTovar').Value := 1;
                                 SP.ParamByName('NotOrderTovar').Value := 0;
                                 SP.ParamByName('OrderOverOst').Value := 0;
                                 CBIsOnlyOstatok1.Checked := false;
                                 CBOverOstatok.Checked := false;
                                 CBNotOrderTovar.Checked := false;
                               end;

  if CBOverOstatok.Checked then begin
                                  SP.ParamByName('VidNo').Value := -1;
                                  SP.ParamByName('OnlyOrderTovar').Value := 0;
                                  SP.ParamByName('NotOrderTovar').Value := 0;
                                  SP.ParamByName('OrderOverOst').Value := 1;
                                  CBIsOnlyOstatok1.Checked := false;
                                  CBOrderTovar.Checked := false;
                                  CBNotOrderTovar.Checked := false;
                                end;

  if CBNotOrderTovar.Checked then begin
                                    SP.ParamByName('VidNo').Value := -1;
                                    SP.ParamByName('OnlyOrderTovar').Value := 0;
                                    SP.ParamByName('NotOrderTovar').Value := 1;
                                    SP.ParamByName('OrderOverOst').Value := 0;
                                    CBIsOnlyOstatok1.Checked := false;
                                    CBOrderTovar.Checked := false;
                                    CBOverOstatok.Checked := false;
                                  end;

  if not CBIsOnlyOstatok1.Checked and not CBOrderTovar.Checked and
     not CBOverOstatok.Checked and not CBNotOrderTovar.Checked then begin
                                                                      SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                                      SP.ParamByName('NotOrderTovar').Value := 0;
                                                                      SP.ParamByName('OrderOverOst').Value := 0;
                                                                    end;
 }

  if RBIsOnlyOstatok1.Checked then begin
                                     if EdPodr.Text = '' then begin
                                                                SP.ParamByName('VidNo').Value := -1;
                                                                SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                                SP.ParamByName('NotOrderTovar').Value := 0;
                                                                SP.ParamByName('OrderOverOst').Value := 0;
                                                              end
                                                         else begin
                                                                SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                                SP.ParamByName('NotOrderTovar').Value := 0;
                                                                SP.ParamByName('OrderOverOst').Value := 0;
                                                              end;
                                   end;
  if RBOrderTovar.Checked then begin
                                 if EdPodr.Text = '' then begin
                                                            SP.ParamByName('VidNo').Value := -1;
                                                            SP.ParamByName('OnlyOrderTovar').Value := 1;
                                                            SP.ParamByName('NotOrderTovar').Value := 0;
                                                            SP.ParamByName('OrderOverOst').Value := 0;
                                                          end
                                                     else begin
                                                            SP.ParamByName('OnlyOrderTovar').Value := 1;
                                                            SP.ParamByName('NotOrderTovar').Value := 0;
                                                            SP.ParamByName('OrderOverOst').Value := 0;
                                                          end;
                               end;
  if RBOverOstatok.Checked then begin
                                  if EdPodr.Text = '' then begin
                                                             SP.ParamByName('VidNo').Value := -1;
                                                             SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                             SP.ParamByName('NotOrderTovar').Value := 0;
                                                             SP.ParamByName('OrderOverOst').Value := 1;
                                                           end
                                                      else begin
                                                             SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                             SP.ParamByName('NotOrderTovar').Value := 0;
                                                             SP.ParamByName('OrderOverOst').Value := 1;
                                                           end;
                                end;
  if RBNotOrderTovar.Checked then begin
                                    if EdPodr.Text = '' then begin
                                                               SP.ParamByName('VidNo').Value := -1;
                                                               SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                               SP.ParamByName('NotOrderTovar').Value := 1;
                                                               SP.ParamByName('OrderOverOst').Value := 0;
                                                             end
                                                        else begin
                                                               SP.ParamByName('OnlyOrderTovar').Value := 0;
                                                               SP.ParamByName('NotOrderTovar').Value := 1;
                                                               SP.ParamByName('OrderOverOst').Value := 0;
                                                             end;
                                  end;

  SP.Open;
  isFirst := false;
  if is_locate then DS.DataSet.Locate('ID',l_old_id,[]);
  rebuild_column(ActionRegim.Checked);
  ActiveControl:=DBGrid;
  Screen.Cursor:=crDefault;
end;

procedure TMlekoCrossOstatok1Form.DBGridKeyDown(Sender: TObject;
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

procedure TMlekoCrossOstatok1Form.SPAfterPost(DataSet: TDataSet);
var i:integer;
ln_summa_pos:Real;
Index:Integer;
l_summa: Real;
S: string;

begin
  inherited;
   Index:=DbGrid.SelectedIndex;
  IF ((DbGrid.SelectedField.FieldName[1]='C') and Edit_CrossBlankOrder = True )  then begin
{
     S := DbGrid.SelectedField.FieldName;
     Delete(S,1,1);
 }
     spEditBlankPosition.Close;
//     spEditBlankPosition.Prepare;

     spEditBlankPosition.ParamByName('Ostatok_id').Value := lOstatok1_id;
     spEditBlankPosition.ParamByName('Ostatok1NaklNo').Value := DbGrid.Columns[Index].Field.Tag;;
     spEditBlankPosition.ParamByName('TovarNo').Value := SP.FieldByName('ID').AsInteger;
     spEditBlankPosition.ParamByName('Qty').Value := SP.FieldByName('C'+IntToStr(DbGrid.Columns[Index].Field.Tag)).AsFloat;
     spEditBlankPosition.ExecProc;
     l_summa:=spEditBlankPosition.ParamByName('@SummaDost').AsFloat;
     sums[DbGrid.Columns[Index].Field.Index].Summa:=l_summa;

     dmDataModule.QFO.Close;
     dmDataModule.QFO.Sql.Clear;
     dmDataModule.QFO.SQL.Add('select sum(KolZakNow) as KolZakNow from Ostatok1Spec s where s.TovarNo=:p_TovarNo and s.Ostatok1Head_Id=:Ostatok1Head_Id');
     dmDataModule.QFO.ParamByName('p_TovarNo').AsInteger:=SP.FieldByName('ID').AsInteger;
     dmDataModule.QFO.ParamByName('Ostatok1Head_Id').AsDate:=lOstatok1_id;
     dmDataModule.QFO.Open;

     Sp.AfterPost:=nil;
     SP.Edit;
     SP.FieldByName('KolZakNow').AsFloat:=dmDataModule.QFO.FieldByName('KolZakNow').AsFloat;
     SP.Post;

     sp.Refresh;

     quInfo.Close;
     quInfo.ParamByName('Ostatok1_Id').Value := lOstatok1_id;
     quInfo.Open;

//     rebuild_column(ActionRegim.Checked);

     dbgrid.Refresh;


     Sp.AfterPost:=SPAfterPost;

 end;

end;


procedure TMlekoCrossOstatok1Form.ActionRegimExecute(Sender: TObject);
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

procedure TMlekoCrossOstatok1Form.ActionRegimSetExecute(Sender: TObject);
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

procedure TMlekoCrossOstatok1Form.DBGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (sp.FieldByName('KolZakNow').AsFloat>sp.FieldByName('KolOst').AsFloat) then AFont.Color:=clRed;
  if (sp.FieldByName('ID').AsInteger=ln_tovarNo) then Background:=clLtGray else
  begin
    Background:=StrToInt(Column.Field.Origin);
  end;
end;


procedure TMlekoCrossOstatok1Form.DBGridColExit(Sender: TObject);
begin
  inherited;
   IF Sp.State=dsEdit then Sp.Post;
end;

procedure TMlekoCrossOstatok1Form.rebuild_column(is_pack:boolean);
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
    if (fld.Visible) then
    begin
      fld.Tag:= quInfo.FieldByName('ID').AsInteger;
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

// ShowMessage (sp.ParamByName('Ostatok1_id').AsString);


  sp.EnableControls;
  dbgrid.Visible:=true;
  dbgrid.Columns[0].HideDuplicates:=true;
  Progress.Position:=0;
  IF dbgrid.Columns.Count <=4 then dbgrid.FrozenCols:=dbgrid.Columns.Count-1 else dbgrid.FrozenCols:=4;
end;

procedure TMlekoCrossOstatok1Form.DBGridGetFooterParams(Sender: TObject;
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


procedure TMlekoCrossOstatok1Form.btCreateNaklsClick(Sender: TObject);
var
  quCheckCreateNakls               : TMSQuery;
  quOstatok1NaklSpecForCreateNaklP : TMSQuery;
  quInsInD_Control_PriceInInst     : TMSQuery;
  quPriceInInst                    : TMSQuery;
  quNaklP                          : TMSQuery;
  quListAddressPost                : TMSQuery;
  quSetNaklNoInOstatok1Nakl        : TMSQuery;
  quSetKolZakItogOstatok1Spec      : TMSQuery;
  a,b,c,SummaNaklR, SummaNaklP     : Currency;
  Delta                            : Boolean;
  l_str                            : string;
  is_Post                          : Boolean;
  PostNo,NewNaklNo, Nom            : Integer;
  pKey                             : Int64;
  ListNaklR                        : String;
  PriceInInst                      : Currency;
  RateCurrencyAccounting           : Real;
  CurrencyAccounting               : String;

begin
  inherited;
  quCheckCreateNakls := TMSQuery.Create(nil);
  quCheckCreateNakls.Connection := dmDataModule.DB;
  quCheckCreateNakls.SQL.Clear;
  quCheckCreateNakls.SQL.Text := 'select * '
                                +' from Ostatok1Spec o1s left join                                                                         '
                                +'      (select Ostatok1Id, TovarNo, sum(qty) as qty                                                       '
                                +'        from Ostatok1Nakl                                                                                '
                                +'         where NaklNo is null                                                                            '
                                +'       group by Ostatok1Id, TovarNo) s on o1s.Ostatok1Head_Id = s.Ostatok1Id and o1s.TovarNo = s.TovarNo '
                                +'  where isnull(o1s.BegVirtKol,0)-isnull(o1s.KolZakItog,0) < isnull(s.Qty,0)                              '
                                +'    and o1s.Ostatok1Head_Id = :p1_Ostatok1Head_Id                                                        ';
  quCheckCreateNakls.ParamByName('p1_Ostatok1Head_Id').Value := lOstatok1_id;
  quCheckCreateNakls.Prepare;
  quCheckCreateNakls.Open;

  if quCheckCreateNakls.RecordCount > 0 then raise Exception.Create(' В Остатк-1 присутствует товар текущий заказ которого превышает остаток!'+ #10#13 +
                                                                    'Выровняйте заказ и повторите попытку.');

  dmDataModule.OpenSQL('select * from ListAddressPostForOstatok1Prihod where Active = 1');

  PostNo := dmDataModule.QFO.FieldByName('PostNo').AsInteger;

  quInsInNaklP.Close;
  quInsInNaklP.ParamByName('PostNo').Value := dmDataModule.QFO.FieldByName('PostNo').AsInteger;
  quInsInNaklP.ParamByName('OtdelNo').Value := dmDataModule.QFO.FieldByName('OtdelNo').AsInteger;
  quInsInNaklP.ParamByName('Buh').Value := dmDataModule.QFO.FieldByName('Buh').AsInteger;
  quInsInNaklP.ParamByName('Doc_Type').Value := 1;
  quInsInNaklP.ParamByName('UserNo').Value := data.UserNo;
  quInsInNaklP.ParamByName('DateNakl').Value := Date;
  quInsInNaklP.ParamByName('DatePrih').Value := Date;
  quInsInNaklP.ParamByName('SET_ARTICLE_GROUP_ID').Value := dmDataModule.QFO.FieldByName('Set_Article_Group_Id').Value;

  dmDataModule.OpenSQL('select * from L_POST_SET_ARTGROUP_DELAY where PostNo = :p1_PostNo and Buh = :p2_Buh and SET_ARTICLE_GROUP_ID = :p3_SET_ARTICLE_GROUP_ID',[quInsInNaklP.ParamByName('PostNo').Value,quInsInNaklP.ParamByName('Buh').Value,quInsInNaklP.ParamByName('SET_ARTICLE_GROUP_ID').Value]);

  quInsInNaklP.ParamByName('Day_Delay').Value := dmDataModule.QFO.FieldByName('Day_Delay').AsInteger;
  quInsInNaklP.ParamByName('Day_Delay_Ext').Value := dmDataModule.QFO.FieldByName('Day_Delay_Ext').AsInteger;
//  quInsInNaklP.ParamByName('').Value :=
  quInsInNaklP.Prepare;
  quInsInNaklP.Execute;

  quNaklP := TMSQuery.Create(nil);
  quNaklP.Connection:= dmDataModule.DB;
  quNaklP.SQL.Clear;
  quNaklP.SQL.Text := 'select NaklNo, Pkey from NaklP where NaklNo = (select max(NaklNo) from NaklP)';
  quNaklP.Prepare;
  quNaklP.Open;

  quOstatok1NaklSpecForCreateNaklP := TMSQuery.Create(nil);
  quOstatok1NaklSpecForCreateNaklP.Connection:= dmDataModule.DB;
  quOstatok1NaklSpecForCreateNaklP.SQL.Clear;
  quOstatok1NaklSpecForCreateNaklP.SQL.Text:='select  o1n.TovarNo                                                                         '+
                                             '       , sum(qty) as Qty                                                                    '+
                                             '       , convert(decimal(18,2),o.AvgPriceIn) as AvgPriceIn                                  '+
                                             ' from Ostatok1Nakl o1n left join                                                            '+
                                             '      Ostatok1Spec o on o.TovarNo = o1n.TovarNo  and o.Ostatok1Head_Id = o1n.Ostatok1Id     '+
                                             '  where Ostatok1Id = :Ostatok1Id                                                            '+
                                             '    and NaklNo is null                                                                      '+
                                             '    and (qty is not null and Qty > 0)                                                       '+
                                             'group by o1n.TovarNo, o.AvgPriceIn                                                          ';
  quOstatok1NaklSpecForCreateNaklP.Prepare;
  quOstatok1NaklSpecForCreateNaklP.ParamByName('Ostatok1Id').Value := lOstatok1_id;
  quOstatok1NaklSpecForCreateNaklP.Open;
  quOstatok1NaklSpecForCreateNaklP.First;


{
  while not quOstatok1NaklSpecForCreateNaklP.Eof do
   begin


     quOstatok1NaklSpecForCreateNaklP.Next;

   end;
}

  while not quOstatok1NaklSpecForCreateNaklP.Eof do
   begin
     is_Post := True;



     quPriceInInst:=TMSQuery.Create(nil);
     quPriceInInst.Connection:=dmDataModule.DB;
     quPriceInInst.SQL.Clear;
     quPriceInInst.SQL.Text:= 'select isnull(PriceInInst,0) as PriceInInst from PriceForVeb where TovarNo = :TovarNo ';
     quPriceInInst.ParamByName('TovarNo').Value := quOstatok1NaklSpecForCreateNaklP.FieldByName('TovarNo').Value;
     quPriceInInst.Open;

     a:=  quPriceInInst.FieldByName('PriceInInst').AsFloat - DeltaPriceInInst;
     b:=  quPriceInInst.FieldByName('PriceInInst').AsFloat + DeltaPriceInInst;
     c:=  quOstatok1NaklSpecForCreateNaklP.FieldByName('AvgPriceIn').Value;

     PriceInInst := quPriceInInst.FieldByName('PriceInInst').AsFloat;

     if ((a <= c) and (c <= b)) then Delta := True
                                else Delta := False;

     if Delta = False
      then begin
             l_str := 'Цена '+floattostr(c)+ 'не входит в допустимый интервал цены.' + #10#13 +
                      'Допустимый интервал: с ' + floattostr(a) +
                      ' по ' + floattostr(b) + #10#13 +
                      'Продолжить (Да) отменить (Нет)?';
             if Application.MessageBox(PChar(l_str), 'Внимание!', MB_YESNO) = IDYES then begin
                                                                                           quInsInD_Control_PriceInInst:=TMSQuery.Create(nil);
                                                                                           quInsInD_Control_PriceInInst.Connection:=dmDataModule.DB;
                                                                                           quInsInD_Control_PriceInInst.SQL.Clear;
                                                                                           quInsInD_Control_PriceInInst.SQL.Text:= 'insert into D_Control_PriceInInst (UserNo,TovarNo,PriceInInst,Price_ECO,Date,PostNo,HostName,Dhead_id)'
                                                                                                                                  +'values (:UserNo,:TovarNo,:PriceInInst,:Price_ECO,GetDate(),:PostNo,HOST_NAME(),:Dhead_id)';
                                                                                           quInsInD_Control_PriceInInst.ParamByName('UserNo').Value := Data.UserNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('TovarNo').Value := quOstatok1NaklSpecForCreateNaklP.FieldByName('TovarNo').Value;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PriceInInst').Value := quPriceInInst.FieldByName('PriceInInst').AsFloat;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Price_ECO').Value := c;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('PostNo').Value := PostNo;
                                                                                           quInsInD_Control_PriceInInst.ParamByName('Dhead_id').Value := quNaklP.FieldByName('Pkey').Value;
                                                                                           quInsInD_Control_PriceInInst.Execute;
                                                                                           is_Post := True;
                                                                                         end
                                                                                    else begin
                                                                                           is_Post := False;
                                                                                           ShowMessage('Отменено пользователем');

                                                                                         end;

           end;

     quPriceInInst.Close;

     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Open;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Insert;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('article_id').AsInteger := quOstatok1NaklSpecForCreateNaklP.FieldByName('TovarNo').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('qty').AsFloat := quOstatok1NaklSpecForCreateNaklP.FieldByName('Qty').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Price_eco').AsFloat := quOstatok1NaklSpecForCreateNaklP.FieldByName('AvgPriceIn').Value;
     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value := quNaklP.FieldByName('Pkey').Value;

     if is_Post = True then begin
//                              dmDataModule.ExecSQL('insert into l_PriceInInstForNaklP (Dhead_ID,TovarNo,PriceInInst) values (:p1_Dhead_ID,:p2_TovarNo,:p3_PriceInInst)',[TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.FieldByName('Dhead_ID').Value,quOstatok1NaklSpecForCreateNaklP.FieldByName('TovarNo').Value,PriceInInst]);
                              TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Post;
                            end
                       else TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Cancel;

     TMlekoDbDsMSSQLDm(CustomDm).quDSPEC.Close;

     quOstatok1NaklSpecForCreateNaklP.Next;
   end;

  dmDataModule.OpenSQL('select Summa from NaklP where pkey = :p1_Pkey',[quNaklP.FieldByName('Pkey').Value]);
  SummaNaklP := dmDataModule.QFO.FieldByName('Summa').Value;
  ShowMessage('Создана приходная накладная номер :' + quNaklP.FieldByName('NaklNo').AsString );

//////// Создаем расходные накладные

  quNaklR.Open;

  quListAddressPost := TMSQuery.Create(nil);
  quListAddressPost.Connection:= dmDataModule.DB;
  quListAddressPost.SQL.Clear;
  quListAddressPost.SQL.Text:= 'select distinct  Ostatok1NaklNo       '+
                               '               , PostNo               '+
                               '      			   , AddressNo            '+
                               '      			   , SotrudNo             '+
                               '      			   , OtdelNo              '+
                               '      			   , Set_Article_Group_Id '+
                               '      			   , Buh                  '+
                               ' from Ostatok1Nakl                    '+
                               '  where Ostatok1Id = :Ostatok1Id      '+
                               '    and NaklNo is null                ';
  quListAddressPost.Prepare;
  quListAddressPost.ParamByName('Ostatok1Id').Value := lOstatok1_id;
  quListAddressPost.Open;
  quListAddressPost.First;

  while not quListAddressPost.Eof do
   begin

     ShowMessage('Ostatok1NaklNo : '+quListAddressPost.FieldByName('Ostatok1NaklNo').AsString);

     dmDataModule.OpenSQL('select Day_Delay + Day_Delay_Ext as MainDelay from L_POST_SET_ARTGROUP_DELAY where PostNo = :p1_PostNo and Buh = :p2_Buh and SET_ARTICLE_GROUP_ID = :p3_SET_ARTICLE_GROUP_ID',[quListAddressPost.FieldByName('PostNo').Value,quListAddressPost.FieldByName('Buh').Value,quListAddressPost.FieldByName('Set_Article_Group_Id').Value]);
     if not (quNaklR.State in [dsInsert, dsEdit]) then quNaklR.Edit;
     quNaklR.FieldByName('PostNo').AsInteger := quListAddressPost.FieldByName('PostNo').Value;
     quNaklR.FieldByName('PostNoFirst').AsInteger := quListAddressPost.FieldByName('PostNo').Value;
     quNaklR.FieldByName('SotrudNo').AsInteger := quListAddressPost.FieldByName('SotrudNo').Value;
     quNaklR.FieldByName('AddressNo').AsInteger := quListAddressPost.FieldByName('AddressNo').Value;
     quNaklR.FieldByName('OtdelNo').AsInteger := quListAddressPost.FieldByName('OtdelNo').Value;

     quNaklR.FieldByName('VidNaklNo').AsInteger := 1;
     quNaklR.FieldByName('TypeReturnNo').AsInteger := 0;
     quNaklR.FieldByName('Buh').AsInteger := quListAddressPost.FieldByName('Buh').Value;
     quNaklR.FieldByName('SET_ARTICLE_GROUP_ID').Value := quListAddressPost.FieldByName('Set_Article_Group_Id').Value;
     quNaklR.FieldByName('ColnPrice').AsInteger := 9;
     quNaklR.FieldByName('DateOpl').AsDateTime := IncDay(Date(), dmDataModule.QFO.FieldByName('MainDelay').AsInteger);


     dmDataModule.OpenSQL('select c.l_code from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
     CurrencyAccounting := dmDataModule.QFO.FieldByName('l_code').Value;

     dmDataModule.OpenSQL('select ce.Rate from D_CURRENCY c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0');
     RateCurrencyAccounting := dmDataModule.QFO.FieldByName('Rate').Value;

     dmDataModule.OpenSQL('select -1*cast(cast(newid() as binary(16)) as bigint) as new_id ');
     pKey := dmDataModule.QFO.FieldByName('new_id').Value;

     dmDataModule.OpenSQL('Select max(NaklNo)+1 as NaklNo from Naklr');
     if dmDataModule.QFO.FieldByName('NaklNo').IsNull then NewNaklNo := 1
                                                      else NewNaklNo := dmDataModule.QFO.FieldByName('NaklNo').AsInteger;

     dmDataModule.OpenSQL('Select max(Nom)+1 as Nom from Naklr');
     if dmDataModule.QFO.FieldByName('Nom').IsNull then Nom := 1
                                                   else Nom := dmDataModule.QFO.FieldByName('Nom').AsInteger;

     quNaklR.FieldByName('Nom').Value := Nom;
     quNaklR.FieldByName('NomFirst').Value := Nom;
     quNaklR.FieldByName('DateNakl').AsDateTime := Date();
     quNaklR.FieldByName('DateNaklFirst').AsDateTime := Date();
     quNaklR.FieldByName('NaklNo').AsInteger := NewNaklNo;
     quNaklR.FieldByName('pkey').Value := pKey;
     quNaklR.FieldByName('UserNo').Value := data.UserNo;
     quNaklR.FieldByName('description').Value := 'Создано на основании Остаток-1 № '+IntToStr(lOstatok1_id);
     quNaklR.FieldByName('CurrencyHead').Value := CurrencyAccounting;
     quNaklR.FieldByName('CurrencyAccounting').Value := CurrencyAccounting;
     quNaklR.FieldByName('RateCurrencyAccounting').Value := RateCurrencyAccounting;

     quNaklR.Post;

     quSpec.Close;
     quSpec.ParamByName('Ostatok1Id').Value := lOstatok1_id;
     quSpec.ParamByName('Ostatok1NaklNo').Value := quListAddressPost.FieldByName('Ostatok1NaklNo').Value;
     quSpec.Open;

     if quSpec.RecordCount > 0 then begin
                                      quSpec.First;
                                      while not quSpec.Eof do begin
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.Open;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.Insert;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('article_id').AsInteger := quSpecTovarNo.Value;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('qty').AsFloat := quSpecQty.Value;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('Price_eco').AsFloat := quSpecAvgPriceIn.Value;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.FieldByName('dhead_id').Value := pKey;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.Post;
                                                                TMlekoDbDsMSSQLDm(CustomDm).quDspec.Close;

                                                                quSetKolZakItogOstatok1Spec := TMSQuery.Create(nil);
                                                                quSetKolZakItogOstatok1Spec.Connection:= dmDataModule.DB;
                                                                quSetKolZakItogOstatok1Spec.SQL.Clear;
                                                                quSetKolZakItogOstatok1Spec.SQL.Text:= 'declare                                                                                                                             '+
                                                                                                       '    @Qty decimal(18,3)                                                                                                              '+
                                                                                                       ' set @Qty = convert(decimal(18,3),:Qty)                                                                                             '+
                                                                                                       'update Ostatok1Spec                                                                                                                 '+
                                                                                                       ' set  KolZakItog = isnull(KolZakItog,0) + @Qty                                                                                      '+
                                                                                                       '    , KolZakNow = 0                                                                                                                 '+
                                                                                                       '    , OstVirtKol = case when (OstVirtKol = 0 and BegVirtKol<> KolZakItog) then null else BegVirtKol-isnull(KolZakItog,0)-@Qty end   '+
                                                                                                       'where Ostatok1Head_Id = :Ostatok1Id                                                                                                 '+
                                                                                                       '  and TovarNo = :TovarNo                                                                                                            ';
                                                                quSetKolZakItogOstatok1Spec.Prepare;
                                                                quSetKolZakItogOstatok1Spec.ParamByName('Qty').Value := quSpecQty.Value;
                                                                quSetKolZakItogOstatok1Spec.ParamByName('TovarNo').Value := quSpecTovarNo.Value;
                                                                quSetKolZakItogOstatok1Spec.ParamByName('Ostatok1Id').Value := lOstatok1_id;
                                                                quSetKolZakItogOstatok1Spec.Execute;

                                                                quSpec.Next;
                                                              end;
                                      dmDataModule.OpenSQL('select Summa from NaklR where pkey = :p1_Pkey',[pKey]);
                                      SummaNaklR := SummaNaklR + dmDataModule.QFO.FieldByName('Summa').Value;
                                      ListNaklR :=  ListNaklR + #10#13 + IntToStr(NewNaklNo);

                                      quSetNaklNoInOstatok1Nakl := TMSQuery.Create(nil);
                                      quSetNaklNoInOstatok1Nakl.Connection:= dmDataModule.DB;
                                      quSetNaklNoInOstatok1Nakl.SQL.Clear;
                                      quSetNaklNoInOstatok1Nakl.SQL.Text:= 'update  Ostatok1Nakl                                  '+
                                                                           ' set NaklNo = convert(int,:NaklNo)                    '+
                                                                           ' where Ostatok1NaklNo = convert(int,:Ostatok1NaklNo)  '+
                                                                           '   and NaklNo is null                                 '+
                                                                           '   and Ostatok1Id = convert(int,:Ostatok1Id)          ';
                                      quSetNaklNoInOstatok1Nakl.Prepare;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('NaklNo').AsInteger := NewNaklNo;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('Ostatok1NaklNo').AsInteger := quListAddressPost.FieldByName('Ostatok1NaklNo').Value;;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('Ostatok1Id').AsInteger := lOstatok1_id;
                                      quSetNaklNoInOstatok1Nakl.Execute;
                                    end
                               else dmDataModule.ExecSQL('delete NaklR where pkey = :p1_pkey',[pKey]);

{
     if quSpec.RecordCount > 0 then begin
                                      dmDataModule.OpenSQL('select Summa from NaklR where pkey = :p1_Pkey',[pKey]);
                                      SummaNaklR := SummaNaklR + dmDataModule.QFO.FieldByName('Summa').Value;
                                      ListNaklR :=  ListNaklR + #10#13 + IntToStr(NewNaklNo);

                                      quSetNaklNoInOstatok1Nakl := TMSQuery.Create(nil);
                                      quSetNaklNoInOstatok1Nakl.Connection:= dmDataModule.DB;
                                      quSetNaklNoInOstatok1Nakl.SQL.Clear;
                                      quSetNaklNoInOstatok1Nakl.SQL.Text:= 'update  Ostatok1Nakl                                  '+
                                                                           ' set NaklNo = convert(int,:NaklNo)                    '+
                                                                           ' where Ostatok1NaklNo = convert(int,:Ostatok1NaklNo)  '+
                                                                           '   and NaklNo is null                                 '+
                                                                           '   and Ostatok1Id = convert(int,:Ostatok1Id)   	     ';
                                      quSetNaklNoInOstatok1Nakl.Prepare;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('NaklNo').AsInteger := NewNaklNo;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('Ostatok1NaklNo').AsInteger := quListAddressPost.FieldByName('Ostatok1NaklNo').Value;;
                                      quSetNaklNoInOstatok1Nakl.ParamByName('Ostatok1Id').AsInteger := lOstatok1_id;
                                      quSetNaklNoInOstatok1Nakl.Execute;
                                    end;
}




     quListAddressPost.Next;
   end;

   ShowMessage(' Созданы расходные накладные на основе Остаток-1 № '+IntToStr(lOstatok1_id)+ #10#13 +
               'С Номерами: '+ ListNaklR);
   if SummaNaklR <> SummaNaklP then ShowMessage(' Сумма расходных накладных не совпадает с суммой прихлдной накладной!'+ #10#13 +
                                                'Сумма приходной накладной: '+FloatToStr(SummaNaklP)+ #10#13 +
                                                'Сумма Расходных накладных: '+FloatToStr(SummaNaklR));
  quNaklR.Close;



//  MlekoCrossOstatok1Form.Close;

end;

procedure TMlekoCrossOstatok1Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Free;
end;

end.
