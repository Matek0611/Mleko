unit Password;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  StdCtrls, Buttons, Mask, IniFiles, Db, ExtCtrls,
  ActnList;

type
  TfmPassword = class(TMlekoForm)
    mePassword: TMaskEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Image1: TImage;
    Label2: TLabel;
    EdSelBase: TComboBox;
    ActionList1: TActionList;
    ActionSelectBase: TAction;
    procedure ActionSelectBaseExecSQL(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     ls_Aliases:TStrings;
     ls_AliasNames: TStrings;
  public
    class function GetPassword(var p_Password:String;var p_AliasName:String;var p_ServerSource:String;var p_AdoDataBase:String;var p_FirmNo:Integer):boolean;
  end;

implementation


{$R *.DFM}
class function TfmPassword.GetPassword(var p_Password:String;var p_AliasName:String;var p_ServerSource:String;var p_AdoDataBase:String;var p_FirmNo:Integer):boolean;
var Ini:TIniFile;
 ServerCatalog,DataBase, IniSection,aServSection: String;
begin
 with TfmPassword.Create(Application) do
 begin
   Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
   try
     Result := (ShowModal = mrOk );
     p_Password:=mePassword.Text;
     aServSection:=ls_Aliases[EdSelBase.ItemIndex]; 
     p_AdoDataBase:=Ini.ReadString(aServSection,'AdoDataBase','Mleko');
     p_ServerSource:=Ini.ReadString(aServSection,'ServerSource','Server-1');
     p_AliasName:=Ini.ReadString(aServSection,'AliasName','Mleko');
     p_FirmNo:=StrToInt(Ini.ReadString('Options','LasTOurFirm','1'));
     ini.WriteString('Options','LastAlias',aServSection);
   finally
    Ini.Free;
    Free;
   end;
 end;
end;

procedure TfmPassword.ActionSelectBaseExecSQL(Sender: TObject);
begin
  ActionSelectBase.Checked:= not ActionSelectBase.Checked;
  EdSelBase.Visible:=ActionSelectBase.Checked;
end;

procedure TfmPassword.FormCreate(Sender: TObject);
var Ini:TIniFile;
 defIndex,i,k:Integer;
 Names,lastAlias:String;

begin
 Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'setup.ini');
 EdSelBase.Clear;
 ls_Aliases:=TStringList.Create;
 ls_AliasNames:=TStringList.Create;
 Ini.ReadSectionValues('Aliases',ls_AliasNames);
 LastAlias:=Ini.ReadString('Options','lastAlias','');
 k:=0;
 for i := 0 to ls_AliasNames.Count-1 do
 begin
   if ls_AliasNames.Names[i]=LastAlias then k:=i;
   ls_AliasNames[i]:=ls_AliasNames.ValueFromIndex[i];
 end;
 Ini.ReadSection('Aliases',ls_Aliases);
 EdSelBase.Items.AddStrings(ls_AliasNames);
 EdSelBase.ItemIndex:=k;
 Ini.Free;
end;

end.
