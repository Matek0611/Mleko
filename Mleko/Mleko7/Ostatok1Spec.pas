unit Ostatok1Spec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DB, DBAccess, MSAccess, MemDS, GridsEh,
  DBGridEh, ExtCtrls, StdCtrls, Spin;

type
  TOstatok1SpecForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    quOstatok1Spec: TMSQuery;
    dsOstatok1Spec: TMSDataSource;
    quOstatok1SpecTovarNo: TSmallintField;
    quOstatok1SpecNameTovar: TStringField;
    quOstatok1SpecBegVirtKol: TFloatField;
    quOstatok1SpecAvgPriceIn: TFloatField;
    quOstatok1SpecKolZakUniv: TFloatField;
    quOstatok1SpecSumma: TFloatField;
    quOstatok1SpecKolZakItog: TFloatField;
    quOstatok1SpecOstVirtKol: TFloatField;
    quOstatok1SpecId: TLargeintField;
    btAddAddressPostListForOstatok1NaklR: TButton;
    btCreateOstatok1Nakl: TButton;
    sp_CreateOstatok1Nakl: TMSStoredProc;
    btAddAdderessPostListForCreateNaklP: TButton;
    Button1: TButton;
    CorrectError: TMSQuery;
    Button2: TButton;
    quSetKolZakUniv: TMSQuery;
    procedure quOstatok1SpecAfterPost(DataSet: TDataSet);
    procedure btAddAddressPostListForOstatok1NaklRClick(Sender: TObject);
    procedure btCreateOstatok1NaklClick(Sender: TObject);
    procedure btAddAdderessPostListForCreateNaklPClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  Ostatok1SpecForm: TOstatok1SpecForm;

implementation

uses data, PostForRashod0, ListAddressPostForOstatok1, ListAddressPostForOstatok1Prihod;

{$R *.dfm}

procedure TOstatok1SpecForm.quOstatok1SpecAfterPost(DataSet: TDataSet);
var
 Id : int64;
begin
  inherited;
//  quOstatok1Spec.Refresh;
  Id := quOstatok1SpecId.Value;
  quOstatok1Spec.Close;
  quOstatok1Spec.Open;
  quOstatok1Spec.Locate('Id', Id, []);
  DBGridEh1.Refresh;
end;

procedure TOstatok1SpecForm.btAddAddressPostListForOstatok1NaklRClick(Sender: TObject);
var
  RetPostForRashod: TRetPostForRashod;
  quInsInListAddressPostForOstatok1 : TMSQuery;
begin
  inherited;

// Отключено по просьбе Саши
{
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
                                                                                   +'set @kol = :Kol '
                                                                                   +'set @Active = :Active '
                                                                                   +'set @Buh = :Buh '
                                                                                   +'select @cnt = count(*) from ListAddressPostForOstatok1 where PostNo = @PostNo and AddressNo = @AddressNo and SotrudNo = @SotrudNo and OtdelNo = @OtdelNo and Set_Article_Group_Id = @Set_Article_Group_Id and Buh = @Buh '
                                                                                   +'if @cnt = 0 '
                                                                                   +' insert into ListAddressPostForOstatok1 (PostNo, AddressNo, SotrudNo, OtdelNo, Set_Article_Group_Id, Buh, Kol, Active) '
                                                                                   +'                                 values (@PostNo,@AddressNo,@SotrudNo,@OtdelNo,@Set_Article_Group_Id,@Buh,@kol,@Active) ';
                                                                                   /// Закомментировано
                                                                                   +'if @cnt = 1 '
                                                                                   +' update ListAddressPostForOstatok1 '
                                                                                   +'  set  Kol = @Kol '
                                                                                   +'     , Active = @Active '
                                                                                   +' where PostNo = @PostNo and AddressNo = @AddressNo and SotrudNo = @SotrudNo and OtdelNo = @OtdelNo and Set_Article_Group_Id = @Set_Article_Group_Id and Buh = @Buh';
                                                                                   /////////////////////////////////////////////////
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

}
///////////////////

  with TListAddressPostForOstatok1Form.Create(Application) do
  try
    quListAddressPostForOstatok1Kol.ReadOnly := false;
    quListAddressPostForOstatok1.Open;
    ShowModal;
  finally
    quListAddressPostForOstatok1.Close;
    Free;
  end;
