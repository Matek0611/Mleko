unit UpdaterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PictCollectionUnit, BUnit, Registry, ActnList, Menus, ExtCtrls, BTypesUnit;


type
  TUpdaterForm = class(TBForm)
    TrayIcon: TTrayIcon;
    ActionList1: TActionList;
    PopupMenu: TPopupMenu;
    Logout: TAction;
    Logout1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure LogoutExecute(Sender: TObject);
  private
    FUpdAppName:string; //  имя приложения, по чью душу было запущено обновление
    FUpdCommand: string;

    FRegistry : TRegistry;
    FUpdateLocalPath: string;
    FWorkDirPath: string;
    FRemoteUrlPath: string;


    FProcessTread: TThread;
    {  Windows сообщение о том, что локальное обновление готово
       будет отправлено всем приложениям которые могут откликнуться на него
       Предполагаемая реакция -  после получения события активация акшиона обновления файлов }
    wm_update_ready: cardinal;
    {  Windows сообщение о том, что пора начинать копировать в локальную папку модули
       программного комплекса
       при этом, в зависимости от типа обновления будет вызван поток копирования в локальную папку
       с дальнейшей отправкой сообщения приложению о том, что пора произвести замену файлов. }
    wm_start_copying: cardinal;

    {  Windows сообщение о запуске замены файлов исполняемого приложения на обновленные
       из локальной папки обновления программного комплекса }
    wm_start_replace: cardinal;

    {  Windows  сообщение о необходимости родительскому приложению завершить работу,
       поскольку будет заменен исполняемый файл }
    wm_app_terminate: cardinal;

    function GetAppMainExe: string;

    procedure UpdateCopyingDone(Sender: TObject);
    procedure UpdateReplaseDone(Sender: TObject);

    function GetAppUpdateURL: string;
    function GetAppUpdateSharedFolder: string;
    function GetAppUpdateType: TAppUpdateType;

  protected
    procedure WndProc(var Message: TMessage); override;
  public
    UpdatedFiles: integer;

    property AppMainExe:string read GetAppMainExe;

    property AppUpdateType: TAppUpdateType read GetAppUpdateType;
    property AppUpdateURL: string read GetAppUpdateURL;
    property AppUpdateSharedFolder: string read GetAppUpdateSharedFolder;

  end;

var
  UpdaterForm: TUpdaterForm;

implementation

uses ShellAPI, SyncroNetworkUnit, SyncroHTTPUnit, SyncroReplaceUnit;

{$R *.dfm}

procedure TUpdaterForm.FormCreate(Sender: TObject);
begin
  inherited;
  try
    if ParamCount < 2
    then raise Exception.Create('TUpdaterForm.FormCreate: Parameters incorrect, use UPDATER COMMAND APPLICATION_NAME ');

    if not ((ParamStr(1) = 'DOWNLOAD') or  (ParamStr(1) = 'REPLACE') or (ParamStr(1) = 'CHECK'))
    then raise Exception.Create('TUpdaterForm.FormCreate: Command incorrect, use ''DOWNLOAD'' or ''REPLACE'' or ''CHECK'' ');

    FUpdCommand:= paramstr(1);
    FUpdAppName := paramstr(2);
    FRegistry := TRegistry.Create;
    FRegistry.RootKey := HKEY_CURRENT_USER;

    Pictures:= TPictCollection.Create(PWideChar(ImageFileName), ImageSizeMenu, ImageSizeButton, ImageSizePanel);
    FillPicts;
    Application.ShowMainForm := False;
    TrayIcon.Icons:= Pictures.ImgMnu;
    TrayIcon.Visible:= true;
    wm_update_ready:= RegisterWindowMessage(PWideChar(FUpdAppName+'UpdateReady'));
    wm_start_copying:= RegisterWindowMessage(PWideChar(FUpdAppName+'StartCopying'));
    wm_start_replace:= RegisterWindowMessage(PWideChar(FUpdAppName+'StartReplace'));
    wm_app_terminate:= RegisterWindowMessage(PWideChar(FUpdAppName+'AppTerminate'));
    FWorkDirPath:= ExtractFilePath(AppMainExe);
    FUpdateLocalPath:= ExtractFilePath(AppMainExe)+'update\';

    case AppUpdateType of
      autUpdateSite: begin
        FRemoteUrlPath:= AppUpdateURL+'\';
      end;
      autUpdateSharedFolder: begin
        FRemoteUrlPath:= AppUpdateSharedFolder+'\';
      end;
    end;



    if ParamStr(1) = 'DOWNLOAD' then
       SendMessage(HWND_BROADCAST, wm_start_copying,0,0)
    else
    if ParamStr(1) = 'REPLACE' then
       SendMessage(HWND_BROADCAST, wm_start_replace,0,0)


  except
    on e:Exception do
    begin
      ShowMessage(e.Message);
      Application.Terminate;
    end;

  end;
