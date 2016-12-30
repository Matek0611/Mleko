{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnEncrypt
|
| Description: TEncryptTransform class
|
| History: Dec, 2003. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}
unit EnEncrypt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnTransf, EnDiGrph, EnMisc;

Type


  TEncryptTransform = class(TImageTransform)
  protected
    { Private declarations }
    FEncryptionKey : Int64;
    FStripSize     : Integer;
    FBidimensional : Boolean;
    procedure ShuffleStrips(const Dest   : TDibGraphic);

  public

    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;

    constructor Create;

    property EncryptionKey : Int64 read FEncryptionKey write FEncryptionKey;
    property StripSize     : Integer read FStripSize write FStripSize;
    property Bidimensional : Boolean read FBidimensional write FBidimensional;
  end;

implementation


type

TPseudoRandomGenerator=class
 FRandomSeed:Int64;
 constructor Create;
 function GetRandom:Int64; overload;
 function GetRandom(N:Integer):Integer; overload;
 property RandomSeed:Int64 read FRandomSeed write FRandomSeed;
end;

constructor TPseudoRandomGenerator.Create;
 begin
  inherited Create;
  FRandomSeed:=0;
 end;

function TPseudoRandomGenerator.GetRandom:Int64;
const Factor = $08088405 ; Term = 1 ; Two32= 4294967296 ;
begin
 {$Q-} FRandomSeed := FRandomSeed*Factor + Term {$Q+} ;
 FRandomSeed := FRandomSeed - (FRandomSeed div Two32)*Two32 ;
 Result:=FRandomSeed;
end;

function TPseudoRandomGenerator.GetRandom(N:Integer):Integer;
const Two32= 4294967296.0 ;
 Var T : extended ;
begin
  GetRandom;
  T := FRandomSeed/Two32 ;
  if T<0 then T := T+1.0 ;
  Result := Trunc(T*N) ;
end;



constructor TEncryptTransform.Create;
 begin
  inherited Create;
  EncryptionKey  :=0;
  FStripSize     :=1;
  FBidimensional :=False;
 end;


Type
    TBooleanArray=Array[0..0] of Boolean;
    PBooleanArray=^TBooleanArray;


{$WARNINGS OFF}
procedure TEncryptTransform.ShuffleStrips(const Dest   : TDibGraphic);
 Var RG:TPseudoRandomGenerator;
     TotalStripes:Integer;
     AlreadyExchanged:PBooleanArray;
     SourceIndex,DestIndex,MaxExchanges,CurrentExchanges:Integer;
     ExchangeDone:Boolean;
     TempBuffer:PChar;
     StripIndex:Integer;
 begin
  // Creates Pseudo Random Number Generato
  RG:=TPseudoRandomGenerator.Create;
  try
   // Init generator with key
   RG.RandomSeed:=EncryptionKey;
   TotalStripes:=Dest.Height div FStripSize;
   GetMem(AlreadyExchanged,SizeOf(Boolean)*TotalStripes);
   try
    MaxExchanges:=TotalStripes div 2;
    for SourceIndex:=0 to TotalStripes-1 do AlreadyExchanged[SourceIndex]:=False;
    CurrentExchanges:=0;
    GetMem(TempBuffer,Dest.ScanLineSize);
    try
     for SourceIndex:=0 to TotalStripes-1 do
      begin
       if not AlreadyExchanged[SourceIndex] then
        begin
         AlreadyExchanged[SourceIndex]:=True;
         ExchangeDone:=False;
         Repeat
          DestIndex:=RG.GetRandom(TotalStripes-SourceIndex)+SourceIndex;
          if not AlreadyExchanged[DestIndex] then
           begin
            for StripIndex:=0 to FStripSize-1 do
             begin
              Move(Dest.ScanLine[DestIndex*StripSize+StripIndex]^,TempBuffer^,Dest.ScanLineSize);
              Move(Dest.ScanLine[SourceIndex*StripSize+StripIndex]^,Dest.ScanLine[DestIndex*StripSize+StripIndex]^,Dest.ScanLineSize);
              Move(TempBuffer^,Dest.ScanLine[SourceIndex*StripSize+StripIndex]^,Dest.ScanLineSize);
             end;
            AlreadyExchanged[DestIndex]:=True;
            Inc(CurrentExchanges);
            ExchangeDone:=True;
           end;
         Until ExchangeDone=True;
         if CurrentExchanges>=MaxExchanges then break;
        end;
      end;
    finally
     FreeMem(TempBuffer);
    end;
   finally
    FreeMem(AlreadyExchanged);
   end;
  finally
   RG.Free;
  end;
 end;
{$WARNINGS ON}

procedure TEncryptTransform.ApplyOnDest( const Source : TDibGraphic; const Dest   : TDibGraphic );
 Var
     TempImage : TDibGraphic;
     Transform : TRotateTransform;
 begin

  // Assigne source to dest
  if Source<>Dest then Dest.Assign(Source);
  // Make encryption on first dimension
  ShuffleStrips(Dest);
  if FBidimensional then
   begin
    TempImage:=TDibGraphic.Create;
    try
     TempImage.Assign(Dest);
     Transform := TRotateTransform.Create;
     try
        Transform.Angle           := 90;
        Transform.Apply(TempImage);

        ShuffleStrips(TempImage);

        Transform.Angle           := 270;
        Transform.Apply(TempImage);
     finally
        Transform.Free;
     end;
     Dest.Assign(TempImage);
    finally
     TempImage.Free;
    end;
   end;
 end;

 end.


