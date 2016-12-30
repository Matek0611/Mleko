program CreateDBFForMail;

uses
  Forms,
  NaklRDBFForMail0 in 'NaklRDBFForMail0.pas' {CreateDbfForMail0};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCreateDbfForMail0, CreateDbfForMail0);
  Application.Run;
end.
