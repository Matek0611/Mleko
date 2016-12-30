unit MlkChildArticle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlkChild, ActnList, BCFrame, BCContainer, BCCxList, MLKCxList,
  MLKCxListArticle, MlkListLinkArticleGroup, cxControls, cxSplitter,
  ExtCtrls, MlkListLinkAGGroup;

type
  TMlkChildArticleForm = class(TMlkChildForm)
    FrmArticle: TMLKCxListArticleFrame;
    pnlArticle: TPanel;
    pnlGroup: TPanel;
    SplGroup: TcxSplitter;
    FrmArticleGroup: TMlkListLinkAGGroupFrame;
  protected

  public

  end;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMlkChildArticleForm }


{ TMlkChildArticleForm }








initialization
  RegisterClass(TMlkChildArticleForm);

finalization
  UnRegisterClass(TMlkChildArticleForm);

end.
