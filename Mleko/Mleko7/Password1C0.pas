unit Password1C0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MlekoForm,
  Dialogs, ExtCtrls, StdCtrls, DB, DBAccess, MsAccess, MemDS, ActnList;

type
  TfmPassword1C = class(TMlekoForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    quUsers: TMSQuery;
    quUsersid: TStringField;
    quUserscode: TStringField;
    quUsersdescr: TStringField;
    quUsersismark: TStringField;
    quUsersverstamp: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPassword1C: TfmPassword1C;
  function Password1C(var Path1C:string):string;

implementation

uses data;

{$R *.dfm}

function Password1C(var Path1C:string):string;
begin
 Result:='';
 fmPassword1C:=TfmPassword1C.Create(Application);
 try
  //fmPassword1C.quUsers.DatabaseName:=Path1C;
  fmPassword1C.Edit1.Text:='';
  fmPassword1C.quUsers.Open;
  while not fmPassword1C.quUsers.Eof do
   begin
    fmPassword1C.ComboBox1.Items.Add(fmPassword1C.quUsersDESCR.AsString);
    fmPassword1C.quUsers.Next;
   end;
  fmPassword1C.ComboBox1.ItemIndex:=0;
  if fmPassword1C.ShowModal=mrOK then
   Result:=fmPassword1C.ComboBox1.Items.Strings[fmPassword1C.ComboBox1.ItemIndex]+'*'+fmPassword1C.Edit1.Text;
 finally
 fmPassword1C.quUsers.Close;
 fmPassword1C.Free;
 end;
end;

procedure TfmPassword1C.Button1Click(Sender: TObject);
begin
 Close;
 ModalResult:=mrOk;
end;

end.
