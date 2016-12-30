program Updater;

uses
  Forms,
  UpdaterUnit in 'UpdaterUnit.pas' {UpdaterForm},
  SyncroHTTPUnit in 'SyncroHTTPUnit.pas',
  SyncroNetworkUnit in 'SyncroNetworkUnit.pas',
  SyncroReplaceUnit in 'SyncroReplaceUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'Центр Обновления';
  Application.CreateForm(TUpdaterForm, UpdaterForm);
  Application.Run;
end.
