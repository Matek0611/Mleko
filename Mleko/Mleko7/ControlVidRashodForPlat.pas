unit ControlVidRashodForPlat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CFLMLKCustom, ActnList, DB, MemDS, DBAccess, MSAccess, GridsEh,
  DBGridEh, StdCtrls, citCtrls, citmask, citDBComboEdit, ExtCtrls;

type
  TControlVidRashodForPlatForm = class(TCFLMLKCustomForm)
    Panel1: TPanel;
    VidrashodNoPlatP: TcitDBComboEdit;
    gbPlatP: TGroupBox;
    gbPlatR: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    VidrashodNoPlatR: TcitDBComboEdit;
    DBGridEhVidRashPlatP: TDBGridEh;
    DBGridEhVidRashPlatR: TDBGridEh;
    dsVidRashodPlatP: TMSDataSource;
    quVidRashodPlatP: TMSQuery;
    dsVidRashodPlatR: TMSDataSource;
    quVidRashodPlatR: TMSQuery;
    quVidRashodPlatPVidRashNo: TSmallintField;
    quVidRashodPlatPVidRashodName: TStringField;
    quVidRashodPlatPCheckMinus: TBooleanField;
    quVidRashodPlatRVidRashNo: TSmallintField;
    quVidRashodPlatRVidRashodName: TStringField;
    quVidRashodPlatRCheckMinus: TBooleanField;
    spInsInListMinusVidRashPlatPForSite: TMSStoredProc;
    spInsInListMinusVidRashPlatRForSite: TMSStoredProc;
    procedure DBGridEhVidRashPlatPKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEhVidRashPlatPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEhVidRashPlatRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEhVidRashPlatRKeyPress(Sender: TObject; var Key: Char);
    procedure VidrashodNoPlatPSelectOk(Sender: TObject);
    procedure VidrashodNoPlatRSelectOk(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SearchString:string;
  public
    { Public declarations }
  end;

var
  ControlVidRashodForPlatForm: TControlVidRashodForPlatForm;

implementation

{$R *.dfm}

uses data;

procedure TControlVidRashodForPlatForm.DBGridEhVidRashPlatPKeyPress(
  Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
  inherited;
  if (Key in Data.SearchSet) then
   begin
     SearchString:=SearchString+Key;
     Key:=Chr(0);
     Found:=False;
     try
       Found:=DBGridEhVidRashPlatP.DataSource.DataSet.Locate(DBGridEhVidRashPlatP.Columns[DBGridEhVidRashPlatP.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
     except
       SearchString:='';
     end;
     if (not Found) and (DBGridEhVidRashPlatP.Columns[DBGridEhVidRashPlatP.Col].Field.DataType=ftString) then
      SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TControlVidRashodForPlatForm.DBGridEhVidRashPlatPKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quVidRashodPlatP.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TControlVidRashodForPlatForm.DBGridEhVidRashPlatRKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
  VK_RETURN: begin

             end;
  VK_INSERT: begin

             end;
  VK_DELETE:if Application.MessageBox('Вы уверены ?','Удаление',MB_YESNO or MB_DEFBUTTON2)=ID_YES then
             quVidRashodPlatR.Delete;
  VK_DOWN,VK_UP:SearchString:='';
 end;
end;

procedure TControlVidRashodForPlatForm.DBGridEhVidRashPlatRKeyPress(
  Sender: TObject; var Key: Char);
var
 Found:boolean;
begin
  inherited;
  begin
   SearchString:=SearchString+Key;
   Key:=Chr(0);
   Found:=False;
   try
   Found:=DBGridEhVidRashPlatR.DataSource.DataSet.Locate(DBGridEhVidRashPlatR.Columns[DBGridEhVidRashPlatR.Col].FieldName,SearchString,[loPartialKey,loCaseInsensitive]);
   except
   SearchString:='';
   end;
   if (not Found) and (DBGridEhVidRashPlatR.Columns[DBGridEhVidRashPlatR.Col].Field.DataType=ftString) then
    SearchString:=Copy(SearchString,1,length(SearchString)-1);
  end;
end;

procedure TControlVidRashodForPlatForm.VidrashodNoPlatPSelectOk(
  Sender: TObject);
begin
  inherited;
  spInsInListMinusVidRashPlatPForSite.Close;
  spInsInListMinusVidRashPlatPForSite.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidRashPlatPForSite.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidRashPlatPForSite.Execute;
  quVidRashodPlatP.Refresh;
  DBGridEhVidRashPlatP.Refresh;
end;

procedure TControlVidRashodForPlatForm.VidrashodNoPlatRSelectOk(
  Sender: TObject);
begin
  inherited;
  spInsInListMinusVidRashPlatRForSite.Close;
  spInsInListMinusVidRashPlatRForSite.ParamByName('SPID').AsInteger := dmDataModule.SPID;
  spInsInListMinusVidRashPlatRForSite.ParamByName('UserNo').AsInteger := data.UserNo;
  spInsInListMinusVidRashPlatRForSite.Execute;
  quVidRashodPlatR.Refresh;
  DBGridEhVidRashPlatR.Refresh;
end;

procedure TControlVidRashodForPlatForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if quVidRashodPlatR.State in [dsEdit, dsInsert] then quVidRashodPlatR.Post;
  if quVidRashodPlatP.State in [dsEdit, dsInsert] then quVidRashodPlatP.Post;
end;

end.
