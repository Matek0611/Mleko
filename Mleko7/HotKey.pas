unit HotKey;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, ComCtrls, Buttons, Menus, ActnList;

type
  TfmHKey = class(TMlekoForm)
    HotKey1: THotKey;
    BitBtn1: TBitBtn;
    ListView1: TListView;
    Label1: TLabel;
    procedure ListView1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfmHKey.ListView1Click(Sender: TObject);
begin
 with ListView1 do
  if (Assigned(Selected) and (Selected.Caption<>'-')) then
   HotKey1.HotKey:=TextToShortCut(ListView1.Selected.SubItems[0]);
 HotKey1.SetFocus;
end;

procedure TfmHKey.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key <> VK_CONTROL then
  begin
   with ListView1 do
    begin
     Selected.SubItems[0]:=ShortCutToText(HotKey1.HotKey);
     UpdateItems(Selected.Index,Selected.Index);
    end;
 end;
end;

end.
