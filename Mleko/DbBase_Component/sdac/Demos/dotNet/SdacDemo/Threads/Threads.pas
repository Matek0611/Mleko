unit Threads;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, MemDS, DBCtrls, ActiveX,
  Grids, DBGrids, DBAccess, MSAccess, SdacVcl,
  Buttons, ThreadsData, DemoFrame;

const
  WM_ENDTHREAD     = $500;
  WM_EXCEPTTHREAD  = $501;
  WM_ENDEXECUTE    = $502;

type
  TThreadsFrame = class(TDemoFrame)
    Timer: TTimer;
    MSDataSource: TDataSource;
    scDeleteAll: TMSSQL;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    meSQL: TMemo;
    meLog: TMemo;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel5: TPanel;
    btStart: TSpeedButton;
    btStop: TSpeedButton;
    btRun: TSpeedButton;
    btRunMax: TSpeedButton;
    btClearLog: TSpeedButton;
    Panel6: TPanel;
    btOpen: TSpeedButton;
    btDeleteAll: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Panel11: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbThreadCount: TLabel;
    lbExceptCount: TLabel;
    Panel12: TPanel;
    lbInterval: TLabel;
    lbTime: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label3: TLabel;
    edCount: TEdit;
    Panel9: TPanel;
    Label4: TLabel;
    rbInsert: TRadioButton;
    rbSelect: TRadioButton;
    meErrorLog: TMemo;
    MSQuery: TMSQuery;
    procedure btRunClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btStartClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure edCountChange(Sender: TObject);
    procedure btRunMaxClick(Sender: TObject);
    procedure btClearLogClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
    procedure btDeleteAllClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    procedure WMEndExecute(var Msg: TMessage); message WM_ENDTHREAD;
    procedure WMException(var Msg: TMessage); message WM_EXCEPTTHREAD;

    function RunThread(ObjectPtr: pointer; Method:pointer; EndMethod: pointer): THandle;

    procedure Execute;
    procedure EndExecute(Result: boolean);

    procedure Log(St: string);
    procedure ErrorLog(St: string);

    procedure TestConnected;

  public
    // Demo management
    procedure Initialize; override;
    procedure SetDebug(Value: boolean); override;
  end;

implementation

uses
{$IFNDEF VER130}Variants,{$ENDIF}
  SdacDemoForm;

{$WRITEABLECONST ON}

{$R *.dfm}

const
  MaxThread: integer = 40;
  Interval: integer = 2000;
  ExceptCount: integer = 0;

var
  ThreadCount: integer;
  ThreadNum: integer;
  hCountSec: TRTLCriticalSection;
  hLogSec: TRTLCriticalSection;
  BegTime: TDateTime;

type
  TMethod = procedure (Self: pointer);
  TEndMethod = procedure (Self: pointer; Result: boolean);

  PMethodDesc = ^TMethodDesc;
  TMethodDesc = record
    ObjectPtr :pointer;
    Method    :pointer;
    EndMethod :pointer;
    hWindow   :HWND;
  end;

procedure ThreadProc(MethodDesc: PMethodDesc); stdcall;
begin
  try
    TMethod(MethodDesc^.Method)(MethodDesc.ObjectPtr);
    PostMessage(MethodDesc.hWindow, WM_ENDTHREAD, DWORD(MethodDesc), 0);
  except
    on E:Exception do begin
      PostMessage(MethodDesc.hWindow, WM_EXCEPTTHREAD, DWORD(MethodDesc),
        DWORD(E));
      ExitThread(0);
    end;
  end;
end;

procedure TThreadsFrame.WMEndExecute(var Msg: TMessage);
begin
  if PMethodDesc(Msg.wParam).EndMethod <> nil then
    TEndMethod(PMethodDesc(Msg.wParam).EndMethod)(PMethodDesc(Msg.wParam).ObjectPtr, True);
  Dispose(PMethodDesc(Msg.wParam));
end;

procedure TThreadsFrame.WMException(var Msg: TMessage);
begin
  if PMethodDesc(Msg.wParam).EndMethod <> nil then
    TEndMethod(PMethodDesc(Msg.wParam).EndMethod)(PMethodDesc(Msg.wParam).ObjectPtr, False);
  Dispose(PMethodDesc(Msg.wParam));
  raise Exception(Msg.lParam);
end;

function TThreadsFrame.RunThread(ObjectPtr: pointer; Method: pointer; EndMethod: pointer): THandle;
var
  ThreadId: DWORD;
  MethodDesc: PMethodDesc;
begin
  New(MethodDesc);

  MethodDesc.ObjectPtr := ObjectPtr;
  MethodDesc.Method := Method;
  MethodDesc.EndMethod := EndMethod;
  MethodDesc.hWindow := Handle;

  InterlockedIncrement(ThreadCount);
  Result:= CreateThread(nil, 1000, @ThreadProc, MethodDesc, 0, ThreadId);
end;

procedure TThreadsFrame.Log(St: string);
begin
  EnterCriticalSection(hLogSec);
  if meLog.Lines.Count > 1000 then
    meLog.Lines.Clear;
  meLog.Lines.Add(St);
  LeaveCriticalSection(hLogSec);
end;

procedure TThreadsFrame.ErrorLog(St:string);
begin
  EnterCriticalSection(hLogSec);
  meErrorLog.Lines.Add(St);
  LeaveCriticalSection(hLogSec);
end;

const
  Delay = 1000;

procedure TThreadsFrame.Execute;
var
  Data: TdmThreadsData;
  ThreadNum: integer;
  i: integer;
