unit EditUser0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, ActnList;

type
  TfmEditUser = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    deName: TDBEdit;
    deCodeAccess: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    edPassword: TEdit;
    BitBtn1: TBitBtn;
    dcbPostEdit: TDBCheckBox;
    dcbEditPriceInInst: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditUser: TfmEditUser;

implementation

uses  Users, data, SetupMenu0, main;

{$R *.DFM}

procedure TfmEditUser.bbOkClick(Sender: TObject);
begin
 try
 if not (fmUsers.quUsers.State in [dsEdit,dsInsert]) then
  fmUsers.quUsers.Edit;

 fmUsers.quUsersPassword.AsString:=Coder(edPassword.Text);
 if fmUsers.quUsers.State in [dsEdit,dsInsert] then
  fmUsers.quUsers.Post;

 EditPriceInInst := dcbEditPriceInInst.Checked;
 except
  SysUtils.Beep;
  exit;
 end;
 fmEditUser.Close;
end;

procedure TfmEditUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if fmUsers.quUsers.State in [dsEdit,dsInsert] then
  fmUsers.quUsers.Cancel;
end;

procedure TfmEditUser.FormShow(Sender: TObject);
begin
 edPassword.Text:=Coder(fmUsers.quUsersPassword.AsString);
end;

procedure TfmEditUser.BitBtn1Click(Sender: TObject);
begin
 SetupMenu(fmMain.mmMenu.Items,fmUsers.quUsersUserNo.AsInteger);
end;

end.
