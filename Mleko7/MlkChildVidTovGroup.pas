unit MlkChildVidTovGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCChild, ActnList, BCFrame, BCContainer, 
  cxControls, cxSplitter, ExtCtrls,
  MlkListVidTovGroup, BCCxList;

type
  TMlkChildVidTovGroupForm = class(TBCChildForm)
    pnlGroup: TPanel;
    FrmVidTovGroup: TMlkListVidTovGroupFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkChildVidTovGroupForm: TMlkChildVidTovGroupForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TMlkChildVidTovGroupForm);

finalization
  UnRegisterClass(TMlkChildVidTovGroupForm);

end.
