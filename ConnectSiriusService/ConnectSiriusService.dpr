program ConnectSiriusService;

uses
  Forms,
  ConnectSiriusService0 in 'ConnectSiriusService0.pas' {Form1},
  SiriusService in 'SiriusService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
