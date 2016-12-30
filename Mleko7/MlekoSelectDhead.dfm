inherited MlekoSelectDheadDlg: TMlekoSelectDheadDlg
  Left = 662
  Top = 201
  Width = 754
  Height = 465
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Left = 0
    Width = 746
    Height = 342
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 516
        Height = 314
      end
      inherited PanelGrid: TPanel
        Width = 516
        Height = 314
        inherited DBGrid: TcitDBGrid
          Width = 514
          Height = 290
        end
        inherited ToolBar: TToolBar
          Width = 514
        end
      end
      inherited PanelSelect: TPanel
        Left = 519
        Height = 314
        inherited DBGridSelection: TcitDBGrid
          Height = 290
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 682
    Top = 380
    Width = 64
  end
  inherited ButtonCancel: TButton
    Left = 682
    Top = 408
    Width = 63
  end
  inherited FilterPanel: TTargetFilter_Panel
    Left = 2
    Top = 342
    Width = 676
    Height = 93
    object ftNom: TTargetFilter_StringFilter
      Left = 274
      Top = 1
      Width = 244
      Height = 31
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 158
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'SUB_NUM'
      a_b_ServerFieldName = 'SUB_NUM'
      a_Label = #1053#1086#1084#1077#1088' '#1076#1086#1082'.'
      a_LabelWidth = 65
      a_ComboWidth = 0
      a_ShortCut = 0
      a_ParamNames.Strings = (
        'TargetFilterNum')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = sctLike
      DesignSize = (
        244
        31)
    end
    object ftDateNakl: TTargetFilter_DateFilter
      Left = 1
      Top = 1
      Width = 273
      Height = 31
      Align = alLeft
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 176
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 1
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'DOC_DATE'
      a_b_ServerFieldName = 'DOC_DATE'
      a_Label = #1055#1077#1088#1080#1086#1076
      a_LabelWidth = 38
      a_ComboWidth = 0
      a_ShortCut = 0
      a_ParamNames.Strings = (
        'Inventory_date_beg '
        'Inventory_date_end')
      a_ServerType = tfst_MS_SQL
      a_Minimum = 40905.545415173610000000
      a_Maximum = 40905.545415173610000000
      a_Value = 40905.545415173610000000
      a_Parameter = 0
      a_ConditionType = dct_date_GE_LE
      a_SetDateTimeToNow = False
      a_DisableTime = True
    end
    object Panel1: TPanel
      Left = 369
      Top = 32
      Width = 305
      Height = 31
      Caption = 'Panel1'
      TabOrder = 2
      object ftTovar: TcitDBComboEdit
        Left = 38
        Top = 5
        Width = 237
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
        LLblCaption = #1058#1086#1074#1072#1088
        LLblWidth = 35
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
        OnIsSelect = ftTovarIsSelect
        EditStyle = edSelect
        AutoTabControl = False
      end
    end
    object Panel4: TPanel
      Left = 368
      Top = 63
      Width = 306
      Height = 29
      TabOrder = 3
      object ftOtdel: TcitDBComboEdit
        Left = 39
        Top = 3
        Width = 237
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
        LLblCaption = #1054#1090#1076#1077#1083
        LLblWidth = 35
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
        DataSet = quDepts
        LocateKey = False
        KeyField = 'OtdelNo'
        TextField = 'OtdelName'
        OnSelectOk = ftOtdelSelectOk
        EditStyle = edCombo
        AutoTabControl = False
      end
    end
    object FilterFirm: TTargetFilter_DictionaryFilter
      Left = 1
      Top = 32
      Width = 367
      Height = 31
      Alignment = taLeftJustify
      Constraints.MaxHeight = 31
      Constraints.MinHeight = 31
      Constraints.MinWidth = 243
      ParentColor = True
      TabOrder = 4
      a_Disable_ConditionType_Combo = True
      a_a_TableName = 'a'
      a_b_FieldName = 'CONTRACTOR_ID'
      a_b_ServerFieldName = 'CONTRACTOR_ID'
      a_Label = #1060#1080#1088#1084#1072
      a_LabelWidth = 40
      a_ComboWidth = 0
      a_ShortCut = 0
      a_ParamNames.Strings = (
        'tfpostNo')
      a_ServerType = tfst_MS_SQL
      a_ConditionType = dtctE
      a_OnSelectValue = FilterFirma_OnSelectValue
      a_CodeEdit_Width = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 63
      Width = 367
      Height = 29
      TabOrder = 5
      object DBEdType: TcitDBComboEdit
        Left = 87
        Top = 4
        Width = 250
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
        LLblCaption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
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
        TabOrder = 0
        Visible = True
        DataSet = QuDocType
        LocateKey = False
        KeyField = 'ID'
        TextField = 'Name'
        OnSelectOk = ftOtdelSelectOk
        EditStyle = edCombo
        AutoTabControl = False
      end
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_dhead a')
    Where.Strings = (
      ' (MANAGER_DEPT_ID = :P_OTDELNO or :P_SHOW_ALL = -1)'
      
        ' and (exists (select 1 from dspec where dhead_id=a.id and articl' +
        'e_id = :p_tovarno ) or :is_show_all_tov =1 )'
      ' and (type_id = :doc_type_id or :is_all_doc_type = 1)')
    OnGetParams = SQLBuilderGetParams
    Left = 364
    Top = 46
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 568
    Top = 392
    object quDeptsOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quDeptsOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
  end
  object QuDocType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.d_doc_type')
    Left = 560
    Top = 344
    object QuDocTypename: TStringField
      DisplayWidth = 45
      FieldName = 'name'
      Size = 30
    end
    object QuDocTypeID: TIntegerField
      DisplayWidth = 3
      FieldName = 'ID'
    end
  end
end
