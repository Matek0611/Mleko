object MainForm: TMainForm
  Left = 255
  Top = 111
  Width = 696
  Height = 480
  Caption = 'Test form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 100
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 97
    Align = alTop
    TabOrder = 0
    object DimensionLbl: TLabel
      Left = 8
      Top = 48
      Width = 89
      Height = 13
      AutoSize = False
    end
    object OpenImageBtn: TButton
      Left = 8
      Top = 12
      Width = 105
      Height = 25
      Caption = 'Open &Image'
      TabOrder = 0
      OnClick = OpenImageBtnClick
    end
    object ZoomCB: TComboBox
      Left = 8
      Top = 66
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = ZoomCBChange
      Items.Strings = (
        'Original Size'
        'Fit Width'
        'Full Page')
    end
    object RotateRG: TRadioGroup
      Left = 136
      Top = 8
      Width = 161
      Height = 81
      ItemIndex = 0
      Items.Strings = (
        '90'
        '180'
        '270'
        'Arbitrary')
      TabOrder = 2
    end
    object AngleEdit: TEdit
      Left = 216
      Top = 62
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '10'
      OnChange = AngleEditChange
    end
    object RotateBtn: TButton
      Left = 216
      Top = 24
      Width = 75
      Height = 25
      Caption = '&Rotate'
      TabOrder = 4
      OnClick = RotateBtnClick
    end
    object DeskewBtn: TButton
      Left = 312
      Top = 10
      Width = 105
      Height = 25
      Caption = '&Deskew'
      TabOrder = 5
      OnClick = DeskewBtnClick
    end
    object CropBtn: TButton
      Left = 312
      Top = 38
      Width = 105
      Height = 25
      Caption = '&Crop Selection'
      TabOrder = 6
      OnClick = CropBtnClick
    end
    object CleanupBorderBtn: TButton
      Left = 312
      Top = 66
      Width = 105
      Height = 25
      Caption = 'Cleanup &Border'
      TabOrder = 7
      OnClick = CleanupBorderBtnClick
    end
    object ReadBarCodeBtn: TButton
      Left = 424
      Top = 10
      Width = 105
      Height = 25
      Caption = 'Re&ad Bar Code'
      TabOrder = 8
      OnClick = ReadBarCodeBtnClick
    end
    object OcrBtn: TButton
      Left = 424
      Top = 38
      Width = 105
      Height = 25
      Caption = '&OCR'
      TabOrder = 9
      OnClick = OcrBtnClick
    end
  end
  object ImageScrollBox: TImageScrollBox
    Left = 0
    Top = 97
    Width = 688
    Height = 355
    HorzScrollBar.Tracking = True
    HorzScrollBar.Visible = False
    VertScrollBar.Tracking = True
    VertScrollBar.Visible = False
    AntiAliased = True
    ZoomPercent = 100
    Align = alClient
    TabOrder = 1
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 112
    Top = 88
  end
end
