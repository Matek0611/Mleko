unit MlkChildArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCChild, ActnList, BCFrame, BCContainer, 
  cxControls, cxSplitter, ExtCtrls,
  MlkListArticleGroup, BCTree;

type
  TMlkChildArticleGroupForm = class(TBCChildForm)
    pnlGroup: TPanel;
    FrmArticleGroup: TMlkListArticleGroupFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkChildArticleGroupForm: TMlkChildArticleGroupForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TMlkChildArticleGroupForm);

finalization
  UnRegisterClass(TMlkChildArticleGroupForm);

end.
