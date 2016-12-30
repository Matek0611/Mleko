unit DemoFrame;

interface

uses
  Classes,
{$IFDEF LINUX}
  QControls, QStdCtrls, QGraphics, QForms,
{$ELSE}
  Forms, Windows, Messages, SysUtils, StdCtrls, Graphics, Controls, Dialogs,
  ComCtrls, Buttons, ExtCtrls, DBCtrls,
{$ENDIF}
  DBAccess
  {$IFNDEF VER130}, Variants{$ENDIF}
  ;

type
  TDemoFrame = class(TFrame)
  public
    Connection: TCustomDAConnection;
    procedure Initialize; virtual;
    procedure SetDebug(Value: boolean); virtual;

    procedure AssignConnectionTo(Dest: TCustomDAConnection);
  end;

  TDemoFrameClass = class of TDemoFrame;


implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

procedure TDemoFrame.Initialize;
begin
end;

procedure TDemoFrame.SetDebug(Value: boolean);
begin
end;

procedure TDemoFrame.AssignConnectionTo(Dest: TCustomDAConnection);
begin
  Dest.Assign(Connection);
  Dest.AfterConnect := nil;
  Dest.AfterDisconnect := nil;
end;

end.
