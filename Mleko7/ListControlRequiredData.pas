unit ListControlRequiredData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, StdCtrls, ExtCtrls, ActnList;

type
  TListControlRequiredDataForm = class(TMlekoForm)
    Panel1: TPanel;
    MemoInfo: TMemo;
    Panel2: TPanel;
    IsRead: TButton;
    IsWrite: TButton;
    MemoListControlRequiredData: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListControlRequiredDataForm: TListControlRequiredDataForm;

implementation

{$R *.dfm}

end.
