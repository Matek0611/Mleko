inherited MlekoSelectFloatDlg: TMlekoSelectFloatDlg
  Left = 1003
  Top = 418
  Width = 316
  Height = 140
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 300
    Height = 60
    Align = alClient
    TabOrder = 0
    object FloatEditFromOststok: TcitDBCalcEdit
      Left = 80
      Top = 24
      Width = 169
      Height = 21
      DataField = 'MaxKol'
      DataSource = dsMaxKolFromOstatok
      DontPushIfDisabled = False
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1042#1074#1077#1076#1080#1090#1077' '#1095#1080#1089#1083#1086
      LLblWidth = 80
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
      MaxLength = 10
      TabOrder = 0
      Text = 'FloatEditFromOststok'
      Visible = True
      DecimalsNumber = 10
      DialogStyle = dsNoCaption
      AlwaysShowDialog = False
    end
    object FloatEditFromAnalysisOstatok: TcitDBCalcEdit
      Left = 80
      Top = 24
      Width = 169
      Height = 21
      DataField = 'MaxKol'
      DataSource = dsMaxKolFromAnalysisOstatok
      DontPushIfDisabled = False
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1042#1074#1077#1076#1080#1090#1077' '#1095#1080#1089#1083#1086
      LLblWidth = 80
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
      MaxLength = 10
      TabOrder = 1
      Text = 'FloatEditFromAnalysisOstatok'
      Visible = True
      DecimalsNumber = 10
      DialogStyle = dsNoCaption
      AlwaysShowDialog = False
    end
    object FloatEditForAnalysisUnlocking: TcitDBCalcEdit
      Left = 80
      Top = 24
      Width = 169
      Height = 21
      DataField = 'MaxKol'
      DataSource = dsMaxKolForAnalysisUnlocking
      DontPushIfDisabled = False
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1042#1074#1077#1076#1080#1090#1077' '#1095#1080#1089#1083#1086
      LLblWidth = 80
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
      MaxLength = 10
      TabOrder = 2
      Text = 'FloatEditForAnalysisUnlocking'
      Visible = True
      DecimalsNumber = 10
      DialogStyle = dsNoCaption
      AlwaysShowDialog = False
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 60
    Width = 300
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btOk: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TButton
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
  object dsMaxKolFromOstatok: TMSDataSource
    DataSet = quMaxKolFromOstatok
    Top = 72
  end
  object quMaxKolFromOstatok: TMSQuery
    SQLInsert.Strings = (
      'update MaxKolFromOstatok'
      '  set MaxKol = :MaxKol')
    SQLDelete.Strings = (
      'update MaxKolFromOstatok'
      '  set MaxKol = 0')
    SQLUpdate.Strings = (
      'update MaxKolFromOstatok'
      '  set MaxKol = :MaxKol')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select isnull(MaxKol,0) as MaxKol from MaxKolFromOstatok')
    Left = 24
    Top = 72
    object quMaxKolFromOstatokMaxKol: TFloatField
      FieldName = 'MaxKol'
    end
  end
  object dsMaxKolFromAnalysisOstatok: TMSDataSource
    DataSet = quMaxKolFromAnalysisOstatok
    Left = 108
    Top = 72
  end
  object quMaxKolFromAnalysisOstatok: TMSQuery
    SQLInsert.Strings = (
      'update MaxKolFromAnalysisOstatok'
      '  set MaxKol = :MaxKol')
    SQLDelete.Strings = (
      'update MaxKolFromAnalysisOstatok'
      '  set MaxKol = 0')
    SQLUpdate.Strings = (
      'update MaxKolFromAnalysisOstatok'
      '  set MaxKol = :MaxKol')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select isnull(MaxKol,0) as MaxKol from MaxKolFromAnalysisOstatok')
    Left = 132
    Top = 72
    object quMaxKolFromAnalysisOstatokMaxKol: TIntegerField
      FieldName = 'MaxKol'
    end
  end
  object dsMaxKolForAnalysisUnlocking: TMSDataSource
    DataSet = quMaxKolForAnalysisUnlocking
    Left = 236
    Top = 72
  end
  object quMaxKolForAnalysisUnlocking: TMSQuery
    SQLInsert.Strings = (
      'update MaxKolForAnalysisUnlocking'
      '  set MaxKol = :MaxKol')
    SQLDelete.Strings = (
      'update MaxKolForAnalysisUnlocking'
      '  set MaxKol = 0')
    SQLUpdate.Strings = (
      'update MaxKolForAnalysisUnlocking'
      '  set MaxKol = :MaxKol')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select isnull(MaxKol,0) as MaxKol from MaxKolForAnalysisUnlockin' +
        'g')
    Left = 260
    Top = 72
    object IntegerField1: TIntegerField
      FieldName = 'MaxKol'
    end
  end
end
