unit MlkChildPostSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, BCFrame, BCContainer,
  MlkListPostArticleGroupDelayPay, BCCxList, MLKCxList, MLKCxListPost,
  ExtCtrls, cxControls, cxSplitter, MlkListPostArticleGroupPriceType,MlkChild;

type
  TMlkChildPostSetForm = class(TMlkChildForm)
    FrmDelayPay: TMlkListPostArticleGroupDelayPayFrame;
    pnlPost: TPanel;
    FrmPost: TMLKCxListPostFrame;
    SplitterDetails: TcxSplitter;
    pnlDelay: TPanel;
    pnlPrice: TPanel;
    pnlSet: TPanel;
    SplSet: TcxSplitter;
    FrmPriceType: TMlkListPostArticleGroupPriceTypeFrame;
    Panel1: TPanel;
    pnl1: TPanel;
  private
    { Private declarations }
  protected

  end;

var
  MlkChildPostSetForm: TMlkChildPostSetForm;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

initialization
  RegisterClass(TMlkChildPostSetForm);

finalization
  UnRegisterClass(TMlkChildPostSetForm);

end.

