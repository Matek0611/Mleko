unit EnProWin;
{##############################################################################}
{ EnProWin - Provides general purpose image window frame                       }
{ Copyright (C) 2002  Nick Boland  nick@b-e.com                                }
{ 20556 Country Lake Blvd, Noblesville, IN  46060  USA                         }
{                                                                              }
{ This library is free software; you can redistribute it and/or                }
{ modify it under the terms of the GNU Lesser General Public                   }
{ License as published by the Free Software Foundation; either                 }
{ version 2.1 of the License, or (at your option) any later version.           }
{                                                                              }
{ This library is distributed in the hope that it will be useful,              }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of               }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU            }
{ Lesser General Public License for more details.                              }
{                                                                              }
{ You should have received a copy of the GNU Lesser General Public             }
{ License along with this library; if not, write to the Free Software          }
{ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA    }
{                                                                              }
{ History: Dec 10, 2001. Nick Boland, preliminary test version                 }
{          Feb 05, 2002. Nick Boland, add imaging support for caching images   }
{                        Add imaging support for two highlight areas           }
{          Mar 28, 2002. Nick Boland, add GNU Lessor General Public License    }
{                                                                              }
{ These functions must be called to configure the frame and to save its        }
{ settings:                                                                    }
{                                                                              }
{   ImgWinFrame.ConfigStr := <saved value>                                     }
{   <current value> := ImgWinFrame.ConfigStr;                                  }
{   EnableRotating( TRUE / FALSE );                                            }
{   EnablePrinting( TRUE / FALSE );                                            }
{                                                                              }
{ If a caption needs updated when zoom changes then add this event handler.    }
{                                                                              }
{   ImgWinFrame.OnCaption := OnCaption;                                        }
{##############################################################################}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Clipbrd, Math,
  EnDiGrph, EnTifGr, EnJpgGr, EnBmpGr, EnPrint, EnImgScr, EnTransf, EnMisc,
  EnOCR, EnBarcode;

type
  TZoomType = ( ztBestFit, ztFitWidth, ztFitHeight, ztActualSize, ztUserSelected );
  TImageFormat = EnMisc.TImageFormat;
  TTiffCompression = EnTifGr.TTiffCompression;
  TJPEGQuality = EnJpgGr.TJPEGQuality;

  TCaptionEvent = procedure( const NewCaption : String ) of object;

  TOverlayInfo = record
    Pos : String;
    Color : TColor;
  end;

type

  TEnProWinFrame = class(TFrame)

    SpeedBarPanel: TPanel;
    ZoomInBtn: TSpeedButton;
    ZoomOutBtn: TSpeedButton;
    FitHeightBtn: TSpeedButton;
    FitWidthBtn: TSpeedButton;
    BestFitBtn: TSpeedButton;
    ActualSizeBtn: TSpeedButton;
    PrintSetupBtn: TSpeedButton;
    PrintBtn: TSpeedButton;
    RotateLeftBtn: TSpeedButton;
    RotateRightBtn: TSpeedButton;
    ZoomComboBox: TComboBox;
    DispAlgComboBox: TComboBox;
    PrintModeComboBox: TComboBox;
    ImageScrollBox: TImageScrollBox;
    StatusBar: TStatusBar;

    procedure ZoomInBtnClick(Sender: TObject);
    procedure ZoomOutBtnClick(Sender: TObject);
    procedure FitHeightBtnClick(Sender: TObject);
    procedure FitWidthBtnClick(Sender: TObject);
    procedure BestFitBtnClick(Sender: TObject);
    procedure ActualSizeBtnClick(Sender: TObject);
    procedure ZoomComboBoxChange(Sender: TObject);
    procedure DispAlgComboBoxChange(Sender: TObject);
    procedure RotateLeftBtnClick(Sender: TObject);
    procedure RotateRightBtnClick(Sender: TObject);
    procedure PrintSetupBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure ImageScrollBoxBeforeSave(const Sender: TImageScrollBox; const Graphic: TDibGraphic);

  protected

    FFileName : String;
    FOrigFileName : String;
    FOnCaption : TCaptionEvent;
    FHighlightColor : TColor;
    FScreenLayout : Integer;
    FScreenAdjustment : String;
    FMarkSenseAdjustment : String;
    FAnnotationCanvas : TCanvas;

    isFrozen : Boolean;
    origImageLoaded : Boolean;
    CurrentImagePosition : String;
    CurrentImageSelection : Integer;
    LoadingScrollPositionX : Integer;
    LoadingScrollPositionY : Integer;
    AdjLeftPct, AdjTopPct : Double;
    ZoomType : TZoomType;
    ZoomFactor : Integer;
    OverlayList : String;
    saveCompression : TTiffCompression;
    saveQuality : TJPEGQuality;
    overlayGraphic : TDibGraphic;
    overlayGraphicFileName : String;

    function  GetCacheFileName : String;
    procedure SetCacheFileName( const FileName : String );
    procedure SetHighlightColor( Color : TColor );
    procedure SetScreenLayout( Layout : Integer );
    procedure SetScreenAdjustment( Adjustment : String );
    procedure SetMarkSenseAdjustment( Adjustment : String );
    function  GetCaption : String;
    function  GetConfigStr : String;
    procedure SetConfigStr( value : String );

    procedure DrawOverlayBoxOnImage(  addOverlay : Boolean; x1, y1, x2, y2 : Integer; color : TColor; penMode : TPenMode );
    procedure DrawOverlayBoxOnScreen( addOverlay : Boolean; x1, y1, x2, y2 : Integer; color : TColor; penMode : TPenMode );
    procedure DrawOverlayOnScreen( addOverlay : Boolean; annotationStr : String );
    procedure RemoveOverlay( list : String );
    procedure AddOverlay( list : String );
    procedure OnAfterDraw( Sender : TObject );
    procedure UpdateImageDisplay( andOverlays : Boolean );

  public

    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;

    property  ConfigStr : String read GetConfigStr write SetConfigStr;
    property  FileName : String read FFileName;
    property  CacheFileName : String read GetCacheFileName write SetCacheFileName;
    property  Caption : String read GetCaption;
    property  HighlightColor : TColor read FHighlightColor write SetHighlightColor;
    property  ScreenLayout : Integer read FScreenLayout write SetScreenLayout;
    property  ScreenAdjustment : String read FScreenAdjustment write SetScreenAdjustment;
    property  MarkSenseAdjustment : String read FMarkSenseAdjustment write SetMarkSenseAdjustment;

    function  Load( fileName : String ) : Boolean; virtual;
    function  LoadEx( fileName : String; origImage : Boolean ) : Boolean; virtual;
    function  LoadHidden( fileName : String ) : Boolean; virtual;
    procedure LoadBlank( width, height, xdpi, ydpi : Integer; format : TImageFormat; bgndColor : TColor  );
    function  LoadGraphic( const srcGraphic : TDibGraphic ) : Boolean;
    function  LoadGraphicHidden( const srcGraphic : TDibGraphic ) : Boolean;
    function  LoadGraphicCrop( const srcGraphic : TDibGraphic; srcRect : TRect ) : Boolean; overload;
    function  LoadGraphicCrop( imgWinFrame : TEnProWinFrame; srcRect : TRect ) : Boolean; overload;
    function  LoadGraphicCrop( imgWinFrame : TEnProWinFrame; Pos : String; Selection : Integer ) : Boolean; overload;
    procedure Clear;
    function  Save( fileName : String; compression : TTiffCompression; quality : TJPEGQuality ) : Boolean;

    function  Info( var fileName : String; var width, height, xdpi, ydpi : Integer; var imageFormat : TImageFormat; var compression : TTiffCompression; var quality : TJPEGQuality ) : Boolean;
    function  DeskewAngle( maxAngle : Double ) : Double;
    function  Deskew( canResize : Boolean; maxAngle : Double ) : Double; overload;
    function  Deskew( canResize : Boolean; const bgColor : TRgb; maxAngle : Double ) : Double; overload;
    procedure Rotate( angle : Double );
    procedure BorderCleanup( maxDepthInches : Double ); overload;
    procedure BorderCleanup( maxDepthInches : Double; const bgColor : TRgb ); overload;
    procedure ChangeRes( xdpi, ydpi : Integer );
    procedure ChangeSize( width, height : Integer );
    function  FindBorders : TRect; overload;
    function  FindBorders( const bgColor : TRgb ) : TRect; overload;
    procedure Crop( srcRect : TRect ); overload;
    procedure Crop( Pos : String; Selection : Integer ); overload;
    procedure Redraw( graphicChanged : Boolean );

    procedure WriteText( fontName : String; fontSize : Integer; fontStyles : TFontStyles; fontColor : TColor; xPosPcnt, yPosPcnt : Double; text : String );
    function  Overlay( fileName : String; copyMode : TCopyMode ) : Boolean;
    procedure OverlayDone;

    procedure FreezeDisplay;
    procedure EnableRotating( enable : Boolean );
    procedure EnablePrinting( enable : Boolean );

    procedure CalcPosPercent( var pos : String; selection : Integer; var leftPct, topPct, widthPct, heightPct : Double );
    function  CalcPosToRect( pos : String; selection : Integer ) : TRect;
    procedure ImagePosition( Pos : String; Selection : Integer; isLoading : Boolean; const overlayInfo : array of TOverlayInfo ); overload;
    procedure ImagePosition( Pos : String; Selection : Integer; isLoading : Boolean ); overload;
    procedure ImagePosition( srcRect : TRect; isLoading : Boolean ); overload;
    procedure ImagePosition( x0, y0, x1, y1 : Integer; isLoading : Boolean ); overload;
    procedure ImageSelection( Offset : Integer );
    procedure ImageAdjustment( Adj : String );

    function  ImageMarkSense( Pos : String; Selection : Integer; GridWidth, GridHeight, GridIndex, GridStyle : Integer ) : Integer;
    function  ImageMarkSenseEx( Pos : String; Selection : Integer; GridWidth, GridHeight, GridIndex, GridStyle : Integer; var NumBlackStr, NumPixelsStr : String ) : Integer;
    function  ImageCenterAdjustment( Pos : String; Selection : Integer; RowThresholdPct, ColThresholdPct : Double; var LeftPct, TopPct : Double ) : Boolean;

    function  ImageOCR( Pos : String; Selection : Integer; Params : String; TypeOCR : TImageTypeOCR; CharSet : TOCRCharSet; PictureMask : String; MinConf : Double; var strResult : array of TOCRStringResult ) : Boolean;
    function  ImageBarcode( Pos : String; Selection : Integer; Params : String; TypeBarcode : TImageTypeBarcode; var strResults : array of TBarcodeStringResult ) : Boolean;
  published

    property  OnCaption : TCaptionEvent read FOnCaption write FOnCaption;
  end;

procedure CalcPosPercent( imgWinFrame : TEnProWinFrame; var pos : String; selection : Integer; var leftPct, topPct, widthPct, heightPct : Double );
function  CalcPosToRect( imgWinFrame : TEnProWinFrame; pos : String; selection : Integer ) : TRect;
function  CalcWinToImgRect( imgWinFrame : TEnProWinFrame; winRect : TRect ) : TRect;

implementation

{$R *.DFM}

uses
  EnProLib;

type
  TProtectedScrollBox = class(TImageScrollBox);

constructor TEnProWinFrame.Create(AOwner : TComponent);
{******************************************************************************}
{ This is called when the frame is created.                                    }
{******************************************************************************}
begin
  inherited Create(AOwner);

  { Default values }
  isFrozen := TRUE;
  CurrentImagePosition := '';
  CurrentImageSelection := 1;
  ScreenAdjustment := '';
  MarkSenseAdjustment := '';
  ScreenLayout := 1;
  AdjLeftPct := 0;
  AdjTopPct  := 0;
  HighlightColor := clYellow;

  { Control default values }
  PrintModeComboBox.ItemIndex := 1;
  DispAlgComboBox.ItemIndex := 1;
  ZoomType := ztFitWidth;
  ZoomFactor := 100;

  { Variables }
  FAnnotationCanvas := nil;

  ImageScrollBox.DisplayedGraphic.AfterDraw := OnAfterDraw;

  ImageScrollBox.DoubleBuffered := FALSE;

  if FindDibGraphicClass( '*.BMP'  ) = nil then RegisterDibGraphic( 'BMP',  'Bitmap file', TBitmapGraphic );
  if FindDibGraphicClass( '*.TIF'  ) = nil then RegisterDibGraphic( 'TIF',  'TIFF file',   TTiffGraphic );
  if FindDibGraphicClass( '*.TIFF' ) = nil then RegisterDibGraphic( 'TIFF', 'TIFF file',   TTiffGraphic );
  if FindDibGraphicClass( '*.JPG'  ) = nil then RegisterDibGraphic( 'JPG',  'JPEG',        TJpegGraphic );
  if FindDibGraphicClass( '*.JPEG' ) = nil then RegisterDibGraphic( 'JPEG', 'JPEG',        TJpegGraphic );

  overlayGraphic := TDibGraphic.Create;

  { Display }
  ImageScrollBox.Align := alClient;
end;

destructor TEnProWinFrame.Destroy;
{******************************************************************************}
{ This is called when the frame is destroyed.                                  }
{******************************************************************************}
begin
  OverlayDone;
  overlayGraphic.Free;

  if not ImageScrollBox.Graphic.IsEmpty then ImageScrollBox.Clear;

  ImageScrollBox.DisplayedGraphic.AfterDraw := nil;

  if Assigned( FAnnotationCanvas ) then begin
    ReleaseDC( ImageScrollBox.Handle, FAnnotationCanvas.Handle );
    FAnnotationCanvas.Free;
  end;

  inherited Destroy;
end;

function TEnProWinFrame.GetConfigStr : String;
{******************************************************************************}
{ Returns the frame's configuration to the calling procedure.                  }
{******************************************************************************}
begin
  Result := '';
  Result := EnStrAddToList( Result, ';', Format( 'PrintMode=%d',  [ PrintModeComboBox.ItemIndex ] ) );
  Result := EnStrAddToList( Result, ';', Format( 'DispAlg=%d',    [ DispAlgComboBox.ItemIndex ] ) );
  Result := EnStrAddToList( Result, ';', Format( 'ZoomFactor=%d', [ ZoomFactor ] ) );
  Result := EnStrAddToList( Result, ';', Format( 'ZoomType=%d',   [ Ord( ZoomType ) ] ) );
end;

procedure TEnProWinFrame.SetConfigStr( value : String );
{******************************************************************************}
{ Sets the frame's configuration from the given configStr.                     }
{******************************************************************************}
var
  list, item : String;
begin
  while value <> '' do begin
    list := EnStrGetNextToken( value, ';' );
    item := EnStrGetNextToken( list, '=' );
    if AnsiCompareText( item, 'PrintMode' )  = 0 then PrintModeComboBox.ItemIndex := StrToIntDef( list, 1 );
    if AnsiCompareText( item, 'DispAlg' )    = 0 then DispAlgComboBox.ItemIndex := StrToIntDef( list, 1 );
    if AnsiCompareText( item, 'ZoomType' )   = 0 then ZoomType := TZoomType( StrToIntDef( list, 1 ) );
    if AnsiCompareText( item, 'ZoomFactor' ) = 0 then ZoomFactor := StrToIntDef( list, 100 );
    if DispAlgComboBox.ItemIndex > 1 then DispAlgComboBox.ItemIndex := 1;
  end;
end;

procedure TEnProWinFrame.ImageScrollBoxBeforeSave( const Sender: TImageScrollBox; const Graphic: TDibGraphic );
{******************************************************************************}
{ This event is used to set parameters in the "Graphic" being saved.           }
{******************************************************************************}
begin
  { TIFF }
  if Graphic is TTiffGraphic then begin
    TTiffGraphic(Graphic).RowsPerStrip := Graphic.Height;
    if Graphic.ImageFormat = ifTrueColor then begin
      TTiffGraphic(Graphic).Compression := tcJPEG;
    end else if Graphic.ImageFormat = ifBlackWhite then begin
      TTiffGraphic(Graphic).Compression := saveCompression;
    end else begin
      TTiffGraphic(Graphic).Compression := tcPackbits;
    end;
  { JPEG }
  end else if Graphic is TJpegGraphic then begin
    TJpegGraphic(Graphic).SaveQuality := saveQuality;
  end;
end;

procedure TEnProWinFrame.OnAfterDraw( Sender : TObject );
{******************************************************************************}
{ This is called after the image has been drawn on the screen.  It is most     }
{ useful for display of annotations.                                           }
{******************************************************************************}
begin
  { Redraw any current annotations }
  if OverlayList <> '' then DrawOverlayOnScreen( TRUE, OverlayList );
end;

function TEnProWinFrame.LoadEx( fileName : String; origImage : Boolean ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given image file name is successfully displayed,         }
{ otherwise FALSE.                                                             }
{                                                                              }
{ NOTE - The form must be visible before trying to display an image,           }
{        otherwise I received an out of memory error message.                  }
{******************************************************************************}
begin
  Result := FALSE;

  FFileName := fileName;
  if origImage then FOrigFileName := fileName;
  origImageLoaded := origImage;

  { Save current position to be used on next image }
  if not ImageScrollBox.Graphic.IsEmpty then begin
    LoadingScrollPositionX := ImageScrollBox.HorzScrollBar.ScrollPos;
    LoadingScrollPositionY := ImageScrollBox.VertScrollBar.ScrollPos;
  { Default initial position }
  end else begin
    LoadingScrollPositionX := 0;
    LoadingScrollPositionY := 0;
  end;

  isFrozen := FALSE;
  UpdateImageDisplay( FALSE );

  try
    ImageScrollBox.FileName := fileName;
  except
    on E : Exception do begin
//    ShowMessage( E.Message );
      Exit;
    end;
  end;

  Update;

  Result := TRUE;
end;

function TEnProWinFrame.Load( fileName : String ) : Boolean;
begin
  Result := LoadEx( fileName, TRUE );
end;

function TEnProWinFrame.LoadHidden( fileName : String ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given image file name is successfully loaded,            }
{ otherwise FALSE.  No attempt is made to update the display of the image.     }
{ It may still be manipulated without displaying it.                           }
{******************************************************************************}
var
  stream : TFileStream;
  graphic : TDibGraphic;
begin
  Result := FALSE;
  FFileName := fileName;
  FOrigFileName := fileName;
  origImageLoaded := TRUE;
  OverlayList := '';
  CurrentImagePosition := '';
  CurrentImageSelection := 0;
  if not ImageScrollBox.Graphic.IsEmpty then ImageScrollBox.Clear;
  LoadingScrollPositionX := 0;
  LoadingScrollPositionY := 0;
  isFrozen := FALSE;
  UpdateImageDisplay( FALSE );
  try
    graphic := NewDibGraphic( fileName );
    try
      stream := TFileStream.Create( fileName, fmOpenRead or fmShareDenyNone );
      try
        graphic.MultiLoad := FALSE;
        graphic.ImageToLoad := 1;
        graphic.LoadFromStream( stream );
      finally
        stream.Free;
      end;
      ImageScrollBox.Graphic.Assign( graphic );
    finally
      graphic.Free;
    end;
  except
    Exit;
  end;
  Result := TRUE;
end;

procedure TEnProWinFrame.LoadBlank( width, height, xdpi, ydpi : Integer; format : TImageFormat; bgndColor : TColor );
{******************************************************************************}
{ Creates and displays a blank image of the given "width", "height",           }
{ "xdpi", "ydpi", "format", and "bgndColor".                                   }
{******************************************************************************}
begin
  FFileName := '';
  FOrigFileName := '';
  origImageLoaded := TRUE;
  OverlayList := '';
  CurrentImagePosition := '';
  CurrentImageSelection := 0;
  if not ImageScrollBox.Graphic.IsEmpty then ImageScrollBox.Clear;
  LoadingScrollPositionX := 0;
  LoadingScrollPositionY := 0;
  isFrozen := FALSE;
  UpdateImageDisplay( FALSE );
  ImageScrollBox.Graphic.NewImage( width, height, format, nil, xdpi, ydpi );
  ImageScrollBox.Graphic.Canvas.Brush.Color := bgndColor;
  ImageScrollBox.Graphic.Canvas.Brush.Style := bsSolid;
  ImageScrollBox.Graphic.Canvas.FillRect( Rect( 0, 0, width, height ) );
end;

function TEnProWinFrame.LoadGraphic( const srcGraphic: TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "srcGraphic" is successfully loaded,               }
{ otherwise FALSE.                                                             }
{******************************************************************************}
begin
  Result := LoadGraphicHidden( srcGraphic );
  Redraw( TRUE );
end;

function TEnProWinFrame.LoadGraphicHidden( const srcGraphic: TDibGraphic ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "srcGraphic" is successfully loaded,               }
{ otherwise FALSE.  No attempt is made to update the display of the image.     }
{ It may still be manipulated without displaying it.                           }
{******************************************************************************}
begin
  FFileName := 'Graphic.tif';
  FOrigFileName := '';
  origImageLoaded := TRUE;
  OverlayList := '';
  CurrentImagePosition := '';
  CurrentImageSelection := 0;
  if not ImageScrollBox.Graphic.IsEmpty then ImageScrollBox.Clear;
  LoadingScrollPositionX := 0;
  LoadingScrollPositionY := 0;
  isFrozen := FALSE;
  UpdateImageDisplay( FALSE );
  ImageScrollBox.Graphic.Assign( srcGraphic );
  Result := TRUE;
end;

function TEnProWinFrame.LoadGraphicCrop( const srcGraphic : TDibGraphic; srcRect : TRect ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "srcRect" of "srcGraphic" is successfully loaded,  }
{ otherwise FALSE.                                                             }
{******************************************************************************}
begin
  Result := LoadGraphicHidden( srcGraphic );
  Crop( srcRect );
  Redraw( TRUE );
end;

function TEnProWinFrame.LoadGraphicCrop( imgWinFrame : TEnProWinFrame; srcRect : TRect ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "srcRect" of "srcGraphic" is successfully loaded,  }
{ otherwise FALSE.                                                             }
{******************************************************************************}
begin
  Result := LoadGraphicCrop( imgWinFrame.ImageScrollBox.Graphic, srcRect );
end;

function TEnProWinFrame.LoadGraphicCrop( imgWinFrame : TEnProWinFrame; Pos : String; Selection : Integer ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "srcRect" of "srcGraphic" is successfully loaded,  }
{ otherwise FALSE.                                                             }
{******************************************************************************}
begin
  Result := LoadGraphicCrop( imgWinFrame, EnProWin.CalcPosToRect( imgWinFrame, Pos, Selection ) );
end;

procedure TEnProWinFrame.Clear;
{******************************************************************************}
{ Clears the displayed image.                                                  }
{******************************************************************************}
begin
  FFileName := '';
  FOrigFileName := '';
  origImageLoaded := TRUE;
  OverlayList := '';
  CurrentImagePosition := '';
  CurrentImageSelection := 0;
  if not ImageScrollBox.Graphic.IsEmpty then ImageScrollBox.Clear;
//if caption <> '' then begin
//  isFrozen := FALSE;
//  UpdateImageDisplay( FALSE );
//end;
end;

function TEnProWinFrame.Save( fileName : String; compression : TTiffCompression; quality : TJPEGQuality ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given image file name is successfully saved with         }
{ the given "compression" and/or "quality".                                    }
{******************************************************************************}
begin
  saveCompression := compression;
  saveQuality := quality;
  try
    ImageScrollBox.SaveToFile( fileName );
  except
    on E : Exception do begin
//    ShowMessage( E.Message );
      Result := FALSE;
      Exit;
    end;
  end;
  Result := TRUE;
end;

function TEnProWinFrame.GetCacheFileName : String;
{******************************************************************************}
{ Gets the currently loaded cached file name.                                  }
{******************************************************************************}
begin
  Result := ImageScrollBox.ReadAheadFileName;
end;

procedure TEnProWinFrame.SetCacheFileName( const FileName : String );
{******************************************************************************}
{ Sets the cache file name that will be loaded in background if possible.      }
{ This speeds up loading that image if it is the next image requested.         }
{******************************************************************************}
begin
  ImageScrollBox.ReadAheadFileName := FileName;
end;

function TEnProWinFrame.Info( var fileName : String; var width, height, xdpi, ydpi : Integer; var imageFormat : TImageFormat; var compression : TTiffCompression; var quality : TJPEGQuality ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given image information was successfully returned.       }
{******************************************************************************}
var
  graphic : TDibGraphic;
begin
  Result := FALSE;
  graphic := ImageScrollBox.Graphic;
  if graphic.IsEmpty then Exit;
  fileName := ImageScrollBox.FileName;
  width    := graphic.Width;
  height   := graphic.Height;
  xdpi     := graphic.XDotsPerInch;
  ydpi     := graphic.YDotsPerInch;
  imageFormat := graphic.ImageFormat;
  if graphic is TTiffGraphic then compression := TTiffGraphic(graphic).Compression
  else compression := tcNone;
  if graphic is TJpegGraphic then quality := TJpegGraphic(graphic).SaveQuality
  else quality := 100;
  Result := TRUE;
end;

function TEnProWinFrame.DeskewAngle( maxAngle : Double ) : Double;
{******************************************************************************}
{ Returns the angle in degrees that the image should be rotated to deskew it.  }
{******************************************************************************}
begin
  Result := EnDeskewAngleBW( ImageScrollBox.Graphic, maxAngle );
end;

function TEnProWinFrame.Deskew( canResize : Boolean; maxAngle : Double ) : Double;
{******************************************************************************}
{ Returns the angle in degrees that the image was given to be rotated.         }
{******************************************************************************}
begin
  Result := Deskew( canResize, MakeRgb( 255, 255, 255 ), maxAngle );
end;

function TEnProWinFrame.Deskew( canResize : Boolean; const bgColor : TRgb; maxAngle : Double ) : Double;
{******************************************************************************}
{ Returns the angle in degrees that the image was given to be rotated.         }
{******************************************************************************}
var
  graphic : TDibGraphic;
begin
  graphic := TDibGraphic.Create;
  BeginHourglass;
  try
    Result := EnDeskewAngleBW( ImageScrollBox.Graphic, maxAngle );
    if Result <> 0.00 then begin
      graphic.Assign( ImageScrollBox.Graphic );
      EnDeskewBW( graphic, ImageScrollBox.Graphic, canResize, bgColor, maxAngle, Result );
    end;
  finally
    EndHourglass;
    graphic.Free;
  end;
end;

procedure TEnProWinFrame.Rotate( angle : Double );
{******************************************************************************}
{ Rotates the current image the given "angle" clockwise in degrees.            }
{******************************************************************************}
var
  ok : Boolean;
  graphic : TDibGraphic;
  rotateTransform : TRotateTransform;
begin
  graphic := TDibGraphic.Create;
  rotateTransform := TRotateTransform.Create;
  BeginHourglass;
  try
    graphic.Assign( ImageScrollBox.Graphic );
    ok := FALSE;
    if angle =  90.0 then ok := EnRotateBW90(  graphic, ImageScrollBox.Graphic );
    if angle = 180.0 then ok := EnRotateBW180( graphic, ImageScrollBox.Graphic );
    if angle = 270.0 then ok := EnRotateBW270( graphic, ImageScrollBox.Graphic );
    if not ok then begin
//    rotateTransform.OnProgress :=
      rotateTransform.Angle := angle;
      rotateTransform.BackgroundColor := MakeRgb( 255, 255, 255 );
      rotateTransform.ApplyOnDest( graphic, ImageScrollBox.Graphic );
    end;
  finally
    EndHourglass;
    rotateTransform.Free;
    graphic.Free;
  end;
end;

procedure TEnProWinFrame.BorderCleanup( maxDepthInches : Double );
{******************************************************************************}
{ Cleans up the borders of the given image to the given depth.                 }
{******************************************************************************}
begin
  EnBorderCleanup( ImageScrollBox.Graphic, maxDepthInches );
end;

procedure TEnProWinFrame.BorderCleanup( maxDepthInches : Double; const bgColor : TRgb );
{******************************************************************************}
{ Cleans up the borders of the given image to the given depth.                 }
{******************************************************************************}
begin
  EnBorderCleanup( ImageScrollBox.Graphic, maxDepthInches, bgColor );
end;

procedure TEnProWinFrame.ChangeRes( xdpi, ydpi : Integer );
{******************************************************************************}
{ Changes the resolution of the current image to the given "xdpi" and "ydpi".  }
{******************************************************************************}
var
  graphic : TDibGraphic;
  resizeTransform : TResizeTransform;
begin
  graphic := TDibGraphic.Create;
  resizeTransform := TResizeTransform.Create;
  BeginHourglass;
  try
    graphic.Assign( ImageScrollBox.Graphic );
    resizeTransform.Interpolated := FALSE;
    resizeTransform.Width  := Trunc( ( xdpi * ImageScrollBox.Graphic.Width  ) / ImageScrollBox.Graphic.XDotsPerInch );
    resizeTransform.Height := Trunc( ( ydpi * ImageScrollBox.Graphic.Height ) / ImageScrollBox.Graphic.YDotsPerInch );
    resizeTransform.ApplyOnDest( graphic, ImageScrollBox.Graphic );
  finally
    EndHourglass;
    resizeTransform.Free;
    graphic.Free;
  end;
  ImageScrollBox.Graphic.XDotsPerInch := xdpi;
  ImageScrollBox.Graphic.YDotsPerInch := ydpi;
end;

procedure TEnProWinFrame.ChangeSize( width, height : Integer );
{******************************************************************************}
{ Changes the size of the current image to the given "width" and "height".     }
{******************************************************************************}
var
  xdpi, ydpi : Integer;
begin
  xdpi := Round( ( width  * ImageScrollBox.Graphic.XDotsPerInch ) / ImageScrollBox.Graphic.Width );
  ydpi := Round( ( height * ImageScrollBox.Graphic.YDotsPerInch ) / ImageScrollBox.Graphic.Height );
  ChangeRes( xdpi, ydpi );
end;

function TEnProWinFrame.FindBorders : TRect;
{******************************************************************************}
{ Finds the borders of the image.                                              }
{******************************************************************************}
begin
  Result := FindBorders( MakeRgb( 255, 255, 255 ) );
end;

function TEnProWinFrame.FindBorders( const bgColor : TRgb ) : TRect;
{******************************************************************************}
{ Finds the borders of the image.                                              }
{******************************************************************************}
begin
  Result := EnFindBordersBW( ImageScrollBox.Graphic, bgColor );
end;

procedure TEnProWinFrame.Crop( srcRect : TRect );
{******************************************************************************}
{ Crops the image so that only "srcRect" remains.                              }
{******************************************************************************}
var
  ok : Boolean;
  graphic : TDibGraphic;
  cropTransform : TCropTransform;
begin
  graphic := TDibGraphic.Create;
  try
    graphic.Assign( ImageScrollBox.Graphic );
    ok := EnCropBW( graphic, srcRect, ImageScrollBox.Graphic );
    if not ok then begin
      cropTransform := TCropTransform.Create;
      try
//      cropTransform.OnProgress :=
        cropTransform.Left   := srcRect.Left;
        cropTransform.Top    := srcRect.Top;
        cropTransform.Right  := ImageScrollBox.Graphic.Width - srcRect.Right;   // In from the right?
        cropTransform.Bottom := ImageScrollBox.Graphic.Height - srcRect.Bottom; // Up from the bottom?
        cropTransform.ApplyOnDest( graphic, ImageScrollBox.Graphic );
      finally cropTransform.Free; end;
    end;
  finally graphic.Free; end;
end;

procedure TEnProWinFrame.Crop( Pos : String; Selection : Integer );
{******************************************************************************}
{ Crops the image to the given "Pos" and "Selection" (see ImagePosition).      }
{******************************************************************************}
begin
  Crop( CalcPosToRect( Pos, Selection ) );
end;

procedure TEnProWinFrame.Redraw( graphicChanged : Boolean );
{******************************************************************************}
{ Forces the loaded image to be redrawn.  An indication as to if the graphic   }
{ image has changed since the last time it was drawn is given.                 }
{******************************************************************************}
begin
  ImageScrollBox.Redraw( graphicChanged );
//if not Visible then Show;
  Update;
end;

procedure TEnProWinFrame.WriteText( fontName : String; fontSize : Integer; fontStyles : TFontStyles; fontColor : TColor; xPosPcnt, yPosPcnt : Double; text : String );
{******************************************************************************}
{ Writes the given "text" to the current image using the given "fontName",     }
{ "fontSize", "xPosPcnt", and "yPosPcnt"                                       }
{******************************************************************************}
var
  x, y : Integer;
begin
  ImageScrollBox.Graphic.Canvas.Font.Name  := fontName;
  ImageScrollBox.Graphic.Canvas.Font.Size  := fontSize;
  ImageScrollBox.Graphic.Canvas.Font.Style := fontStyles;
  ImageScrollBox.Graphic.Canvas.Font.Color := fontColor;
  x := Trunc( ( xPosPcnt * ImageScrollBox.Graphic.Width  ) / 100 );
  y := Trunc( ( yPosPcnt * ImageScrollBox.Graphic.Height ) / 100 );
  ImageScrollBox.Graphic.Canvas.TextOut( x, y, text );
end;

function TEnProWinFrame.Overlay( fileName : String; copyMode : TCopyMode ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the given "fileName" was successfully overlayed onto the     }
{ current image.                                                               }
{                                                                              }
{ NOTE - cmSrcAnd is the desired copy mode for black on white images.          }
{******************************************************************************}
var
  stream : TFileStream;
  tmpGraphic : TDibGraphic;
  resizeTransform : TResizeTransform;
begin
  Result := FALSE;
  try
    BeginHourglass;
    try
      { Load or reload overlay file if it is different }
      if ( not Assigned( overlayGraphic ) )
      or overlayGraphic.IsEmpty
      or ( overlayGraphicFileName <> fileName )
      or ( overlayGraphic.Width <> ImageScrollBox.Graphic.Width )
      or ( overlayGraphic.Height <> ImageScrollBox.Graphic.Height ) then begin
        OverlayDone;      // Release old resources
        overlayGraphic.Free;
        overlayGraphic := NewDibGraphic( fileName );
        stream := TFileStream.Create( fileName, fmOpenRead or fmShareDenyNone );
        try
          overlayGraphic.MultiLoad := FALSE;
          overlayGraphic.ImageToLoad := 1;
          overlayGraphic.LoadFromStream( stream );
        finally
          stream.Free;
        end;
        overlayGraphicFileName := fileName;
      end;
      { Resize overlay file if necessary }
      if ( overlayGraphic.Width <> ImageScrollBox.Graphic.Width )
      or ( overlayGraphic.Height <> ImageScrollBox.Graphic.Height ) then begin
        tmpGraphic := TDibGraphic.Create;
        resizeTransform := TResizeTransform.Create;
        try
          tmpGraphic.Assign( overlayGraphic );
          resizeTransform.Interpolated := FALSE;
          resizeTransform.Width  := ImageScrollBox.Graphic.Width;
          resizeTransform.Height := ImageScrollBox.Graphic.Height;
          resizeTransform.ApplyOnDest( tmpGraphic, overlayGraphic );
          overlayGraphic.XDotsPerInch := ImageScrollBox.Graphic.XDotsPerInch;
          overlayGraphic.YDotsPerInch := ImageScrollBox.Graphic.YDotsPerInch;
        finally
          resizeTransform.Free;
          tmpGraphic.Free;
        end;
      end;
      { Do the actual overlaying }
      ImageScrollBox.Graphic.Canvas.CopyMode := copyMode;
      ImageScrollBox.Graphic.Canvas.CopyRect( Rect( 0, 0, ImageScrollBox.Graphic.Width, ImageScrollBox.Graphic.Height ), overlayGraphic.Canvas, Rect( 0, 0, overlayGraphic.Width, overlayGraphic.Height ) );
    finally
      EndHourglass;
    end;
  except
    on E : Exception do begin
//    ShowMessage( E.Message );
      Exit;
    end;
  end;
  Result := TRUE;
end;

procedure TEnProWinFrame.OverlayDone;
{******************************************************************************}
{ Indicates that overlaying is finished and resources may be released.         }
{******************************************************************************}
begin
  overlayGraphic.Clear;
  overlayGraphicFileName := '';
end;

procedure TEnProWinFrame.EnableRotating( enable : Boolean );
{******************************************************************************}
{ Allows rotating options to be enabled.                                       }
{******************************************************************************}
begin
  RotateLeftBtn .Visible := enable;
  RotateRightBtn.Visible := enable;
end;

procedure TEnProWinFrame.EnablePrinting( enable : Boolean );
{******************************************************************************}
{ Allows printing options to be enabled.                                       }
{******************************************************************************}
begin
  PrintSetupBtn    .Visible := enable;
  PrintBtn         .Visible := enable;
  PrintModeComboBox.Visible := enable;
end;

procedure TEnProWinFrame.FreezeDisplay;
{******************************************************************************}
{ Freeze display until either "ImageDisplay" or "ClearDisplay" is called.      }
{ This can be useful to stop unnecessary "ImagePosition" commands.             }
{******************************************************************************}
begin
  isFrozen := TRUE;
end;

procedure CalcPosPercent( imgWinFrame : TEnProWinFrame; var pos : String; selection : Integer; var leftPct, topPct, widthPct, heightPct : Double );
{******************************************************************************}
{ Calculates the positions as percentages and returns them in "leftPct",       }
{ "topPct", "widthPct", and "heigthPct".  "pos" returns the current            }
{ image positions as specified by "selection".  "pos" is formated              }
{ as '<x>,<y>,<w>,<h>' and is measured in percentages.  Multiple positions     }
{ are separated with a semicolon.  Screen layouts are separated with an        }
{ exclamation point.                                                           }
{******************************************************************************}
var
  s, t : String;
  i : Integer;
  scrnAdjStr : String;
  scrnAdjx : Double;
  scrnAdjy : Double;
  scrnScalex : Double;
  scrnScaley : Double;
begin
  { Determine screen layout }
  s := pos;
  for i := 1 to imgWinFrame.ScreenLayout do begin
    pos := EnStrGetNextToken( s, '!' );
    if s = '' then break;
  end;

  { Get coordinates }
  t := pos;
  for i := 1 to selection do begin
    s := EnStrGetNextToken( t, ';' );
  end;

  if s = '' then s := '0,0,0,0';
  leftPct   := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 0.0 );
  topPct    := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 0.0 );
  widthPct  := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 0.0 );
  heightPct := EnStrToFloatDef( EnStrGetNextToken( s, ';' ), 0.0 );

  { User Adjustments }
  leftPct := leftPct + imgWinFrame.AdjLeftPct;
  topPct  := topPct  + imgWinFrame.AdjTopPct;

  { Screen Adjustments }
  scrnAdjStr := imgWinFrame.ScreenAdjustment;
  for i := 1 to imgWinFrame.ScreenLayout do begin
    s := EnStrGetNextToken( scrnAdjStr, '!' );
    if s = '' then break;
  end;

  if s = '' then s := '0,0,100,100';
  scrnAdjx   := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 0.0 );
  scrnAdjy   := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 0.0 );
  scrnScalex := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 100.0 );
  scrnScaley := EnStrToFloatDef( EnStrGetNextToken( s, ',' ), 100.0 );

  LeftPct   := leftPct   * scrnScalex / 100.0;
  TopPct    := topPct    * scrnScaley / 100.0;
  WidthPct  := widthPct  * scrnScalex / 100.0;
  HeightPct := heightPct * scrnScaley / 100.0;

  leftPct := leftPct + scrnAdjx;
  topPct  := topPct  + scrnAdjy;
