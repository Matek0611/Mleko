inherited MlekoBlankListLightForm: TMlekoBlankListLightForm
  Left = 430
  Top = 193
  Width = 1024
  Height = 712
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074' '#1076#1083#1103' '#1090#1086#1088#1075#1086#1074#1099#1093' '#1072#1075#1077#1085#1090#1086#1074
  OnActivate = FormActivate
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 654
    Width = 1008
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  inherited ToolBar: TToolBar
    Width = 1008
    ButtonWidth = 24
    inherited ToolBtnProp: TToolButton
      Left = 24
    end
    inherited ToolBtnDel: TToolButton
      Left = 48
    end
    inherited ToolButton4: TToolButton
      Left = 72
    end
    inherited ToolBtnRefresh: TToolButton
      Left = 80
    end
    inherited TBCopyProfile: TToolButton
      Left = 104
    end
    inherited BtnLayot: TToolButton
      Left = 128
    end
    object ToolButton3: TToolButton
      Left = 152
      Top = 0
      Action = ActionRestore
    end
    object ToolButton18: TToolButton
      Left = 176
      Top = 0
      Action = ActionItemCopy
      Visible = False
    end
    object ToolButton15: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 13
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton13: TToolButton
      Left = 208
      Top = 0
      Action = ActionOrderBlock
      Visible = False
    end
    object ToolButton14: TToolButton
      Left = 232
      Top = 0
      Action = ActionOrderUnBlock
      Visible = False
    end
    object ToolButton7: TToolButton
      Left = 256
      Top = 0
      Action = ActionSpecPrint
      Visible = False
    end
    object ToolButton6: TToolButton
      Left = 280
      Top = 0
      Action = ActionGoExcel
      Visible = False
    end
    object ToolButton5: TToolButton
      Left = 304
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 312
      Top = 0
      Action = ActionGoBlank
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 336
      Top = 0
      Action = ActionDelFromBlank
      Visible = False
    end
    object ToolButton12: TToolButton
      Left = 360
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton10: TToolButton
      Left = 368
      Top = 0
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1080#1079' '#1078#1091#1088#1085#1072#1083#1072' '#1079#1072#1082#1072#1079#1086#1074
      Action = ActionAllCorrelation
      Visible = False
    end
    object ToolButton11: TToolButton
      Left = 392
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1082#1072#1079#1099' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Action = ActionDelAllFromNaklR
      Visible = False
    end
    object ToolButton16: TToolButton
      Left = 416
      Top = 0
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 13
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton9: TToolButton
      Left = 424
      Top = 0
      Action = ActionOpenCrossGrid
      Visible = False
    end
    object ToolButton17: TToolButton
      Left = 448
      Top = 0
      Action = ActionCheckNakl
      Visible = False
    end
    object ToolButton19: TToolButton
      Left = 472
      Top = 0
      Width = 8
      Caption = 'ToolButton19'
      ImageIndex = 20
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton20: TToolButton
      Left = 480
      Top = 0
      Action = ActionAutoLoadAll
      Visible = False
    end
    object ToolButtonTmpCross: TToolButton
      Left = 504
      Top = 0
      Hint = #1057#1077#1090#1082#1072' '#1087#1077#1088#1077#1076' '#1072#1074#1090#1086#1087#1086#1088#1077#1079#1082#1086#1081
      Caption = 'ToolButtonTmpCross'
      ImageIndex = 27
      Visible = False
      OnClick = ToolButtonTmpCrossClick
    end
  end
  inherited PageControlTop: TPageControl
    Width = 1008
    Height = 75
    TabHeight = 1
    TabPosition = tpRight
    inherited TabSheet1: TTabSheet
      ParentFont = False
      inherited FilterPanel: TTargetFilter_Panel
        Top = 30
        Width = 1000
        Height = 37
        a_OrAnd = oaAnd
        object FilterFirm: TTargetFilter_DictionaryFilter
          Left = 226
          Top = 5
          Width = 344
          Height = 31
          Alignment = taLeftJustify
          Constraints.MaxHeight = 31
          Constraints.MinHeight = 31
          Constraints.MinWidth = 243
          ParentColor = True
          TabOrder = 0
          a_Disable_ConditionType_Combo = True
          a_a_TableName = 'a'
          a_b_FieldName = 'postNo'
          a_b_ServerFieldName = 'postNo'
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
        object gBPeriod: TGroupBox
          Left = 0
          Top = 1
          Width = 227
          Height = 36
          Caption = #1055#1077#1088#1080#1086#1076
          TabOrder = 1
          object Label2: TLabel
            Left = 5
            Top = 16
            Width = 7
            Height = 13
            Caption = #1057
          end
          object Label3: TLabel
            Left = 111
            Top = 16
            Width = 14
            Height = 13
            Caption = #1055#1086
          end
          object EdDateBeg: TcxDateEdit
            Left = 16
            Top = 12
            Properties.ClearKey = 46
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.WeekNumbers = True
            TabOrder = 0
            Width = 92
          end
          object EdDateEnd: TcxDateEdit
            Left = 129
            Top = 12
            Properties.ClearKey = 46
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.WeekNumbers = True
            TabOrder = 1
            Width = 92
          end
        end
        object GbReason: TGroupBox
          Left = 569
          Top = 1
          Width = 230
          Height = 36
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          TabOrder = 2
          Visible = False
          object DbLCbReason: TcxDBLookupComboBox
            Left = 6
            Top = 13
            DataBinding.DataField = 'Reason_Id'
            DataBinding.DataSource = DSVtTemp
            Properties.ClearKey = 46
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                FieldName = 'ReasonName'
              end>
            Properties.ListSource = DsReason
            TabOrder = 0
            Width = 218
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1000
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object Label1: TLabel
          Left = 365
          Top = 7
          Width = 80
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        end
        object EDDept: TcxDBLookupComboBox
          Left = 456
          Top = 4
          DataBinding.DataField = 'OtdelNo'
          DataBinding.DataSource = DSVtTemp
          Properties.ClearKey = 46
          Properties.KeyFieldNames = 'OtdelNo'
          Properties.ListColumns = <
            item
              FieldName = 'OtdelName'
            end>
          Properties.ListSource = DSDepts
          TabOrder = 0
          Width = 145
        end
        object ftTovar: TcitDBComboEdit
          Left = 48
          Top = 3
          Width = 282
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
          TabOrder = 1
          Visible = True
          LocateKey = False
          KeyField = 'TovarNo'
          TextField = 'NameTovar'
          EntityCode = 'Tovar'
          OnIsSelect = ftTovarIsSelect
          EditStyle = edSelect
          AutoTabControl = False
        end
        object CBReason4: TCheckBox
          Left = 615
          Top = -1
          Width = 153
          Height = 17
          Caption = #1053#1077' '#1086#1090#1075#1088#1091#1078#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
          TabOrder = 2
        end
        object CBReason5: TCheckBox
          Left = 615
          Top = 13
          Width = 189
          Height = 17
          Caption = #1057#1092#1086#1088#1084#1080#1088'. '#1079#1072#1082#1072#1079#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
          TabOrder = 3
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Width = 1008
    Height = 536
    BevelOuter = bvNone
    BorderWidth = 1
    inherited DBGrid: TcitDBGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 534
      LightedColor = 12910472
      DisabledColor = clInactiveCaptionText
      OnGetKey = DBGridGetKey
      MarkShortCut = 115
      OnDrawDataCell = DBGridDrawDataCell
      OnDblClick = DBGridDblClick
    end
  end
  object PanelMsg: TPanel [4]
    Left = 0
    Top = 99
    Width = 1008
    Height = 19
    Align = alTop
    Caption = 'hgh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object PB: TProgressBar
      Left = 1
      Top = 1
      Width = 1006
      Height = 17
      Align = alClient
      Step = 1
      TabOrder = 0
    end
  end
  inherited ActionList: TActionList
    Left = 28
    Top = 156
    inherited ActionItemAdd: TAction
      OnExecute = ActionItemAddExecute
    end
    inherited ActionItemProp: TAction
      OnExecute = ActionItemPropExecute
    end
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
    object ActionOpenSpec: TAction [14]
      Category = 'Item'
      Caption = 'ActionOpenSpec'
      ShortCut = 13
      OnExecute = ActionOpenSpecExecute
    end
    object ActionGoBlank: TAction [15]
      Category = 'Item'
      Caption = 'ActionGoBlank'
      Hint = '[Ctrl+T] '#1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 32
      ShortCut = 16468
      OnExecute = ActionGoBlankExecute
    end
    object ActionRestore: TAction [16]
      Category = 'Item'
      Caption = 'ActionRestore'
      Hint = '[Ctrl+R] '#1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1081
      ImageIndex = 10
      ShortCut = 16466
      OnExecute = ActionRestoreExecute
    end
    object ActionDelFromBlank: TAction [17]
      Category = 'Item'
      Caption = 'ActionDelFromBlank'
      Hint = '[Ctrl+Alt+T] '#1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1095#1077#1088#1085#1086#1074#1080#1082' ('#1091#1076#1072#1083#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1093')'
      ImageIndex = 31
      ShortCut = 49236
      OnExecute = ActionDelFromBlankExecute
    end
    object ActionGoExcel: TAction [18]
      Caption = #1042' Excel'
      ImageIndex = 14
      ShortCut = 16453
      OnExecute = ActionGoExcelExecute
    end
    object ActionSpecPrint: TAction [19]
      Category = 'Item'
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ImageIndex = 15
      ShortCut = 16464
      OnExecute = ActionSpecPrintExecute
    end
    object ActionOpenCrossGrid: TAction [20]
      Caption = 'ActionOpenCrossGrid'
      Hint = #1057#1077#1090#1082#1072'/'#1054#1073#1097#1080#1081' '#1073#1083#1072#1085#1082' '#1079#1072#1082#1072#1079#1086#1074
      ImageIndex = 9
      OnExecute = ActionOpenCrossGridExecute
    end
    object ActionAllCorrelation: TAction [21]
      Caption = 'ActionAllCorrelation'
      Hint = #1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1074' '#1089#1077#1090#1082#1091
      ImageIndex = 8
      OnExecute = ActionAllCorrelatiOnExecute
    end
    object ActionDelAllFromNaklR: TAction [22]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1080#1079' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      ImageIndex = 12
      OnExecute = ActionDelAllFromNaklRExecute
    end
    object ActionOrderBlock: TAction [23]
      Category = 'Item'
      Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 17
      ShortCut = 16450
      OnExecute = ActionOrderBlockExecute
    end
    object ActionOrderUnBlock: TAction [24]
      Category = 'Item'
      Caption = #1057#1085#1103#1090#1100' '#1079#1072#1087#1088#1077#1090
      Hint = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 16
      ShortCut = 49218
      OnExecute = ActionOrderUnBlockExecute
    end
    object ActionCheckNakl: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1080' '#1094#1077#1085
      ImageIndex = 23
      OnExecute = ActionCheckNaklExecute
    end
    object ActionItemCopy: TAction
      Category = 'Item'
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 24
      ShortCut = 49219
      OnExecute = ActionItemCopyExecute
    end
    object ActionAutoLoadAll: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
      Hint = #1055#1088#1086#1074#1077#1089#1090#1080' '#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
      ImageIndex = 25
      OnExecute = ActionAutoLoadAllExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'a.*'
      
        '--       ,(select TypeReturnName from d_TypeReturn where TypeRet' +
        'urnNo = l.TypeReturnNo) as TypeReturn')
    From.Strings = (
      'dbo.v_blanklist a /*left join'
      '      dbo.L_BlankReturn l on l.Document_id = a.Document_id*/')
    Where.Strings = (
      ' DateNakl between :p_date_beg and :p_date_end'
      ' and (otdelNo= :P_OTDELNO or :P_SHOW_ALL = -1)'
      
        ' and (exists (select 1 from e_blanks where document_id=a.id and ' +
        'TovarNo = :p_tovarno ) or :is_show_all_tov =1 )'
      ' and OurFIrmNo = :OurFIrmNo'
      ' and (ReasonId = :Reason_id or isnull(:is_show_all_Reason,0)=1)')
    OrderBy.Strings = (
      'a.ID')
    OnGetParams = SQLBuilderGetParams
    Left = 368
    Top = 252
  end
  inherited Query: TMSQuery
    SQLRefresh.Strings = (
      'select  a.*'
      
        '--       ,(select TypeReturnName from d_TypeReturn where TypeRet' +
        'urnNo = l.TypeReturnNo) as TypeReturn'
      ' from dbo.v_blanklist a /* left join'
      '      dbo.L_BlankReturn l on l.Document_id = a.Document_id*/'
      'WHERE a.ID = :ID')
    SQL.Strings = (
      'select  a.*'
      ' from dbo.v_blanklist a'
      'where (otdelNo= :P_OTDELNO or :P_SHOW_ALL = -1)')
    Left = 28
    Top = 204
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'P_OTDELNO'
      end
      item
        DataType = ftInteger
        Name = 'P_SHOW_ALL'
      end>
    object QueryPostname: TStringField
      FieldName = 'Postname'
      Size = 30
    end
    object QueryAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object QuerySumma: TFloatField
      FieldName = 'Summa'
    end
    object QueryDatenakl: TDateTimeField
      FieldName = 'Datenakl'
    end
    object QueryVidnaklname: TStringField
      FieldName = 'Vidnaklname'
      ReadOnly = True
    end
    object QueryId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object QueryDocument_Id: TIntegerField
      FieldName = 'Document_Id'
      Visible = False
    end
    object QueryPostNo: TSmallintField
      FieldName = 'PostNo'
      Visible = False
    end
    object QueryVidtovGroupId: TLargeintField
      FieldName = 'VidtovGroupId'
      Visible = False
    end
    object QueryBuh: TSmallintField
      FieldName = 'Buh'
      Visible = False
    end
    object QueryReasonId: TSmallintField
      FieldName = 'ReasonId'
      Visible = False
    end
    object QueryStatus: TSmallintField
      FieldName = 'Status'
      Visible = False
    end
    object Queryreserve: TSmallintField
      FieldName = 'reserve'
      Visible = False
    end
    object QueryVidtovgroupname: TStringField
      FieldName = 'Vidtovgroupname'
      ReadOnly = True
      Size = 512
    end
    object QueryColnpricename: TStringField
      FieldName = 'Colnpricename'
      ReadOnly = True
      Visible = False
      Size = 64
    end
    object QueryUsername: TStringField
      FieldName = 'Username'
      ReadOnly = True
    end
    object QueryUserNo: TSmallintField
      FieldName = 'UserNo'
      Visible = False
    end
  end
  inherited DS: TDataSource
    Left = 164
    Top = 156
  end
  inherited ComponentProps: TcitComponentProps
    TableName = 'dbo.Profile'
    Left = 96
    Top = 156
  end
  inherited QueryStorage: TMSQuery
    Left = 504
    Top = 156
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 300
    Top = 252
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 504
    Top = 204
  end
  object spBlankCorrelation: TMSStoredProc
    StoredProcName = 'sp_BlankToNaklR;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_BlankToNaklR;1(:p_document_id, :p_dateN' +
        'akl)}')
    Left = 368
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_document_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end>
  end
  object spRestoreInputOrder: TMSStoredProc
    StoredProcName = 'sp_RestoreInputOrder'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_RestoreInputOrder (:document_id)}')
    Left = 436
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end>
  end
  object SpDelOrderFromSetka: TMSStoredProc
    StoredProcName = 'Sp_DelOrderFromNaklR'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Sp_DelOrderFromNaklR (:document_id)}')
    Left = 164
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end>
  end
  object spDelInputOrder: TMSStoredProc
    StoredProcName = 'sp_DelInputOrder'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_DelInputOrder (:document_id)}')
    Left = 232
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end>
  end
  object quBlankSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT '
      '              b.TovarNo '
      '            , t.NameTovar '
      '            , b.KolOrd'
      '            ,b.Boss_price'
      '            ,t.KolPerPak'
      '            ,t.SrokReal'
      '            ,v.vidname'
      'FROM dbo.e_blanks b, tovar t, vidtov v'
      'where b.tovarNo=t.tovarNo'
      'and t.vidno=v.vidno'
      'and document_id=:document_id'
      'and isNull(KolOrd,0)<>0')
    Left = 300
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'document_id'
        Value = 15
      end>
  end
  object quDepts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from dbo.vidOtdel')
    Left = 96
    Top = 204
  end
  object DSDepts: TDataSource
    DataSet = quDepts
    Left = 232
    Top = 156
  end
  object QuSumma: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'sum(weight) as weight'
      ',sum(summa) as summa'
      ' from e_blank_head '
      'where (dateNakl between :p_dateBeg and :p_dateEnd)'
      ' and status<>-1')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 164
    Top = 204
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_dateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'p_dateEnd'
      end>
  end
  object spSetOrderReserve: TMSStoredProc
    StoredProcName = 'sp_SetOrderReserve'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetOrderReserve (:p_document_id, :p_res' +
        'erve)}')
    Left = 96
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_document_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_reserve'
        ParamType = ptInput
      end>
  end
  object DSVtTemp: TDataSource
    DataSet = VTTemp
    Left = 368
    Top = 156
  end
  object spCopyBlank: TMSStoredProc
    StoredProcName = 'sp_Copy_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Blank;1(:p_document_id, :p_date_to' +
        ', :p_UserNo)}')
    Left = 28
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_document_id'
        ParamType = ptInputOutput
        Size = 32
      end
      item
        DataType = ftDateTime
        Name = 'p_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end>
  end
  object QueryExistBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(RashodNum) as RashodNum, max(id) as ID'
      'from dbo.v_blankList'
      'where status=0 '
      'and DateNakl= :p_DateNakl'
      'and PostNo=  :p_PostNo'
      'and AddressNo= :p_AddressNo'
      'and VidTovGroupId= :p_VidTovGroupId'
      'and OtdelNo= :p_OtdelNo'
      'and SotrudNo= :p_SotrudNo'
      'and ColNPrice= :p_ColNPrice')
    Left = 436
    Top = 156
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_DateNakl'
      end
      item
        DataType = ftSmallint
        Name = 'p_PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_AddressNo'
      end
      item
        DataType = ftInteger
        Name = 'p_VidTovGroupId'
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
      end
      item
        DataType = ftSmallint
        Name = 'p_ColNPrice'
      end>
  end
  object VTTemp: TVirtualTable
    FieldDefs = <
      item
        Name = 'OtdelNo'
        DataType = ftInteger
      end
      item
        Name = 'Reason_Id'
        DataType = ftLargeint
      end>
    Left = 436
    Top = 252
    Data = {
      0300020007004F7464656C4E6F03000000000000000900526561736F6E5F4964
      1900000000000000000000000000}
  end
  object QuReason: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_blank_reason')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 232
    Top = 204
  end
  object DsReason: TDataSource
    DataSet = QuReason
    Left = 300
    Top = 156
  end
  object QuCheckNakl: TMSQuery
    SQLRefresh.Strings = (
      'select * from dbo.v_blanklist a'
      'WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select u.id,u.blank_cnt,u.Nakl_cnt,u.spis_cnt'
      'from '
      '(    '
      'SELECT  h.id'
      '       ,(SELECT Count(s.id)'
      '        FROM   e_blanks s'
      '        WHERE  s.document_id = h.id'
      '        AND s.kolord <> 0) AS blank_cnt'
      '       ,(SELECT Count(s1.id)'
      '        FROM   dspec s1'
      '        WHERE  s1.dhead_id = h.rowid'
      '        AND s1.qty <> 0) AS nakl_cnt'
      '       ,(SELECT Count(s2.id)'
      '        FROM   dspec s2'
      '        WHERE  s2.dhead_id IN (SELECT pkey'
      '                               FROM   naklr'
      
        '                               WHERE  nomreturn = h.rowid)) AS s' +
        'pis_cnt'
      '       ,h.vidnaklno'
      'FROM   e_blank_head h'
      'WHERE  h.datenakl = :p_date_Nakl'
      'AND h.status <> -1) u'
      
        'where blank_cnt<>Nakl_cnt or (u.vidnaklNo=3 and u.blank_cnt<>u.s' +
        'pis_cnt)')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 572
    Top = 204
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_date_Nakl'
      end>
  end
end
