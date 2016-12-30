unit EditCars0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, citCtrls,
  citmask, citDBCtrls, DBAccess, MsAccess, MemDS, ActnList, DBCtrlsEh;

type
  TfmEditCars = class(TMlekoForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    deCarsNo: TDBEdit;
    deCarsName: TDBEdit;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label3: TLabel;
    deCarsDriver: TDBEdit;
    Label4: TLabel;
    deCarsType: TDBEdit;
    Label5: TLabel;
    deCarsNomer: TDBEdit;
    Label6: TLabel;
    deCarsFirma: TDBEdit;
    Label7: TLabel;
    deCarsOKPO: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    EDMol: TcitDBEdit;
    TPost: TMSTable;
    DSPost: TDataSource;
    DBCheckBox2: TDBCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    DBNumberEditEhVolume: TDBNumberEditEh;
    DBNumberEditEhCapacity: TDBNumberEditEh;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    procedure EDMolPushButton(Sender: TObject);
    procedure EDMolExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditCars: TfmEditCars;
  procedure EditCars;

implementation

uses data, EditAccountCash;

{$R *.dfm}


procedure EditCars;
var
  FNativeFilter : string;
begin
 fmEditCars:=TfmEditCars.Create(Application);

 if dmDataModule.quCars.FieldByName('MOLPostNo').IsNull then FNativeFilter := 'PostNo = 0'
                                                        else FNativeFilter := 'PostNo = ' + dmDataModule.quCars.FieldByName('MOLPostNo').AsString;
 fmEditCars.TPost.Filter := FNativeFilter;
 fmEditCars.TPost.Filtered := true;
 fmEditCars.TPost.Open;

 if dmDataModule.quCars.State = dsInsert then begin
                                                fmEditCars.DBCheckBox1.Checked := false;
                                                fmEditCars.DBCheckBox2.Checked := false;
                                                fmEditCars.DBCheckBox3.Checked := false;
                                              end;
 try
  if fmEditCars.ShowModal=mrOk then
   begin
    if fmEditCars.EDMol.Text = '' then begin
                                         ShowMessage ('Не заполнено обязательное поле МОЛ!');
                                         fmEditCars.ActiveControl := fmEditCars.EDMol;
                                         fmEditCars.ShowModal;
                                       end;
    if dmDataModule.quCars.State in [dsEdit,dsInsert] then
     dmDataModule.quCars.Post;
   end
                               else
   begin
    if dmDataModule.quCars.State in [dsEdit,dsInsert] then
     dmDataModule.quCars.Cancel;
   end
{
 except
    fmEditCars.ActiveControl := fmEditCars.EDMol;
 end;
}
 finally
 fmEditCars.TPost.Close;
 fmEditCars.Free;
 end;

end;
//l_postNo:=FEditAccountCash;
procedure TfmEditCars.EDMolPushButton(Sender: TObject);
var l_postNo:integer;
begin
 l_postNo:=FEditAccountCash;
 if not (dmDataModule.quCars.State in [dsEdit,dsInsert]) then dmDataModule.quCars.Edit;
 fmEditCars.TPost.Close;
 fmEditCars.TPost.Filter := 'PostNo = ' + IntToStr(l_postNo);
 fmEditCars.TPost.Open;
 dmDataModule.quCars.FieldByName('MolPostNo').AsInteger:=l_postNo;
end;


procedure TfmEditCars.EDMolExit(Sender: TObject);
begin
  inherited;
  if fmEditCars.EDMol.Text = '' then begin
                                       ShowMessage ('Не заполнено обязательное поле МОЛ!');
                                       fmEditCars.ActiveControl := fmEditCars.EDMol;
                                     end;
end;



end.
