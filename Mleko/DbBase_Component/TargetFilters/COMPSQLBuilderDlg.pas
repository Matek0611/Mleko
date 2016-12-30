unit COMPSQLBuilderDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TSQLDlg = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnEditor: TBitBtn;
    pnlSmallEditors: TPanel;
    GBSelect: TGroupBox;
    MemoSelect: TMemo;
    GBFrom: TGroupBox;
    MemoFrom: TMemo;
    GBOrderBy: TGroupBox;
    MemoOrderBy: TMemo;
    GBGroupBy: TGroupBox;
    MemoGroupBy: TMemo;
    GBWhere: TGroupBox;
    MemoWhere: TMemo;
    GBEditor: TGroupBox;
    SplEditor: TSplitter;
    MmEditor: TMemo;
    btnClipboard: TBitBtn;
    btnEditorHide: TBitBtn;
    btnAbort: TBitBtn;
    procedure btnEditorClick(Sender: TObject);
    procedure pnlSmallEditorsResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoSelectEnter(Sender: TObject);
    procedure MemoSelectChange(Sender: TObject);
    procedure MmEditorChange(Sender: TObject);
    procedure btnClipboardClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MemoSelectKeyPress(Sender: TObject; var Key: Char);
  private
    EditorWidth		: integer;
    EditorMaster	: TMemo;
    LockMode		: boolean;
    SrcWidth		: integer;

    SrcSelect,
    SrcFrom,
    SrcWhere,
    SrcGroupBy,
    SrcOrderBy		: AnsiString;
    procedure ChangeFontStyle(Sender: TMemo; pIsBold: boolean);
  public
  end;

implementation

{$R *.DFM}

uses
  Clipbrd;

function EmptyLine(AStr: AnsiString): boolean;
var	i	: integer;
begin
  Result := False;
  for i := 1 to Length(AStr) do
  begin
    if not (AStr[i] in [' ', #$0A, #$0D]) then Exit;
  end;
  Result := True;
end;

{ TSQLDlg }

procedure TSQLDlg.FormShow(Sender: TObject);
begin
  pnlSmallEditorsResize(Sender);
  GBEditor.Visible := False;
  SplEditor.Visible := False;
  GBEditor.Width := 300;
  SplEditor.Width := 5;
  EditorWidth := 305;
  SrcWidth := Self.Width;
  LockMode := False;
  MemoSelectEnter(MemoSelect);

  SrcSelect := MemoSelect.Lines.Text;
  SrcFrom := MemoFrom.Lines.Text;
  SrcWhere := MemoWhere.Lines.Text;
  SrcGroupBy := MemoGroupBy.Lines.Text;
  SrcOrderBy := MemoOrderBy.Lines.Text;
end;

procedure TSQLDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  IsUpdate	: boolean;
  MR		: integer;
begin
  if ModalResult = mrOk then begin CanClose := True; Exit end;
  if ModalResult = mrAbort then begin CanClose := True; Exit end;
  IsUpdate := SrcSelect <> MemoSelect.Lines.Text;
  IsUpdate := IsUpdate OR (SrcFrom <> MemoFrom.Lines.Text);
  IsUpdate := IsUpdate OR (SrcWhere <> MemoWhere.Lines.Text);
  IsUpdate := IsUpdate OR (SrcGroupBy <> MemoGroupBy.Lines.Text);
  IsUpdate := IsUpdate OR (SrcOrderBy <> MemoOrderBy.Lines.Text);
  CanClose := not IsUpdate;
  if IsUpdate then
  begin
    MR := MessageDlg('Save changes?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    CanClose := MR in [mrYes, mrNo];
    if MR = mrYes then ModalResult := mrOk;
  end;
end;

procedure TSQLDlg.MemoSelectKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then btnCancel.Click;
end;

procedure TSQLDlg.btnEditorClick(Sender: TObject);
var
  Mode  : boolean;
begin
  Mode := SplEditor.Visible;
  if Mode then EditorWidth := GBEditor.Width + SplEditor.Width;
  if not Mode then Self.Width := Self.Width + EditorWidth;
  GBEditor.Visible := not Mode;
  SplEditor.Visible := not Mode;
  if Mode then
  begin
    if SrcWidth > (Self.Width - EditorWidth) then
      EditorWidth := Self.Width - SrcWidth;
    Self.Width := Self.Width - EditorWidth;
  end;
  if Mode and (SplEditor.Left < GBEditor.Left) then SplEditor.Left := GBEditor.Left - 1;
  btnEditor.Visible := Mode;
  btnEditorHide.Visible := not Mode;
  if Screen.DesktopWidth < (Self.Width + Self.Left) then 
  begin
    if Screen.DesktopWidth < Self.Width then Self.Left := 0
    else Self.Left := Screen.DesktopWidth - Self.Width;
  end;
end;

procedure TSQLDlg.pnlSmallEditorsResize(Sender: TObject);
var
  All, One      : integer;
begin
  All := pnlSmallEditors.ClientHeight;
  One := All div 5;
  GBFrom.Height := One;
  GBOrderBy.Height := One;
  GBGroupBy.Height := One;
  GBWhere.Height := One;
end;

procedure TSQLDlg.ChangeFontStyle(Sender: TMemo; pIsBold: boolean);
var
  vFSs	: TFontStyles;
begin
  if not Assigned(Sender) then Exit;

  vFSs := Sender.Font.Style;
  if pIsBold then Include(vFSs, fsBold) else Exclude(vFSs, fsBold);
  Sender.Font.Style := vFSs;

  if not Assigned(Sender.Parent) then Exit;
  if not (Sender.Parent is TGroupBox) then Exit;

  vFSs := TGroupBox(Sender.Parent).Font.Style;
  if pIsBold then Include(vFSs, fsBold) else Exclude(vFSs, fsBold);
  TGroupBox(Sender.Parent).Font.Style := vFSs;
end;

procedure TSQLDlg.MemoSelectEnter(Sender: TObject);
begin
  if LockMode then Exit;
  if not (Sender is TMemo) then Exit;
  ChangeFontStyle(EditorMaster, False);
  EditorMaster := TMemo(Sender);
  ChangeFontStyle(EditorMaster, True);
  GBEditor.Caption := TGroupBox(EditorMaster.Parent).Caption;
  MemoSelectChange(EditorMaster);
end;

procedure TSQLDlg.MemoSelectChange(Sender: TObject);
begin
  if LockMode then Exit;
  if EditorMaster = Sender then
  begin
    LockMode := True;
    MmEditor.Lines.Assign(EditorMaster.Lines);
    LockMode := False;
  end;
end;

procedure TSQLDlg.MmEditorChange(Sender: TObject);
begin
  if LockMode then Exit;
  if EditorMaster <> nil then
  begin
    LockMode := True;
    EditorMaster.Lines.Assign(MmEditor.Lines);
    LockMode := False;
  end;
end;

procedure TSQLDlg.btnClipboardClick(Sender: TObject);
var
  Res		: string;
begin
  Res := 'SELECT ' + MemoSelect.Lines.Text + ' FROM ' + MemoFrom.Lines.Text;
  if not EmptyLine(MemoWhere.Lines.Text) then
    Res := Res + ' WHERE ' + MemoWhere.Lines.Text;
  if not EmptyLine(MemoGroupBy.Lines.Text) then
    Res := Res + ' GROUP BY ' + MemoGroupBy.Lines.Text;
  if not EmptyLine(MemoOrderBy.Lines.Text) then
    Res := Res + ' ORDER BY ' + MemoOrderBy.Lines.Text;
  Clipboard.AsText := Res;
end;

end.
