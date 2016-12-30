inherited EditOtdelForm: TEditOtdelForm
  Left = 1113
  Top = 164
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1072
  ClientHeight = 201
  ClientWidth = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 158
    Top = 178
    ModalResult = 1
  end
  inherited ButtonCancel: TButton
    Left = 234
    Top = 178
  end
  inherited ButtonApply: TButton
    Left = 310
    Top = 178
  end
  inherited PageControl: TPageControl
    Width = 385
    Height = 177
    inherited TabSheet1: TTabSheet
      object DBText1: TDBText
        Left = 112
        Top = 0
        Width = 65
        Height = 17
        DataField = 'OtdelNo'
        DataSource = dmDataModule.dsVidOtdel
      end
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 89
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1086#1090#1076#1077#1083#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 1
        Top = 23
        Width = 93
        Height = 26
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#13#10#1086#1090#1076#1077#1083#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 128
        Width = 68
        Height = 13
        Caption = #1058#1080#1087' '#1086#1090#1076#1077#1083#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 28
        Width = 225
        Height = 21
        DataField = 'OtdelName'
        DataSource = dmDataModule.dsVidOtdel
        TabOrder = 0
      end
      object p_response_dept_id: TcitDBComboEdit
        Left = 102
        Top = 58
        Width = 226
        Height = 21
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
        LLblCaption = #1062#1060#1054
        LLblWidth = 95
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
        Required = True
        TabOrder = 1
        Visible = True
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'id'
        TextField = 'Name'
        EntityCode = 'D_RESPONSE_DEPT'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_activity_type_id: TcitDBComboEdit
        Left = 102
        Top = 95
        Width = 226
        Height = 21
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
        LLblCaption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085
        LLblWidth = 95
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
        Required = True
        TabOrder = 2
        Visible = True
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'id'
        TextField = 'Name'
        EntityCode = 'D_ACTIVITY_TYPE'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object lcManager_Team: TDBLookupComboboxEh
        Left = 104
        Top = 123
        Width = 225
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'Name'
        ListSource = dsManager_Team
        TabOrder = 3
        Visible = True
      end
    end
  end
  inherited ToolBar: TToolBar
    Width = 387
  end
  inherited ActionList: TActionList
    Left = 264
    Top = 0
  end
  inherited quAddBegParam: TMSQuery
    Left = 336
    Top = 0
  end
  inherited quUpdBegParam: TMSQuery
    Left = 360
    Top = 0
  end
  inherited spUpd: TMSStoredProc
    Left = 288
    Top = 0
  end
  inherited spAdd: TMSStoredProc
    Left = 312
    Top = 0
  end
  object quManager_Team: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from D_Manager_Team')
    Left = 356
    Top = 29
    object quManager_TeamID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quManager_TeamName: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1076#1077#1083#1072
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 128
    end
    object quManager_Teampkey: TLargeintField
      FieldName = 'pkey'
    end
  end
  object dsManager_Team: TMSDataSource
    DataSet = quManager_Team
    Left = 356
    Top = 56
  end
end