end;

function TUpdaterForm.GetAppMainExe: string;
begin
  FRegistry.OpenKey(RegistryRootkey+FUpdAppName+'\Run',true);
  if not FRegistry.ValueExists('AppMainExe') then Result:= ''
  else Result:= FRegistry.ReadString('AppMainExe');
  FRegistry.CloseKey;
end;

function TUpdaterForm.GetAppUpdateSharedFolder: string;
begin
  Registry.OpenKey(RegistryRootkey+FUpdAppName+'\Update',true);
  if not Registry.ValueExists('AppUpdateSharedFolder') then Result:= ExtractFilePath(Application.ExeName)
  else Result:= Registry.ReadString('AppUpdateSharedFolder');
  Registry.CloseKey;
end;

function TUpdaterForm.GetAppUpdateType: TAppUpdateType;
begin
  Registry.OpenKey(RegistryRootkey+FUpdAppName+'\Update',true);
  if not Registry.ValueExists('AppUpdateType') then Result:= TAppUpdateType(0)
  else Result:= TAppUpdateType(Registry.ReadInteger('AppUpdateType'));
  Registry.CloseKey;
end;

function TUpdaterForm.GetAppUpdateURL: string;
begin
  FRegistry.OpenKey(RegistryRootkey+FUpdAppName+'\Update',true);
  if not FRegistry.ValueExists('AppUpdateURL') then Result:= 'istochnik.com.ua/downloads/IContacts.upd'
  else Result:= FRegistry.ReadString('AppUpdateURL');
  FRegistry.CloseKey;
end;

procedure TUpdaterForm.LogoutExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TUpdaterForm.TrayIconClick(Sender: TObject);
var p: TPoint;
begin
  inherited;
  GetCursorPos(p);
  PopupMenu.Popup(p.x,p.y);
end;

procedure TUpdaterForm.UpdateCopyingDone(Sender: TObject);
begin
  if UpdatedFiles > 0 then
  begin
    TrayIcon.BalloonHint:= 'Обновление подготовлено. Файлов - '+inttostr(UpdatedFiles);
    TrayIcon.BalloonTimeout:= 5000;
    TrayIcon.ShowBalloonHint;
    Sleep(5500);
  end;
  SendMessage(HWND_BROADCAST, wm_update_ready,UpdatedFiles,0);
  Application.Terminate;
end;

procedure TUpdaterForm.UpdateReplaseDone(Sender: TObject);
var
 h: hwnd;
begin
  h:= 0;
  if ShellExecute(h, 'open', pWideChar(AppMainExe), pWideChar(''), pWideChar(''), SW_SHOW) < 32
  then
    ShowMessage('Сбой автоматического запуска программы, запустите вручную');
  Application.Terminate;
end;

procedure TUpdaterForm.WndProc(var Message: TMessage);
begin
  if Message.Msg = wm_start_copying  then
  {  запускаем в зависимости от того какой вид обновления выбранный поток копирвоания
   в папку локального обновления }
  begin
    if AppUpdateType = autUpdateSharedFolder then begin
      FProcessTread:= TSyncroNetworkUnit.Create
        (FUpdAppName, FWorkDirPath, FUpdateLocalPath, FRemoteUrlPath);
      FProcessTread.OnTerminate:= UpdateCopyingDone;
    end;

    if AppUpdateType = autUpdateSite then begin
      FProcessTread:= TSyncroHTTPUnit.Create
        (FUpdAppName, FWorkDirPath, FUpdateLocalPath);
      FProcessTread.OnTerminate:= UpdateCopyingDone;
    end;
  end
  else
  if Message.Msg = wm_start_replace  then
  {  запускаем поток замены файлов на обновленные }
  begin
    SendMessage(HWND_BROADCAST, wm_app_terminate,0,0);
    FProcessTread:= TSyncroReplace.Create
      (FUpdAppName, FWorkDirPath, FUpdateLocalPath);
    FProcessTread.OnTerminate:= UpdateReplaseDone;
  end
  else
  inherited WndProc(Message);

end;

end.