end;

procedure TEnProWinFrame.CalcPosPercent( var pos : String; selection : Integer; var leftPct, topPct, widthPct, heightPct : Double );
{******************************************************************************}
{ Calculates the positions as percentages and returns them in "leftPct",       }
{ "topPct", "widthPct", and "heigthPct".  "pos" returns the current            }
{ image positions as specified by "selection".  "pos" is formated              }
{ as '<x>,<y>,<w>,<h>' and is measured in percentages.  Multiple positions     }
{ are separated with a semicolon.  Screen layouts are separated with an        }
{ exclamation point.                                                           }
{******************************************************************************}
begin
  EnProWin.CalcPosPercent( self, pos, selection, leftPct, topPct, widthPct, heightPct );
end;

function CalcPosToRect( imgWinFrame : TEnProWinFrame; pos : String; selection : Integer ) : TRect;
{******************************************************************************}
{ Converts the given "Pos" and "Selection" to rectangular coordinates.         }
{******************************************************************************}
var
  lPct, tPct , wPct, hPct : Double;
  bx, by, bh, bw : Integer;       // Box position
begin
  { Determine adjusted percentages }
  CalcPosPercent( imgWinFrame, pos, selection, lPct, tPct, wPct, hPct );

  { Determine box positions - image coordinates }
  bx := Trunc( lPct * imgWinFrame.ImageScrollBox.Graphic.Width  ) div 100;
  by := Trunc( tPct * imgWinFrame.ImageScrollBox.Graphic.Height ) div 100;
  bw := Trunc( wPct * imgWinFrame.ImageScrollBox.Graphic.Width  ) div 100;
  bh := Trunc( hPct * imgWinFrame.ImageScrollBox.Graphic.Height ) div 100;

  Result := Rect( bx, by, bx+bw, by+bh );
