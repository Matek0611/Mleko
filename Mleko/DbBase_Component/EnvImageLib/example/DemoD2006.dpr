program DemoD2006;

uses
  Forms,
  DemoForm in 'DemoForm.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Envision Example Program';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
      

