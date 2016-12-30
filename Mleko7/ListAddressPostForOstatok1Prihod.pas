unit ListAddressPostForOstatok1Prihod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, GridsEh, DBGridEh,
  MemDS, ExtCtrls, StdCtrls;

type
  TListAddressPostForOstatok1PrihodForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    quListAddressPostForOstatok1Prihod: TMSQuery;
    DBGridEh1: TDBGridEh;
    dsListAddressPostForOstatok1Prihod: TMSDataSource;
    quListAddressPostForOstatok1PrihodPostNo: TIntegerField;
    quListAddressPostForOstatok1PrihodName: TStringField;
    quListAddressPostForOstatok1PrihodAddressNo: TIntegerField;
    quListAddressPostForOstatok1PrihodAddress: TStringField;
    quListAddressPostForOstatok1PrihodActive: TBooleanField;
    quListAddressPostForOstatok1PrihodSotrudNo: TIntegerField;
    quListAddressPostForOstatok1PrihodSotrudName: TStringField;
    quListAddressPostForOstatok1PrihodSet_Article_Group_Id: TLargeintField;
    quListAddressPostForOstatok1PrihodGroupName: TStringField;
    quListAddressPostForOstatok1PrihodOtdelNo: TIntegerField;
    quListAddressPostForOstatok1PrihodOtdelName: TStringField;
    Button1: TButton;
    quListAddressPostForOstatok1PrihodBuh: TIntegerField;
    quListAddressPostForOstatok1PrihodBuh_type_name: TStringField;
    btExitOk: TButton;
    spUpdateListAddressPostForOstatok1Prihod: TMSStoredProc;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btExitOkClick(Sender: TObject);
    procedure quListAddressPostForOstatok1PrihodBeforePost(
      DataSet: TDataSet);
    procedure quListAddressPostForOstatok1PrihodAfterPost(
      DataSet: TDataSet);
    procedure DBGridEh1CellClick(Column: TColumnEh);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListAddressPostForOstatok1PrihodForm: TListAddressPostForOstatok1PrihodForm;

implementation
uses data, PostForRashod0;

{$R *.dfm}

procedure TListAddressPostForOstatok1PrihodForm.Button1Click(Sender: TObject);
var
  RetPostForRashod: TRetPostForRashod;
  quInsInListAddressPostForOstatok1Prihod : TMSQuery;
begin
  inherited;
  RetPostForRashod := PostForRashod(Date);
  if RetPostForRashod.PostNo > 0 then Begin
                                        quInsInListAddressPostForOstatok1Prihod :=TMSQuery.Create(nil);
                                        quInsInListAddressPostForOstatok1Prihod.Connection:=dmDataModule.DB;
                                        quInsInListAddressPostForOstatok1Prihod.SQL.Clear;
                                        quInsInListAddressPostForOstatok1Prihod.SQL.Text:='declare '
                                                                                   +'     @cnt int '
                                                                                   +'   , @PostNo int '
                                                                                   +'   , @AddressNo int '
                                                                                   +'   , @SotrudNo int '
                                                                                   +'   , @OtdelNo int '
                                                                                   +'   , @Set_Article_Group_Id bigint '
                                                                                   +'   , @Kol int '
                                                                                   +'   , @Active bit '
                                                                                   +'   , @Buh int '
                                                                                   +'set @PostNo = :PostNo '
                                                                                   +'set @AddressNo = :AddressNo '
                                                                                   +'set @SotrudNo = :SotrudNo '
                                                                                   +'set @OtdelNo = :OtdelNo '
                                                                                   +'set @Set_Article_Group_Id = :Set_Article_Group_Id '
                                                                                   +'set @Buh = :Buh '
                                                                                   +'set @Active = :Active '
                                                                                   +'select @cnt = count(*) from ListAddressPostForOstatok1Prihod where PostNo = @PostNo and AddressNo = @AddressNo and SotrudNo = @SotrudNo and OtdelNo = @OtdelNo and Set_Article_Group_Id = @Set_Article_Group_Id and Buh = @Buh '
                                                                                   +'if @cnt = 0 '
                                                                                   +' insert into ListAddressPostForOstatok1Prihod (PostNo, AddressNo, SotrudNo, OtdelNo, Set_Article_Group_Id, Buh, Active) '
                                                                                   +'                                values (@PostNo,@AddressNo,@SotrudNo,@OtdelNo,@Set_Article_Group_Id,@Buh,@Active) ';

                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('PostNo').Value := RetPostForRashod.PostNo;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('Set_Article_Group_Id').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                        quInsInListAddressPostForOstatok1Prihod.ParamByName('Active').Value := false;
                                        quInsInListAddressPostForOstatok1Prihod.Execute;
                                        quInsInListAddressPostForOstatok1Prihod.Close;
                                      End;
  quListAddressPostForOstatok1Prihod.Refresh;