end;

function CalcWinToImgRect( imgWinFrame : TEnProWinFrame; winRect : TRect ) : TRect;
{******************************************************************************}
{ Converts the window rectangule to image rectangular coordinates.             }
{******************************************************************************}
var
  ratio : Double;
begin
  ratio := imgWinFrame.ImageScrollBox.Graphic.Width / imgWinFrame.ImageScrollBox.DisplayedGraphic.Width;
  Result.Left   := Round( ratio * winRect.Left );
  Result.Right  := Round( ratio * winRect.Right );
  ratio := imgWinFrame.ImageScrollBox.Graphic.Height / imgWinFrame.ImageScrollBox.DisplayedGraphic.Height;
  Result.Top    := Round( ratio * winRect.Top );
  Result.Bottom := Round( ratio * winRect.Bottom );
end;

function TEnProWinFrame.CalcPosToRect( pos : String; selection : Integer ) : TRect;
{******************************************************************************}
{ Converts the given "Pos" and "Selection" to rectangular coordinates.         }
{******************************************************************************}
begin
  Result := EnProWin.CalcPosToRect( self, pos, selection );
end;

procedure TEnProWinFrame.ImagePosition( Pos : String; Selection : Integer; isLoading : Boolean; const overlayInfo : array of TOverlayInfo );
{******************************************************************************}
{ Positions the image using the given position.                                }
{ The format of the string is '<x>,<y>,<w>,<h>' measured in percentages.       }
{ Multiple positions are separated with a semicolon.                           }
{ Screen layouts are separated with an exclamation point.                      }
{                                                                              }
{ Box             bx                     bx+bw              b = box            }
{ ---          by +------------------------+                                   }
{                 |                        |                                   }
{         by+bh/2 o - - - - - - - - - - - -+                                   }
{                 |                        |                                   }
{           by+bh +------------------------+                                   }
{                                                                              }
{ Display         spx                         spx+dw        sp = scroll        }
{ -------     spy +------------------------------+               position      }
{                 |                              |                             }
{                 |                              |                             }
{                 |                              |                             }
{                 |                              |                             }
{                 |                              |                             }
{          spy+dh +------------------------------+                             }
{                                                                              }
{******************************************************************************}
const
  ScrollBarThickness = 20;
