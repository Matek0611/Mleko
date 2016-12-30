unit PatternPrihodOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MlekoForm, GridsEh, DBGridEh, StdCtrls, ActnList, Buttons,
  ExtCtrls, DB, DBAccess, MSAccess, MemDS;

type
  TPatternPrihodOrderForm = class(TMlekoForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    quListShablonName: TMSQuery;
    dsListShablonName: TMSDataSource;
    Panel1: TPanel;
    bbOK: TBitBtn;
    bbcancel: TBitBtn;
    quListShablonNameNameShablon: TStringField;
    procedure bbOKClick(Sender: TObject);
    procedure bbcancelClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  PatternPrihodOrderForm: TPatternPrihodOrderForm;

implementation

uses data, ShablonName, PatternPrihodOrderSpec;

{$R *.dfm}

procedure TPatternPrihodOrderForm.bbOKClick(Sender: TObject);
begin
  inherited;
  if quListShablonName.State in [dsInsert, dsEdit] then quListShablonName.Post;
end;

procedure TPatternPrihodOrderForm.bbcancelClick(Sender: TObject);
begin
  inherited;
  if quListShablonName.State in [dsInsert, dsEdit] then quListShablonName.Cancel;
end;

procedure TPatternPrihodOrderForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Dlg : TShablonNameForm;
  NameShablon : string;

begin
  inherited;
  case Key of
  VK_RETURN:begin
              with TPatternPrihodOrderSpecForm.Create(Application) do
               try
                 gbPatternSpec.Caption := 'Шаблон ' + quListShablonNameNameShablon.AsString;
                 quPatternSpec.ParamByName('NameShablon').Value := quListShablonNameNameShablon.Value;
                 quPatternSpec.Open;
                 ShowModal;
               finally
                 quPatternSpec.Close;
                 Free;
               end;
            end;
  VK_INSERT:begin
              Dlg := TShablonNameForm.Create(Application);
              try
               if Dlg.ShowModal = mrok Then begin
                                              NameShablon := Dlg.edShablonName.Text;
                                            end;
              finally
               Dlg.Free;
              end;
              if NameShablon <> '' then begin
                                          with TPatternPrihodOrderSpecForm.Create(Application) do
                                           try
                                             gbPatternSpec.Caption := 'Шаблон ' + NameShablon;
                                             quPatternSpec.ParamByName('NameShablon').Value := NameShablon;
                                             quPatternSpec.Open;
                                             ShowModal;
                                           finally
                                             quPatternSpec.Close;
                                             Free;
                                           end;
                                        end;
            end;
  VK_DELETE:if Application.MessageBox('Вы уверены?','Удаление',MB_YESNO)=IDYES then
             begin
               quListShablonName.Delete;
               quListShablonName.Refresh;
             end;
  end;
end;

procedure TPatternPrihodOrderForm.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  with TPatternPrihodOrderSpecForm.Create(Application) do
   try
     gbPatternSpec.Caption := 'Шаблон ' + quListShablonNameNameShablon.AsString;
     quPatternSpec.ParamByName('NameShablon').Value := quListShablonNameNameShablon.Value;
     quPatternSpec.Open;
     ShowModal;
   finally
     quPatternSpec.Close;
     Free;
   end;
end;

end.
