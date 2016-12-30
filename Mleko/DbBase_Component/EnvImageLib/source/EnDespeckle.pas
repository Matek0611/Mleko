{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnDespeckle
|
| Description: TDespeckleTransform class
|
| History: Dec 20, 2003. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}
unit EnDespeckle;

{$M+}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnTransf, EnDiGrph, EnMisc;

type
  TAggressivity=(aLow,aNormal,aHigh);

  TDespeckleTransform = class(TImageTransform)
  private
    { Private declarations }
    FAggressivity:TAggressivity;
    FPointsRemoved:Integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create;

    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;
  published
    { Published declarations }
    property Aggressivity:TAggressivity read FAggressivity write FAggressivity;
    property PointsRemoved:Integer read FPointsRemoved;
  end;

{--------------------------------------------------------------------------}

implementation

constructor TDespeckleTransform.Create;
 begin
  inherited Create;
  FAggressivity:=aNormal;
 end;

{--------------------------------------------------------------------------}

procedure TDespeckleTransform.ApplyOnDest( const Source : TDibGraphic; const Dest   : TDibGraphic );
 var x,y,StrongConnections,OtherConnections:integer;
     PriorLine,CurrentLine:PByteArray;
     FLastPercent:Integer;
 begin
  // Reset points removed
  FPointsRemoved:=0;
  // Copy source in destination as - is
  Dest.Assign(Source);
  // The trasnform currentrly works only on monochrome images...
  if Source.ImageFormat <> ifBlackWhite then Exit;

  FLastPercent := -1;
  FLastPercent := DoProgress(Self, FOnProgress, 0, 0, 100, FLastPercent);

  // Allocate memory for lines
  {$WARNINGS OFF}
  GetMem(PriorLine,Source.Width);
  try
   FillChar(PriorLine^,Source.Width,0);
   GetMem(CurrentLine,Source.Width);
   try
    FillChar(CurrentLine^,Source.Width,0);
    for y:= 1 to Source.Height-2 do
     begin
      FLastPercent := DoProgress(Self, FOnProgress, y, 0, Dest.Height-1, FLastPercent);

      // Save pixel from line to process
      for x:=1 to Source.Width-2 do
       CurrentLine[x]:=Source.PaletteIndex[X,Y];
      // Process current line
      for x:=1 to Source.Width-2 do
       begin
         StrongConnections:=
         CurrentLine[X-1]+
         CurrentLine[X+1]+
         PriorLine[X]+
         Source.PaletteIndex[X,Y+1];
         OtherConnections:=
          PriorLine[X-1]+
          PriorLine[X+1]+
          Source.PaletteIndex[X-1,Y+1]+
          Source.PaletteIndex[X+1,Y+1];
         // Check if center pixel is 0
         if CurrentLine[X]=0 then
          begin
           StrongConnections:=4-StrongConnections;
           OtherConnections:=4-OtherConnections;
          end;
         Case FAggressivity of
          aLow: Begin
                 // Delete noise only if it has no connections...
                 if (OtherConnections+StrongConnections=0)
                  then Dest.PaletteIndex[X,Y]:=Abs(1-CurrentLine[x]);
                end;
          aHigh:Begin
                  // Delete if less than 2 strong connections exixts
                  if (StrongConnections<=2)
                   then Dest.PaletteIndex[X,Y]:=Abs(1-CurrentLine[x]);
                 end;
          else Begin
                // Delete if no strong connection exists
                if (StrongConnections=0)
                 then Dest.PaletteIndex[X,Y]:=Abs(1-CurrentLine[x]);
               end;
         end;
        if CurrentLine[x]<>Dest.PaletteIndex[X,Y] then Inc (FPointsRemoved);
       end;
      // Move pixels from Saved lines to PriorLine
      Move(CurrentLine^,PriorLine^,Dest.Width);
     end;
   finally
    FreeMem(CurrentLine);
   end;
  finally
   FreeMem(PriorLine);
  end;
  {$WARNINGS OFF}

  DoProgress(Self, FOnProgress, 100, 0, 100, FLastPercent);

 end;

{--------------------------------------------------------------------------}

end.
