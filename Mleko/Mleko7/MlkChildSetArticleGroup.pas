unit MlkChildSetArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCChild, ActnList, BCFrame, BCContainer, 
  MlkListSetArticleGroup, BCCxList;

type
  TMlkChildSetArticleGroupForm = class(TBCChildForm)
    FrmSetArticleGroup: TMlkListSetArticleGroupFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

initialization
  RegisterClass(TMlkChildSetArticleGroupForm);

finalization
  UnRegisterClass(TMlkChildSetArticleGroupForm);

end.
