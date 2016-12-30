unit GetNaklNo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfmGetNaklNo = class(TMlekoForm)
    Label2: TLabel;
    Bevel1: TBevel;
    edNaklNo: TEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGetNaklNo: TfmGetNaklNo;

implementation

{$R *.DFM}

procedure TfmGetNaklNo.bbCancelClick(Sender: TObject);
begin
 edNaklNo.Text:='-1';
 Close;
end;

procedure TfmGetNaklNo.bbOkClick(Sender: TObject);
begin
 try
  StrToInt(edNaklNo.Text);
  Close;
 except
  edNaklNo.Text:='';
  ActiveControl:=edNaklNo;
 end;
end;

end.
