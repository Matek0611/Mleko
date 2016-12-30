inherited CheckMeshCuttingForm: TCheckMeshCuttingForm
  Left = 728
  Top = 377
  Width = 189
  Height = 159
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 173
    Height = 120
    Align = alClient
    Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
      DataField = 'IsCheck'
      DataSource = dmDataModule.dsCheckMeshCutting
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object bbOk: TBitBtn
      Left = 4
      Top = 84
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 90
      Top = 84
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Kind = bkCancel
    end
    object mdDate: TcitDBDateEdit
      Left = 55
      Top = 51
      Width = 78
      Height = 21
      DataField = 'DateCheck'
      DataSource = dmDataModule.dsCheckMeshCutting
      DialogStyle = dsNoCaption
      DontPushIfDisabled = False
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1044#1072#1090#1072
      LLblWidth = 40
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      MaxLength = 8
      PickFromField = False
      DatePickMethod = dmToday
      TabOrder = 3
      Visible = True
      HeaderColor = clBtnFace
      DayBackgroundColor = clActiveCaption
      CalendarColor = clWindow
      DayTextColor = clCaptionText
      WeekEndColor = clRed
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clBlack
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      CalendarFont.Charset = DEFAULT_CHARSET
      CalendarFont.Color = clWindowText
      CalendarFont.Height = -11
      CalendarFont.Name = 'MS Sans Serif'
      CalendarFont.Style = []
      TodayShortCut = 116
      DisableCheck = True
      DateFormat = dfShort
    end
  end
  inherited ActionList: TActionList
    Left = 136
    Top = 8
  end
end
