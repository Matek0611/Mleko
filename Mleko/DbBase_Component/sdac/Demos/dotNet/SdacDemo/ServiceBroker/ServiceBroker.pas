unit ServiceBroker;

interface

uses
{$IFDEF VER6P}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DemoFrame, ExtCtrls, StdCtrls, DB, DBAccess, MSAccess,
  MSServiceBroker, Buttons;

type
  TServiceBrokerFrame = class(TDemoFrame)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    InitiatorServiceBroker: TMSServiceBroker;
    MSConnection2: TMSConnection;
    TargetServiceBroker: TMSServiceBroker;
    Panel3: TPanel;
    Panel4: TPanel;
    meInitiatorLog: TMemo;
    meTargetLog: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    btInitiatorBeginDialog: TSpeedButton;
    btInitiatorEndDialog: TSpeedButton;
    btInitiatorSend: TSpeedButton;
    btInitiatorReceive: TSpeedButton;
    Panel7: TPanel;
    cbInitiatorAsynchNotification: TCheckBox;
    lbInitiatorMessage: TLabel;
    edInitiatorMessage: TEdit;
    edInitiatorWaitTimeout: TEdit;
    lbInitiatorWaitTimeout: TLabel;
    btTargetReceive: TSpeedButton;
    btTargetSend: TSpeedButton;
    Panel8: TPanel;
    cbTargetAsynchNotification: TCheckBox;
    lbTargetMessage: TLabel;
    edTargetMessage: TEdit;
    lbTargetWaitTimeout: TLabel;
    edTargetWaitTimeout: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    procedure btInitiatorBeginDialogClick(Sender: TObject);
    procedure btInitiatorEndDialogClick(Sender: TObject);
    procedure btInitiatorSendClick(Sender: TObject);
    procedure btInitiatorReceiveClick(Sender: TObject);
    procedure cbInitiatorAsynchNotificationClick(Sender: TObject);
    procedure edInitiatorWaitTimeoutChange(Sender: TObject);
    procedure btTargetSendClick(Sender: TObject);
    procedure btTargetReceiveClick(Sender: TObject);
    procedure cbTargetAsynchNotificationClick(Sender: TObject);
    procedure edTargetWaitTimeoutChange(Sender: TObject);
    procedure InitiatorServiceBrokerBeginConversation(Sender: TObject;
      Conversation: TMSConversation);
    procedure InitiatorServiceBrokerEndConversation(Sender: TObject;
      Conversation: TMSConversation; ErrorMessage: String;
      ErrorCode: Integer);
    procedure InitiatorServiceBrokerMessage(Sender: TObject);
    procedure TargetServiceBrokerBeginConversation(Sender: TObject;
      Conversation: TMSConversation);
    procedure TargetServiceBrokerEndConversation(Sender: TObject;
      Conversation: TMSConversation; ErrorMessage: String;
      ErrorCode: Integer);
    procedure TargetServiceBrokerMessage(Sender: TObject);
  private
    FMSConversation: TMSConversation;
  public
    // Demo management
    procedure AssignTargetConnection;
    procedure Initialize; override;
  end;

var
  ServiceBrokerFrame: TServiceBrokerFrame;

implementation

{$IFDEF CLR}
{$R *.nfm}
{$ENDIF}
{$IFDEF WIN32}
{$R *.dfm}
{$ENDIF}

const
  InitiatorServiceName = 'InitiatorService';
  TargetServiceName = 'TargetService';

{ TServiceBrokerFrame }

procedure TServiceBrokerFrame.AssignTargetConnection;
begin
  if Connection.Connected and MSConnection2.Connected then
    Exit;

  if not Connection.Connected then
    Connection.Connect;

  MSConnection2.Disconnect;
  MSConnection2.Assign(Connection);
  MSConnection2.LoginPrompt := False;
  MSConnection2.Connect;

  InitiatorServiceBroker.CreateServerObjects;

  TargetServiceBroker.CreateServerObjects;
end;

procedure TServiceBrokerFrame.btInitiatorBeginDialogClick(Sender: TObject);
begin
  AssignTargetConnection;
  
  FMSConversation := InitiatorServiceBroker.BeginDialog(TargetServiceName, '', False);

  // Demo managment
  btInitiatorEndDialog.Enabled := True;
  btInitiatorBeginDialog.Enabled := False;
end;

procedure TServiceBrokerFrame.btInitiatorEndDialogClick(Sender: TObject);
begin
  FMSConversation.EndConversation;
  FMSConversation := nil;

  // Demo managment
  btInitiatorEndDialog.Enabled := False;
  btInitiatorBeginDialog.Enabled := True;
end;

procedure TServiceBrokerFrame.btInitiatorSendClick(Sender: TObject);
var
  TransmitionStatus: string;
begin
  AssignTargetConnection;
  if FMSConversation <> nil then begin
    FMSConversation.Send(edInitiatorMessage.Text);
    TransmitionStatus := FMSConversation.GetTransmissionStatus;
    if TransmitionStatus <> '' then
      meInitiatorLog.Lines.Add(TransmitionStatus)
    else
      meInitiatorLog.Lines.Add('Message was send successfully');
  end
  else
    raise Exception.Create('No active dialog');