begin
  i := CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  if i <> S_OK then
    raise Exception.Create('err - ' + IntToStr(i));

  EnterCriticalSection(hCountSec);
    Inc(Threads.ThreadNum);
    ThreadNum := Threads.ThreadNum;
    lbThreadCount.Caption := IntToStr(ThreadCount);
  LeaveCriticalSection(hCountSec);

  Data := TdmThreadsData.Create(nil);
  try
  try
    with Data do begin
      Log(IntToStr(ThreadNum) + ' Connecting...');
        MSConnection.Assign(SdacForm.MSConnection);
        MSConnection.LoginPrompt := False;
        MSConnection.Connect;
      Log(IntToStr(ThreadNum) + ' Connected');

      if rbInsert.Checked then begin
      // INSERT
        MSSQL.ParamByName('ID').AsInteger := Random(10000);
        MSSQL.Execute;
//        MSConnection.Commit;
        Log(IntToStr(ThreadNum) + ' Executed');
      end
      else begin
      // SELECT
        MSQuery.Open;
        i := 0;
        while not MSQuery.Eof do begin
          MSQuery.Next;
          Inc(i);
        end;
        Log(IntToStr(ThreadNum) + ' Fetched ' + IntToStr(i) + ' rows');
        MSQuery.Close;
      end;

      MSConnection.Disconnect;
      Log(IntToStr(ThreadNum) + ' Disconnected');
    end;
  except
    on E:Exception do begin
      MessageBeep(1000);
      Log(IntToStr(ThreadNum) + ' ' + IntToStr(ThreadCount) + ' Exception ' + E.Message);
      ErrorLog(IntToStr(ThreadNum) + ' ' + IntToStr(ThreadCount) + ' Exception ' + E.Message);
      Inc(ExceptCount);     
      lbExceptCount.Caption := IntToStr(ExceptCount);
    end;
  end;
  finally
    Data.Free;
    CoUninitialize;
  end;
end;

procedure TThreadsFrame.EndExecute(Result: boolean);
begin
  InterlockedDecrement(ThreadCount);
  EnterCriticalSection(hCountSec);
  lbThreadCount.Caption := IntToStr(ThreadCount);
  MessageBeep(1000);
  LeaveCriticalSection(hCountSec);
end;

procedure TThreadsFrame.btRunClick(Sender: TObject);
begin
  TestConnected;
  RunThread(Self, @TThreadsFrame.Execute, @TThreadsFrame.EndExecute);
end;

procedure TThreadsFrame.btRunMaxClick(Sender: TObject);
var
  i: integer;
begin
  TestConnected;
  for i := 1 to MaxThread do
    RunThread(Self, @TThreadsFrame.Execute, @TThreadsFrame.EndExecute);
end;

procedure TThreadsFrame.btStartClick(Sender: TObject);
begin
  TestConnected;
  edCount.Text := IntToStr(MaxThread);
  BegTime := Time;
  TimerTimer(nil);
end;

procedure TThreadsFrame.btStopClick(Sender: TObject);
begin
  Timer.Enabled := False;
end;

procedure TThreadsFrame.TimerTimer(Sender: TObject);
begin
  if ThreadCount < MaxThread then begin
    btRunClick(nil);
    if ThreadCount < (MaxThread div 10) * 9 then
      Dec(Interval, Interval div 10);
  end
  else
    Inc(Interval, Interval div 10);

  lbInterval.Caption := IntToStr(Interval);
  lbExceptCount.Caption := IntToStr(ExceptCount);
  Timer.Interval := Random(Interval - 1) + 1;
  lbTime.Caption := TimeToStr(Time - BegTime);

  lbInterval.Caption := lbInterval.Caption + ' / ' + IntToStr(Timer.Interval);

  Timer.Enabled := True;
end;

procedure TThreadsFrame.edCountChange(Sender: TObject);
begin
  MaxThread := StrToInt(edCount.Text);
end;

procedure TThreadsFrame.btClearLogClick(Sender: TObject);
begin
  meLog.Lines.Clear;
  meErrorLog.Lines.Clear;
  ThreadNum := 0;
  ExceptCount := 0;
  lbExceptCount.Caption := IntToStr(ExceptCount);
end;

procedure TThreadsFrame.btOpenClick(Sender: TObject);
begin
  MSQuery.Close;
  MSQuery.Open;
end;

procedure TThreadsFrame.rgModeClick(Sender: TObject);
begin
  if rbInsert.Checked then
    meSQL.Lines.Assign(dmThreadsData.MSSQL.SQL)
  else
    meSQL.Lines.Assign(dmThreadsData.MSQuery.SQL)
end;

procedure TThreadsFrame.btDeleteAllClick(Sender: TObject);
begin
  scDeleteAll.Execute;
//  MSConnection.Commit;
end;

procedure TThreadsFrame.Button1Click(Sender: TObject);
begin
  Execute;
end;

procedure TThreadsFrame.TestConnected;
begin
  SdacForm.MSConnection.Connect;
  if not SdacForm.MSConnection.Connected then
    Abort;
end;

// Demo management
procedure TThreadsFrame.Initialize;
begin
  inherited;
  MSQuery.Connection := Connection as TMSConnection;
  dmThreadsData := TdmThreadsData.Create(Self);
  edCount.Text := IntToStr(MaxThread);
  rbInsert.Checked := True;
end;

procedure TThreadsFrame.SetDebug(Value: boolean);
begin
  MSQuery.Debug := Value;
end;

initialization

  // We are using Windows threading (vs Delphi TThread), so we need to enable IsMultiThread
  IsMultiThread := True;

  InitializeCriticalSection(hCountSec);
  InitializeCriticalSection(hLogSec);
  Randomize;
finalization
  DeleteCriticalSection(hCountSec);
  DeleteCriticalSection(hLogSec);
end.

