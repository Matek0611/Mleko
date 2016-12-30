unit ListAddressPostForOstatok1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, GridsEh, DBGridEh,
  MemDS, ExtCtrls, StdCtrls;

type
  TListAddressPostForOstatok1Form = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    quListAddressPostForOstatok1: TMSQuery;
    DBGridEh1: TDBGridEh;
    dsListAddressPostForOstatok1: TMSDataSource;
    quListAddressPostForOstatok1PostNo: TIntegerField;
    quListAddressPostForOstatok1Name: TStringField;
    quListAddressPostForOstatok1AddressNo: TIntegerField;
    quListAddressPostForOstatok1Address: TStringField;
    quListAddressPostForOstatok1Active: TBooleanField;
    quListAddressPostForOstatok1SotrudNo: TIntegerField;
    quListAddressPostForOstatok1SotrudName: TStringField;
    quListAddressPostForOstatok1Set_Article_Group_Id: TLargeintField;
    quListAddressPostForOstatok1GroupName: TStringField;
    quListAddressPostForOstatok1OtdelNo: TIntegerField;
    quListAddressPostForOstatok1OtdelName: TStringField;
    Button1: TButton;
    quListAddressPostForOstatok1Buh: TIntegerField;
    quListAddressPostForOstatok1Buh_type_name: TStringField;
    quListAddressPostForOstatok1Kol: TIntegerField;
    btExitOk: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btExitOkClick(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ListAddressPostForOstatok1Form: TListAddressPostForOstatok1Form;

implementation
uses data, PostForRashod0;

{$R *.dfm}

procedure TListAddressPostForOstatok1Form.Button1Click(Sender: TObject);
var
  RetPostForRashod: TRetPostForRashod;
  quInsInListAddressPostForOstatok1 : TMSQuery;
begin
  inherited;
  RetPostForRashod := PostForRashod(Date);
  if RetPostForRashod.PostNo > 0 then Begin
                                        quInsInListAddressPostForOstatok1 :=TMSQuery.Create(nil);
                                        quInsInListAddressPostForOstatok1.Connection:=dmDataModule.DB;
                                        quInsInListAddressPostForOstatok1.SQL.Clear;
                                        quInsInListAddressPostForOstatok1.SQL.Text:='declare '
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
                                                                                   +'set @kol = :Kol '
                                                                                   +'set @Active = :Active '
                                                                                   +'select @cnt = count(*) from ListAddressPostForOstatok1 where PostNo = @PostNo and AddressNo = @AddressNo and SotrudNo = @SotrudNo and OtdelNo = @OtdelNo and Set_Article_Group_Id = @Set_Article_Group_Id and Buh = @Buh '
                                                                                   +'if @cnt = 0 '
                                                                                   +' insert into ListAddressPostForOstatok1 (PostNo, AddressNo, SotrudNo, OtdelNo, Set_Article_Group_Id, Buh, Kol, Active) '
                                                                                   +'                                values (@PostNo,@AddressNo,@SotrudNo,@OtdelNo,@Set_Article_Group_Id,@Buh,@kol,@Active) ';
{
                                                                                   +'if @cnt = 1 '
                                                                                   +' update ListAddressPostForOstatok1 '
                                                                                   +'  set  Kol = @Kol '
                                                                                   +'     , Active = @Active '
                                                                                   +' where PostNo = @PostNo and AddressNo = @AddressNo and SotrudNo = @SotrudNo and OtdelNo = @OtdelNo and Set_Article_Group_Id = @Set_Article_Group_Id and Buh = @Buh';
}                                                                                   
                                        quInsInListAddressPostForOstatok1.ParamByName('PostNo').Value := RetPostForRashod.PostNo;
                                        quInsInListAddressPostForOstatok1.ParamByName('AddressNo').Value := RetPostForRashod.AddressNo;
                                        quInsInListAddressPostForOstatok1.ParamByName('SotrudNo').Value := RetPostForRashod.SotrudNo;
                                        quInsInListAddressPostForOstatok1.ParamByName('OtdelNo').Value := RetPostForRashod.OtdelNo;
                                        quInsInListAddressPostForOstatok1.ParamByName('Set_Article_Group_Id').Value := RetPostForRashod.SET_ARTICLE_GROUP;
                                        quInsInListAddressPostForOstatok1.ParamByName('Buh').Value := RetPostForRashod.Buh;
                                        quInsInListAddressPostForOstatok1.ParamByName('Active').Value := true;
                                        quInsInListAddressPostForOstatok1.Execute;
                                        quInsInListAddressPostForOstatok1.Close;
                                      End;
  quListAddressPostForOstatok1.Refresh;

end;

procedure TListAddressPostForOstatok1Form.DBGridEh1KeyPress(
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

procedure TListAddressPostForOstatok1Form.DBGridEh1TitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quListAddressPostForOstatok1.Close;
  case ACol of
    1:quListAddressPostForOstatok1.MacroByName('_order').Value:='p.Name';
    3:quListAddressPostForOstatok1.MacroByName('_order').Value:='ap.Address';
    5:quListAddressPostForOstatok1.MacroByName('_order').Value:='s.SotrudName';
    7:quListAddressPostForOstatok1.MacroByName('_order').Value:='dsag.NAME';
    9:quListAddressPostForOstatok1.MacroByName('_order').Value:=' dbt.Buh_type_name';
  end;
  quListAddressPostForOstatok1.Open;
end;

procedure TListAddressPostForOstatok1Form.DBGridEh1Exit(Sender: TObject);
begin
  inherited;
  if dsListAddressPostForOstatok1.State in [dsInsert,dsEdit] then quListAddressPostForOstatok1.Post;
end;

procedure TListAddressPostForOstatok1Form.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_RETURN :begin
              SearchString:='';
              Key:=0;
             end;
  VK_INSERT : Button1.Click;
  VK_DELETE : if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then quListAddressPostForOstatok1.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TListAddressPostForOstatok1Form.btExitOkClick(Sender: TObject);
begin
  inherited;
  if dsListAddressPostForOstatok1.State in [dsInsert,dsEdit] then quListAddressPostForOstatok1.Post;
end;

end.
