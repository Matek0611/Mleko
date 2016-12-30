unit ExportTovarForScales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, ActnList, DBGridEh, DB, StdCtrls, Mask, DBCtrlsEh,
  DBLookupEh, DBAccess, MSAccess, MemDS;

type
  TExportTovarForScalesForm = class(TMlekoForm)
    spExportTovarForScales: TMSStoredProc;
    quFilterVidTovarForScales: TMSQuery;
    dsFilterVidTovarForScales: TMSDataSource;
    cbDBLookupFilterVidTovar: TDBLookupComboboxEh;
    bExportTovarForScales: TButton;
    isExportSelectedVidTovar: TCheckBox;
    isExportAll: TCheckBox;
    Label1: TLabel;
    quFilterVidTovarForScalesNameGroup: TStringField;
    bSetListVidTovar: TButton;
    procedure bSetListVidTovarClick(Sender: TObject);
    procedure isExportAllClick(Sender: TObject);
    procedure isExportSelectedVidTovarClick(Sender: TObject);
    procedure bExportTovarForScalesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExportTovarForScalesForm: TExportTovarForScalesForm;

implementation

uses data,ListVidTovarForScales,main;

{$R *.dfm}

procedure TExportTovarForScalesForm.bSetListVidTovarClick(Sender: TObject);
begin
  inherited;
  begin
      with TListVidTovarForScalesForm.Create(Application) do
        try
          qu_ListVidTovarForScales.Open;
          ShowModal;
        finally
          qu_ListVidTovarForScales.Close;
          Free;
        end;
  end;
end;

procedure TExportTovarForScalesForm.isExportAllClick(Sender: TObject);
begin
  inherited;
  if isExportAll.Checked = true then begin
                                       isExportSelectedVidTovar.Checked := false;
                                       spExportTovarForScales.ParamByName('Name').Clear;
                                     end;


end;

procedure TExportTovarForScalesForm.isExportSelectedVidTovarClick(
  Sender: TObject);
begin
  inherited;
  if isExportSelectedVidTovar.Checked = true then begin
                                                    isExportAll.Checked := false;
                                                    spExportTovarForScales.ParamByName('Name').Clear;
                                                    spExportTovarForScales.ParamByName('ExportSelectVidTovForScales').Value := 1;
                                                  end;
end;

procedure TExportTovarForScalesForm.bExportTovarForScalesClick(
  Sender: TObject);
begin
  inherited;
  if GlobalOurFirmNo = 490 then if FileExists('\\SIRIUS\ExportTovarForScales\Article.txt') then DeleteFile('\\SIRIUS\ExportTovarForScales\Article.txt');
  if GlobalOurFirmNo = 7419 then if FileExists('\\SIRIUS\ExportTovarForScalesMarket\Article.txt') then DeleteFile('\\SIRIUS\ExportTovarForScalesMarket\Article.txt');
  spExportTovarForScales.Close;

  if isExportAll.Checked then begin
                                spExportTovarForScales.ParamByName('Name').Clear;
                                spExportTovarForScales.ParamByName('ExportSelectVidTovForScales').Value := 0;
                              end;
  if isExportSelectedVidTovar.Checked then begin
                                             spExportTovarForScales.ParamByName('Name').Clear;
                                             spExportTovarForScales.ParamByName('ExportSelectVidTovForScales').Value := 1;
                                           end;
  if not isExportSelectedVidTovar.Checked and not isExportAll.Checked then begin
                                                                             if cbDBLookupFilterVidTovar.Text = '' then begin
                                                                                                                          ShowMessage('Не выбран Вид товара для выгрузки!'+ #10#13 +
                                                                                                                                      'Будет выгружен весь товар!');
                                                                                                                          ActiveControl := cbDBLookupFilterVidTovar;
                                                                                                                        end;
                                                                             spExportTovarForScales.ParamByName('Name').Value := cbDBLookupFilterVidTovar.Text;
                                                                             spExportTovarForScales.ParamByName('ExportSelectVidTovForScales').Value := 0;
                                                                           end;
  spExportTovarForScales.Prepare;
  spExportTovarForScales.ExecProc;

  if GlobalOurFirmNo = 490 then if FileExists('\\SIRIUS\ExportTovarForScales\Article.txt') then ShowMessage('Создан файл \\SIRIUS\ExportTovarForScales\Article.txt')
                                                                                           else ShowMessage('Файл \\SIRIUS\ExportTovarForScales\Article.txt не создан!'+ #10#13 +
                                                                                                            'Обратитесь к системному администратору!');
  if GlobalOurFirmNo = 7419 then if FileExists('\\SIRIUS\ExportTovarForScalesMarket\Article.txt') then ShowMessage('Создан файл \\SIRIUS\ExportTovarForScalesMarket\Article.txt')
                                                                                                  else ShowMessage('Файл \\SIRIUS\ExportTovarForScalesMarket\Article.txt не создан!'+ #10#13 +
                                                                                                                   'Обратитесь к системному администратору!');
  spExportTovarForScales.Close;
end;

end.