end;

procedure TOstatok1SpecForm.btCreateOstatok1NaklClick(Sender: TObject);
var id : int64;
begin
  inherited;
  sp_CreateOstatok1Nakl.Close;
  sp_CreateOstatok1Nakl.ParamByName('Ostatok1Id').Value := quOstatok1Spec.ParamByName('Ostatok1Head_Id').Value;
  sp_CreateOstatok1Nakl.Execute;

  Id := quOstatok1SpecId.Value;
  quOstatok1Spec.Close;
  quOstatok1Spec.Open;
  quOstatok1Spec.Locate('Id', Id, []);
  DBGridEh1.Refresh;
  ShowMessage('Созданы временные накладные по Остаток-1 № '+quOstatok1Spec.ParamByName('Ostatok1Head_Id').AsString);
end;

procedure TOstatok1SpecForm.btAddAdderessPostListForCreateNaklPClick(
  Sender: TObject);
begin
  inherited;
  with TListAddressPostForOstatok1PrihodForm.Create(Application) do
  try
    quListAddressPostForOstatok1Prihod.Open;
    ShowModal;
  finally
    quListAddressPostForOstatok1Prihod.Close;
    Free;
  end;
end;

procedure TOstatok1SpecForm.Button1Click(Sender: TObject);
var id : int64;
begin
  inherited;
  dmDataModule.ExecSQL('delete Ostatok1Nakl where NaklNo is null and Ostatok1Id = :p1_Ostatok1Id',[quOstatok1Spec.ParamByName('Ostatok1Head_Id').Value]);

  CorrectError.Close;
  CorrectError.ParamByName('id').Value := quOstatok1Spec.ParamByName('Ostatok1Head_Id').Value;
  CorrectError.Execute;

  Id := quOstatok1SpecId.Value;
  quOstatok1Spec.Close;
  quOstatok1Spec.Open;
  quOstatok1Spec.Locate('Id', Id, []);
  DBGridEh1.Refresh;
end;

procedure TOstatok1SpecForm.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
  inherited;
   if DBGridEh1.SelectedIndex <> 4 then
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
    end
end;

procedure TOstatok1SpecForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  quOstatok1Spec.Close;
  case ACol of
    0:quOstatok1Spec.MacroByName('_order').Value:='t.TovarNo';
    1:quOstatok1Spec.MacroByName('_order').Value:='t.NameTovar';
    2:quOstatok1Spec.MacroByName('_order').Value:='os.BegVirtKol';
    3:quOstatok1Spec.MacroByName('_order').Value:='AvgPriceIn';
    4:quOstatok1Spec.MacroByName('_order').Value:='KolZakUniv';
    5:quOstatok1Spec.MacroByName('_order').Value:='Summa';
    6:quOstatok1Spec.MacroByName('_order').Value:='KolZakItog';
    7:quOstatok1Spec.MacroByName('_order').Value:='OstVirtKol';
  end;
  quOstatok1Spec.Open;
end;

procedure TOstatok1SpecForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_RETURN :begin
                SearchString:='';
                Key:=0;
               end;
    VK_DOWN,VK_UP:SearchString:='';
  end;
end;

procedure TOstatok1SpecForm.Button2Click(Sender: TObject);
var id : int64;
begin
  inherited;
  quSetKolZakUniv.Close;
  quSetKolZakUniv.ParamByName('Ostatok1Head_Id').Value := quOstatok1Spec.ParamByName('Ostatok1Head_Id').Value;
  quSetKolZakUniv.Execute;

  Id := quOstatok1SpecId.Value;
  quOstatok1Spec.Close;
  quOstatok1Spec.Open;
  quOstatok1Spec.Locate('Id', Id, []);
  DBGridEh1.Refresh;
end;

end.
