{----------------------------------------------------------------------------
|
| Library: Envision
|
| Module: EnWatermark
|
| Description: TWatermarkTransform
|
| History: Dec 20, 2003. Francesco Pucino, first version
|
|---------------------------------------------------------------------------}

unit EnWatermark;

{$M+}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, EnTransf, EnDiGrph, EnBmpGr , EnMisc;

type

  TWatermarkTransform = class(TImageTransform)
  private
    { Private declarations }
    FOpacity:Byte;
    FWatermark:TDibGraphic;
    FPosition:TPoint;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create;
    procedure ApplyOnDest( const Source : TDibGraphic;
                           const Dest   : TDibGraphic ); override;
  published
    { Published declarations }
    property Watermark:TDibGraphic read FWatermark write FWatermark;
    property Opacity:Byte read FOpacity write FOpacity;
    property Position:TPoint read FPosition write FPosition;
  end;

implementation


constructor TWatermarkTransform.Create;
 begin
  inherited Create;
  // Set the default value as 50% for opacity
  FOpacity:=50;
  FWatermark:=nil;
  FPosition:=Point(0,0);
 end;

function ByteRange(Value:Integer):Byte;
 begin
  if Value<0 then Value:=0;
  if Value>255 then Value:=255;
  Result:=Value;
 end;

procedure TWatermarkTransform.ApplyOnDest( const Source : TDibGraphic; const Dest   : TDibGraphic );
 Var Transform:TImageFormatTransform;
     x,y:integer;
     TempWatermark:TDibGraphic;
     Temp1,Temp2,White,Black:TRGB;
 begin
  // Copy source in destination
  Dest.Assign(Source);
  // No watermark, no transform !
  if not Assigned(FWatermark) or FWatermark.IsEmpty then Exit;
  // Check opacity range
  if FOpacity>100 then FOpacity:=100;
  // Create e copy of watermark
  TempWatermark:=TDibGraphic.Create;
  try
   TempWatermark.Assign(FWatermark);
   // Create a transform
   Transform:=TImageFormatTransform.Create;
   try
    // Transforms watermark in truecolor
    Transform.ImageFormat:=ifTrueColor;
    Transform.Apply(TempWatermark);
    // if target image is monochrome, then use dithering....
    if Source.ImageFormat=ifBlackWhite then
     begin
      Transform.ImageFormat:=ifBlackWhite;
      Transform.Dither:=True;
      Transform.Apply(TempWatermark);
     end
    else
     begin
      // Calculate transparency
      for x:=0 to TempWatermark.Width-1 do
       for y:=0 to TempWatermark.Height-1 do
        begin
         Temp1:=TempWatermark.RGB[x,y];
         Temp1.Blue:=Round(Temp1.Blue*FOpacity/100);
         Temp1.Red:=Round(Temp1.Red*FOpacity/100);
         Temp1.Green:=Round(Temp1.Green*FOpacity/100);
         TempWatermark.RGB[x,y]:=Temp1;
        end;
     end;

   finally
    Transform.Free;
   end;

   White.Blue:=255;
   White.Red:=255;
   White.Green:=255;
   Black.Blue:=0;
   Black.Red:=0;
   Black.Green:=0;
   // Apply watermark
   for x:=0 to TempWatermark.Width-1 do
    for y:=0 to TempWatermark.Height-1 do
     begin
      // Check if target position is in the image
      if (x+position.x>=0) and (y+position.y>=0) and
         (x+position.x<Source.Width) and (y+position.y<Source.Height) then
       begin
        Temp1:=TempWatermark.RGB[x,y];
        if (Dest.ImageFormat=ifBlackWhite) then
         begin
          if (Temp1.Blue=0) then Dest.RGB[x+position.x,y+position.y]:=Temp1;
         end
        else
         begin
          Temp2:=Source.RGB[x+position.x,y+position.y];
          Temp2.Blue:=Round(Temp2.Blue*(100-FOpacity)/100);
          Temp2.Red:=Round(Temp2.Red*(100-FOpacity)/100);
          Temp2.Green:=Round(Temp2.Green*(100-FOpacity)/100);
          Temp1.Blue:=ByteRange(Temp1.Blue+Temp2.Blue);
          Temp1.Red:=ByteRange(Temp1.Red+Temp2.Red);
          Temp1.Green:=ByteRange(Temp1.Green+Temp2.Green);
          Dest.RGB[x+position.x,y+position.y]:=Temp1
         end;
       end;
     end;
  finally
   TempWatermark.Free;
  end;
 end;


end.
