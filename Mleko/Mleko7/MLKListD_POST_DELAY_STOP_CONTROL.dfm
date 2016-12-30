inherited MLKListD_POST_DELAY_STOP_CONTROLFrame: TMLKListD_POST_DELAY_STOP_CONTROLFrame
  Width = 607
  Height = 396
  inherited PanelGrid: TPanel
    Width = 276
    Height = 258
    inherited DBCxGrid: TcxGrid
      Width = 270
      Height = 165
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        object DBCxGridDBTableView1USER_ID: TcxGridDBColumn
          Caption = #1054#1087#1077#1088#1072#1090#1086#1088
          DataBinding.FieldName = 'UserName'
          Options.Editing = False
        end
        object DBCxGridDBTableView1DATE_BEG: TcxGridDBColumn
          Caption = #1057' '#1044#1072#1090#1099
          DataBinding.FieldName = 'DATE_BEG'
        end
        object DBCxGridDBTableView1DATE_END: TcxGridDBColumn
          Caption = #1055#1086' '#1044#1072#1090#1091
          DataBinding.FieldName = 'DATE_END'
        end
        object DBCxGridDBTableView1ACTION_DATE: TcxGridDBColumn
          Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'ACTION_DATE'
          Options.Editing = False
        end
        object DBCxGridDBTableView1ReasonName: TcxGridDBColumn
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
          DataBinding.FieldName = 'ReasonName'
        end
        object DBCxGridDBTableView1Day_Prosr_group: TcxGridDBColumn
          Caption = #1055#1088#1086#1089#1088#1086#1095#1082#1072' '#1087#1086' '#1085#1072#1073#1086#1088#1091
          DataBinding.FieldName = 'Day_Prosr_group'
        end
        object DBCxGridDBTableView1Day_Prosr: TcxGridDBColumn
          Caption = #1055#1088#1086#1089#1088#1086#1095#1082#1072' '#1086#1073#1097#1072#1103
          DataBinding.FieldName = 'Day_Prosr'
        end
        object DBCxGridDBTableView1SummaDolg: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072' '#1086#1073#1097#1072#1103
          DataBinding.FieldName = 'SummaDolg'
        end
        object DBCxGridDBTableView1SummaCollection: TcxGridDBColumn
          Caption = #1048#1085#1082#1072#1089#1072#1094#1080#1103
          DataBinding.FieldName = 'SummaCollection'
        end
        object ClnActive: TcxGridDBColumn
          Caption = #1040#1082#1090#1080#1074#1085#1072
          DataBinding.FieldName = 'ACTIVE'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Options.Editing = False
          Width = 64
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 270
      ActivePage = tsDynamicFilter
      ClientRectRight = 270
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 224
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 270
    end
  end
  inherited PageExt: TcxPageControl
    Top = 292
    Width = 607
    ClientRectRight = 606
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 605
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Top = 284
    Width = 607
  end
  inherited PageSettings: TcxPageControl
    Height = 258
    ClientRectBottom = 257
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 210
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 210
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDDataSetName=QuD_POST_DELAY_STOP_CONTROL')
        ColWidths = (
          120
          83)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 503
    Height = 258
    ClientRectBottom = 257
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 236
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Left = 495
    Height = 258
  end
  inherited SplitterSettings: TcxSplitter
    Height = 258
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 607
  end
  inherited SaveDialog: TSaveDialog
    Left = 26
    Top = 189
  end
  inherited UserActionList: TActionList
    Left = 6
    Top = 150
  end
  inherited DS: TDataSource
    DataSet = QuD_POST_DELAY_STOP_CONTROL
    Left = 96
    Top = 150
  end
  inherited OpenDialog: TOpenDialog
    Left = 65532
    Top = 189
  end
  inherited CustomActionList: TActionList
    Left = 66
    Top = 151
  end
  inherited SysActionList: TActionList
    Left = 36
    Top = 150
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    Left = 48
    Top = 248
    DockControlHeights = (
      0
      0
      0
      0)
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 320
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 387
    end
  end
  inherited PropStore: TcxPropertiesStore
    Left = 120
    Top = 262
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 12
    Top = 263
  end
  inherited DSSelection: TDataSource
    Left = 156
    Top = 261
  end
  inherited VTSelection: TVirtualTable
    Left = 86
    Top = 253
    Data = {03000000000000000000}
  end
  inherited PopMenuGRID: TcxGridPopupMenu
    Left = 64
    Top = 189
  end
  object QuD_POST_DELAY_STOP_CONTROL: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO D_POST_DELAY_STOP_CONTROL'
      
        '  (L_POST_SET_DELAY_ID, USER_ID, DATE_BEG, DATE_END, ACTION_DATE' +
        ',ACTIVE)'
      'VALUES'
      
        '  (:L_POST_SET_DELAY_ID, :USER_ID, :DATE_BEG, :DATE_END, GetDate' +
        '(),'#39'Y'#39')')
    SQLDelete.Strings = (
      'UPDATE D_POST_DELAY_STOP_CONTROL'
      'SET'
      ' ACTIVE = '#39'N'#39
      'WHERE'
      '  ID = :ID')
    SQLUpdate.Strings = (
      'UPDATE D_POST_DELAY_STOP_CONTROL'
      'SET'
      
        '  ID = L_POST_SET_DELAY_ID = :L_POST_SET_DELAY_ID, USER_ID = :US' +
        'ER_ID, DATE_BEG = :DATE_BEG, DATE_END = :DATE_END, ACTION_DATE =' +
        ' :ACTION_DATE, ACTIVE = :ACTIVE'
      'WHERE'
      '  ID = :ID')
    SQLRefresh.Strings = (
      
        'SELECT D_POST_DELAY_STOP_CONTROL.ID, D_POST_DELAY_STOP_CONTROL.L' +
        '_POST_SET_DELAY_ID, D_POST_DELAY_STOP_CONTROL.USER_ID, D_POST_DE' +
        'LAY_STOP_CONTROL.DATE_BEG, D_POST_DELAY_STOP_CONTROL.DATE_END, D' +
        '_POST_DELAY_STOP_CONTROL.ACTION_DATE FROM D_POST_DELAY_STOP_CONT' +
        'ROL'
      'WHERE'
      '  ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT ID'
      '      ,L_POST_SET_DELAY_ID'
      
        '      ,case when isSite = 1 then (select SotrudName from Sotrud ' +
        'where SotrudNo = l.USER_ID)'
      
        #9'    when (isSite is null or isSite = 0) then (select UserName f' +
        'rom Users where UserNo=l.USER_ID) '
      '       end as UserName '
      '      ,USER_ID'
      '      ,DATE_BEG'
      '      ,DATE_END'
      '      ,ACTION_DATE'
      '      ,rfu.ReasonName'
      '      ,Day_Prosr_group'
      '      ,Day_Prosr'
      '      ,SummaDolg'
      '      ,SummaCollection'
      '      ,ACTIVE'
      ' FROM D_POST_DELAY_STOP_CONTROL l left join'
      '      ReasonForUnlocking rfu on rfu.ReasonNo = l.ReasonNo'
      'where 1 = 1'
      '&_where')
    RefreshOptions = [roAfterInsert, roAfterUpdate, roBeforeEdit]
    Options.StrictUpdate = False
    MasterFields = 'ID'
    DetailFields = 'L_POST_SET_DELAY_ID'
    Left = 1
    Top = 98
    MacroData = <
      item
        Name = '_where'
      end>
  end
end
