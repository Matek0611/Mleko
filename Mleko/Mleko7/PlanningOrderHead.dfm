inherited PlanningOrderHeadForm: TPlanningOrderHeadForm
  Left = 704
  Top = 184
  Width = 561
  Height = 396
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1072#1078
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 338
    Width = 545
  end
  inherited ToolBar: TToolBar
    Width = 545
    ButtonHeight = 29
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 916
      Height = 29
      Caption = 'ToolBar'
      Flat = True
      Images = dmDataModule.ImageListToolBar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object NewPrihodOrder: TToolButton
        Left = 0
        Top = 0
        Hint = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
        ImageIndex = 0
        OnClick = NewPrihodOrderClick
      end
      object EditPrihodOrder: TToolButton
        Left = 23
        Top = 0
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088'/'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        ImageIndex = 1
        OnClick = EditPrihodOrderClick
      end
      object DelPrihodOrder: TToolButton
        Left = 46
        Top = 0
        Hint = #1059#1076#1072#1083#1077#1085#1080#1077
        Caption = 'DelPrihodOrder'
        ImageIndex = 2
        OnClick = DelPrihodOrderClick
      end
      object Refresh: TToolButton
        Left = 69
        Top = 0
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        Caption = 'Refresh'
        ImageIndex = 3
        OnClick = RefreshClick
      end
      object ExitForm: TToolButton
        Left = 92
        Top = 0
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
        Caption = 'ExitForm'
        ImageIndex = 45
        OnClick = ExitFormClick
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 29
    Width = 545
    Height = 309
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 543
      Height = 307
      Align = alClient
      DataSource = dsPlanningOrderHead
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
    end
  end
  inherited ActionList: TActionList
    Left = 160
  end
  object dsPlanningOrderHead: TMSDataSource
    DataSet = quPlanningOrderHead
    Left = 512
    Top = 29
  end
  object quPlanningOrderHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   poh.id'
      '       , poh.DatePlanning'
      '       , poh.DatePlanningBeg'
      '       , poh.DatePlanningEnd'
      '       , u.UserName'
      '       , poh.NamePlanning'
      '       , u.UserNo'
      ' from PlanningOrderHead poh left join'
      '      Users u on u.UserNo = poh.UserNo'
      '  where &_where')
    Left = 488
    Top = 29
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quPlanningOrderHeadid: TIntegerField
      FieldName = 'id'
    end
    object quPlanningOrderHeadDatePlanning: TDateTimeField
      FieldName = 'DatePlanning'
    end
    object quPlanningOrderHeadDatePlanningBeg: TDateTimeField
      FieldName = 'DatePlanningBeg'
    end
    object quPlanningOrderHeadDatePlanningEnd: TDateTimeField
      FieldName = 'DatePlanningEnd'
    end
    object quPlanningOrderHeadUserNo: TIntegerField
      FieldName = 'UserNo'
    end
    object quPlanningOrderHeadUserName: TStringField
      FieldName = 'UserName'
    end
    object quPlanningOrderHeadNamePlanning: TStringField
      FieldName = 'NamePlanning'
      Size = 30
    end
  end
end
