unit MlkPropDbSetArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BCPropDb, DB, ActnList, cxPC, cxControls, StdCtrls, cxContainer,
  cxEdit, cxTextEdit, cxDBEdit, BCFrame, BCContainer, 
  MlkListLinkSetArticleGroup, cxCheckBox, BCCxList;

type
  TMlkPropDbSetArticleGroupDlg = class(TBCPropDbDlg)
    DbEdName: TcxDBTextEdit;
    lbl1: TLabel;
    tsArticleGroup: TcxTabSheet;
    FrmLinkSetArticleGroup: TMlkListLinkSetArticleGroupFrame;
    DBCBActive: TcxDBCheckBox;
    DbEdId: TcxDBTextEdit;
    Label1: TLabel;
  private
  protected
    procedure AfterQueryOpen(DataSet: TDataSet); override;
    { Private declarations }
  public
  end;

var
  MlkPropDbSetArticleGroupDlg: TMlkPropDbSetArticleGroupDlg;

implementation

uses MlekoDbDsMSSQL,BCCommon;

{$R *.dfm}

{ TMlkPropDbSetArticleGroupDlg }


{ TMlkPropDbSetArticleGroupDlg }

procedure TMlkPropDbSetArticleGroupDlg.AfterQueryOpen(DataSet: TDataSet);
begin
  inherited;
  tsArticleGroup.TabVisible:=not (Action in [acAdd]);
  PageControl.ActivePage:=tsMainProp;
end;

initialization
  RegisterClass(TMlkPropDbSetArticleGroupDlg);

finalization
  UnRegisterClass(TMlkPropDbSetArticleGroupDlg);

end.
