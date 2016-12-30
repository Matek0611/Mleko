unit MlekoSelectSetArticleGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, MemDS, DBAccess, MSAccess, GridsEh, DBGridEh,
  StdCtrls, ExtCtrls, ActnList;

type
  TMlekoSelectSetArticleGroupForm = class(TMlekoForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TButton;
    BtCancel: TButton;
    DBGridEh1: TDBGridEh;
    dsSetArtGroupDelay: TMSDataSource;
    quSetArtGroupDelay: TMSQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MlekoSelectSetArticleGroupForm: TMlekoSelectSetArticleGroupForm;

implementation
uses data;

{$R *.dfm}

end.
