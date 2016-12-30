unit EnOCRTraining;
{##############################################################################}
{ EnOCRTraining - Provides window for simple OCR training and testing.         }
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
{          Jan 27, 2002. Nick Boland, enhance some OCR training features       }
{          Mar 28, 2002. Nick Boland, add GNU Lessor General Public License    }
{##############################################################################}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,
  EnProWin, ComCtrls, ExtCtrls;

type
  TEnOCRTrainingForm = class(TForm)
    OCRTrainingLabel: TLabel;
    ImageFileLabel: TLabel;
    ImageFileEdit: TEdit;
    ImageFileBtn: TBitBtn;
    ImageFileOpenDialog: TOpenDialog;
    ImgWinFrame: TEnProWinFrame;
    InfoMemo: TMemo;
    TextFileOpenDialog: TOpenDialog;
    PageControl: TPageControl;
    OCRTrainingTabSheet: TTabSheet;
    OCRTestingTabSheet: TTabSheet;
    ConfigLabel: TLabel;
    ResultsFileEdit: TEdit;
    ResultsFileBtn: TBitBtn;
    FontIDLabel: TLabel;
    FontIDEdit: TEdit;
    StartOCRTrainingBtn: TButton;
    OCRTestBtn: TButton;
    TestingConstraintsLabel: TLabel;
    AlphaCheckBox: TCheckBox;
    NumericCheckBox: TCheckBox;
    MaskLabel: TLabel;
    MaskEdit: TEdit;
    ValueLabel: TLabel;
    ValueEdit: TEdit;
    OCRResultLabel: TLabel;
    ConfLabel: TLabel;
    ConfEdit: TEdit;
    TypeOCRComboBox: TComboBox;
    SlowCheckBox: TCheckBox;
    BarcodeTestingTabSheet: TTabSheet;
    BarcodeTestBtn: TButton;
    BarcodeResultLabel: TLabel;
    PreviewImage: TImage;
    DisplayNumUpDown: TUpDown;
    DisplayNumLabel: TLabel;
    DisplayEdit: TEdit;
    procedure ImageFileBtnClick(Sender: TObject);
    procedure StartOCRTrainingBtnClick(Sender: TObject);
    procedure OCRTestBtnClick(Sender: TObject);
    procedure ImgWinFrameImageScrollBoxRubberbandChange( const Rect: TRect);
    procedure ResultsFileBtnClick(Sender: TObject);
    procedure MaskEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BarcodeTestBtnClick(Sender: TObject);
    procedure DisplayEditChange(Sender: TObject);
  private
    RubberBandRect : TRect;
  public
  end;

var
  EnOCRTrainingForm: TEnOCRTrainingForm;

implementation

{$R *.DFM}

uses
  Enimgscr, EnProLib, EnOCR, EnBarcode;

procedure TEnOCRTrainingForm.FormCreate(Sender: TObject);
{******************************************************************************}
{ This is called when the form is created.                                     }
{******************************************************************************}
begin
  PageControl.ActivePage := OCRTrainingTabSheet;
end;

procedure TEnOCRTrainingForm.ImageFileBtnClick(Sender: TObject);
{******************************************************************************}
{ Opens the image file dialog to select a file.                                }
{******************************************************************************}
begin
  ImageFileOpenDialog.FileName := ImageFileEdit.Text;
  if ImageFileOpenDialog.Execute then begin
    ImageFileEdit.Text := ImageFileOpenDialog.FileName;
    ImgWinFrame.Load( ImageFileEdit.Text );
    ImgWinFrame.ImageScrollBox.MouseMode := mmSelect;
  end;
end;

procedure TEnOCRTrainingForm.ResultsFileBtnClick(Sender: TObject);
{******************************************************************************}
{ Opens the text file dialog to select a file.                                 }
{******************************************************************************}
begin
  TextFileOpenDialog.FileName := ResultsFileEdit.Text;
  if TextFileOpenDialog.Execute then begin
    ResultsFileEdit.Text := TextFileOpenDialog.FileName;
  end;
end;

procedure TEnOCRTrainingForm.ImgWinFrameImageScrollBoxRubberbandChange( const Rect: TRect);
{******************************************************************************}
{ Saves the most recent rubber band box.                                       }
{******************************************************************************}
begin
  RubberBandRect := Rect;
end;

procedure TEnOCRTrainingForm.StartOCRTrainingBtnClick(Sender: TObject);
{******************************************************************************}
{ Displays the OCR training form.                                              }
{******************************************************************************}
const
  THRESHOLD = 3.00;
var
  i : Integer;
  F : TextFile;
  srcRect, lineRect, charRect : TRect;
  numRight, numDown : Integer;
  charAttr : TOCRCharAttr;
  nextCharColumn : Integer;
  numFound : Integer;
  charSet : TOCRCharSet;
  charResults : array [ 0 .. 3 ] of TOCRCharResult;
  str : String;
begin
  if FontIDEdit.Text = '' then begin
    ShowMessage( 'Font ID must not be blank.' );
    Exit;
  end;

  if ResultsFileEdit.Text = '' then begin
    ShowMessage( 'Results file must not be blank.' );
    Exit;
  end;

  if ImgWinFrame.FileName = '' then Exit;
//ImgWinFrame.Load( ImageFileEdit.Text );
//srcRect := Rect( 0, 0, ImgWinFrame.ImageScrollBox.Graphic.Width, ImgWinFrame.ImageScrollBox.Graphic.Height );
  srcRect :=  CalcWinToImgRect( ImgWinFrame, RubberBandRect );
  if not EnTextLineDetectionBW( ImgWinFrame.ImageScrollBox.Graphic, srcRect, THRESHOLD, 2.0 * THRESHOLD, lineRect, numRight, numDown ) then Exit;
  ImgWinFrame.ImagePosition( lineRect, FALSE );
  Sleep( 1000 );

  { Break into Characters }
  nextCharColumn := 0;
  while nextCharColumn < (lineRect.Right-1) do begin
    if EnTextCharDetectionBW( ImgWinFrame.ImageScrollBox.Graphic, lineRect, THRESHOLD, 2.0 * THRESHOLD, charRect, nextCharColumn ) then begin
      EnGetOCRCharAttrBW( ImgWinFrame.ImageScrollBox.Graphic, charRect, charAttr );
      { Get OCR of this value }
      charSet := EnOCRCharSet( itoCSZ );
      numFound := EnOCRCharBW( ImgWinFrame.ImageScrollBox.Graphic, charRect, charAttr, charSet, '', charResults );
      { Fill display }
      ImgWinFrame.ImagePosition( charRect, FALSE );
      EnGetImageFromOCRCharAttr( charAttr, PreviewImage );
      PreviewImage.Update;
      InfoMemo.Lines.Clear;
      InfoMemo.Lines.Add( Format( 'Top Gray %d', [ charAttr.TopGray ] ) );
      InfoMemo.Lines.Add( Format( 'Bot Gray %d', [ charAttr.BotGray ] ) );
      InfoMemo.Lines.Add( Format( 'WHRatio  %d', [ charAttr.WHRatio ] ) );
      InfoMemo.Lines.Add( Format( 'Disjoint %d', [ charAttr.Disjoint ] ) );
      for i := 0 to numFound-1 do begin
        InfoMemo.Lines.Add( Format( '%s  %8.4f:%s', [ charResults[i].Letter, charResults[i].ConfPct, charResults[i].FontID ] ) );
      end;
      { Prompt for correct value }
      str := '';
      if InputQuery( 'Character', 'Value', str ) then begin
        if str = '' then continue;
        AssignFile( F, ResultsFileEdit.Text );
        if not FileExists( ResultsFileEdit.Text ) then Rewrite( F )
        else Append( F );
        try
          Write( F, Format( '%s,%s,%d,%d,%d,%d', [ str, UpperCase( FontIDEdit.Text ), charAttr.TopGray, charAttr.BotGray, charAttr.WHRatio, charAttr.Disjoint ] ) );
          for i := 0 to 62 do Write( F, Format( ',%d', [ charAttr.GridGray[i] ] ) );
          WriteLn( F );
        finally CloseFile( F ); end;
        EnLoadOCRAttrFile( ResultsFileEdit.Text, TRUE );
      end;
    end;
  end;
end;

procedure TEnOCRTrainingForm.DisplayEditChange(Sender: TObject);
{******************************************************************************}
{ Displays training file item number.                                          }
{******************************************************************************}
var
  index : Integer;
begin
  if not EnLoadOCRAttrFile( ResultsFileEdit.Text, TRUE ) then Exit;
  DisplayNumUpDown.Min := Low( AttrArray );
  DisplayNumUpDown.Max := High( AttrArray );
  index := StrToIntDef( DisplayEdit.Text, 0 );
  if index < Low( AttrArray ) then index := Low( AttrArray );
  if index > High( AttrArray ) then index := High( AttrArray );
  EnGetImageFromOCRCharAttr( AttrArray[ index ], PreviewImage );
  PreviewImage.Update;
  InfoMemo.Lines.Clear;
  InfoMemo.Lines.Add( Format( 'Top Gray %d', [ AttrArray[ index ].TopGray ] ) );
  InfoMemo.Lines.Add( Format( 'Bot Gray %d', [ AttrArray[ index ].BotGray ] ) );
  InfoMemo.Lines.Add( Format( 'WHRatio  %d', [ AttrArray[ index ].WHRatio ] ) );
  InfoMemo.Lines.Add( Format( 'Disjoint %d', [ AttrArray[ index ].Disjoint ] ) );
end;

procedure TEnOCRTrainingForm.OCRTestBtnClick(Sender: TObject);
{******************************************************************************}
{ Test the training by OCRing the current image.                               }
{******************************************************************************}
const
  THRESHOLD = 3.00;
  DEFAULT_CONFIDENCE = 99.00;
var
  i : Integer;
  srcRect, lineRect, charRect : TRect;
  numRight, numDown : Integer;
  charAttr : TOCRCharAttr;
  nextCharColumn : Integer;
  str : String;
  charResults : array [ 0 .. 4 ] of TOCRCharResult;
  strResults : array [ 0 .. 9 ] of TOCRStringResult;
  numFound : Integer;
  charSet : TOCRCharSet;
  c : Char;
  conf : Double;
  confThreshold : Double;
  typeOCR : TImageTypeOCR;
  resNum : Integer;
  params : String;

begin
  if ResultsFileEdit.Text = '' then begin
    ShowMessage( 'Results file must not be blank.' );
    Exit;
  end;

  if TypeOCRComboBox.ItemIndex < 0 then begin
    ShowMessage( 'The type of OCR must be selected.' );
    Exit;
  end;

  EnLoadOCRAttrFile( ResultsFileEdit.Text, TRUE );

  if ImgWinFrame.FileName = '' then Exit;
//ImgWinFrame.Load( ImageFileEdit.Text );
//srcRect := Rect( 0, 0, ImgWinFrame.ImageScrollBox.Graphic.Width, ImgWinFrame.ImageScrollBox.Graphic.Height );
  srcRect :=  CalcWinToImgRect( ImgWinFrame, RubberBandRect );
  if not EnTextLineDetectionBW( ImgWinFrame.ImageScrollBox.Graphic, srcRect, THRESHOLD, 2.0 * THRESHOLD, lineRect, numRight, numDown ) then Exit;
  ImgWinFrame.ImagePosition( lineRect, FALSE );
  if SlowCheckBox.Checked then Sleep( 1000 );

  strResults[0].OCRString := '';
  strResults[0].ConfPct := 0.0;

  confThreshold := EnStrToFloatDef( ConfEdit.Text, DEFAULT_CONFIDENCE );

  if TypeOCRComboBox.ItemIndex < 0 then TypeOCRComboBox.ItemIndex := 0;
  typeOCR := TImageTypeOCR( TypeOCRComboBox.ItemIndex );

  charSet := EnOCRCharSet( typeOCR );
  if AlphaCheckBox  .Checked then charSet := charSet + [ 'A'..'Z' ];
  if NumericCheckBox.Checked then charSet := charSet + [ '0'..'9', '-', '/', '.' ];

  { Break into Characters }
  nextCharColumn := 0;
  while nextCharColumn < (lineRect.Right-1) do begin
    if EnTextCharDetectionBW( ImgWinFrame.ImageScrollBox.Graphic, lineRect, THRESHOLD, 2.0 * THRESHOLD, charRect, nextCharColumn ) then begin
      EnGetOCRCharAttrBW( ImgWinFrame.ImageScrollBox.Graphic, charRect, charAttr );
      { Get OCR of this value }
      numFound := EnOCRCharBW( ImgWinFrame.ImageScrollBox.Graphic, charRect, charAttr, charSet, '', charResults );
      if numFound > 0 then begin
        { Build result string }
        c := charResults[0].Letter;
        conf := charResults[0].ConfPct;
        if conf < confThreshold then c := '~';
        strResults[0].OCRString := strResults[0].OCRString + c;
        { Confidence is only as good as the weakest letter }
        if strResults[0].ConfPct < 1.0 then strResults[0].ConfPct := conf
        else if strResults[0].ConfPct > conf then strResults[0].ConfPct := conf;
        { Display the results }
        ImgWinFrame.ImagePosition( charRect, FALSE );
        EnGetImageFromOCRCharAttr( charAttr, PreviewImage );
        PreviewImage.Update;
        InfoMemo.Lines.Clear;
        for i := 0 to numFound-1 do begin
          if charResults[i].ConfPct >= confThreshold then begin
            InfoMemo.Lines.Add( Format( '%s  %8.4f:%s', [ charResults[i].Letter, charResults[i].ConfPct, charResults[i].FontID ] ) );
          end else if charResults[i].ConfPct > 0 then begin
            InfoMemo.Lines.Add( Format( '%s  %8.4f:%s?', [ charResults[i].Letter, charResults[i].ConfPct, charResults[i].FontID ] ) );
          end;
        end;
//      InfoMemo.Lines.Add( Format( 'Top Gray %d', [ charAttr.TopGray ] ) );
//      InfoMemo.Lines.Add( Format( 'Bot Gray %d', [ charAttr.BotGray ] ) );
//      InfoMemo.Lines.Add( Format( 'WHRatio  %d', [ charAttr.WHRatio ] ) );
//      InfoMemo.Lines.Add( Format( 'Disjoint %d', [ charAttr.Disjoint ] ) );
        InfoMemo.Update;
        if SlowCheckBox.Checked then Sleep( 1000 );
      end;
    end;
  end;

//EnOCRClean( '', typeOCR, charSet, MaskEdit.Text, strResults[0] );

  { This is how the OCR function should be called - the code above is for display purposes }
  str := '';
  params := Format( 'CONF=%f', [ confThreshold ] );
  if EnOCRLineBW( ImgWinFrame.ImageScrollBox.Graphic, srcRect, params, typeOCR, charSet, MaskEdit.Text, strResults ) then begin
    for resNum := Low( strResults ) to High( strResults ) do begin
      if strResults[resNum].ConfPct > 1.0 then begin
        str := str + Format( '%s  %6.2f', [ strResults[resNum].OCRString, strResults[resNum].ConfPct ] ) + #13#10;
      end;
    end;
  end else begin
    str := 'No OCR Results';
  end;

  ValueEdit.Text := strResults[0].OCRString;
  ShowMessage( str );
end;

procedure TEnOCRTrainingForm.MaskEditChange(Sender: TObject);
{******************************************************************************}
{ Test the training by OCRing the current image.                               }
{******************************************************************************}
var
  errPos : Integer;
  retVal : TEnPictureMask;
  input : String;
  str : String;
begin
  input := ValueEdit.Text;
  retVal := EnPicture( MaskEdit.Text, input, FALSE, errPos );
  if retVal = prComplete      then str := 'prComplete';
  if retVal = prIncomplete    then str := 'prIncomplete';
  if retVal = prEmpty         then str := 'prEmpty';
  if retVal = prError         then str := 'prError';
  if retVal = prSyntax        then str := 'prSyntax';
  if retVal = prAmbiguous     then str := 'prAmbiguous';
  if retVal = prIncompNoFill  then str := 'prIncompNoFill';
  OCRResultLabel.Caption := str;
end;

procedure TEnOCRTrainingForm.BarcodeTestBtnClick(Sender: TObject);
{******************************************************************************}
{ Reads the currently selected barcode.                                        }
{******************************************************************************}
const
  THRESHOLD = 3.00;
var
  srcRect, lineRect : TRect;
  numRight, numDown : Integer;
  strResults : TBarcodeStringResult;
begin
  if ImgWinFrame.FileName = '' then Exit;
//ImgWinFrame.Load( ImageFileEdit.Text );
//srcRect := Rect( 0, 0, ImgWinFrame.ImageScrollBox.Graphic.Width, ImgWinFrame.ImageScrollBox.Graphic.Height );
  srcRect :=  CalcWinToImgRect( ImgWinFrame, RubberBandRect );
  if not EnTextLineDetectionBW( ImgWinFrame.ImageScrollBox.Graphic, srcRect, THRESHOLD, 2.0 * THRESHOLD, lineRect, numRight, numDown ) then Exit;
  ImgWinFrame.ImagePosition( lineRect, FALSE );

  { This is how the barcode function should be called - the code above is for display purposes }
  if EnReadBarcodeBW( ImgWinFrame.ImageScrollBox.Graphic, srcRect, '', itbUnknown, strResults ) then begin
    BarcodeResultLabel.Caption := strResults.BarcodeString;
  end else begin
    BarcodeResultLabel.Caption := 'ERROR READING BARCODE';
  end;
end;

end.
