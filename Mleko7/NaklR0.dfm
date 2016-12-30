inherited fmNaklR_: TfmNaklR_
  Left = 447
  Top = 226
  VertScrollBar.Range = 0
  ActiveControl = RxDBGrid1
  AutoScroll = False
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 600
  ClientWidth = 1082
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 581
    Width = 1082
  end
  inherited ToolBar: TToolBar
    Width = 1082
    Height = 25
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Action = ActionAdd
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Action = ActionOpenSpec
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Action = ActionDelete
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 77
      Top = 0
      Action = ActionPrint
    end
    object ToolButton7: TToolButton
      Left = 100
      Top = 0
      Action = ActionPrintNakl
    end
    object ToolButton10: TToolButton
      Left = 123
      Top = 0
      Action = ActionExport
    end
    object ToolButton2: TToolButton
      Left = 146
      Top = 0
      Action = ActionViewRefresh
    end
    object ToolButton8: TToolButton
      Left = 169
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 177
      Top = 0
      Action = ActionExit
    end
    object CreateNaklP: TToolButton
      Left = 200
      Top = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1055#1053
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1055#1053
      ImageIndex = 32
      OnClick = CreateNaklPClick
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 25
    Width = 1082
    Height = 556
    Align = alClient
    DataSource = dsNaklR
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        Title.Caption = #1050#1086#1076
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #8470
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BuhName'
        Title.Caption = #1058#1080#1087
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OtdelName'
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        Title.Caption = #1044#1086#1083#1075
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNaklFirst'
        Title.Caption = ' '
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameFirst'
        Title.Caption = ' '
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = ' '
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Edit_status_name'
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1088#1077#1076
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidNaklName'
        Title.Caption = #1042#1080#1076
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Spisanie'
        Title.Caption = #1057#1087#1080#1089#1072#1085#1086
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SET_ARTICLE_GROUP_NAME'
        Title.Caption = #1053#1072#1073#1086#1088
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TypeReturn'
        Title.Caption = #1058#1080#1087' '#1042#1086#1079#1074#1088#1072#1090#1072
        Visible = True
      end>
  end
  inherited ActionList: TActionList
    Left = 240
    Top = 104
  end
  object quNaklR: TMSQuery
    SQLDelete.Strings = (
      'declare @Pkey bigint'
      ''
      'set @Pkey = :PKey'
      ''
      'EXEC [sp_delnaklr] @Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT '
      '       h.NaklNo,'
      '       h.Nom,'
      '       h.PostNo,'
      '       h.DateNakl,'
      '       h.Summa,'
      '       h.SummaDolg,'
      '       h.VidNaklNo,'
      '       P1.Name,'
      '       h.ColnPrice,'
      '       h.Buh,'
      
        '       (select buh_type_name from d_buh_type where buh=h.buh) as' +
        ' BuhName,'
      '       h.SotrudNo,'
      '       Users.UserName,'
      '       h.DateNaklFirst,'
      '       h.Ask,'
      '       h.AddressNo,'
      '       P2.Name AS NameFirst,'
      '       h.DateOpl,'
      '       h.RealDateOpl,'
      '       h.PostNoFirst,'
      '       AddressPost.Address,'
      '       h.Weight,'
      '       h.KolPerPak,'
      '       VidOtdel.OtdelName,'
      '       h.OtdelNo,'
      '       Post_1.Name AS NameReturn,'
      '       h.NomReturn,'
      '       P1.Print3,'
      '       h.InCar,'
      '       h.ExpeditionNo,'
      
        '       P2.Name + '#39' ('#39' + AddressPost.Address + '#39')'#39' AS NameAddress' +
        ','
      
        '       (select name from d_edit_status where id = h.edit_status_' +
        'id) as Edit_status_name,'
      '       h.Edit_Status_id,'
      
        '       (select VidNaklName from vidnakl where VidNaklNo=h.VidNak' +
        'lNo) as VidNaklName ,'
      '       h.Pkey'
      
        '      ,case when h.vidNaklNo=3 then (SELECT isnull(Max('#39#1058#1040#1050#39'),'#39#1053 +
        #1030#39') FROM NaklR WHERE NomReturn in (h.Pkey,h.NaklNo)) else '#39#1053#1030#39' e' +
        'nd As Spisanie'
      
        '      ,(select name from D_SET_ARTICLE_GROUP where id=h.SET_ARTI' +
        'CLE_GROUP_ID) as SET_ARTICLE_GROUP_NAME'
      '      ,h.SET_ARTICLE_GROUP_ID'
      '      ,p1.TTN'
      
        '      ,(select TypeReturnName from d_TypeReturn where TypeReturn' +
        'No = L.TypeReturnNo) as TypeReturn'
      '  FROM NaklR h'
      '  LEFT OUTER JOIN Post P1 ON P1.PostNo = h.PostNo'
      '  LEFT OUTER JOIN Post P2 ON P2.PostNo = h.PostNoFirst'
      '  LEFT OUTER JOIN Users ON Users.UserNo = h.UserNo'
      '  LEFT OUTER JOIN VidOtdel ON h.OtdelNo = VidOtdel.OtdelNo'
      
        '  LEFT OUTER JOIN AddressPost ON AddressPost.AddressNo = h.Addre' +
        'ssNo'
      
        '                             AND h.PostNoFirst = AddressPost.Pos' +
        'tNo'
      '  LEFT OUTER JOIN Post Post_1 ON h.PostNoReturn = Post_1.PostNo'
      '  LEFT OUTER JOIN L_NaklRReturn L on L.NaklNo = h.NaklNo'
      ' where &_where'
      ' order by &_order')
    BeforePost = quNaklPBeforePost
    OnNewRecord = quNaklPNewRecord
    Options.StrictUpdate = False
    Left = 40
    Top = 34
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
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 40
    Top = 96
  end
  object ActionList1: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 312
    Top = 96
    object ActionOpenSpec: TAction
      Caption = 'ActionOpenSpec'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActionOpenSpecExecSQL
    end
    object ActionViewRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionDelete: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = ActionDeleteExecute
    end
    object ActionAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 42
      ShortCut = 16464
      OnExecute = ActionPrintExecute
    end
    object ActionPrintNakl: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1053#1072#1082#1083#1072#1076#1085#1086#1081
      Hint = #1055#1077#1095#1072#1090#1100' '#1053#1072#1082#1083#1072#1076#1085#1086#1081
      ImageIndex = 15
      ShortCut = 16500
      OnExecute = ActionPrintNaklExecute
    end
    object ActionExit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 45
      OnExecute = ActionExitExecute
    end
    object ActionExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' DBF'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' DBF'
      ImageIndex = 46
      OnExecute = ActionExportExecute
    end
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 12
    Top = 308
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    FixedWidth = True
    Background = True
    Centered = False
    EmptyLines = True
    Left = 31
    Top = 308
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 46
    Top = 308
  end
  object frxXMLExport1: TfrxXMLExport
    FileName = 'C:\DELPHI\MLEKO\1.xls'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 64
    Top = 308
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 84
    Top = 308
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 103
    Top = 308
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 122
    Top = 308
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 141
    Top = 308
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 157
    Top = 308
  end
  object RepDataSet: TfrxDBDataset
    UserName = 'RepDataSetNakl'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NaklNo=NaklNo'
      'PostNo=PostNo'
      'Name=Name'
      'Nom=Nom'
      'VidNaklName=VidNaklName'
      'ColnPrice=ColnPrice'
      'DateNakl=DateNakl'
      'Summa=Summa'
      'SummaDolg=SummaDolg'
      'VidNaklNo=VidNaklNo'
      'SotrudNo=SotrudNo'
      'SotrudName=SotrudName'
      'UserName=UserName'
      'Buh=Buh'
      'BuhName=BuhName'
      'DateNaklFirst=DateNaklFirst'
      'NameFirst=NameFirst'
      'DateOpl=DateOpl'
      'RealDateOpl=RealDateOpl'
      'PostNoFirst=PostNoFirst'
      'Ask=Ask'
      'AddressNo=AddressNo'
      'Address=Address'
      'Weight=Weight'
      'KolPerPak=KolPerPak'
      'OtdelNo=OtdelNo'
      'OtdelName=OtdelName'
      'lcNameOtdel=lcNameOtdel'
      'NameReturn=NameReturn'
      'NomReturn=NomReturn'
      'Print3=Print3'
      'InCar=InCar'
      'ExpeditionNo=ExpeditionNo')
    DataSet = quNaklR
    BCDToCurrency = False
    Left = 212
    Top = 308
  end
  object frxReport: TfrxReport
    Version = '4.7.91'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38642.576833877300000000
    ReportOptions.LastChange = 38642.588511458300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 244
    Top = 308
    Datasets = <
      item
        DataSet = RepDataSet
        DataSetName = 'RepDataSetNakl'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.291666666666670000
      RightMargin = 5.291666666666670000
      TopMargin = 5.291666666666670000
      BottomMargin = 5.291666666666670000
      object ReportTitle1: TfrxReportTitle
        Height = 26.456710000000000000
        Top = 16.000000000000000000
        Width = 753.701274166667000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 753.701274166667000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029#1057#8249#1057#8230)
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 17.677180000000000000
        Top = 64.000000000000000000
        Width = 753.701274166667000000
        object Memo2: TfrxMemoView
          Width = 37.978676080000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 37.978676080000000000
          Width = 67.781834230000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1029#1056#176#1056#1108#1056#187)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 194.760510320000000000
          Width = 115.106215200000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1029#1057#8218#1057#1026#1056#176#1056#1110#1056#181#1056#1029#1057#8218' '#1057#8222#1056#176#1056#1108#1057#8218)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 309.866725520000000000
          Width = 115.106215200000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1029#1057#8218#1057#1026#1056#176#1056#1110#1056#181#1056#1029#1057#8218' '#1056#177#1057#1107#1057#8230)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 424.595249960000000000
          Width = 116.106215200000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 541.078953740000000000
          Width = 61.654092920000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1115#1057#8218#1056#1169#1056#181#1056#187)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 602.733046660000000000
          Width = 42.085093480000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1118#1056#1105#1056#1111)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 644.818140140000000000
          Width = 54.351035870000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 699.169176000000000000
          Width = 54.351035870000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#1110)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 106.169176000000000000
          Width = 88.840272810000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            #1056#1106#1056#1110#1056#181#1056#1029#1057#8218)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 32.897650000000000000
        Top = 140.000000000000000000
        Width = 753.701274166667000000
        DataSet = RepDataSet
        DataSetName = 'RepDataSetNakl'
        RowCount = 0
        object Memo13: TfrxMemoView
          Width = 37.978676080000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'Nom'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."Nom"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 37.978676080000000000
          Width = 67.781834230000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'DateNakl'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."DateNakl"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 194.760510320000000000
          Width = 115.106215200000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'NameFirst'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."NameFirst"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 309.866725520000000000
          Width = 115.106215200000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'Name'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."Name"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 424.595249960000000000
          Width = 116.106215200000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'Address'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."Address"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 541.078953740000000000
          Width = 61.654092920000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'OtdelName'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."OtdelName"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 602.733046660000000000
          Width = 42.085093480000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'BuhName'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."BuhName"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 644.818140140000000000
          Width = 54.351035870000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'Summa'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."Summa"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 699.169176000000000000
          Width = 54.351035870000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'SummaDolg'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."SummaDolg"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 106.169176000000000000
          Width = 88.840272810000000000
          Height = 32.897650000000000000
          ShowHint = False
          DataField = 'SotrudName'
          DataSet = RepDataSet
          DataSetName = 'RepDataSetNakl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[RepDataSetNakl."SotrudName"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 232.000000000000000000
        Width = 753.701274166667000000
        object Memo23: TfrxMemoView
          Align = baWidth
          Width = 753.701274166667000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo24: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          Left = 678.110674166667000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8 = (
            'Page [Page#]')
        end
      end
    end
  end
  object SaveDialogDBF: TSaveDialog
    DefaultExt = 'dbf'
    Filter = 'DBF files (*.dbf)|*.dbf'
    Left = 480
    Top = 88
  end
  object quNaklR_Export: TMSQuery
    SQLDelete.Strings = (
      'declare @Pkey bigint'
      ''
      'set @Pkey = :PKey'
      ''
      'EXEC [sp_delnaklr] @Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from v_NaklR_Export')
    BeforePost = quNaklPBeforePost
    OnNewRecord = quNaklPNewRecord
    Options.StrictUpdate = False
    Left = 520
    Top = 90
  end
  object quCreateNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare '
      '    @PostNo int'
      '   ,@Cnt int '
      '   ,@QtyOrig decimal(18,3)'
      '   ,@TovarNoOrig int'
      '   ,@QtyReturn decimal(18,3)'
      '   ,@TovarNoReturn int'
      '   ,@d_bank_invoice_id int'
      '   ,@NaklNo int'
      '   ,@Nom int'
      '   ,@Buh int'
      '   ,@UserNo int'
      '   ,@Pkey bigint'
      '   ,@OurFirmNo int'
      '   ,@OtdelNo int'
      '   ,@Price decimal(18,6)'
      '   ,@ParentNakl int'
      '   ,@spec_id bigint'
      '   ,@DocDate smalldatetime'
      '   ,@DateOfManufacture datetime'
      ''
      '  set @PostNo = :PostNo'
      '  set @OtdelNo = :OtdelNo'
      '  set @Buh = :Buh'
      '  set @UserNo = :UserNo'
      ''
      
        '  select @DocDate = min(DateNakl) from NaklR where (NaklNo in &_' +
        'NaklS)'
      ''
      '  select @OurFirmNo = PostNo from d_our_firm'
      ''
      
        '  select @d_bank_invoice_id = id from D_BANK_INVOICE where isMai' +
        'n = 1'
      ''
      '  select @NaklNo = MAX(NaklNo)+1 , @Nom = max(nom)+1 from NaklP'
      ''
      '  select @Pkey = -1*cast(cast(newid() as binary(16)) as bigint) '
      ''
      '  if @NaklNo is null set @NaklNo = 1'
      '  if @Nom is null set @Nom = 1'
      ''
      '  insert into NaklP'
      
        '    (NaklNo, Nom, PostNo, DateNakl, Summa, SummaDolg, Buh, UserN' +
        'o, VidNaklNo,'
      
        '    OtdelNo, DatePrih, doc_type, parent_NaklNo, OurFirmNo,pkey,E' +
        'dit_status_id,d_bank_invoice_id)'
      '  values'
      '    (@NaklNo, @Nom, @PostNo, @DocDate, 0, 0, @Buh, @UserNo, '
      
        '     1, @OtdelNo, @DocDate, 1, @ParentNakl, @OurFirmNo, @pkey, 3' +
        ', @d_bank_invoice_id)'
      ''
      
        '  insert into l_NaklPForNaklR (NaklNoR, NaklNoP, NaklDate,UserNo' +
        ')'
      
        '  select NaklNo, @NaklNo, getdate(),@UserNo from NaklR where (Na' +
        'klNo in &_NaklL)'
      '   '
      '  declare CS cursor scroll local for   '
      '  select  -1 * ds.QTY as QtyOrig'
      '        , ds.ARTICLE_ID as TovarNoOrig'
      #9', ds.QTY as QtyReturn'
      #9', l.TovarNoReturn'
      #9', o.LastPriceIn'
      '        , ds.DateOfManufacture'
      '   from DSPEC ds left join'
      '        NaklR nr on ds.NaklNo = nr.NaklNo left join'
      #9'L_NaklRReturn lnrr on lnrr.NaklNo = nr.NaklNo left join'
      
        #9'l_TovarForReturn l on ds.ARTICLE_ID = l.TovarNo and lnrr.TypeRe' +
        'turnNo = l.TypeReturnNo left join'
      #9'Ostatok o on o.TovarNo = ds.ARTICLE_ID'
      '    where l.TovarNoReturn is not null'
      '      and (ds.NaklNo in &_NaklNo)'
      ''
      '  open CS;'
      '  while 1= 1 '
      '   begin'
      '     fetch next from CS '
      '      into  @QtyOrig'
      #9'  , @TovarNoOrig'
      #9'  , @QtyReturn'
      #9'  , @TovarNoReturn'
      #9'  , @Price'
      '          , @DateOfManufacture'
      '      '
      '      if @@FETCH_STATUS <> 0 break'
      '       begin'
      '         EXECUTE [work].[dbo].[pr_add_dspec]'
      '          @spec_id OUTPUT ,'
      '          @TovarNoOrig ,'
      '          @QtyOrig ,'
      '          @Price ,'
      '          @pkey ,'
      #9'  @QtyOrig ,'
      #9'  null,'
      #9'  @DateOfManufacture'
      ''
      '         EXECUTE [work].[dbo].[pr_add_dspec]'
      '          @spec_id OUTPUT ,'
      '          @TovarNoReturn ,'
      '          @QtyReturn ,'
      '          @Price ,'
      '          @pkey ,'
      '          @QtyOrig ,'
      #9'  null,'
      #9'  @DateOfManufacture'
      '       end'
      '     '
      'end'
      'close CS;')
    Left = 1000
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'OtdelNo'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
      end>
    MacroData = <
      item
        Name = '_NaklS'
      end
      item
        Name = '_NaklL'
      end
      item
        Name = '_NaklNo'
      end>
  end
  object dsCreateNaklP: TMSDataSource
    DataSet = quCreateNaklP
    Left = 976
    Top = 96
  end
  object quCeckCreateNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  ds.ARTICLE_ID as TovarNo'
      #9'    , l.TovarNoReturn'
      
        #9#9', (select NameTovar from Tovar where TovarNo = ds.ARTICLE_ID) ' +
        'as NameTovar'
      
        #9#9', (select TypeReturnName from D_TypeReturn where TypeReturnNo ' +
        '= l.TypeReturnNo) as NameReturn'
      '   from DSPEC ds left join'
      '        L_NaklRReturn lnrr on lnrr.NaklNo = ds.NaklNo left join'
      
        #9'    l_TovarForReturn l on ds.ARTICLE_ID = l.TovarNo and lnrr.Ty' +
        'peReturnNo = l.TypeReturnNo left join'
      #9'    Tovar t on ds.ARTICLE_ID = t.TovarNo'
      '    where l.TovarNoReturn is null'
      '      and (ds.NaklNo in &_NaklS)')
    Left = 1032
    Top = 168
    MacroData = <
      item
        Name = '_NaklS'
      end>
  end
  object dsCeckCreatenaklP: TMSDataSource
    Left = 1008
    Top = 168
  end
end
