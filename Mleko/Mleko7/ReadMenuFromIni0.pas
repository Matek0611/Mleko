unit ReadMenuFromIni0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, MlekoForm, Dialogs,
  Db, DBTables, IniFiles;

type
  TfmReadMenuFromIni = class(TMlekoForm)
    quMenu: TMSQuery;
    quMenuUserNo: TSmallintField;
    quMenuItemName: TStringField;
    quMenuEnabled: TBooleanField;
    quUsers: TMSQuery;
    quUsersUserNo: TIntegerField;
    quUsersCodeAccess: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReadMenuFromIni: TfmReadMenuFromIni;
  procedure ReadMenuFromIni;
implementation

uses main;

{$R *.DFM}
procedure ReadMenuFromIni;
var
 Ini:TIniFile;
 i,j,k:integer;
begin
 fmReadMenuFromIni:=TfmReadMenuFromIni.Create(Application);
 try
 with fmReadMenuFromIni do
  begin
   Ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'menu.ini');
   quUsers.Open;
   while not quUsers.EOF do
    begin
     for i:=0 to fmMain.mmMenu.Items.Count-1 do
      begin
       quMenu.ParamByName('UserNo').AsSmallInt:=quUsersUserNo.AsInteger;
       quMenu.ParamByName('ItemName').AsString:=fmMain.mmMenu.Items[i].Name;
       quMenu.ParamByName('Enabled').AsBoolean:=Ini.ReadBool('User'+Trim(quUsersCodeAccess.AsString),fmMain.mmMenu.Items[i].Name,True);
       quMenu.Execute;
       for j:=0 to fmMain.mmMenu.Items[i].Count-1 do
        begin
         quMenu.ParamByName('UserNo').AsSmallInt:=quUsersUserNo.AsInteger;
         quMenu.ParamByName('ItemName').AsString:=fmMain.mmMenu.Items[i].Items[j].Name;
         quMenu.ParamByName('Enabled').AsBoolean:=Ini.ReadBool('User'+Trim(quUsersCodeAccess.AsString),fmMain.mmMenu.Items[i].Items[j].Name,True);
         quMenu.Execute;
         for k:=0 to fmMain.mmMenu.Items[i].Items[j].Count-1 do
          begin
           quMenu.ParamByName('UserNo').AsSmallInt:=quUsersUserNo.AsInteger;
           quMenu.ParamByName('ItemName').AsString:=fmMain.mmMenu.Items[i].Items[j].Items[k].Name;
           quMenu.ParamByName('Enabled').AsBoolean:=Ini.ReadBool('User'+Trim(quUsersCodeAccess.AsString),fmMain.mmMenu.Items[i].Items[j].Items[k].Name,True);
           quMenu.Execute;
          end;
        end;
      end;
     quUsers.Next;
    end;
  end;
 finally
 fmReadMenuFromIni.quUsers.Close;
 fmReadMenuFromIni.Free;
 end;
end;

end.