var
  lPct, tPct , wPct, hPct : Double;
  dw, dh : Integer;               // Display size
  spx, spy : Integer;             // Scroll position
  bx, by, bh, bw : Integer;       // Box position
  i : Integer;
begin
  { Determine adjusted percentages }
  CalcPosPercent( Pos, Selection, lPct, tPct, wPct, hPct );

  { Save current position }
  CurrentImagePosition := Pos;
  CurrentImageSelection := Selection;

  { No position }
  if ( wPct = 0 ) or ( hPct = 0 ) then begin
    RemoveOverlay( OverlayList );
    Exit;
  end;

  { Nothing can be done without the image }
  if ImageScrollBox.Graphic.IsEmpty then Exit;

  { Get last saved scroll positions }
  { This keeps it from moving when changing images }
  if isLoading then begin
    spx := LoadingScrollPositionX;
    spy := LoadingScrollPositionY;
  end else begin
    spx := ImageScrollBox.HorzScrollBar.ScrollPos;
    spy := ImageScrollBox.VertScrollBar.ScrollPos;
  end;

  { Get display size }
  dw := ImageScrollBox.ClientWidth;
  dh := ImageScrollBox.ClientHeight;

  { Determine box positions - screen coordinates }
  bx := Trunc( lPct * ImageScrollBox.DisplayedGraphic.Width  ) div 100;
  by := Trunc( tPct * ImageScrollBox.DisplayedGraphic.Height ) div 100;
  bw := Trunc( wPct * ImageScrollBox.DisplayedGraphic.Width  ) div 100;
  bh := Trunc( hPct * ImageScrollBox.DisplayedGraphic.Height ) div 100;

  { Add a little extra to account for scroll bars }
  bw := bw + ScrollBarThickness;
  bh := bh + ScrollBarThickness;

  { HORIZONTAL }

  { Box is outside on the right }
  if ( bx + bw ) > ( spx + dw ) then begin
    spx := bx + bw - dw;                        // Just bring it back in
  end;
  { Box is outside on the left }
  if bx < spx then begin
    spx := bx;                                  // Just bring it back in
  end;

  { VERTICAL Big Box }
  if dh > bh then begin

    { Box is outside above }
    if by < spy then begin
      spy := by;                                // Just bring it back in
    end;
    { Box is outside below }
    if ( by + bh ) > ( spy + dh ) then begin
      spy := by;                                // Bring it all the way to the top
    end;

  { VERTICAL Small Box }
  end else begin

    spy := by + ( bh div 2 ) - ( dh div 2 );    // Put it in the middle

  end;

  { Save where it would have moved if not frozen }
  LoadingScrollPositionX := spx;
  LoadingScrollPositionY := spy;

  { Do not move if frozen }
  if isFrozen then Exit;

  { Move to desired location }
  ImageScrollBox.HorzScrollBar.Position := spx;
  ImageScrollBox.VertScrollBar.Position := spy;

  { Remove scroll bar adjustment factors }
  bw := bw - ScrollBarThickness;
  bh := bh - ScrollBarThickness;

  { Debugging }
  if StatusBar.Visible then StatusBar.SimpleText := Format( 'Img( %d, %d )  Scrn( %d, %d )  Disp( %d, %d, %d, %d )  Box( %d, %d, %d, %d )', [ ImageScrollBox.Graphic.Width, ImageScrollBox.Graphic.Height, ImageScrollBox.DisplayedGraphic.Width, ImageScrollBox.DisplayedGraphic.Height, ImageScrollBox.HorzScrollBar.Position, ImageScrollBox.VertScrollBar.Position, ImageScrollBox.ClientWidth, ImageScrollBox.ClientHeight, bx, by, bw, bh ] );

  { Erase and draw selection rectangle }
  RemoveOverlay( OverlayList );
  if not isLoading then begin
    AddOverlay( Format( '%d,%d,%d,%d,%d', [ bx, by, bw, bh, HighlightColor ] ) );
    for i := 0 to High( overlayInfo ) do begin
      pos := overlayInfo[i].Pos;
      CalcPosPercent( pos, 1, lPct, tPct, wPct, hPct );
      bx := Trunc( lPct * ImageScrollBox.DisplayedGraphic.Width  ) div 100;
      by := Trunc( tPct * ImageScrollBox.DisplayedGraphic.Height ) div 100;
      bw := Trunc( wPct * ImageScrollBox.DisplayedGraphic.Width  ) div 100;
      bh := Trunc( hPct * ImageScrollBox.DisplayedGraphic.Height ) div 100;
      AddOverlay( Format( '%d,%d,%d,%d,%d', [ bx, by, bw, bh, overlayInfo[i].Color ] ) );
    end;
  end;
