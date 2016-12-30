unit ControlRestTovarOfDateManufacture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, DB, DBAccess, MSAccess, MemDS, GridsEh,
  DBGridEh, citCtrls, citmask, citDBComboEdit, ExtCtrls, StdCtrls, ComCtrls;

type
  TControlRestTovarOfDateManufactureForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdVidTovar: TcitDBComboEdit;
    quTovarOfDateManufacture: TMSQuery;
    dsTovarOfDateManufacture: TMSDataSource;
    quTovarOfDateManufactureTovarNo: TIntegerField;
    quTovarOfDateManufactureDateBegStart: TDateTimeField;
    quTovarOfDateManufactureKol: TFloatField;
    quTovarOfDateManufactureDateBeg: TDateTimeField;
    quTovarOfDateManufactureDateEnd: TDateTimeField;
    quTovarOfDateManufactureNameTovar2: TStringField;
    quTovarOfDateManufactureSrokReal2: TSmallintField;
    quTovarOfDateManufactureVidName: TStringField;
    dtDateOfManufacture: TDateTimePicker;
    Label1: TLabel;
    EdVidTovarDel: TcitDBComboEdit;
    DBGridEh1: TDBGridEh;
    EdTovar: TcitDBComboEdit;
    DelAll: TButton;
    procedure EdVidTovarSelectOk(Sender: TObject);
    procedure EdVidTovarDelSelectOk(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure EdTovarSelectOk(Sender: TObject);
    procedure DelAllClick(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  ControlRestTovarOfDateManufactureForm: TControlRestTovarOfDateManufactureForm;

implementation

{$R *.dfm}
uses data;

procedure TControlRestTovarOfDateManufactureForm.EdVidTovarSelectOk(
  Sender: TObject);
var
  quListVidTovara : TMSQuery;
  quInsInTovarDateOfManufacture : TMSQuery;
  ListNameVidTov : string;
  Cnt : integer;
begin
  inherited;
  quListVidTovara := TMSQuery.Create(nil);
  quListVidTovara.Connection:= dmDataModule.DB;
  quListVidTovara.SQL.Clear;
  quListVidTovara.SQL.Text := 'select cast(Param_Value as smallint) as VidNo, '+
                              '       (select VidName from VidTov where VidNo = cast(Param_Value as smallint)) as VidName '+
                              ' from e_Session_params '+
                              '  where UserNo = :UserNo '+
                              '    and SPID = :SPID '+
                              '	and owner_name = :owner_name '+
                              '	and param_name = :param_name';
  quListVidTovara.ParamByName('UserNo').Value := data.UserNo;
  quListVidTovara.ParamByName('SPID').Value := dmDataModule.SPID;
  quListVidTovara.ParamByName('owner_name').Value := 'ControlRestTovarOfDateManufacture';
  quListVidTovara.ParamByName('param_name').Value := 'EDVIDTOVAR';
  quListVidTovara.Open;

  quListVidTovara.First;

  while not quListVidTovara.Eof do
    begin

      dmDataModule.OpenSQL('select count(*) as cnt from TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)', [quListVidTovara.FieldByName('VidNo').Value]);

      Cnt := dmDataModule.QFO.FieldByName('cnt').AsInteger;

      if (Cnt > 0)
       then if Application.MessageBox('Вы уверены что хотите пересоздать остатки ?', 'Товар с этим брендом уже существует', MB_YESNO or MB_DEFBUTTON2) = ID_YES
             then begin
                    ListNameVidTov := quListVidTovara.FieldByName('VidName').AsString +' ,' + #10#13;
                    dmDataModule.ExecSQL('delete TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)',[quListVidTovara.FieldByName('VidNo').Value]);
                    dmDataModule.ExecSQL('delete l_DspecForTovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)',[quListVidTovara.FieldByName('VidNo').Value]);
                    quInsInTovarDateOfManufacture := TMSQuery.Create(nil);
                    quInsInTovarDateOfManufacture.Connection:= dmDataModule.DB;
                    quInsInTovarDateOfManufacture.SQL.Clear;
                    quInsInTovarDateOfManufacture.SQL.Text := 'declare '+
                                                              '     @DateBeg smalldatetime '+
                                                              '   , @DateBegStart smalldatetime '+
                                                              '   , @VidNo int '+
                                                              '   , @NaklNoR int '+
                                                              '   , @NaklNoP int '+
                                                              'select @NaklNoR = max(NaklNo) from NaklR '+
                                                              'select @NaklNoP = max(NaklNo) from NaklP '+
                                                              'set @DateBeg = :DateBeg '+
                                                              'set @DateBegStart = :DateBegStart '+
                                                              'set @VidNo = :VidNo '+
                                                              'insert into TovarDateOfManufacture (TovarNo,Kol,DateBeg,DateEnd,DateBegStart,KolFirst,CreateDate,Action,NaklNoR,NaklNoP) '+
                                                              'select  t.TovarNo '+
                                                              '      , isnull(o.Kol,0) as Kol '+
                                                              '      , @DateBeg '+
                                                              '      , dateadd(day,isnull(t.SrokReal,0),@DateBeg) as DateEnd '+
                                                              '      , @DateBegStart '+
                                                              '      , isnull(o.Kol,0) as KolFirst '+
                                                              '      , getdate() '+
                                                              '      , ''C''  '+
                                                              '      , @NaklNoR '+
                                                              '      , @NaklNoP '+
                                                              ' from Tovar t left join '+
                                                              '      Ostatok o on o.TovarNo = t.TovarNo '+
                                                              '  where t.VidNo = @VidNo '+
                                                              '    and t.Visible = 0 ';
                    quInsInTovarDateOfManufacture.ParamByName('DateBeg').Value := dtDateOfManufacture.Date - 2;
                    quInsInTovarDateOfManufacture.ParamByName('DateBegStart').Value := Date();
                    quInsInTovarDateOfManufacture.ParamByName('VidNo').Value := quListVidTovara.FieldByName('VidNo').Value;
                    quInsInTovarDateOfManufacture.Prepare;
                    quInsInTovarDateOfManufacture.Execute;
                  end;
      if (Cnt = 0)
       then begin
              ListNameVidTov := quListVidTovara.FieldByName('VidName').AsString +' ,' + #10#13;
              quInsInTovarDateOfManufacture := TMSQuery.Create(nil);
              quInsInTovarDateOfManufacture.Connection:= dmDataModule.DB;
              quInsInTovarDateOfManufacture.SQL.Clear;
              quInsInTovarDateOfManufacture.SQL.Text := 'declare '+
                                                              '     @DateBeg smalldatetime '+
                                                              '   , @DateBegStart smalldatetime '+
                                                              '   , @VidNo int '+
                                                              '   , @NaklNoR int '+
                                                              '   , @NaklNoP int '+
                                                              'set @DateBeg = :DateBeg '+
                                                              'set @DateBegStart = :DateBegStart '+
                                                              'set @VidNo = :VidNo '+
                                                              'select @NaklNoR = max(NaklNo) from NaklR '+
                                                              'select @NaklNoP = max(NaklNo) from NaklP '+
                                                              'insert into TovarDateOfManufacture (TovarNo,Kol,DateBeg,DateEnd,DateBegStart,KolFirst,CreateDate,Action,NaklNoR,NaklNoP) '+
                                                              'select  t.TovarNo '+
                                                              '      , isnull(o.Kol,0) as Kol '+
                                                              '      , @DateBeg '+
                                                              '      , dateadd(day,isnull(t.SrokReal,0),@DateBeg) as DateEnd '+
                                                              '      , @DateBegStart '+
                                                              '      , isnull(o.Kol,0) as KolFirst  '+
                                                              '      , getdate() '+
                                                              '      , ''C''  '+
                                                              '      , @NaklNoR '+
                                                              '      , @NaklNoP '+
                                                              ' from Tovar t left join '+
                                                              '      Ostatok o on o.TovarNo = t.TovarNo '+
                                                              '  where t.VidNo = @VidNo '+
                                                              '    and t.Visible = 0 ';
              quInsInTovarDateOfManufacture.ParamByName('DateBeg').Value := dtDateOfManufacture.Date - 2;
              quInsInTovarDateOfManufacture.ParamByName('DateBegStart').Value := Date();
              quInsInTovarDateOfManufacture.ParamByName('VidNo').Value := quListVidTovara.FieldByName('VidNo').Value;
              quInsInTovarDateOfManufacture.Prepare;
              quInsInTovarDateOfManufacture.Execute;
            end;
      quListVidTovara.Next;
    end;

  quListVidTovara.First;

  while not quListVidTovara.Eof do
    begin
      dmDataModule.OpenSQL('select count(*) as cnt, TovarNo from TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo) group by TovarNo having count(*) > 1', [quListVidTovara.FieldByName('VidNo').Value]);
      Cnt := dmDataModule.QFO.FieldByName('cnt').AsInteger;

      if (cnt > 1) then  raise Exception.Create(' Остатки по дате созданны не верно!!!'+ #10#13 +
                                                'обратитесь к программисту!!!');
      quListVidTovara.Next;
    end;



  quTovarOfDateManufacture.Close;
  quTovarOfDateManufacture.Open;

  ShowMessage (' Cозданы остатки по брендам: '+ #10#13 + ListNameVidTov);

end;

procedure TControlRestTovarOfDateManufactureForm.EdVidTovarDelSelectOk(
  Sender: TObject);
var
  quListVidTovara : TMSQuery;
  ListNameVidTov : string;
  Message : string;
begin
  inherited;

  quListVidTovara := TMSQuery.Create(nil);
  quListVidTovara.Connection:= dmDataModule.DB;
  quListVidTovara.SQL.Clear;
  quListVidTovara.SQL.Text := 'select cast(Param_Value as smallint) as VidNo, '+
                              '       (select VidName from VidTov where VidNo = cast(Param_Value as smallint)) as VidName '+
                              ' from e_Session_params '+
                              '  where UserNo = :UserNo '+
                              '    and SPID = :SPID '+
                              '	and owner_name = :owner_name '+
                              '	and param_name = :param_name';
  quListVidTovara.ParamByName('UserNo').Value := data.UserNo;
  quListVidTovara.ParamByName('SPID').Value := dmDataModule.SPID;
  quListVidTovara.ParamByName('owner_name').Value := 'ControlRestTovarOfDateManufacture';
  quListVidTovara.ParamByName('param_name').Value := 'EdVidTovarDel';
  quListVidTovara.Open;

  quListVidTovara.First;

  while not quListVidTovara.Eof do
    begin
//      ListNameVidTov := quListVidTovara.FieldByName('VidName').AsString + #10#13;
      dmDataModule.OpenSQL('select count(*) as cnt from TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)', [quListVidTovara.FieldByName('VidNo').Value]);
      
      Message := 'Вы уверены что хотите удалить бренд '+  quListVidTovara.FieldByName('VidName').AsString +' из остатков ?' ;
      if (dmDataModule.QFO.FieldByName('cnt').AsInteger > 0)
       then if Application.MessageBox(PChar(Message), PChar('Удаление бренда с остатка по дате производства'), MB_YESNO or MB_DEFBUTTON2) = ID_YES
             then begin
                    ListNameVidTov := quListVidTovara.FieldByName('VidName').AsString +' ,' + #10#13;
                    dmDataModule.ExecSQL('delete TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)',[quListVidTovara.FieldByName('VidNo').Value]);
                    dmDataModule.ExecSQL('delete l_DspecForTovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = :p1_VidNo)',[quListVidTovara.FieldByName('VidNo').Value]);
                  end;
      quListVidTovara.Next;
    end;

  quTovarOfDateManufacture.Close;
  quTovarOfDateManufacture.Open;    

  ShowMessage (' Бренд(ы) : '+ #10#13 + ListNameVidTov + #10#13 +'Удален(ы)');

end;

procedure TControlRestTovarOfDateManufactureForm.DBGridEh1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_DOWN, VK_UP: SearchString := '';
    VK_DELETE: if Application.MessageBox('Вы уверены ?', 'Удаление', MB_YESNO or MB_DEFBUTTON2) = ID_YES then begin
                                                                                                                dmDataModule.ExecSQL('delete TovarDateOfManufacture where TovarNo = :p1_TovarNo',[quTovarOfDateManufactureTovarNo.Value]);
                                                                                                                dmDataModule.ExecSQL('delete l_DspecForTovarDateOfManufacture where TovarNo = :p1_TovarNo',[quTovarOfDateManufactureTovarNo.Value]);
                                                                                                                quTovarOfDateManufacture.Close;
                                                                                                                quTovarOfDateManufacture.Open;
                                                                                                              end;
  end;
end;

procedure TControlRestTovarOfDateManufactureForm.DBGridEh1KeyPress(
  Sender: TObject; var Key: Char);
var
 Found:boolean;  
begin
  inherited;
  if Key in data.SearchSet then
   begin
     Found:=False;
     SearchString:=SearchString+Key;
     try
      Found:=DBGridEh1.DataSource.DataSet.Locate(DBGridEh1.Columns[DBGridEh1.SelectedIndex].FieldName,AnsiUpperCase(SearchString),[loCaseInsensitive,loPartialKey]);
     except
      SearchString:='';
     end;
     if DBGridEh1.Columns[DBGridEh1.SelectedIndex].Field.DataType=ftString then
      if not Found then SearchString:=Copy(SearchString,1,Length(SearchString)-1);
     Key:=Chr(0);
   end;
end;

procedure TControlRestTovarOfDateManufactureForm.EdTovarSelectOk(
  Sender: TObject);
var
  quListTovara : TMSQuery;
  quInsInTovarDateOfManufacture : TMSQuery;
  ListNameTovar : string;
  Cnt : integer;
begin
  quListTovara := TMSQuery.Create(nil);
  quListTovara.Connection:= dmDataModule.DB;
  quListTovara.SQL.Clear;
  quListTovara.SQL.Text := 'select cast(Param_Value as int) as TovarNo, '+
                           '       (select NameTovar from Tovar where TovarNo = cast(Param_Value as int)) as NameTovar '+
                           ' from e_Session_params '+
                           '  where UserNo = :UserNo '+
                           '    and SPID = :SPID '+
                           '	and owner_name = :owner_name '+
                           '	and param_name = :param_name';
  quListTovara.ParamByName('UserNo').Value := data.UserNo;
  quListTovara.ParamByName('SPID').Value := dmDataModule.SPID;
  quListTovara.ParamByName('owner_name').Value := 'ControlRestTovarOfDateManufacture';
  quListTovara.ParamByName('param_name').Value := 'EDTOVAR';
  quListTovara.Open;

  quListTovara.First;

  while not quListTovara.Eof do
    begin

      dmDataModule.OpenSQL('select count(*) as cnt from TovarDateOfManufacture where TovarNo = :p1_TovarNo', [quListTovara.FieldByName('TovarNo').Value]);

      Cnt := dmDataModule.QFO.FieldByName('cnt').AsInteger;

      if (Cnt > 0)
       then if Application.MessageBox('Вы уверены что хотите пересоздать остатки ?', 'Такой товар уже существует', MB_YESNO or MB_DEFBUTTON2) = ID_YES
             then begin
                    ListNameTovar := quListTovara.FieldByName('NameTovar').AsString +' ,' + #10#13;
                    dmDataModule.ExecSQL('delete TovarDateOfManufacture where TovarNo = :p1_TovarNo)',[quListTovara.FieldByName('TovarNo').Value]);
                    dmDataModule.ExecSQL('delete l_DspecForTovarDateOfManufacture where TovarNo = :p1_TovarNo)',[quListTovara.FieldByName('TovarNo').Value]);
                    quInsInTovarDateOfManufacture := TMSQuery.Create(nil);
                    quInsInTovarDateOfManufacture.Connection:= dmDataModule.DB;
                    quInsInTovarDateOfManufacture.SQL.Clear;
                    quInsInTovarDateOfManufacture.SQL.Text := 'declare '+
                                                              '     @DateBeg smalldatetime '+
                                                              '   , @DateBegStart smalldatetime '+
                                                              '   , @TovarNo int '+
                                                              '   , @NaklNoR int '+
                                                              '   , @NaklNoP int '+
                                                              '   , @VidNo int '+
                                                              'set @DateBeg = :DateBeg '+
                                                              'set @DateBegStart = :DateBegStart '+
                                                              'set @TovarNo = :TovarNo '+
                                                              'select @VidNo = VidNo from Tovar where TovarNo = @TovarNo '+
                                                              'select @NaklNoR = min(NaklNoR) from TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = @VidNo) '+
                                                              'select @NaklNoP = min(NaklNoP) from TovarDateOfManufacture where TovarNo in (select TovarNo from Tovar where VidNo = @VidNo) '+
                                                              'insert into TovarDateOfManufacture (TovarNo,Kol,DateBeg,DateEnd,DateBegStart,KolFirst,CreateDate,Action,NaklNoR,NaklNoP) '+
                                                              'select  t.TovarNo '+
                                                              '      , isnull(o.Kol,0) as Kol '+
                                                              '      , @DateBeg '+
                                                              '      , dateadd(day,isnull(t.SrokReal,0),@DateBeg) as DateEnd '+
                                                              '      , @DateBegStart '+
                                                              '      , isnull(o.Kol,0) as KolFirst '+
                                                              '      , getdate() '+
                                                              '      , ''C''  '+
                                                              '      , @NaklNoR '+
                                                              '      , @NaklNoP '+
                                                              ' from Tovar t left join '+
                                                              '      Ostatok o on o.TovarNo = t.TovarNo '+
                                                              '  where t.TovarNo = @TovarNo '+
                                                              '    and t.Visible = 0 ';
                    quInsInTovarDateOfManufacture.ParamByName('DateBeg').Value := dtDateOfManufacture.Date - 2;
                    quInsInTovarDateOfManufacture.ParamByName('DateBegStart').Value := Date();
                    quInsInTovarDateOfManufacture.ParamByName('TovarNo').Value := quListTovara.FieldByName('TovarNo').Value;
                    quInsInTovarDateOfManufacture.Prepare;
                    quInsInTovarDateOfManufacture.Execute;
                  end;
      if (Cnt = 0)
       then begin
              ListNameTovar := quListTovara.FieldByName('NameTovar').AsString +' ,' + #10#13;
              quInsInTovarDateOfManufacture := TMSQuery.Create(nil);
              quInsInTovarDateOfManufacture.Connection:= dmDataModule.DB;
              quInsInTovarDateOfManufacture.SQL.Clear;
              quInsInTovarDateOfManufacture.SQL.Text := 'declare '+
                                                              '     @DateBeg smalldatetime '+
                                                              '   , @DateBegStart smalldatetime '+
                                                              '   , @TovarNo int '+
                                                              'set @DateBeg = :DateBeg '+
                                                              'set @DateBegStart = :DateBegStart '+
                                                              'set @TovarNo = :TovarNo '+
                                                              'insert into TovarDateOfManufacture (TovarNo,Kol,DateBeg,DateEnd,DateBegStart,KolFirst,CreateDate,Action) '+
                                                              'select  t.TovarNo '+
                                                              '      , isnull(o.Kol,0) as Kol '+
                                                              '      , @DateBeg '+
                                                              '      , dateadd(day,isnull(t.SrokReal,0),@DateBeg) as DateEnd '+
                                                              '      , @DateBegStart '+
                                                              '      , isnull(o.Kol,0) as KolFirst  '+
                                                              '      , getdate() '+
                                                              '      , ''C''  '+
                                                              ' from Tovar t left join '+
                                                              '      Ostatok o on o.TovarNo = t.TovarNo '+
                                                              '  where t.TovarNo = @TovarNo '+
                                                              '    and t.Visible = 0 ';
              quInsInTovarDateOfManufacture.ParamByName('DateBeg').Value := dtDateOfManufacture.Date - 2;
              quInsInTovarDateOfManufacture.ParamByName('DateBegStart').Value := Date();
              quInsInTovarDateOfManufacture.ParamByName('TovarNo').Value := quListTovara.FieldByName('TovarNo').Value;
              quInsInTovarDateOfManufacture.Prepare;
              quInsInTovarDateOfManufacture.Execute;
            end;
      quListTovara.Next;
    end;

  quListTovara.First;

  while not quListTovara.Eof do
    begin
      dmDataModule.OpenSQL('select count(*) as cnt, TovarNo from TovarDateOfManufacture where TovarNo = :p1_TovarNo group by TovarNo having count(*) > 1', [quListTovara.FieldByName('TovarNo').Value]);
      Cnt := dmDataModule.QFO.FieldByName('cnt').AsInteger;

      if (cnt > 1) then  raise Exception.Create(' Остатки по дате созданны не верно!!!'+ #10#13 +
                                                'обратитесь к программисту!!!');
      quListTovara.Next;
    end;



  quTovarOfDateManufacture.Close;
  quTovarOfDateManufacture.Open;

  ShowMessage (' Cозданы остатки по товару: '+ #10#13 + ListNameTovar);


end;

procedure TControlRestTovarOfDateManufactureForm.DelAllClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Вы уверены что хотите удалить все ?', 'Внимание! Удаление!', MB_YESNO or MB_DEFBUTTON2) = ID_YES then
   begin
     dmDataModule.ExecSQL('truncate table TovarDateOfManufacture ');
     dmDataModule.ExecSQL('truncate table l_DspecForTovarDateOfManufacture ');
   end;
end;

end.
