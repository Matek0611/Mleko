unit EditSotrud0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, ActnList, cxGraphics,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfmEditSotrud = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    deSotrudName: TDBEdit;
    DBLookupComboBox1: TCxDBLookupComboBox;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    cxDBLookupComboBoxSotrudLevelInPepsico: TcxDBLookupComboBox;
    Label1: TLabel;
    deParentSotrudName: TDBEdit;
    Label4: TLabel;
    procedure deParentSotrudNameDblClick(Sender: TObject);
    procedure deParentSotrudNameExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditSotrud: TfmEditSotrud;
  procedure EditSotrud;
implementation

uses data, Sotrud0, VidSotrudInPepsico;

{$R *.DFM}

procedure EditSotrud;
begin
 fmEditSotrud:=TfmEditSotrud.Create(Application);
 try
 if not dmDataModule.quSotrud.Active then dmDataModule.quSotrud.Open;
 if not dmDataModule.quOtdel.Active then dmDataModule.quOtdel.Open;
 if not dmDataModule.quVidSotrudInPepsico.Active then begin
                                                        dmDataModule.quVidSotrudInPepsico.MacroByName('_where').Value:='where Active = 1 ';
                                                        dmDataModule.quVidSotrudInPepsico.Open;
                                                      end
                                                 else begin
                                                        dmDataModule.quVidSotrudInPepsico.Close;
                                                        dmDataModule.quVidSotrudInPepsico.MacroByName('_where').Value:='where Active = 1 ';
                                                        dmDataModule.quVidSotrudInPepsico.Open;
                                                      end;
 if fmEditSotrud.ShowModal=mrOk then
  begin
   if dmDataModule.quSotrud.State in [dsEdit,dsInsert] then
    dmDataModule.quSotrud.Post;
  end
 else
  begin
   if dmDataModule.quSotrud.State in [dsEdit,dsInsert] then
    dmDataModule.quSotrud.Cancel;
  end
 finally
 fmEditSotrud.Free;
 end;

end;


procedure TfmEditSotrud.deParentSotrudNameDblClick(Sender: TObject);
var
  Dlg : TVidSotrudInPepsicoForm;
  Dlg1 : TfmSotrud;
  VidSotrudInPepsico : integer;
  SotrudNo, ParentSotrudNo, SotrudOtdel : integer;
  quSotrudState, SotrudName, SotrudLevelInPepsico : string;
  Visible  : boolean;
begin
  inherited;

  SotrudNo := dmDataModule.quSotrudSotrudNo.Value;
  SotrudName := dmDataModule.quSotrudSotrudName.Value;
  SotrudOtdel := dmDataModule.quSotrudSotrudOtdel.Value;
  Visible := dmDataModule.quSotrudVisible.Value;
  SotrudLevelInPepsico := dmDataModule.quSotrudSotrudLevelInPepsico.Value;

  if deSotrudName.Text = '' then dmDataModule.quSotrud.Insert
                            else dmDataModule.quSotrud.Edit;

  VidSotrudInPepsico := VidSotrudInPepsi(true);

  if dmDataModule.quSotrud.State = dsEdit then quSotrudState := 'Edit';
  if dmDataModule.quSotrud.State = dsInsert then quSotrudState := 'Insert';

//  Showmessage (quSotrudState);

  dmDataModule.OpenSQL('select Level from VidSotrudInPepsico where id = :p1_VidSotrudInPepsico',[VidSotrudInPepsico]);

  ParentSotrudNo := SotrudLevel(false, dmDataModule.QFO.FieldByName('Level').AsString);

  dmDataModule.quSotrud.Open;

  if quSotrudState = 'Edit' then dmDataModule.quSotrud.Edit else dmDataModule.quSotrud.Insert;

  dmDataModule.quSotrudSotrudNo.Value := SotrudNo;
  dmDataModule.quSotrudSotrudName.Value := SotrudName;
  dmDataModule.quSotrudSotrudOtdel.Value := SotrudOtdel;
  dmDataModule.quSotrudVisible.Value := Visible;
  dmDataModule.quSotrudSotrudLevelInPepsico.Value := SotrudLevelInPepsico;
  dmDataModule.quSotrudParentSotrudNo.Value := ParentSotrudNo;

  dmDataModule.OpenSQL('select SotrudName from Sotrud where SotrudNo = :p1_SotrudNo',[ParentSotrudNo]);

  deParentSotrudName.Text := dmDataModule.QFO.FieldByName('SotrudName').AsString;

//  Showmessage(IntToStr(VidSotrudInPepsico));

end;


procedure TfmEditSotrud.deParentSotrudNameExit(Sender: TObject);
begin
  inherited;
  if deParentSotrudName.Text = '' then dmDataModule.quSotrudParentSotrudNo.Clear;
end;

end.
