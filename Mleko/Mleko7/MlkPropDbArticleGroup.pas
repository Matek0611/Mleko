unit MlkPropDbArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCPropDb, DB, ActnList, cxPC, cxControls, StdCtrls, BCFrame,
  BCContainer, MlkListLinkArticleGroup,
  cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxGraphics, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, BCCxList, MLKCxList, MlkListLinkAGArticle,
  ExtCtrls;

type
  TMlkPropDbArticleGroupDlg = class(TBCPropDbDlg)
    tsListArticle: TcxTabSheet;
    DbEdName: TcxDBTextEdit;
    DbEdCode: TcxDBTextEdit;
    LBName: TcxLabel;
    LBCode: TcxLabel;
    DBCBActive: TcxDBCheckBox;
    DBCBCanDelay: TcxDBCheckBox;
    DBCBCanPrice: TcxDBCheckBox;
    FrmArticle: TMlkListLinkAGArticleFrame;
    cbbParent: TcxDBLookupComboBox;
    LBParent: TcxLabel;
    DbEdId: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    Panel1: TPanel;
  private
  protected
    { Private declarations }
  public
    procedure  OnSetModule; override;
    { Public declarations }
  end;

var
  MlkPropDbArticleGroupDlg: TMlkPropDbArticleGroupDlg;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}


procedure TMlkPropDbArticleGroupDlg.OnSetModule;
begin
  DataModuleClassName := 'TMlekoDbDsMSSQLDm';
  ResourceModuleClassName := 'TMlekoResDm';
  inherited;
  if not TMlekoDbDsMSSQLDm(CustomDM).QuArticleGroupForSelect.Active then TMlekoDbDsMSSQLDm(CustomDM).QuArticleGroupForSelect.Open;  
end;

initialization
  RegisterClass(TMlkPropDbArticleGroupDlg);

finalization
  UnRegisterClass(TMlkPropDbArticleGroupDlg);

end.
