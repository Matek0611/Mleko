unit MlekoUtils;

interface
uses Windows, Classes, SysUtils, SysProcs;

type

  TTimeTracer = class
  private
    FTime: Int64;
    pCreationTime, pExitTime, pKernelTime, pUserTime: Int64;
    FProcessHandle: THandle;
    FIsSuccess: Boolean;
    FFreq, FStartCount, FStopCount: int64;
    FLastTime: TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property IsSuccess: Boolean read FIsSuccess;
    property LastTime: TDateTime read FLastTime;
  end;

function EncodeSecretValue(Value, Secret: Integer): Integer;
function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;
function Ctrl_Is_Down(): Boolean;
function Shift_Is_Down(): Boolean;
function Alt_Is_Down(): Boolean;

implementation

  constructor TTimeTracer.Create;
begin
  inherited Create;
  FProcessHandle:=GetCurrentProcess;
  QueryPerformanceFrequency(FFreq);
  FIsSuccess:=FFreq<>0;
end;

destructor TTimeTracer.Destroy;
begin
  inherited Destroy;
end;

procedure TTimeTracer.Start;
begin
//  FIsSuccess:=GetProcessTimes(FProcessHandle, TFileTime(pCreationTime), TFileTime(pExitTime), TFileTime(pKernelTime), TFileTime(pUserTime));
  QueryPerformanceCounter(FStartCount);
end;

procedure TTimeTracer.Stop;
begin
//  FIsSuccess:=FIsSuccess and GetProcessTimes(FProcessHandle, TFileTime(pCreationTime), TFileTime(pExitTime), TFileTime(pKernelTime), TFileTime(pUserTime));
  QueryPerformanceCounter(FStopCount);
  if FIsSuccess then
    FLastTime:=(FStopCount-FStartCount)/FFreq
  else
    FLastTime:=-1;
end;

function EncodeSecretValue(Value, Secret: Integer): Integer;
asm
  test EAX, EAX  // if (Code<0) then
  js @Quit       // go to @Quit
  mov  AH, DL   // Result:= Secret * 256 + Value;
@Quit:
end;

function DecodeSecretValue(Code: Integer; var Secret: Integer): Integer;
asm
  mov DWORD PTR [EDX], 0         // Secret = 0
  test EAX, EAX                  // if (Code<0) then
  js @Quit                       // go to @Quit
  movzx  ECX, AH                 // ECX = AH (32 bit <- 8 bit)
  mov    DWORD PTR [EDX], ECX    // Secret:= Code div 256;
  and    EAX, $FF                // Result = Code mod 256;
@Quit:
end;

function Ctrl_Is_Down(): Boolean;
var State:TKeyboardState;
begin
  GetKeyboardState(State);
  Result:=((State[VK_CONTROL] and 128)<>0);
end;

function Shift_Is_Down(): Boolean;
var State:TKeyboardState;
begin
  GetKeyboardState(State);
  Result:=((State[VK_SHIFT] and 128)<>0);
end;

function Alt_Is_Down(): Boolean;
var State:TKeyboardState;
begin
  GetKeyboardState(State);
  Result:=((State[VK_MENU] and 128)<>0);
end;




end.
