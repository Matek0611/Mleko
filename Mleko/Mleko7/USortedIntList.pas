unit USortedIntList;

interface

type
  PIntegerArray = ^TIntegerArray;

  TIntegerArray = array[0..$FFFFFF] of Integer;

//  TAbstractSortedList = class
//  protected
//    function GetData: Pointer; abstract;
//    function GetCount: Integer; abstract;
//  public
//    function Find(const Value: Integer; var Index: Integer): Boolean; abstract;
//    function IndexOf(const Value: Integer): Integer; abstract;
//    procedure Insert(Index: Integer; const Value: Integer); abstract;
//  end;

  TSortedIntList = class
  private
    DataList: array of Integer;
    FData: Pointer;
    FCount: Integer;
    procedure GetInternals;
    procedure SetCount(const Value: Integer);
    procedure DecCount;
    procedure IncCount;
    procedure SetValue(Index: Integer; const Value: Integer);
    function GetValue(Index: Integer): Integer;
    procedure DeleteItem(Index: Integer);
//    function GetData: Pointer;
//    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy;
    procedure Clear;
    function Add(const Value: Integer): Integer;
    function Delete(const Value: Integer): Integer;
    function Find(const Value: Integer; var Index: Integer): Boolean;
    function IndexOf(const Value: Integer): Integer;
    procedure Insert(Index: Integer; const Value: Integer);
    property Count: Integer read FCount write SetCount;
    property Data: Pointer read FData;
  end;

implementation

{ TSortedIntList }

function FindValue(XA: PIntegerArray; X: Integer; Count: Integer; var Index:
  Integer): Boolean;
var
  k, klo, khi: Integer;
begin
  klo := 0;
  khi := Count - 1;
  Result := False;
  while (klo <= khi) do
  begin
    k := (khi + klo) shr 1;
    if (xa[k] < x) then
      klo := k + 1
    else
    begin
      khi := k - 1;
      if (xa[k] = x) then
      begin
        klo := k;
        Result := True;
      end
    end;
  end;
  Index := klo;
end;

procedure ShiftIntValues(const P: PIntegerArray; const Index, Length: Integer; Shift: Integer = 1);
begin
  if (Index < Length - 1) then
  if (Shift>0) then
    System.Move(P^[Index], P^[Index + 1], (Length - Index - 1) * SizeOf(Integer)) else
    System.Move(P^[Index+1], P^[Index], (Length - Index - 1) * SizeOf(Integer))
end;

procedure TSortedIntList.GetInternals;
begin
  FCount:= Length(DataList);
  if FCount=0 then FData:= nil else
  FData := @DataList[0];
end;

constructor TSortedIntList.Create;
begin
  SetLength(DataList, 0);
  GetInternals;
end;

destructor TSortedIntList.Destroy;
begin
  SetLength(DataList, 0);
end;

function TSortedIntList.Find(const Value: Integer; var Index: Integer): Boolean;
begin
  Result := FindValue(FData, Value, FCount, Index);
end;

function TSortedIntList.IndexOf(const Value: Integer): Integer;
begin
  if not Find(Value, Result) then
    Result := -1;
end;

procedure TSortedIntList.IncCount();
begin
  Inc(FCount);
  SetLength(DataList, FCount);
  GetInternals;
end;

procedure TSortedIntList.DecCount();
begin
  if (FCount > 0) then
  begin
    Dec(FCount);
    SetLength(DataList, FCount);
    GetInternals;
  end;
end;

procedure TSortedIntList.SetValue(Index: Integer; const Value: Integer);
begin
  DataList[Index] := Value;
end;

function TSortedIntList.GetValue(Index: Integer): Integer;
begin
  Result := DataList[Index];
end;

procedure TSortedIntList.Insert(Index: Integer; const Value: Integer);
begin
  IncCount();
  ShiftIntValues(PIntegerArray(FData), Index, FCount);
  SetValue(Index, Value);
end;

procedure TSortedIntList.DeleteItem(Index: Integer);
begin
  ShiftIntValues(PIntegerArray(FData), Index, FCount, -1);
  DecCount();
end;

function TSortedIntList.Delete(const Value: Integer): Integer;
begin
  if Find(Value, Result) then
    DeleteItem(Result);
end;

function TSortedIntList.Add(const Value: Integer): Integer;
begin
  if not Find(Value, Result) then
    Insert(Result, Value);
end;

procedure TSortedIntList.Clear();
begin
  SetCount(0);
end;

procedure TSortedIntList.SetCount(const Value: Integer);
begin
  if (Value <> FCount) and (Value >= 0) then
  begin
    SetLength(DataList, Value);
    GetInternals;
  end;
end;

end.


