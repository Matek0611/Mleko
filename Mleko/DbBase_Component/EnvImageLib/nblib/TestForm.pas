unit TestForm;

interface

uses
    EnTransf, { for TImageTransform }
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtDlgs, EnImgScr, ExtCtrls;

type
  TMainForm = class(TForm)
    TopPanel: TPanel;
    ImageScrollBox: TImageScrollBox;
    OpenPictureDialog: TOpenPictureDialog;
    OpenImageBtn: TButton;
    ZoomCB: TComboBox;
    RotateRG: TRadioGroup;
    AngleEdit: TEdit;
    RotateBtn: TButton;
    DimensionLbl: TLabel;
    DeskewBtn: TButton;
    CropBtn: TButton;
    CleanupBorderBtn: TButton;
    ReadBarCodeBtn: TButton;
    OcrBtn: TButton;
    procedure OpenImageBtnClick(Sender: TObject);
    procedure ZoomCBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RotateBtnClick(Sender: TObject);
    procedure AngleEditChange(Sender: TObject);
    procedure DeskewBtnClick(Sender: TObject);
    procedure CropBtnClick(Sender: TObject);
    procedure CleanupBorderBtnClick(Sender: TObject);
    procedure ReadBarCodeBtnClick(Sender: TObject);
    procedure OcrBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyTransform( const Transform : TImageTransform );
    procedure DisplayDimensions;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
    NBLib,
    EnRubber, { for TRubberbandMouseHandler }
    EnReg;    { to register graphic formats with VCL }

{--------------------------------------------------------------------------}

procedure TMainForm.FormCreate(Sender: TObject);
begin
    ZoomCB.ItemIndex := 2;
    ZoomCBChange(Self);

    ImageScrollBox.MouseMode := mmSelect;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.DisplayDimensions;
begin
    DimensionLbl.Caption := IntToStr(ImageScrollBox.Graphic.Width) +
                            ' x ' +
                            IntToStr(ImageScrollBox.Graphic.Height);
end;

{--------------------------------------------------------------------------}

procedure TMainForm.OpenImageBtnClick(Sender: TObject);
begin
    if OpenPictureDialog.Execute then
    begin
        ImageScrollBox.FileName := OpenPictureDialog.FileName;
        DisplayDimensions;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.ZoomCBChange(Sender: TObject);
begin
    case ZoomCB.ItemIndex of
        0: ImageScrollBox.ZoomMode := zmOriginalSize;
        1: ImageScrollBox.ZoomMode := zmFitWidth;
        2: ImageScrollBox.ZoomMode := zmFullPage;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.ApplyTransform( const Transform : TImageTransform );
begin
    if ImageScrollBox.Graphic.IsEmpty then
        Exit;

    Screen.Cursor := crHourglass;
    try
        Transform.Apply(ImageScrollBox.Graphic);
        ImageScrollBox.Redraw(True);
        DisplayDimensions;
    finally
        Screen.Cursor := crDefault;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.RotateBtnClick(Sender: TObject);
var
    Transform : TNBRotateTransform;
begin
    Transform := TNBRotateTransform.Create;
    try
        case RotateRG.ItemIndex of
            0: Transform.Angle := 90;
            1: Transform.Angle := 180;
            2: Transform.Angle := 270;
            3: Transform.Angle := StrToFloat(AngleEdit.Text)
        end;

        ApplyTransform(Transform);
    finally
        Transform.Free;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.AngleEditChange(Sender: TObject);
begin
    RotateRG.ItemIndex := 3;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.DeskewBtnClick(Sender: TObject);
var
    Transform : TNBDeskewTransform;
begin
    Transform := TNBDeskewTransform.Create;
    try
        ApplyTransform(Transform);
    finally
        Transform.Free;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.CropBtnClick(Sender: TObject);
var
    Transform : TNBCropTransform;
    Rect      : TRect;
begin
    Transform := TNBCropTransform.Create;
    try

        (ImageScrollBox.MouseHandler as TRubberbandMouseHandler).GetSourceSelection(Rect);

        Transform.CropMode := cmExtractRect;

        Transform.Top    := Rect.Top;
        Transform.Left   := Rect.Left;
        Transform.Bottom := Rect.Bottom;
        Transform.Right  := Rect.Right;

        (ImageScrollBox.MouseHandler as TRubberbandMouseHandler).ClearSelection;

        ApplyTransform(Transform);

    finally
        Transform.Free;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.CleanupBorderBtnClick(Sender: TObject);
var
    Transform : TNBCleanupBorderTransform;
begin
    Transform := TNBCleanupBorderTransform.Create;
    try
        ApplyTransform(Transform);
    finally
        Transform.Free;
    end;
end;

{--------------------------------------------------------------------------}

procedure TMainForm.ReadBarCodeBtnClick(Sender: TObject);
var
    BarCodeStr : String;
    Rect       : TRect;
begin
    (ImageScrollBox.MouseHandler as TRubberbandMouseHandler).GetSourceSelection(Rect);

    BarCodeStr := ReadBarCode( ImageScrollBox.Graphic, Rect );

    if BarCodeStr <> '' then
        MessageDlg( 'Bar code read is: ' + BarCodeStr, mtInformation, [mbOk], 0)
    else
        MessageDlg( 'Bar code not recognized.', mtInformation, [mbOk], 0)

end;

{--------------------------------------------------------------------------}

procedure TMainForm.OcrBtnClick(Sender: TObject);
var
    OcrText  : String;
    Rect      : TRect;
begin
    (ImageScrollBox.MouseHandler as TRubberbandMouseHandler).GetSourceSelection(Rect);

    OcrText := OCRRegion( ImageScrollBox.Graphic, Rect );

    if OCRText <> '' then
        MessageDlg( 'Recognized text is: ' + OCRText, mtInformation, [mbOk], 0)
    else
        MessageDlg( 'Unable to recognize text.', mtInformation, [mbOk], 0)

end;

{--------------------------------------------------------------------------}

end.
