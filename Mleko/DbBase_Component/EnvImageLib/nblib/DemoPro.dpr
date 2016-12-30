program DemoPro;

uses
  Forms,
  EnBarcode in 'EnBarcode.pas',
  EnOCR in 'EnOCR.pas',
  EnProLib in 'EnProLib.pas',
  EnProWin in 'EnProWin.pas' {EnProWinFrame: TFrame},
  EnOCRTraining in 'EnOCRTraining.pas' {EnOCRTrainingForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEnOCRTrainingForm, EnOCRTrainingForm);
  Application.Run;
end.
