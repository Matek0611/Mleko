unit CrossReturnePost0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, ExtCtrls, DB, Variants,
  ActnList;

type
  TfmCrossReturnePost = class(TMlekoForm)
    paTop: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    SearchString: string;
  public
    { Public declarations }
  end;

var
  fmCrossReturnePost: TfmCrossReturnePost;
  function CrossReturnePost(TipReport: integer): string;
implementation
uses CrossReturne0, data;

{$R *.DFM}

function CrossReturnePost(TipReport: integer): string;
var
 i: integer;
begin
 fmCrossReturnePost:=TfmCrossReturnePost.Create(Application);
 try
 if fmCrossReturnePost.ShowModal=mrOk then
  begin
   if fmCrossReturnePost.RxDBGrid1.SelectedRows.Count=0 then
   fmCrossReturnePost.RxDBGrid1.SelectedRows.CurrentRowSelected:=not fmCrossReturnePost.RxDBGrid1.SelectedRows.CurrentRowSelected;

   fmCrossReturnePost.RxDBGrid1.SelectedIndex:=fmCrossReturnePost.RxDBGrid1.SelectedIndex;
   if TipReport=0 then
    begin
     fmCrossReturne.mdCrossPrintNakl.Active:=False;
     fmCrossReturne.mdCrossPrintNakl.Active:=True;
     for i:=0 to fmCrossReturnePost.RxDBGrid1.SelectedRows.Count-1 do
      begin
       fmCrossReturne.qPostR.Bookmark:=fmCrossReturnePost.RxDBGrid1.SelectedRows[i];
       fmCrossReturne.mdCrossSumm.Locate('PostNo; AddressNo', VarArrayOf([fmCrossReturne.qPostRPostNo.AsInteger, fmCrossReturne.qPostRAddressNo.AsInteger]) ,[]);
       fmCrossReturne.mdCrossPrintNakl.Insert;
       fmCrossReturne.mdCrossPrintNaklPostName.AsString:=fmCrossReturne.mdCrossSummPostName.AsString;
       fmCrossReturne.mdCrossPrintNaklAddress.AsString:=fmCrossReturne.mdCrossSummAddress.AsString;
       fmCrossReturne.mdCrossPrintNaklNaklNom.AsString:=fmCrossReturne.mdCrossSummNaklNom.AsString;
       fmCrossReturne.mdCrossPrintNaklSumm.AsFloat:=fmCrossReturne.mdCrossSummSumm.AsFloat;
       fmCrossReturne.mdCrossPrintNaklPostNo.AsInteger:=fmCrossReturne.mdCrossSummPostNo.AsInteger;
       fmCrossReturne.mdCrossPrintNakl.Post;
       fmCrossReturne.mdCrossPrintNakl.Refresh;
      end;
     Result:='0';
    end;
   if TipReport=1 then
    begin
     fmCrossReturne.mdCrossPrintTovar.Active:=False;
     fmCrossReturne.mdCrossPrintTovar.Active:=True;
     for i:=0 to fmCrossReturnePost.RxDBGrid1.SelectedRows.Count-1 do
      begin
       fmCrossReturne.qPostR.Bookmark:=fmCrossReturnePost.RxDBGrid1.SelectedRows[i];
       Result:=Result+'(AddressPost.PostNo ='+IntToStr(fmCrossReturne.qPostRPostNo.AsInteger)+' AND '+'AddressPost.AddressNo ='+IntToStr(fmCrossReturne.qPostRAddressNo.AsInteger)+') OR ';
      end;
     Result:=copy(Result,1,Length(Result)-3);
    end;
  end;
 finally
 fmCrossReturnePost.Free;
 end;
end;

procedure TfmCrossReturnePost.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 case Key of
  VK_DOWN,VK_UP:SearchString:='';
  VK_SPACE:RxDBGrid1.SelectedRows.CurrentRowSelected:=not RxDBGrid1.SelectedRows.CurrentRowSelected;
 end;
end;

procedure TfmCrossReturnePost.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
var
 Found:boolean;
begin
 if (Key in Data.SearchSet) then
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=RxDBGrid1.DataSource.DataSet.Locate(RxDBGrid1.Columns[RxDBGrid1.Col-1].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (RxDBGrid1.Columns[RxDBGrid1.Col-1].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TfmCrossReturnePost.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
 Screen.Cursor:=crHourGlass;
 fmCrossReturne.qPostR.Close;
 case ACol of
  0:fmCrossReturne.qPostR.MacroByName('_order').Value:='Name';
  1:fmCrossReturne.qPostR.MacroByName('_order').Value:='NameLong';
 end;
 fmCrossReturne.qPostR.Open;
 Screen.Cursor:=crDefault;
end;

procedure TfmCrossReturnePost.BitBtn1Click(Sender: TObject);
begin
 RxDBGrid1.SelectAll;
end;

end.
