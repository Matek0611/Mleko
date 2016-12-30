unit MLKCxListArticle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MLKCxList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, MemDS, VirtualTable, Menus, cxPropertiesStore, dxBar,
  cxClasses, ActnList, cxVGrid, cxDBVGrid, Grids, ValEdit,
  cxInplaceContainer, cxSplitter, DBGrids, citDbGrid, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxFilterControl, 
  cxPC, cxNavigator, cxDBLookupComboBox, StdCtrls;

type
  TMLKCxListArticleFrame = class(TMLKCxListFrame)
    DBCxGridDBTableView1TovarNo: TcxGridDBColumn;
    DBCxGridDBTableView1NameTovar: TcxGridDBColumn;
    DBCxGridDBTableView1NameTovarShort: TcxGridDBColumn;
    DBCxGridDBTableView1EdIzm: TcxGridDBColumn;
    DBCxGridDBTableView1VidNo: TcxGridDBColumn;
    DBCxGridDBTableView1CompanyNo: TcxGridDBColumn;
    DBCxGridDBTableView1KolPerPak: TcxGridDBColumn;
    DBCxGridDBTableView1SrokReal: TcxGridDBColumn;
    DBCxGridDBTableView1Weight: TcxGridDBColumn;
    DBCxGridDBTableView1OtdelNo: TcxGridDBColumn;
    DBCxGridDBTableView1TaraNo: TcxGridDBColumn;
    DBCxGridDBTableView1Visible: TcxGridDBColumn;
    chkWithGroup: TCheckBox;
    procedure chkWithGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Open; override;
  end;

var
  MLKCxListArticleFrame: TMLKCxListArticleFrame;

implementation

uses MlekoDbDsMSSQL;

{$R *.dfm}

{ TMLKCxListArticleFrame }

procedure TMLKCxListArticleFrame.Open;
begin
  inherited;
  If not MLKCustomDm.quCompany.Active then MLKCustomDm.quCompany.Open;
  If not MLKCustomDm.quTipTovara.Active then MLKCustomDm.quTipTovara.Open;
  If not MLKCustomDm.QuVidOtdel.Active then MLKCustomDm.QuVidOtdel.Open;
  If not MLKCustomDm.QuVidTov.Active then MLKCustomDm.QuVidTov.Open;
  If not MLKCustomDm.QuTara.Active then MLKCustomDm.QuTara.Open;
  ShowFilter:=True;
end;

procedure TMLKCxListArticleFrame.chkWithGroupClick(Sender: TObject);
begin
  inherited;
  if chkWithGroup.Checked then MLKCustomDm.quTovar.MacroByName('flt1').Value:=
  ' and not exists (select 1 from L_ARTICLE_GROUP l,d_article_group d where l.ARTICLE_GROUP_ID=d.ID and d.ACTIVE=''Y'' and l.ARTICLE_ID=t.TovarNo and l.ACTIVE=''Y'')'
  else  MLKCustomDm.quTovar.MacroByName('flt1').Value:='';
  ActionViewRefresh.Execute;
end;

end.
