object CitComboSelectDlg: TCitComboSelectDlg
  Left = 356
  Top = 287
  ActiveControl = DBGrid
  BorderStyle = bsDialog
  Caption = 'CitComboSelectDlg'
  ClientHeight = 135
  ClientWidth = 186
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TcitDBGrid
    Left = 0
    Top = 0
    Width = 186
    Height = 135
    MarkDisabled = False
    MarkColor = clAqua
    MarkFont.Charset = DEFAULT_CHARSET
    MarkFont.Color = clNavy
    MarkFont.Height = -11
    MarkFont.Name = 'MS Sans Serif'
    MarkFont.Style = []
    LightedFont.Charset = DEFAULT_CHARSET
    LightedFont.Color = clMaroon
    LightedFont.Height = -11
    LightedFont.Name = 'MS Sans Serif'
    LightedFont.Style = []
    LightedColor = clWindow
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clSilver
    DisabledFont.Height = -11
    DisabledFont.Name = 'MS Sans Serif'
    DisabledFont.Style = []
    DisabledColor = clWindow
    MultiPress = False
    EnableTitlePress = False
    MarkShortCut = 116
    SaveOnClose = True
    TitleHeight = 15
    Align = alClient
    BorderStyle = bsNone
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = DBGridCellClick
  end
  object DS: TDataSource
    Left = 64
    Top = 16
  end
  object ActionList: TActionList
    Left = 20
    Top = 16
    object ActionFormSelect: TAction
      Category = 'Form'
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091
      ShortCut = 13
      OnExecute = ActionFormSelectExecute
    end
    object ActionFormCancel: TAction
      Category = 'Form'
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1047#1072#1082#1088#1099#1090#1080#1077' '#1092#1086#1088#1084#1099' '#1073#1077#1079' '#1074#1099#1073#1086#1088#1072
      ShortCut = 27
      OnExecute = ActionFormCancelExecute
    end
  end
end