end;

procedure TListAddressPostForOstatok1PrihodForm.DBGridEh1KeyPress(
  Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
 if DBGridEh1.SelectedIndex <> 10 then
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

procedure TListAddressPostForOstatok1PrihodForm.DBGridEh1TitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quListAddressPostForOstatok1Prihod.Close;
  case ACol of
    1:quListAddressPostForOstatok1Prihod.MacroByName('_order').Value:='p.Name';
    3:quListAddressPostForOstatok1Prihod.MacroByName('_order').Value:='ap.Address';
    5:quListAddressPostForOstatok1Prihod.MacroByName('_order').Value:='s.SotrudName';
    7:quListAddressPostForOstatok1Prihod.MacroByName('_order').Value:='dsag.NAME';
    9:quListAddressPostForOstatok1Prihod.MacroByName('_order').Value:=' dbt.Buh_type_name';
  end;
  quListAddressPostForOstatok1Prihod.Open;
end;

procedure TListAddressPostForOstatok1PrihodForm.DBGridEh1Exit(Sender: TObject);
begin
  inherited;
  if dsListAddressPostForOstatok1Prihod.State in [dsInsert,dsEdit] then quListAddressPostForOstatok1Prihod.Post;
end;

procedure TListAddressPostForOstatok1PrihodForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN :begin
                SearchString:='';
                Key:=0;
               end;
    VK_INSERT : Button1.Click;
    VK_DELETE : if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then quListAddressPostForOstatok1Prihod.Delete;
    VK_DOWN,VK_UP:SearchString:='';
  end;
end;

procedure TListAddressPostForOstatok1PrihodForm.btExitOkClick(Sender: TObject);
begin
  inherited;
  if dsListAddressPostForOstatok1Prihod.State in [dsInsert,dsEdit] then quListAddressPostForOstatok1Prihod.Post;
end;

procedure TListAddressPostForOstatok1PrihodForm.quListAddressPostForOstatok1PrihodBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  dsListAddressPostForOstatok1Prihod.DataSet.DisableControls;
end;

procedure TListAddressPostForOstatok1PrihodForm.quListAddressPostForOstatok1PrihodAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  dsListAddressPostForOstatok1Prihod.DataSet.EnableControls;
end;

procedure TListAddressPostForOstatok1PrihodForm.DBGridEh1CellClick(
  Column: TColumnEh);
var
 Active : boolean;
begin
  if quListAddressPostForOstatok1PrihodActive.Value then Active := false else Active := true;
  spUpdateListAddressPostForOstatok1Prihod.Close;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('PostNo').Value := quListAddressPostForOstatok1PrihodPostNo.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('AddressNo').Value := quListAddressPostForOstatok1PrihodAddressNo.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('SotrudNo').Value := quListAddressPostForOstatok1PrihodSotrudNo.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('OtdelNo').Value := quListAddressPostForOstatok1PrihodOtdelNo.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('Set_Article_Group_Id').Value := quListAddressPostForOstatok1PrihodSet_Article_Group_Id.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('Buh').Value := quListAddressPostForOstatok1PrihodBuh.Value;
  spUpdateListAddressPostForOstatok1Prihod.ParamByName('Active').Value := Active;
  spUpdateListAddressPostForOstatok1Prihod.Execute;
  quListAddressPostForOstatok1Prihod.Refresh;
  DBGridEh1.Refresh;
end;

end.