end;

procedure TServiceBrokerFrame.btInitiatorReceiveClick(Sender: TObject);
begin
  AssignTargetConnection;
  if InitiatorServiceBroker.Receive then
    meInitiatorLog.Lines.Add(InitiatorServiceBroker.CurrentMessage.AsString);
end;

procedure TServiceBrokerFrame.cbInitiatorAsynchNotificationClick(Sender: TObject);
begin
  AssignTargetConnection;
  InitiatorServiceBroker.AsyncNotification := cbInitiatorAsynchNotification.Checked;
end;

procedure TServiceBrokerFrame.edInitiatorWaitTimeoutChange(Sender: TObject);
var
  WaitTimeout: integer;
begin
  try
    WaitTimeout := StrToInt(edInitiatorWaitTimeout.Text);
  except
    Exit;
  end;
  InitiatorServiceBroker.WaitTimeout := WaitTimeout;
end;

procedure TServiceBrokerFrame.InitiatorServiceBrokerBeginConversation(
  Sender: TObject; Conversation: TMSConversation);
begin
  meInitiatorLog.Lines.Add('Conversation started');
end;

procedure TServiceBrokerFrame.InitiatorServiceBrokerEndConversation(
  Sender: TObject; Conversation: TMSConversation; ErrorMessage: String;
  ErrorCode: Integer);
begin
  meInitiatorLog.Lines.Add('Conversation finished');
end;

procedure TServiceBrokerFrame.InitiatorServiceBrokerMessage(Sender: TObject);
begin
  if InitiatorServiceBroker.Receive then
    meInitiatorLog.Lines.Add(InitiatorServiceBroker.CurrentMessage.AsString);
end;

procedure TServiceBrokerFrame.btTargetSendClick(Sender: TObject);
var
  TransmitionStatus: string;
  Conversation: TMSConversation;
begin
  AssignTargetConnection;
  if TargetServiceBroker.ConversationCount > 0 then begin
    Conversation := TargetServiceBroker.Conversations[0];
    Conversation.Send(edTargetMessage.Text);
    TransmitionStatus := Conversation.GetTransmissionStatus;
    if TransmitionStatus <> '' then
      meTargetLog.Lines.Add(TransmitionStatus)
    else
      meTargetLog.Lines.Add('Message was send successfully');
  end
  else
    raise Exception.Create('No active dialog');
end;

procedure TServiceBrokerFrame.btTargetReceiveClick(Sender: TObject);
begin
  AssignTargetConnection;
  if TargetServiceBroker.Receive then
    meTargetLog.Lines.Add(TargetServiceBroker.CurrentMessage.AsString);
end;

procedure TServiceBrokerFrame.cbTargetAsynchNotificationClick(Sender: TObject);
begin
  AssignTargetConnection;
  TargetServiceBroker.AsyncNotification := cbTargetAsynchNotification.Checked;
end;

procedure TServiceBrokerFrame.edTargetWaitTimeoutChange(Sender: TObject);
var
  WaitTimeout: integer;
begin
  try
    WaitTimeout := StrToInt(edTargetWaitTimeout.Text);
  except
    Exit;
  end;
  TargetServiceBroker.WaitTimeout := WaitTimeout;
end;

procedure TServiceBrokerFrame.TargetServiceBrokerBeginConversation(
  Sender: TObject; Conversation: TMSConversation);
begin
  meTargetLog.Lines.Add('Conversation started');
end;

procedure TServiceBrokerFrame.TargetServiceBrokerEndConversation(
  Sender: TObject; Conversation: TMSConversation; ErrorMessage: String;
  ErrorCode: Integer);
begin
  meTargetLog.Lines.Add('Conversation finished');
end;

procedure TServiceBrokerFrame.TargetServiceBrokerMessage(Sender: TObject);
begin
  if TargetServiceBroker.Receive then
    if TargetServiceBroker.CurrentMessage.MessageType <> SEndDialogType then
      meTargetLog.Lines.Add(TargetServiceBroker.CurrentMessage.AsString);
end;

// Demo management
procedure TServiceBrokerFrame.Initialize;
begin
  inherited;

  InitiatorServiceBroker.Connection := Connection as TMSConnection;

  InitiatorServiceBroker.Service := InitiatorServiceName;
  TargetServiceBroker.Service := TargetServiceName;

  cbInitiatorAsynchNotification.Checked := InitiatorServiceBroker.AsyncNotification;
  cbTargetAsynchNotification.Checked := TargetServiceBroker.AsyncNotification;

  edInitiatorWaitTimeout.Text := IntToStr(InitiatorServiceBroker.WaitTimeout);
  edTargetWaitTimeout.Text := IntToStr(TargetServiceBroker.WaitTimeout);

  btInitiatorEndDialog.Enabled := False;
end;

end.