end;

procedure TEnProWinFrame.ImagePosition( Pos : String; Selection : Integer; isLoading : Boolean );
{******************************************************************************}
{ Allows simpler interface.                                                    }
{******************************************************************************}
var
  overlayInfo : TOverlayInfo;
begin
  overlayInfo.Pos := '';
  overlayInfo.Color := 0;
  ImagePosition( Pos, Selection, isLoading, overlayInfo );
end;

procedure TEnProWinFrame.ImagePosition( srcRect : TRect; isLoading : Boolean );
{******************************************************************************}
{ Allows positioning an image using TRect.                                     }
{******************************************************************************}
begin
  ImagePosition( Format( '%f,%f,%f,%f', [ 100.0 * Min( srcRect.Left, srcRect.Right ) / ImageScrollBox.Graphic.Width,
                                          100.0 * Min( srcRect.Top, srcRect.Bottom ) / ImageScrollBox.Graphic.Height,
                                          100.0 * Abs( srcRect.Right - srcRect.Left ) / ImageScrollBox.Graphic.Width,
                                          100.0 * Abs( srcRect.Bottom - srcRect.Top ) / ImageScrollBox.Graphic.Height ] ),
                                          1, isLoading );
end;

procedure TEnProWinFrame.ImagePosition( x0, y0, x1, y1 : Integer; isLoading : Boolean );
{******************************************************************************}
{ Allows positioning an image using coordinates.                               }
{******************************************************************************}
begin
  ImagePosition( Rect( x0, y0, x1, y1 ), isLoading );
