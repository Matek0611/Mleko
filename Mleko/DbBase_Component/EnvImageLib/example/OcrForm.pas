unit OcrForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TOcrResultForm = class(TForm)
    Memo: TMemo;
    BottomPanel: TPanel;
    CloseBtn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowOcrResults( const Results : TStrings );

implementation

{$R *.DFM}

procedure ShowOcrResults( const Results : TStrings );
var
    Form : TOcrResultForm;
begin
    Form := TOcrResultForm.Create(nil);
    try
        Form.Memo.Lines.Assign(Results);
        Form.ShowModal;
    finally
        Form.Free;
    end;
end;

end.
