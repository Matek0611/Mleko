inherited MlekoCrossRequestForGoodsForm: TMlekoCrossRequestForGoodsForm
  Left = 790
  Top = 178
  Width = 818
  Height = 559
  Caption = 'MlekoCrossRequestForGoodsForm'
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
    object ToolButton6: TToolButton
      Left = 215
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 32
      Style = tbsSeparator
    end
    object CBIsOnlyRequest: TCheckBox
      Left = 223
      Top = 0
      Width = 97
      Height = 22
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079
      TabOrder = 1
      OnClick = ActionViewRefreshExecute
    end
    object CBAllTovar: TCheckBox
      Left = 320
      Top = 0
      Width = 97
      Height = 22
      Caption = #1058#1086#1083#1100#1082#1086' '#1084#1080#1085#1091#1089
      TabOrder = 0
      OnClick = ActionViewRefreshExecute
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
          DataField = 'FullName'
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
          Width = 57
          Height = 13
          Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
        end
        object Label7: TLabel
          Left = 265
          Top = 1
          Width = 135
          Height = 13
          Caption = #1044#1072#1090#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
        end
        object DBText2: TDBText
          Left = 281
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'DateRequest'
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
          DataField = 'Id'
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
        object DBText3: TDBText
          Left = 437
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'SummaRequest'
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
          Left = 418
          Top = 1
          Width = 143
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1079#1072#1087#1088#1086#1089#1072' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
        end
        object Label3: TLabel
          Left = 590
          Top = 1
          Width = 91
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        end
        object DBText4: TDBText
          Left = 581
          Top = 15
          Width = 113
          Height = 15
          Color = clInfoBk
          DataField = 'NaklNo'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object EdPodr: TcxDBLookupComboBox
          Left = 355
          Top = 32
          DataBinding.DataField = 'TipNo'
          DataBinding.DataSource = DSVtBrand
          Properties.KeyFieldNames = 'TipNo'
          Properties.ListColumns = <
            item
              FieldName = 'TipName'
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
    StoredProcName = 'GetRequestForSupplyGoods;1'
    SQLUpdate.Strings = (
      'begin'
      ' print 1'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL GetRequestForSupplyGoods;1(:p_dateNakl, :p' +
        '_TipNo, :p_article_id, :only_minus, :Request_id, :isOnlyRequest)' +
        '}')
    Options.StrictUpdate = False
    AfterPost = SPAfterPost
    Left = 452
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'p_dateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_TipNo'
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
      end
      item
        DataType = ftInteger
        Name = 'Request_id'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = 'isOnlyRequest'
        ParamType = ptInput
      end>
  end
  object spGetColInfoForBlankOrder: TMSStoredProc
    StoredProcName = 'sp_GetColInfoForRequest;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_GetColInfoForRequest;1(:Request_id, :Na' +
        'klNo)}')
    Left = 552
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Request_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
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
      'select v.TipName,v.TipNo'
      'from tovar t inner join TipTovara v on t.TipNo=v.TipNo     '
      
        '     left outer join V_RequestForSupplyGoods s on s.DateRequest=' +
        ' :DateNakl and t.TovarNo=s.TovarNo'
      '     left outer join Ostatok o on t.TovarNo=o.TovarNo'
      'where s.Qty<>0 or o.Kol<>0'
      'group by v.TipName,v.TipNo'
      ''
      '/*'
      'select v.VidName,v.VidNo '
      'from tovar t inner join VidTov v on t.VidNo=v.VidNo     '
      
        '     left outer join e_blanks s on s.DateNakl= :DateNakl and t.T' +
        'ovarNo=s.TovarNo'
      '     left outer join Ostatok o on t.TovarNo=o.TovarNo'
      'where s.KolOrd<>0 or o.Kol<>0'
      'group by v.VidName,v.VidNo'
      '*/')
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
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditRequestPosition;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditRequestPosition;1(:Request_id, :Tov' +
        'arNo, :QtyFirst, :Qty, :NaklNo, :id, :summa)}')
    Left = 316
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'Request_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QtyFirst'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Qty'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'summa'
        ParamType = ptInputOutput
      end>
  end
  object quInfo: TMSStoredProc
    StoredProcName = 'sp_CrossColInfoForRequest;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_CrossColInfoForRequest;1(:p_TipNo, :p_d' +
        'ateNakl, :p_article_id, :only_minus, :Request_Id)}')
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
        Name = 'p_TipNo'
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
      end
      item
        DataType = ftInteger
        Name = 'Request_Id'
        ParamType = ptInput
      end>
  end
  object VtBrand: TVirtualTable
    FieldDefs = <
      item
        Name = 'TipNo'
        DataType = ftLargeint
      end>
    Left = 640
    Top = 109
    Data = {0300010005005469704E6F1900000000000000000000000000}
  end
end
