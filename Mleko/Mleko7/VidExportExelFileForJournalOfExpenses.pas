unit VidExportExelFileForJournalOfExpenses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, DB, DBAccess, MSAccess, MemDS, StdCtrls, Buttons,
  ExtCtrls, GridsEh, DBGridEh, ActnList;

type
  TVidExportExelFileForJournalOfExpensesForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    DBGridEhVidExportExelFile: TDBGridEh;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    quVidExportExelFile: TMSQuery;
    quVidExportExelFileid: TLargeintField;
    quVidExportExelFileColumn_Name: TWideStringField;
    quVidExportExelFileIs_Checked: TBooleanField;
    quVidExportExelFileN_pp: TSmallintField;
    dsVidExportExelFile: TMSDataSource;
    quVidExportExelFileUserNo: TSmallintField;
    procedure quVidExportExelFileBeforePost(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VidExportExelFileForJournalOfExpensesForm: TVidExportExelFileForJournalOfExpensesForm;

implementation

uses data;

{$R *.dfm}

procedure TVidExportExelFileForJournalOfExpensesForm.quVidExportExelFileBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  quVidExportExelFileUserNo.Value := data.UserNo;
end;

procedure TVidExportExelFileForJournalOfExpensesForm.bbOkClick(
  Sender: TObject);
begin
  inherited;
  if quVidExportExelFile.State in [dsInsert,dsEdit] then quVidExportExelFile.Post;
end;

procedure TVidExportExelFileForJournalOfExpensesForm.bbCancelClick(
  Sender: TObject);
begin
  inherited;
  if quVidExportExelFile.State in [dsInsert,dsEdit] then quVidExportExelFile.Cancel;
end;

end.
