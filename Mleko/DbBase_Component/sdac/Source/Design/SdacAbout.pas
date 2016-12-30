
//////////////////////////////////////////////////
//  SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  SDAC About Window
//////////////////////////////////////////////////

{$IFNDEF CLR}

{$I Sdac.inc}

unit SdacAbout;
{$ENDIF}
interface
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, HelpUtils;

type
  TSdacAboutForm = class(TForm)
    OKBtn: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbVersion: TLabel;
    lbIDE: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbMail: TLabel;
    lbWeb: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    lblDBMonitorVer: TLabel;
    lbForum: TLabel;
    Label10: TLabel;
    lbEdition: TLabel;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure lbWebClick(Sender: TObject);
    procedure lbMailClick(Sender: TObject);
    procedure lbWebMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbForumClick(Sender: TObject);
    procedure lbForumMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowAbout;

implementation

uses
  ShellApi, MSDesign, DBMonitorClient;

{$I SdacVer.inc}

{$IFDEF IDE}
{$R *.dfm}
{$ENDIF}
{$IFDEF MSWINDOWS}
{$R SdacAbout.dfm}
{$ENDIF}

procedure ShowAbout;
begin
  with TSdacAboutForm.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TSdacAboutForm.FormShow(Sender: TObject);
var
  IDE: string;
begin
{$IFDEF D3}
  IDE := 'Delphi 3';
{$ENDIF}
{$IFDEF D4}
  IDE := 'Delphi 4';
{$ENDIF}
{$IFDEF D5}
  IDE := 'Delphi 5';
{$ENDIF}
{$IFDEF D6}
  IDE := 'Delphi 6';
{$ENDIF}
{$IFDEF D7}
  IDE := 'Delphi 7';
{$ENDIF}
{$IFDEF D8}
  IDE := 'Delphi 8';
{$ENDIF}
{$IFDEF D9}
  IDE := 'Delphi 2005';
{$ENDIF}
{$IFDEF D10}
  IDE := 'Delphi 2006';
{$ENDIF}
{$IFDEF D11}
  IDE := 'Delphi 2007';
{$ENDIF}
{$IFDEF CB3}
  IDE := 'C++Builder 3';
{$ENDIF}
{$IFDEF CB4}
  IDE := 'C++Builder 4';
{$ENDIF}
{$IFDEF CB5}
  IDE := 'C++Builder 5';
{$ENDIF}
{$IFDEF CB6}
  IDE := 'C++Builder 6';
{$ENDIF}
  lbVersion.Caption := SDACVersion + ' ';
  lbIDE.Caption := ' for ' + IDE;
  lbIDE.Left := lbVersion.Left + lbVersion.Width;


  lblDBMonitorVer.Caption := GetDBMonitorVersion;
end;

procedure TSdacAboutForm.lbWebClick(Sender: TObject);
begin
  OpenUrl('http://www.crlab.com/sdac');
  lbWeb.Font.Color := $FF0000;
end;

procedure TSdacAboutForm.lbMailClick(Sender: TObject);
begin
  MailTo('sdac@crlab.com');
  lbMail.Font.Color := $FF0000;
end;

procedure TSdacAboutForm.lbWebMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbWeb.Font.Color := $4080FF;
end;

procedure TSdacAboutForm.lbMailMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lbMail.Font.Color := $4080FF;
end;

procedure TSdacAboutForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbWeb.Font.Color := $FF0000;
  lbMail.Font.Color := $FF0000;
  lbForum.Font.Color := $FF0000;
end;

procedure TSdacAboutForm.lbForumClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  OpenUrl('http://crlab.com/forums/viewforum.php?f=6');
  lbForum.Font.Color := $FF0000;
{$ENDIF}
end;

procedure TSdacAboutForm.lbForumMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  lbForum.Font.Color := $4080FF;
end;

end.
