unit citRichEditDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, citRichEdit, math;

type
  TRichEditDlg = class(TForm)
    lbGroups: TListBox;
    btnAddGroup: TSpeedButton;
    btnDeleteGroup: TSpeedButton;
    Label1: TLabel;
    lbTokens: TListBox;
    Label2: TLabel;
    btnAddToken: TSpeedButton;
    btnDeleteToken: TSpeedButton;
    gbParams: TGroupBox;
    EditLeftComment: TEdit;
    Label3: TLabel;
    EditRightComment: TEdit;
    Label4: TLabel;
    EditComment: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditQuotas: TEdit;
    btnGroupFont: TSpeedButton;
    btnComment: TSpeedButton;
    btnString: TSpeedButton;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnLoad: TBitBtn;
    btnSave: TBitBtn;
    FontDialog: TFontDialog;
    btnEditGroup: TSpeedButton;
    btnEditToken: TSpeedButton;
    btnDefFont: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lbGroupsClick(Sender: TObject);
    procedure lbGroupsKeyPress(Sender: TObject; var Key: Char);
    procedure lbTokensKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddGroupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddTokenClick(Sender: TObject);
    procedure btnDeleteGroupClick(Sender: TObject);
    procedure btnEditGroupClick(Sender: TObject);
    procedure lbGroupsDblClick(Sender: TObject);
    procedure btnGroupFontClick(Sender: TObject);
    procedure btnDefFontClick(Sender: TObject);
    procedure lbTokensClick(Sender: TObject);
    procedure btnDeleteTokenClick(Sender: TObject);
    procedure btnEditTokenClick(Sender: TObject);
    procedure btnCommentClick(Sender: TObject);
    procedure btnStringClick(Sender: TObject);
  private
    procedure UpdateCtrls;
  public
    Component : TcitRichEdit;
    TokenGroups : TTokenGroups;
    CommentFont : TFont;
    StringFont : TFont;
  end;

implementation

{$R *.DFM}

procedure TRichEditDlg.FormCreate(Sender: TObject);
begin
  TokenGroups := TTokenGroups.Create;
  CommentFont := TFont.Create;
  StringFont := TFont.Create;
end;

procedure TRichEditDlg.FormDestroy(Sender: TObject);
begin
  TokenGroups.Free;
  CommentFont.Free;
  StringFont.Free
end;

procedure TRichEditDlg.UpdateCtrls;
begin
  btnEditGroup.Enabled := lbGroups.SelCount = 1;
  btnDeleteGroup.Enabled := lbGroups.SelCount > 0;
  btnGroupFont.Enabled := lbGroups.SelCount > 0;
  lbTokens.Enabled := lbGroups.SelCount = 1;
  btnAddToken.Enabled := lbGroups.SelCount = 1;
  btnDeleteToken.Enabled := (lbGroups.SelCount = 1) and (lbTokens.Items.Count > 0);
  btnEditToken.Enabled := (lbGroups.SelCount = 1) and (lbTokens.Items.Count > 0) and
                          (lbTokens.SelCount = 1);
end;

procedure TRichEditDlg.lbGroupsClick(Sender: TObject);
begin
  with lbGroups do
  if (lbGroups.SelCount = 1) and (ItemIndex > -1) then
  begin
    TokenGroups[Items[ItemIndex]].AssignTo(lbTokens.Items);
    if lbTokens.Items.Count > 0 then lbTokens.Selected[0] := True;
  end
  else
    lbTokens.Clear;
  UpdateCtrls;
end;

procedure TRichEditDlg.lbGroupsKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : btnEditGroup.Click;
    '+' : btnAddGroup.Click;
    '-' : btnDeleteGroup.Click;
  end;
end;

procedure TRichEditDlg.lbTokensKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : btnEditToken.Click;
    '+' : btnAddToken.Click;
    '-' : btnDeleteToken.Click;
  end;
end;

procedure TRichEditDlg.btnAddGroupClick(Sender: TObject);
var
  s : string;
begin
  if InputQuery('TcitRichEdit Editor', 'Enter new token group name', s) then
    if TokenGroups.Add(s) then
    with lbGroups do
    begin
      Items.Add(s);
      Perform(LB_SELITEMRANGE, 0, (Items.Count-1) shl 16);
      Selected[Items.IndexOf(s)] := True;
      UpdateCtrls;
    end
    else MessageDlg('Cannot add new group. Duplicated name', mtError, [mbOK], 0)
end;

procedure TRichEditDlg.FormShow(Sender: TObject);
var
  i : integer;
begin
  TokenGroups.Assign(Component.TokenGroups);
  for i:=0 to TokenGroups.Count-1 do
    lbGroups.Items.Add(TokenGroups.Items[i].GroupName);
  with Component do
  begin
    EditComment.Text := CommentSingleLine;
    EditLeftComment.Text := CommentLeft;
    EditRightComment.Text := CommentRight;
    EditQuotas.Text := QuotationMarks
  end;
  CommentFont.Assign(Component.CommentFont);
  StringFont.Assign(Component.StringFont);

  lbGroups.ItemIndex := 0;
  if lbGroups.Items.Count > 0 then lbGroups.Selected[0] := True;
  lbGroupsClick(Self);
