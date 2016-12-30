unit InheritedConnectForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, MSConnectForm;

type
  TfmInheritedConnect = class(TMSConnectForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInheritedConnect: TfmInheritedConnect;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

initialization
  if GetClass('TfmInheritedConnect') = nil then
    Classes.RegisterClass(TfmInheritedConnect);
end.