end;

procedure TEnProWinFrame.DrawOverlayBoxOnImage( addOverlay : Boolean; x1, y1, x2, y2 : Integer; color : TColor; penMode : TPenMode );
{******************************************************************************}
{ Draws (or removes) the box on the image at the given coordinates using       }
{ the given color and penMode.                                                 }
{******************************************************************************}
var
  xFactor, yFactor : Double;
begin
  { Get scaling factors }
  xFactor := ImageScrollBox.DisplayedGraphic.Width  / ImageScrollBox.Graphic.Width;
  yFactor := ImageScrollBox.DisplayedGraphic.Height / ImageScrollBox.Graphic.Height;
  { Apply scaling factors }
  x1 := Trunc( x1 * xFactor );
  x2 := Trunc( x2 * xFactor );
  y1 := Trunc( y1 * yFactor );
  y2 := Trunc( y2 * yFactor );
  { Now apply to screen }
  DrawOverlayBoxOnScreen( addOverlay, x1, y1, x2, y2, color, penMode );
end;

procedure TEnProWinFrame.DrawOverlayBoxOnScreen( addOverlay : Boolean; x1, y1, x2, y2 : Integer; color : TColor; penMode : TPenMode );
{******************************************************************************}
{ Draws (or removes) the box on the screen at the given coordinates using      }
{ the given color and penMode.                                                 }
{******************************************************************************}
var
  i : Integer;
  hsb, vsb : Integer;
  fRect : TRect;
  fImageScrollBox : TProtectedScrollBox;
begin
  { Create canvas when needed }
  if not Assigned( FAnnotationCanvas ) then begin
    FAnnotationCanvas := TCanvas.Create;
    FAnnotationCanvas.Handle := GetDC( ImageScrollBox.Handle );
  end;

  { Get scroll bar positions }
  hsb := ImageScrollBox.HorzScrollBar.Position;
  vsb := ImageScrollBox.VertScrollBar.Position;
  { Adjust for scroll bar positions }
  x1 := x1 - hsb;  x2 := x2 - hsb;
  y1 := y1 - vsb;  y2 := y2 - vsb;
  { Put overlay on screen }
  if addOverlay then begin
    { Configure pen }
    FAnnotationCanvas.Pen.Style := psSolid;
    FAnnotationCanvas.Pen.Color := color;
    FAnnotationCanvas.Pen.Width := 1;
    FAnnotationCanvas.Pen.Mode := penMode;
    { Draw box on screen }
    for i := y1 to y2 do begin
      FAnnotationCanvas.MoveTo( x1, i );
      FAnnotationCanvas.LineTo( x2, i );
    end;
  { Remove overlay from screen }
  end else begin
    fRect := Rect( x1, y1, x2 + 1, y2 + 1 );
    fImageScrollBox := TProtectedScrollBox( ImageScrollBox );
    InvalidateRect( fImageScrollBox.FImage.Parent.Handle, @fRect, FALSE );
    UpdateWindow( fImageScrollBox.FImage.Parent.Handle );
  end;
end;

procedure TEnProWinFrame.DrawOverlayOnScreen( addOverlay : Boolean; annotationStr : String );
{******************************************************************************}
{ Draws (or removes) the given annotation string on the screen.                }
{******************************************************************************}
var
  bx, by, bw, bh : Integer;
  color : TColor;
  list : String;
begin
  list := annotationStr;
  while list <> '' do begin
    bx := StrToIntDef( EnStrGetNextToken( list, ',' ), 0 );
    by := StrToIntDef( EnStrGetNextToken( list, ',' ), 0 );;
    bw := StrToIntDef( EnStrGetNextToken( list, ',' ), 0 );;
    bh := StrToIntDef( EnStrGetNextToken( list, ',' ), 0 );;
    color := StrToIntDef( EnStrGetNextToken( list, ';' ), clYellow );;
    DrawOverlayBoxOnScreen( addOverlay, bx, by, bx+bw, by+bh, color, pmMask );
  end;
end;

procedure TEnProWinFrame.RemoveOverlay( list : String );
{******************************************************************************}
{ Removes the given overlay "list" from the global overlay list and refreshes  }
{ the screen.                                                                  }
{******************************************************************************}
begin
  { Remove from annotation list FIRST so it does not get repainted }
  OverlayList := EnStrReplace( OverlayList, list, '' );
  OverlayList := EnStrReplace( OverlayList, ';;', ';' );
  if OverlayList = ';' then OverlayList := '';
  DrawOverlayOnScreen( FALSE, list );
end;

procedure TEnProWinFrame.AddOverlay( list : String );
{******************************************************************************}
{ Adds the given overlay "list" to the global overlay list and refreshes       }
{ the screen.                                                                  }
{******************************************************************************}
begin
  OverlayList := EnStrAddToListUnique( OverlayList, ';', list, TRUE );
  DrawOverlayOnScreen( TRUE, list );
end;

procedure TEnProWinFrame.ImageSelection( Offset : Integer );
{******************************************************************************}
{ If the highlighted area has multiple selections, this chooses another one.   }
{******************************************************************************}
var
  i, n : Integer;
  s : String;
begin
  { Count number of available selections }
  n := 0;
  s := CurrentImagePosition;
  while EnStrGetNextToken( s, ';' ) <> '' do Inc( n );
  { Move offset amount }
  i := CurrentImageSelection + Offset;
  { Bounds check }
  if i < 1 then i := n;
  if i > n then i := 1;
  { Reposition }
  ImagePosition( CurrentImagePosition, i, FALSE );
end;

procedure TEnProWinFrame.ImageAdjustment( Adj : String );
{******************************************************************************}
{ Adjusts the positioning of the highlighted area horizontally and vertically. }
{ The format of the string is '<left>,<top>' measured in percentages.          }
{ The adjustment '0,0' removes all compensation.                               }
{******************************************************************************}
var
  LeftPct, TopPct : Double;
