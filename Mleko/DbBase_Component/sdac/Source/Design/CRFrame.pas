
//////////////////////////////////////////////////
//  DB Access Components
//  Copyright © 1998-2005 Core Lab. All right reserved.
//  Base Frame
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Dac.inc}

unit CRFrame;
{$ENDIF}

interface

uses
{$IFDEF MSWINDOWS}
  Controls, ComCtrls,
  Forms,
{$ENDIF}
{$IFDEF LINUX}
  QControls, QForms, QComCtrls,
{$ENDIF}
{$IFDEF DBTOOLS}
  DBToolsClient,
{$ENDIF}
  Classes, CREditor;

type
  TCRFrameClass = class of TCRFrame;

  TCRFrame = class(TFrame)
    procedure FrameEnter(Sender: TObject);
  protected
    FModified: boolean;
    FEditor: TCREditorForm;
    FActivated: boolean; // To avoid duplicate call (for example, on TCRFrame.FrameExit and PageControl.OnChanging events)

    function GetPage: TTabSheet;
    procedure DoActivate; virtual;
    procedure DoFinish; virtual;

  public
    function ActiveControl: TWinControl; virtual; // Return default control for this frame
    procedure Activate;
    procedure Finish;
    procedure ReActivate;

    property Page: TTabSheet read GetPage;
    property Editor: TCREditorForm read FEditor write FEditor;
    property Modified: boolean read FModified write FModified;

  end;

implementation

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R CRFrame.dfm}
{$ENDIF}
{$IFDEF LINUX}
{$R *.xfm}
{$ENDIF}

{ TCRFrame }

function TCRFrame.ActiveControl: TWinControl;
begin
  Result := nil;
end;

function TCRFrame.GetPage: TTabSheet;
begin
  Result := Parent as TTabSheet;
end;

procedure TCRFrame.DoActivate;
begin
end;

procedure TCRFrame.DoFinish;
begin
{$IFDEF DBTOOLS}
  DBTools.CheckDBToolsChanges(Self);
{$ENDIF}
end;

procedure TCRFrame.Activate;
begin
  if not FActivated then
    ReActivate;
end;

procedure TCRFrame.Finish;
begin
  if FActivated then
    DoFinish;
  FActivated := False;
end;

procedure TCRFrame.FrameEnter(Sender: TObject);
begin
  Activate;
end;

procedure TCRFrame.ReActivate;
begin
  DoActivate;
  FActivated := True;
end;

end.