end;

procedure TRichEditDlg.btnAddTokenClick(Sender: TObject);
var
  s : string;
begin
  with lbGroups do
  if InputQuery('TcitRichEdit Editor',
       Format('Enter new token name (to %s group) : ', [Items[ItemIndex]]), s) then
    if TokenGroups[Items[ItemIndex]].Add(s) then
    with lbTokens do
    begin
      Items.Add(s);
      Perform(LB_SELITEMRANGE, 0, (Items.Count-1) shl 16);
      Selected[Items.IndexOf(s)] := True;
    end
    else MessageDlg('Cannot add new group. Duplicated name', mtError, [mbOK], 0)
end;

procedure TRichEditDlg.btnDeleteGroupClick(Sender: TObject);
var
  i, j : integer;
begin
  if MessageDlg('Are you sure to delete token group(s) ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  with lbGroups do
  begin
    j := 0; // Unnesessary !!!!!!!!
    for i:=Items.Count-1 downto 0 do
      if Selected[i] then
      begin
        TokenGroups.Delete(TokenGroups[Items[i]].GroupName);
        Items.Delete(i);
        j := i;
      end;
    try
      Selected[MinIntValue([j, Items.Count-1])] := True
    except end;
    UpdateCtrls;
  end;
end;

procedure TRichEditDlg.btnEditGroupClick(Sender: TObject);
var
  s, tmp : string;
begin
  s := lbGroups.Items[lbGroups.ItemIndex];
  if InputQuery('TcitRichEdit Editor', 'Change token group name', s) then
    with lbGroups do
    if TokenGroups.ChangeName(Items[ItemIndex], s) then
    begin
      Items[ItemIndex] := s;
      tmp := Items.Text;
      Clear;
      Items.Text := tmp;
      Selected[Items.IndexOf(s)] := True;
    end
    else
      MessageDlg('Cannot change token group name', mtError, [mbOK], 0)
end;

procedure TRichEditDlg.lbGroupsDblClick(Sender: TObject);
begin
  btnEditGroup.Click
end;

procedure TRichEditDlg.btnGroupFontClick(Sender: TObject);
var
  i : integer;
begin
  with lbGroups do
  begin
    if SelCount = 1 then FontDialog.Font.Assign(TokenGroups[Items[ItemIndex]].Font)
                    else FontDialog.Font.Assign(TokenGroups.DefaultFont);
    if FontDialog.Execute then
    for i:=0 to Items.Count-1 do
      if Selected[i] then TokenGroups[Items[i]].Font.Assign(FontDialog.Font);
  end;
end;

procedure TRichEditDlg.btnDefFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(TokenGroups.DefaultFont);
  if FontDialog.Execute then TokenGroups.DefaultFont.Assign(FontDialog.Font);
end;

procedure TRichEditDlg.lbTokensClick(Sender: TObject);
begin
  UpdateCtrls;
end;

procedure TRichEditDlg.btnDeleteTokenClick(Sender: TObject);
var
  i, j : integer;
begin
  if MessageDlg('Are you sure to delete selected token(s) ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  with lbTokens do
  begin
    j := 0; // Unnesessary !!!!!!!!
    for i:=Items.Count-1 downto 0 do
      if Selected[i] then
      begin
        TokenGroups[lbGroups.Items[lbGroups.ItemIndex]].Delete(Items[i]);
        Items.Delete(i);
        j := i;
      end;
    try
      Selected[MinIntValue([j, Items.Count-1])] := True
    except end;
    UpdateCtrls;
  end;
end;

procedure TRichEditDlg.btnEditTokenClick(Sender: TObject);
var
  s, tmp : string;
  index : integer;
begin
  s := lbTokens.Items[lbTokens.ItemIndex];
  if InputQuery('TcitRichEdit Editor', 'Change token name', s) then
    with lbTokens do
    if TokenGroups[lbGroups.Items[lbGroups.ItemIndex]].IndexOf(s) < 0 then
    begin
      index := TokenGroups[lbGroups.Items[lbGroups.ItemIndex]].IndexOf(Items[ItemIndex]);
      TokenGroups[lbGroups.Items[lbGroups.ItemIndex]][index] := s;
      Items[ItemIndex] := s;
      tmp := Items.Text;
      Clear;
      Items.Text := tmp;
      Selected[Items.IndexOf(s)] := True;
    end
    else
      MessageDlg('Cannot change token group name', mtError, [mbOK], 0)
end;

procedure TRichEditDlg.btnCommentClick(Sender: TObject);
begin
  FontDialog.Font.Assign(CommentFont);
  if FontDialog.Execute then CommentFont.Assign(FontDialog.Font)
end;

procedure TRichEditDlg.btnStringClick(Sender: TObject);
begin
  FontDialog.Font.Assign(StringFont);
  if FontDialog.Execute then StringFont.Assign(FontDialog.Font)
end;

end.
