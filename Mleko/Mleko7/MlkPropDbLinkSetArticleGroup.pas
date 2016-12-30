unit MlkPropDbLinkSetArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCPropDb, DB, ActnList, cxPC, cxControls, StdCtrls;

type
  TMlkPropDbLinkSetArticleGroupDlg = class(TBCPropDbDlg)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlkPropDbLinkSetArticleGroupDlg: TMlkPropDbLinkSetArticleGroupDlg;

implementation

{$R *.dfm}

initialization
  RegisterClass(TMlkPropDbLinkSetArticleGroupDlg);

finalization
  UnRegisterClass(TMlkPropDbLinkSetArticleGroupDlg);

end.