begin
  { Get setting }
  LeftPct := EnStrToFloatDef( EnStrGetNextToken( Adj, ',' ), 0.0 );
  TopPct  := EnStrToFloatDef( EnStrGetNextToken( Adj, ';' ), 0.0 );
  { Check for clearing values }
  if ( LeftPct = 0 ) and ( TopPct = 0 ) then begin
    AdjLeftPct := 0;
    AdjTopPct  := 0;
  end else begin
    AdjLeftPct := AdjLeftPct + LeftPct;
    AdjTopPct  := AdjTopPct  + TopPct;
  end;
  { Reposition }
  ImagePosition( CurrentImagePosition, CurrentImageSelection, FALSE );
end;

procedure TEnProWinFrame.SetHighlightColor( Color : TColor );
{******************************************************************************}
{ Sets the color used to highlight fields.                                     }
{******************************************************************************}
begin
  FHighlightColor := Color;
end;

procedure TEnProWinFrame.SetScreenLayout( Layout : Integer );
{******************************************************************************}
{ Sets the screen layout to the given "Layout" which goes from 1 .. N.         }
{ Screen layouts are separated with an exclamation point in position strings.  }
{******************************************************************************}
begin
  FScreenLayout := Layout;
end;

procedure TEnProWinFrame.SetScreenAdjustment( Adjustment : String );
{******************************************************************************}
{ Sets the screen adjustment to the given "Adjustment".                        }
{ This is usefull for zoning because an x,y offset can be specified along      }
{ with a scale factor.  The default value is 0,0,100,100.                      }
{ The format of the string is '<x>,<y>,<xscale>,<yscale>' measured in percent. }
{ Screen layouts are separated with an exclamation point.                      }
{******************************************************************************}
begin
  FScreenAdjustment := Adjustment;
end;

procedure TEnProWinFrame.SetMarkSenseAdjustment( Adjustment : String );
{******************************************************************************}
{ Sets the mark sense adjustment to the given "Adjustment".                    }
{******************************************************************************}
begin
  FMarkSenseAdjustment := Adjustment;
end;

function TEnProWinFrame.ImageMarkSenseEx( Pos : String; Selection : Integer; GridWidth, GridHeight, GridIndex, GridStyle : Integer; var NumBlackStr, NumPixelsStr : String ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ on the current image at the given "Pos" and "Selection" (see ImagePosition). }
{ This area can further be broken up into a grid that is "GridWidth" by        }
{ "GridHeight".  The grid is numbered sequentially starting with 1 in the      }
{ upper left hand corner and goes from left to right then top to bottom.       }
{ The desired grid location is specified with "GridIndex".  The desired        }
{ "GridStyle" is currently undefined but should be set to 1.                   }
{ The number of black pixels and number of pixels examined is returned in      }
{ the comma delimited "NumBlackStr" and "NumPixelsStr" strings.  There is      }
{ a value for each "GridIndex" value.                                          }
{******************************************************************************}
var
  lPct, tPct , wPct, hPct : Double;
  bx, by, bh, bw : Integer;       // Box position
  gx, gy : Integer;               // Grid position
  numBlack, numPixels : Integer;
begin
  { Determine adjusted percentages }
  CalcPosPercent( Pos, Selection, lPct, tPct, wPct, hPct );

  { Determine box positions - image coordinates }
  bx := Trunc( lPct * ImageScrollBox.Graphic.Width  ) div 100;
  by := Trunc( tPct * ImageScrollBox.Graphic.Height ) div 100;
  bw := Trunc( wPct * ImageScrollBox.Graphic.Width  ) div 100;
  bh := Trunc( hPct * ImageScrollBox.Graphic.Height ) div 100;

  { Check and determine grid location }
  if GridIndex  < 1 then GridIndex  := 1;
  if GridWidth  < 1 then GridWidth  := 1;
  if GridHeight < 1 then GridHeight := 1;
  gx := ( GridIndex - 1 ) mod GridWidth;
  gy := ( GridIndex - 1 ) div GridWidth;
  if gy > ( GridHeight - 1 ) then gy := ( GridHeight - 1 );

  { Get box positions inside grid }
  bw := bw div GridWidth;
  bh := bh div GridHeight;
  bx := bx + ( gx * bw );
  by := by + ( gy * bh );

//DrawOverlayBoxOnImage(  TRUE, bx, by, bx+bw, by+bh, TColor($01FF00), pmMask );
//Application.ProcessMessages;  Sleep( 100 );
//DrawOverlayBoxOnImage( FALSE, bx, by, bx+bw, by+bh, TColor($01FF00), pmMask );

  Result := EnPercentBlackPixelsBW( ImageScrollBox.Graphic, Rect( bx, by, bx+bw, by+bh ), numBlack, numPixels );
  numBlackStr := IntToStr( numBlack );
  numPixelsStr := IntToStr( numPixels );
end;

function TEnProWinFrame.ImageMarkSense( Pos : String; Selection : Integer; GridWidth, GridHeight, GridIndex, GridStyle : Integer ) : Integer;
{******************************************************************************}
{ Returns 0 .. 10000 which indicates the percentage of pixels that are black   }
{ on the current image at the given "Pos" and "Selection" (see ImagePosition). }
{ This area can further be broken up into a grid that is "GridWidth" by        }
{ "GridHeight".  The grid is numbered sequentially starting with 1 in the      }
{ upper left hand corner and goes from left to right then top to bottom.       }
{ The desired grid location is specified with "GridIndex".  The desired        }
{ "GridStyle" is currently undefined but should be set to 1.                   }
{******************************************************************************}
var
  numBlackStr : String;
  numPixelsStr : String;
begin
  Result := ImageMarkSenseEx( Pos, Selection, GridWidth, GridHeight, GridIndex, GridStyle, numBlackStr, numPixelsStr );
end;

function TEnProWinFrame.ImageCenterAdjustment( Pos : String; Selection : Integer; RowThresholdPct, ColThresholdPct : Double; var LeftPct, TopPct : Double ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the center adjustment was determined, otherwise FALSE.       }
{ The current image at the given "Pos" and "Selection" (see ImagePosition)     }
{ is scanned.  The values returned in "LeftPct" and "TopPct" are appropriate   }
{ for use in the ImageAdjustment string.                                       }
{******************************************************************************}
var
  lPct, tPct, wPct, hPct : Double;
  lPctNeg, tPctNeg : Double;
  bx, by, bh, bw : Integer;       // Box position
  numRight, numDown : LongInt;
  lineRect : TRect;
//rptText : String;
begin
  Result := FALSE;
  { Determine adjusted percentages }
  CalcPosPercent( Pos, Selection, lPct, tPct, wPct, hPct );

  { See if negative offsets should be removed first }
  lPctNeg := 0.0;
  if lPct < 0.0 then begin
    wPct := wPct + lPct;        // Reduce width by amount off the screen
    if wPct < 0.0 then Exit;    // If no width on the screen then can't adjust
    lPctNeg := lPct;            // Save amount off the screen
    lPct := 0.0;                // Clip to the edge
  end;

  tPctNeg := 0.0;
  if tPct < 0.0 then begin
    hPct := hPct + tPct;        // Reduce height by amount off the screen
    if hPct < 0.0 then Exit;    // If no height on the screen then can't adjust
    tPctNeg := tPct;            // Save amount off the screen
    tPct := 0.0;                // Clip to the edge
  end;

  { Determine box positions - image coordinates }
  bx := Trunc( lPct * ImageScrollBox.Graphic.Width  ) div 100;
  by := Trunc( tPct * ImageScrollBox.Graphic.Height ) div 100;
  bw := Trunc( wPct * ImageScrollBox.Graphic.Width  ) div 100;
  bh := Trunc( hPct * ImageScrollBox.Graphic.Height ) div 100;

//DrawOverlayBoxOnImage(  TRUE, bx, by, bx+bw, by+bh, TColor($01FF00), pmMask );
//Application.ProcessMessages;  Sleep( 300 );
//DrawOverlayBoxOnImage( FALSE, bx, by, bx+bw, by+bh, TColor($01FF00), pmMask );

  Result := EnTextLineDetectionBW( ImageScrollBox.Graphic, Rect( bx, by, bx+bw, by+bh ), RowThresholdPct, ColThresholdPct, lineRect, numRight, numDown );
  if Result then begin
    { Add back in any negative offsets }
    if lPctNeg <> 0.0 then begin
      numRight := numRight + Round( ( lPctNeg * ImageScrollBox.Graphic.Width ) / 100 / 2 );
    end;
    if tPctNeg <> 0.0 then begin
      numDown := numDown + Round( ( tPctNeg * ImageScrollBox.Graphic.Height ) / 100 / 2 );
    end;

    { Calculate percentages }
    if ( numRight >= -1 ) and ( numRight <= 1 ) then LeftPct := 0.0 else LeftPct := - ( 100.0 * numRight ) / ImageScrollBox.Graphic.Width;
    if ( numDown  >= -1 ) and ( numDown  <= 1 ) then TopPct  := 0.0 else TopPct  := - ( 100.0 * numDown  ) / ImageScrollBox.Graphic.Height;
    (*
    rptText := rptText + Format( 'Image is %d wide by %d high', [ ImageScrollBox.Graphic.Width, ImageScrollBox.Graphic.Height ] ) + CRLF;
    rptText := rptText + Format( 'Highlight %f, %f, %f, %f', [ lPct, tPct, wPct, hPct ] ) + CRLF;
    rptText := rptText + Format( 'Copying %d, %d, %d, %d', [ bx, by, bw, bh ] ) + CRLF;
    rptText := rptText + Format( 'Rectangle is %d wide by %d high', [ bx+bw, by+bh ] ) + CRLF;
    rptText := rptText + Format( 'Needs to adjust %d right and %d down', [ numRight, numDown ] ) + CRLF;
    rptText := rptText + Format( 'Which is %f left and %f up', [ LeftPct, TopPct ] ) + CRLF;
    ShowMessage( rptText );
    *)
  end;
