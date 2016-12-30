inherited MlekoEditRepParamDlg: TMlekoEditRepParamDlg
  Left = 537
  Top = 306
  ActiveControl = edName
  Caption = 'MlekoEditRepParamDlg'
  ClientHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Top = 210
  end
  inherited ButtonCancel: TButton
    Top = 210
  end
  inherited ButtonApply: TButton
    Top = 210
  end
  inherited PageControl: TPageControl
    Left = 2
    Top = 5
    Width = 310
    Height = 202
    inherited TabSheet1: TTabSheet
      object edName: TcitDBComboEdit
        Left = 69
        Top = 8
        Width = 195
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
        LLblCaption = #1048#1084#1103
        LLblWidth = 65
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
        TabOrder = 0
        Visible = True
        LocateKey = False
        AutoTabControl = True
      end
      object edType: TcitDBComboEdit
        Left = 69
        Top = 35
        Width = 195
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
        LLblCaption = #1058#1080#1087
        LLblWidth = 65
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
        TabOrder = 1
        Visible = True
        DataSet = quParamType
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'ID'
        TextField = 'Description'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object edCaption: TcitDBComboEdit
        Left = 69
        Top = 64
        Width = 195
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
        LLblCaption = 'Caption'
        LLblWidth = 65
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
        TabOrder = 2
        Visible = True
        LocateKey = False
        AutoTabControl = True
      end
      object edTop: TcitDBComboEdit
        Left = 69
        Top = 96
        Width = 52
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
        LLblCaption = #1055#1086#1079'. '#1074#1077#1088#1093
        LLblWidth = 65
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
        TabOrder = 3
        Text = '10'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object edLeft: TcitDBComboEdit
        Left = 217
        Top = 97
        Width = 44
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
        LLblCaption = #1055#1086#1079'. '#1089#1083#1077#1074#1072
        LLblWidth = 65
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
        TabOrder = 4
        Text = '10'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object edHeight: TcitDBComboEdit
        Left = 217
        Top = 123
        Width = 44
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
        LLblCaption = #1042#1099#1089#1086#1090#1072
        LLblWidth = 65
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
        TabOrder = 5
        Text = '21'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object edWidth: TcitDBComboEdit
        Left = 69
        Top = 122
        Width = 52
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
        LLblCaption = #1064#1080#1088#1080#1085#1072
        LLblWidth = 65
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
        TabOrder = 6
        Text = '185'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object MultiSelect: TCheckBox
        Left = 16
        Top = 152
        Width = 81
        Height = 17
        Caption = 'MultiSelect'
        TabOrder = 7
      end
    end
  end
  inherited ActionList: TActionList
    Top = 176
  end
  object SpAddReportParam: TMSStoredProc
    StoredProcName = 'Sp_Add_Prop_dlg_Attribute;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL Sp_Add_Prop_dlg_Attribute;1(:p_id, :p_prop' +
        '_dlg_id, :p_name, :p_entity_type_id, :p_caption, :p_pos_left, :p' +
        '_pos_top, :p_width, :p_height, :p_is_multiselect, :p_style)}')
    Left = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'p_prop_dlg_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_name'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftInteger
        Name = 'p_entity_type_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_caption'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftInteger
        Name = 'p_pos_left'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_pos_top'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_width'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_height'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_multiselect'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_style'
        ParamType = ptInput
        Size = 64
      end>
  end
  object quParamType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from D_ENTITY_TYPE')
    Left = 264
    Top = 64
    object quParamTypeID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'D_ENTITY_TYPE.ID'
      ReadOnly = True
      Visible = False
    end
    object quParamTypecode: TStringField
      DisplayWidth = 15
      FieldName = 'code'
      Origin = 'D_ENTITY_TYPE.code'
      Size = 64
    end
    object quParamTypedescription: TStringField
      DisplayWidth = 30
      FieldName = 'description'
      Size = 64
    end
  end
end
