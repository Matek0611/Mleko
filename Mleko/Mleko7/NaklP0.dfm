inherited fmNaklP: TfmNaklP
  Left = 483
  Top = 338
  VertScrollBar.Range = 0
  ActiveControl = RxDBGrid1
  BorderStyle = bsNone
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 340
  ClientWidth = 1025
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 321
    Width = 1025
  end
  inherited ToolBar: TToolBar
    Width = 1025
    Height = 25
    TabOrder = 2
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Action = ActionAdd
    end
    object ToolButton5: TToolButton
      Left = 23
      Top = 0
      Action = ActionEdit
    end
    object ToolButton8: TToolButton
      Left = 46
      Top = 0
      Action = ActionDel
    end
    object ToolButton7: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 77
      Top = 0
      Action = ActionViewRefresh
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Action = ActionPrint
    end
    object ToolButton9: TToolButton
      Left = 123
      Top = 0
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1074'  DBF'
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1074'  DBF'
      ImageIndex = 46
      OnClick = ToolButton9Click
    end
    object ToolButton6: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 154
      Top = 0
      Action = ActionFormClose
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 25
    Width = 1025
    Height = 296
    Align = alClient
    DataSource = dsNaklP
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyDown = RxDBGrid1KeyDown
    OnKeyPress = RxDBGrid1KeyPress
    ClearSelection = False
    MultiSelect = True
    TitleButtons = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NaklNo'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DatePrih'
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'buhName'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostName'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summadolg'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1083#1075
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserName'
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'doc_type_name'
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status_name'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CurrencyHead'
        Title.Caption = #1042#1072#1083#1102#1090#1072
        Visible = True
      end>
  end
  inherited ActionList: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 88
    Top = 96
    object ActionPrint: TAction
      Caption = 'ActionPrint'
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 15
      OnExecute = ActionPrintExecSQL
    end
    object ActionFormClose: TAction
      Caption = 'ActionFormClose'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 45
      OnExecute = ActionFormCloseExecSQL
    end
    object ActionViewRefresh: TAction
      Caption = 'ActionViewRefresh'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1053#1072#1082#1083#1072#1076#1085#1091#1102
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionEdit: TAction
      Caption = 'ActionEdit'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActionEditExecute
    end
    object ActionDel: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = ActionDelExecute
    end
  end
  object quNaklP: TMSQuery
    SQLInsert.Strings = (
      'insert into NaklP'
      
        '  (NaklNo, Nom, PostNo, DateNakl, Summa, SummaDolg, VidNaklNo, B' +
        'uh, '
      'DatePrih,OurFirmNo)'
      'values'
      
        '  (:NaklNo, :Nom, :PostNo, :DateNakl, :Summa, :SummaDolg, :VidNa' +
        'klNo, :Buh, '
      ':DateNakl, :OurFirmNo)')
    SQLDelete.Strings = (
      '-- delete from dspec where dhead_id= :pkey'
      '/*'
      'declare @Dhead bigint'
      ''
      'declare CS cursor scroll local for   '
      'select id'
      ' from dspec '
      '  where dhead_id = :pkey'
      ''
      ''
      'open CS;'
      'while 1= 1 '
      'begin'
      'fetch next from CS '
      '      into @Dhead '
      '        '
      '    if @@FETCH_STATUS <> 0 break'
      '      begin'
      '        exec pr_del_dspec @Dhead '
      '      end'
      ''
      '     '
      'end'
      'close CS;'
      'deallocate CS;'
      ''
      'delete from NaklP where pkey = :old_pkey'
      '*/'
      ''
      'exec sp_DelNaklP :pkey')
    SQLUpdate.Strings = (
      'update NaklP'
      'set'
      '  NaklNo = :NaklNo,'
      '  Nom = :Nom,'
      '  PostNo = :PostNo,'
      '  DateNakl = :DateNakl,'
      '  Summa = :Summa,'
      '  SummaDolg = :SummaDolg,'
      '  VidNaklNo = :VidNaklNo,'
      '  Buh = :Buh,'
      '  DatePrih = :DatePrih,'
      '  OurFirmNo = :OurFIrmNo'
      'where'
      '  pkey = :pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from v_ListNaklP NaklP'
      'where &_where'
      ' and NaklP.ourFirmNo= :OurFirmNo'
      'order by &_order')
    BeforeOpen = quNaklPBeforeOpen
    BeforePost = quNaklPBeforePost
    OnNewRecord = quNaklPNewRecord
    Options.StrictUpdate = False
    Left = 232
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
        ParamType = ptInput
        Value = 490
      end>
    MacroData = <
      item
        Name = '_where'
        Value = '0=1'
      end
      item
        Name = '_order'
        Value = 'NaklNo'
      end>
  end
  object dsNaklP: TDataSource
    DataSet = quNaklP
    Left = 40
    Top = 96
  end
  object quNaklP_Export: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from v_NaklP_Export')
    Left = 416
    Top = 72
  end
  object SaveDialogDBF: TSaveDialog
    DefaultExt = 'dbf'
    Filter = 'DBF files (*.dbf)|*.dbf'
    Left = 384
    Top = 72
  end
end
