
//////////////////////////////////////////////////
//  MS SQL Server Data Access Components
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  SDAC About Window
//  Created:            24.07.01
//  Last modified:      14.01.02
//////////////////////////////////////////////////

unit SdacAbout;

interface
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
{$IFDEF WIN32}
  Jpeg,
{$ENDIF}
  Buttons, ExtCtrls;
type
  TSdacAboutForm = class(TForm)
    OKBtn: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbMail: TLabel;
    lbWeb: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    lbForum: TLabel;
    procedure lbWebClick(Sender: TObject);
    procedure lbMailClick(Sender: TObject);
    procedure lbWebMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbForumMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbForumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SdacAboutForm: TSdacAboutForm;

procedure ShowAbout;

implementation

uses
  ShellApi;

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
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

procedure TSdacAboutForm.lbWebClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', 'http://www.crlab.com/sdac', '', '', SW_SHOW);
  lbWeb.Font.Color := $FF0000;
{$ENDIF}
end;

procedure TSdacAboutForm.lbMailClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', 'mailto:sdac@crlab.com', 'zxczxc', '', SW_SHOW);
  lbMail.Font.Color := $FF0000;
{$ENDIF}
end;

procedure TSdacAboutForm.lbForumClick(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', 'www.crlab.com/forums/viewforum.php?f=6', '', '', SW_SHOW);
  lbWeb.Font.Color := $FF0000;
{$ENDIF}
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

procedure TSdacAboutForm.lbForumMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  lbForum.Font.Color := $4080FF;
end;

procedure TSdacAboutForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbWeb.Font.Color := $FF0000;
  lbMail.Font.Color := $FF0000;
  lbForum.Font.Color := $FF0000;
end;

end.
