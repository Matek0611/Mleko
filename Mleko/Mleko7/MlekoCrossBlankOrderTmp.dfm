inherited MlekoCrossBlankOrderTmpForm: TMlekoCrossBlankOrderTmpForm
  Left = 577
  Top = 193
  Width = 818
  Height = 559
  Caption = 'MlekoCrossBlankOrderTmpForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 502
    Width = 802
    Height = 18
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  inherited ToolBar: TToolBar
    Top = 61
    Width = 802
    object ToolButton3: TToolButton
      Left = 192
      Top = 0
      Action = ActionRegim
      Style = tbsCheck
    end
    object ToolButton5: TToolButton
      Left = 215
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object ToolButtonRestoreTovar: TToolButton
      Left = 223
      Top = 0
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
      ImageIndex = 28
      OnClick = ToolButtonRestoreTovarClick
    end
    object ToolButtonRestoreBrand: TToolButton
      Left = 246
      Top = 0
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1088#1077#1085#1076
      Caption = 'ToolButtonRestoreBrand'
      ImageIndex = 12
      OnClick = ToolButtonRestoreBrandClick
    end
    object CBAllTovar: TCheckBox
      Left = 269
      Top = 0
      Width = 97
      Height = 22
      Caption = #1042#1089#1077' '#1087#1086#1079#1080#1094#1080#1080
      TabOrder = 0
    end
  end
  inherited PageControlTop: TPageControl
    Top = 0
    Width = 802
    Height = 61
    MultiLine = True
    TabHeight = 1
    TabPosition = tpRight
    TabWidth = 1
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 793
        Height = 53
        object DBText1: TDBText
          Left = 3
          Top = 14
          Width = 263
          Height = 31
          Color = clInfoBk
          DataField = 'ColumnFullName'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object DBText3: TDBText
          Left = 268
          Top = 14
          Width = 84
          Height = 15
          Color = clInfoBk
          DataField = 'buhName'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 291
          Top = 1
          Width = 19
          Height = 13
          Caption = #1058#1080#1087
        end
        object Label3: TLabel
          Left = 360
          Top = 1
          Width = 72
          Height = 13
          Caption = #1050#1086#1083#1086#1085#1082#1072' '#1094#1077#1085#1099
        end
        object DBText4: TDBText
          Left = 356
          Top = 15
          Width = 86
          Height = 15
          Color = clInfoBk
          DataField = 'ColnPriceName'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 448
          Top = 15
          Width = 54
          Height = 15
          Color = clInfoBk
          DataField = 'KolDayPlan'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label2: TLabel
          Left = 458
          Top = 1
          Width = 27
          Height = 13
          Caption = #1044#1085#1077#1081
        end
        object Label6: TLabel
          Left = 522
          Top = 1
          Width = 73
          Height = 13
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        end
        object DBText6: TDBText
          Left = 505
          Top = 15
          Width = 130
          Height = 15
          Color = clInfoBk
          DataField = 'UserName'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 102
          Top = 1
          Width = 59
          Height = 13
          Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        end
        object Label5: TLabel
          Left = 271
          Top = 34
          Width = 31
          Height = 13
          Caption = #1041#1088#1101#1085#1076
        end
        object Label7: TLabel
          Left = 644
          Top = 1
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        end
        object DBText2: TDBText
          Left = 641
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'Createdate'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBText7: TDBText
          Left = 657
          Top = 32
          Width = 97
          Height = 15
          Color = clInfoBk
          DataField = 'ID'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label8: TLabel
          Left = 643
          Top = 33
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object EdPodr: TcxDBLookupComboBox
          Left = 355
          Top = 32
          DataBinding.DataField = 'VidNo'
          DataBinding.DataSource = DSVtBrand
          Properties.KeyFieldNames = 'VidNo'
          Properties.ListColumns = <
            item
              FieldName = 'VidName'
            end>
          Properties.ListSource = DsListBrand
          TabOrder = 1
          Width = 281
        end
        object Progress: TProgressBar
          Left = 0
          Top = 46
          Width = 267
          Height = 6
          Smooth = True
          Step = 1
          TabOrder = 0
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 85
    Width = 802
    Height = 417
    inherited DBGrid: TDBGridEh
      Width = 796
      Height = 411
      TabStop = False
      AllowedOperations = [alopUpdateEh]
      ColumnDefValues.Title.Orientation = tohVertical
      ColumnDefValues.Title.TitleButton = True
      Font.Name = 'Arial'
      FooterColor = 16776176
      FooterFont.Name = 'Arial'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghFrozen3D, dghFooter3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      RowHeight = 15
      SortLocal = True
      STFilter.Local = False
      STFilter.Visible = False
      TitleFont.Height = -12
      TitleFont.Name = 'Arial Narrow'
      UseMultiTitle = True
      VTitleMargin = 0
      OnColEnter = DBGridColEnter
      OnColExit = DBGridColExit
      OnGetCellParams = DBGridGetCellParams
      OnGetFooterParams = DBGridGetFooterParams
      OnKeyDown = DBGridKeyDown
    end
  end
  inherited ActionList: TActionList
    Left = 44
    Top = 148
    inherited ActionItemDel: TAction
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1102' '#1089#1090#1088#1086#1082#1091
    end
    inherited ActionViewFilterOff: TAction
      Visible = False
    end
    object ActionRegim: TAction
      Caption = #1056#1077#1078#1080#1084
      Hint = #1056#1077#1078#1080#1084
      ImageIndex = 30
      ShortCut = 16452
      OnExecute = ActionRegimExecute
    end
    object ActionRegimSet: TAction
      Caption = 'ActionRegimSet'
      OnExecute = ActionRegimSetExecute
    end
  end
  inherited Query: TMSQuery
    Left = 180
    Top = 196
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 452
    Top = 148
  end
  inherited IniPropStorageMan: TIniPropStorageManEh
    Left = 384
    Top = 148
  end
  inherited DS: TDataSource
    DataSet = SP
    Left = 112
    Top = 148
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    Left = 520
    Top = 148
  end
  inherited SaveDialog1: TSaveDialog
    Left = 112
    Top = 196
  end
  object SP: TMSStoredProc
    StoredProcName = 'GetBlankOrderTMP;1'
    SQLUpdate.Strings = (
      'begin'
      ' print 1'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL GetBlankOrderTMP;1(:p_dateNakl, :p_VidNo, ' +
        ':p_article_id, :only_minus)}')
    Options.StrictUpdate = False
    Left = 452
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_VidNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_article_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'only_minus'
        ParamType = ptInput
        Size = 1
      end>
  end
  object spGetColInfoForBlankOrder: TMSStoredProc
    StoredProcName = 'sp_GetColInfoForBlankOrderTmp;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_GetColInfoForBlankOrderTmp;1(:document_' +
        'id)}')
    Left = 552
    Top = 196
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
  object DataSource1: TDataSource
    DataSet = spGetColInfoForBlankOrder
    Left = 248
    Top = 148
  end
  object quBrand: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select v.VidName,v.VidNo '
      'from tovar t inner join VidTov v on t.VidNo=v.VidNo     '
      
        '     left outer join e_blanks s on s.DateNakl= :DateNakl and t.T' +
        'ovarNo=s.TovarNo'
      '     left outer join Ostatok o on t.TovarNo=o.TovarNo'
      'where s.KolOrd<>0 or o.Kol<>0'
      'group by v.VidName,v.VidNo')
    Left = 752
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl'
      end>
  end
  object DsListBrand: TDataSource
    DataSet = quBrand
    Left = 700
    Top = 108
  end
  object DSVtBrand: TDataSource
    DataSet = VtBrand
    Left = 588
    Top = 108
  end
  object SPSummaBlankTovPos: TMSStoredProc
    StoredProcName = 'SP_SummaBlankTovPos'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL SP_SummaBlankTovPos (:p_dateNakl, :p_Tovar' +
        'No)}')
    Left = 44
    Top = 244
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end>
  end
  object quInfo: TMSStoredProc
    StoredProcName = 'sp_CrossColInfoTmp;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_CrossColInfoTmp;1(:p_VidNo, :p_dateNakl' +
        ', :p_article_id, :only_minus)}')
    Left = 384
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_VidNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_article_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'only_minus'
        ParamType = ptInput
        Size = 1
      end>
  end
  object VtBrand: TVirtualTable
    FieldDefs = <
      item
        Name = 'VidNo'
        DataType = ftLargeint
      end>
    Left = 640
    Top = 109
    Data = {0300010005005669644E6F1900000000000000000000000000}
  end
  object spCuttingMesh: TMSStoredProc
    StoredProcName = 'CuttingMesh'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL CuttingMesh (:DateNakl, :VidNo)}')
    Left = 656
    Top = 213
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VidNo'
        ParamType = ptInput
      end>
  end
  object spRestoreTovarForBlanks: TMSStoredProc
    StoredProcName = 'RestoreTovarForBlanks'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL RestoreTovarForBlanks (:DateNakl, :TovarNo' +
        ')}')
    Left = 368
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
        ParamType = ptInput
      end>
  end
  object spRestoreVidTovarForBlanks: TMSStoredProc
    StoredProcName = 'RestoreVidTovarForBlanks;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL RestoreVidTovarForBlanks;1(:DateNakl, :Vid' +
        'No)}')
    Left = 400
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VidNo'
        ParamType = ptInput
      end>
  end
end