end;

function TEnProWinFrame.ImageOCR( Pos : String; Selection : Integer; Params : String; TypeOCR : TImageTypeOCR; CharSet : TOCRCharSet; PictureMask : String; MinConf : Double; var strResult : array of TOCRStringResult ) : Boolean;
{******************************************************************************}
{ Returns TRUE if OCR results are available on the current image at the        }
{ given "Pos" and "Selection" (see ImagePosition), otherwise FALSE.            }
{ The given "Params", "TypeOCR", "CharSet", "PictureMask", and "Conf" are      }
{ used in the determination with all results returned in "strResult".          }
{******************************************************************************}
begin
  Params := EnStrAddToList( Format( 'CONF=%f', [ MinConf ] ), ';', Params );
  Result := EnOCRLineBW( ImageScrollBox.Graphic, CalcPosToRect( Pos, Selection ), Params, TypeOCR, CharSet, PictureMask, strResult );
end;

function TEnProWinFrame.ImageBarcode( Pos : String; Selection : Integer; Params : String; TypeBarcode : TImageTypeBarcode; var strResults : array of TBarcodeStringResult ) : Boolean;
{******************************************************************************}
{ Returns TRUE if the barcode results are available on the current image       }
{ at the given "Pos" and "Selection" (see ImagePosition), otherwise FALSE.     }
{ The given "Params" and "TypeBarcode" are used in the determination with      }
{ all results returned in "strResult".                                         }
{******************************************************************************}
begin
  Result := EnReadBarcodeBW( ImageScrollBox.Graphic, CalcPosToRect( Pos, Selection ), Params, TypeBarcode, strResults );
end;

procedure TEnProWinFrame.FrameResize(Sender: TObject);
{******************************************************************************}
{ Occurs when frame is resized.                                                }
{******************************************************************************}
begin
  if not isFrozen then begin
    { Remove any overlays before the display changes }
    RemoveOverlay( OverlayList );
    { And put overlays back again after changes }
    ImagePosition( CurrentImagePosition, CurrentImageSelection, FALSE );
  end;
end;

procedure TEnProWinFrame.ZoomInBtnClick(Sender: TObject);
{******************************************************************************}
{ Zoom in.                                                                     }
{******************************************************************************}
var
  newZoomFactor : Integer;
begin
  ZoomType := ztUserSelected;
  ZoomFactor := Trunc( ImageScrollBox.ZoomPercent );
  newZoomFactor := Trunc( ZoomFactor * 1.10 );
  if ZoomFactor = newZoomFactor then Inc( ZoomFactor )
  else ZoomFactor := newZoomFactor;
  if ZoomFactor > 400 then ZoomFactor := 400;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.ZoomOutBtnClick(Sender: TObject);
{******************************************************************************}
{ Zoom out.                                                                    }
{******************************************************************************}
var
  newZoomFactor : Integer;
begin
  ZoomType := ztUserSelected;
  ZoomFactor := Trunc( ImageScrollBox.ZoomPercent );
  newZoomFactor := Trunc( ZoomFactor / 1.10 );
  if ZoomFactor = newZoomFactor then Dec( ZoomFactor )
  else ZoomFactor := newZoomFactor;
  if ZoomFactor < 2 then ZoomFactor := 2;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.FitHeightBtnClick(Sender: TObject);
{******************************************************************************}
{ Fit height.                                                                  }
{******************************************************************************}
begin
  ZoomType := ztFitHeight;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.FitWidthBtnClick(Sender: TObject);
{******************************************************************************}
{ Fit width.                                                                   }
{******************************************************************************}
begin
  ZoomType := ztFitWidth;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.BestFitBtnClick(Sender: TObject);
{******************************************************************************}
{ Best fit.                                                                    }
{******************************************************************************}
begin
  ZoomType := ztBestFit;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.ActualSizeBtnClick(Sender: TObject);
{******************************************************************************}
{ Actual size.                                                                 }
{******************************************************************************}
begin
  ZoomType := ztActualSize;
  ZoomComboBox.ItemIndex := -1;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.ZoomComboBoxChange(Sender: TObject);
{******************************************************************************}
{ Zoom selection changes.                                                      }
{******************************************************************************}
begin
  ZoomType := ztUserSelected;
       if ZoomComboBox.Text =  '10%' then  ZoomFactor :=  10
  else if ZoomComboBox.Text =  '20%' then  ZoomFactor :=  20
  else if ZoomComboBox.Text =  '30%' then  ZoomFactor :=  30
  else if ZoomComboBox.Text =  '40%' then  ZoomFactor :=  40
  else if ZoomComboBox.Text =  '50%' then  ZoomFactor :=  50
  else if ZoomComboBox.Text =  '75%' then  ZoomFactor :=  75
  else if ZoomComboBox.Text = '100%' then  ZoomFactor := 100
  else if ZoomComboBox.Text = '125%' then  ZoomFactor := 125
  else if ZoomComboBox.Text = '150%' then  ZoomFactor := 150
  else if ZoomComboBox.Text = '200%' then  ZoomFactor := 200
  else if ZoomComboBox.Text = '400%' then  ZoomFactor := 400
  else ZoomFactor := 100;
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.DispAlgComboBoxChange(Sender: TObject);
{******************************************************************************}
{ Display algorithm changes.                                                   }
{******************************************************************************}
begin
  UpdateImageDisplay( TRUE );
end;

procedure TEnProWinFrame.RotateLeftBtnClick(Sender: TObject);
{******************************************************************************}
{ Rotate left.                                                                 }
{******************************************************************************}
begin
  Rotate( 270.0 );
  Redraw( TRUE );
end;

procedure TEnProWinFrame.RotateRightBtnClick(Sender: TObject);
{******************************************************************************}
{ Rotate right.                                                                }
{******************************************************************************}
begin
  Rotate( 90.0 );
  Redraw( TRUE );
end;

procedure TEnProWinFrame.PrintSetupBtnClick(Sender: TObject);
{******************************************************************************}
{ Display printer setup dialog.                                                }
{******************************************************************************}
var
  dialog : TPrinterSetupDialog;
begin
  dialog := TPrinterSetupDialog.Create( nil );
  try
    dialog.Execute;
  finally
    dialog.Free;
  end;
end;

procedure TEnProWinFrame.PrintBtnClick(Sender: TObject);
{******************************************************************************}
{ Print current image.                                                         }
{******************************************************************************}
var
  graphicPrinter : TDibGraphicPrinter;
begin
  graphicPrinter := TDibGraphicPrinter.Create;
  try
    graphicPrinter.PrintMode := pmFullPage;
    case PrintModeComboBox.ItemIndex of
    0 : graphicPrinter.PrintMode := pmOriginalSize;
    2 : graphicPrinter.PrintMode := pmStretchToPage;
    end;
    graphicPrinter.UsePrintJob := TRUE;
    graphicPrinter.Title := ExtractFileName( FFileName );
    graphicPrinter.Print( ImageScrollBox.Graphic );
  finally
    graphicPrinter.Free;
  end;
end;

procedure TEnProWinFrame.UpdateImageDisplay( andOverlays : Boolean );
{******************************************************************************}
{ Updates image properties and sets the form caption.                          }
{******************************************************************************}
begin
  { Remove any overlays before the display changes }
  RemoveOverlay( OverlayList );

  { Display scale algorithm }
  ImageScrollBox.AntiAliased := ( DispAlgComboBox.Text <> 'Normal' );

  { Zoom }
  case ZoomType of
  ztBestFit :       ImageScrollBox.ZoomMode := zmFitToPage;     
  ztFitWidth :      ImageScrollBox.ZoomMode := zmFitWidth;
  ztFitHeight :     ImageScrollBox.ZoomMode := zmFitHeight;
  ztActualSize :    ImageScrollBox.ZoomMode := zmOriginalSize;
  ztUserSelected :  ImageScrollBox.ZoomPercent := ZoomFactor;
  end;

  ZoomFactor := Trunc( ImageScrollBox.ZoomPercent );

  { And put overlays back again after changes }
  if andOverlays then begin
    ImagePosition( CurrentImagePosition, CurrentImageSelection, FALSE );
  end;

  if Assigned( FOnCaption ) then FOnCaption( GetCaption );
end;

function TEnProWinFrame.GetCaption : String;
{******************************************************************************}
{ Returns a string that may be used in a caption.                              }
{******************************************************************************}
begin
  { Zoom }
  if fileName = '' then begin
    Result := ''
  end else begin
    case ZoomType of
    ztBestFit :       Result := '(best fit)';
    ztFitWidth :      Result := '(fit width)';
    ztFitHeight :     Result := '(fit height)';
    ztActualSize :    Result := '(actual size)';
    ztUserSelected :  Result := Format('(zoom %d%%)', [ ZoomFactor ] );
    end;
    if not origImageLoaded then begin
      Result := Result + ' PREVIEWING ' + ExtractFileName( FFileName );
    end;
  end;
end;

end.
