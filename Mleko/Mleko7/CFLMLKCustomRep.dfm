inherited CFLMLKCustomRepDlg: TCFLMLKCustomRepDlg
  Left = 1093
  Top = 170
  Caption = 'CFLMLKCustomRepDlg'
  ClientHeight = 291
  ClientWidth = 272
  Constraints.MinWidth = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 129
    Top = 270
    Width = 70
    Height = 20
  end
  inherited ButtonCancel: TButton
    Left = 201
    Top = 270
    Width = 70
    Height = 20
  end
  inherited ButtonApply: TButton
    Left = 19
    Top = 270
    Width = 69
    Height = 20
    Enabled = False
    Visible = False
  end
  inherited PageControl: TPageControl
    Top = 130
    Width = 272
    Height = 141
    MultiLine = True
    TabHeight = 1
    TabPosition = tpRight
    TabStop = False
    inherited TabSheet1: TTabSheet
      Caption = ''
    end
  end
  inherited ToolBar: TToolBar
    Width = 272
    object ToolBtnAdd: TToolButton
      Left = 23
      Top = 0
      Action = ActionDesignReport
    end
    object ToolButton1: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object IsDebugMode: TCheckBox
      Left = 54
      Top = 0
      Width = 97
      Height = 22
      Caption = 'Debug Mode'
      TabOrder = 0
    end
  end
  object Panel1: TPanel [5]
    Left = 0
    Top = 24
    Width = 272
    Height = 106
    Align = alTop
    BevelWidth = 2
    TabOrder = 5
    object Label1: TLabel
      Left = 5
      Top = 43
      Width = 102
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CEView: TcitDBComboEdit
      Left = 5
      Top = 20
      Width = 238
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
      LLblAlignment = laTop
      LLblCaption = #1042#1080#1076' '#1086#1090#1095#1077#1090#1072
      LLblWidth = 150
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
      MaxLength = 280
      TabOrder = 0
      Text = 'CEView'
      Visible = True
      DataSet = quViewTemplate
      LocateKey = False
      KeyField = 'ID'
      TextField = 'NAME'
      EditStyle = edCombo
      AutoTabControl = True
    end
    object DBMemo1: TDBMemo
      Left = 2
      Top = 59
      Width = 268
      Height = 45
      Align = alBottom
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clInfoBk
      Ctl3D = False
      DataField = 'DESCRIPTION'
      DataSource = DSReport
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited ActionList: TActionList
    Left = 10
    Top = 138
    object ActionDesignReport: TAction
      Caption = 'ActionDesignReport'
      ImageIndex = 8
      ShortCut = 16453
      OnExecute = ActionDesignReportExecute
    end
    object ActionEditReport: TAction
      Caption = 'ActionEditReport'
      ImageIndex = 1
    end
    object ActionViewSQL: TAction
      Caption = 'ActionViewSQL'
      ShortCut = 49235
    end
    object ActionPushButton: TAction
      Caption = 'ActionPushButton'
      OnExecute = ActionPushButtOnExecute
    end
    object ActionViewParam: TAction
      Caption = 'ActionViewParam'
    end
  end
  inherited Query: TMSQuery
    Connection = dmDataModule.DB
    Left = 100
    Top = 198
  end
  inherited DS: TDataSource
    Left = 40
    Top = 138
  end
  inherited quCMD: TMSQuery
    Left = 130
    Top = 198
  end
  object quTemplates: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_report_template where prop_dlg_id = :p_report_id')
    Left = 190
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object quReport: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_prop_dlg d, d_prop_dlg_type t'
      'where d.type_id=t.id and t.code='#39'REPORT'#39
      'and d.id = :p_report_id')
    Left = 40
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object quParams: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select tp.*,pt.name as code,pt.data_type_code as data_type,pt.de' +
        'scription as entity_name'
      'from D_PROP_DLG_ATTRIBUTE tp, D_ENTITY_TYPE pt'
      'where tp.prop_dlg_id= :p_report_id'
      'and tp.entity_type_id=pt.id'
      'order by tp.num_order')
    Left = 10
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object SPSaveReport: TMSStoredProc
    StoredProcName = 'sp_SaveReport'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SaveReport (:p_report_id, :p_print_temp' +
        'late_id, :p_template)}')
    Left = 160
    Top = 198
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_report_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_print_template_id'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = 'p_template'
        ParamType = ptInput
        Value = ''
      end>
  end
  object Report: TfrxReport
    Version = '4.7.91'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38680.845659942100000000
    ReportOptions.LastChange = 38680.845659942100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 10
    Top = 168
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 100
    Top = 138
  end
  object DSReport: TDataSource
    DataSet = quReport
    Left = 70
    Top = 138
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select :p_date -14 as val')
    Left = 70
    Top = 198
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_date'
      end>
  end
  object quViewTemplate: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from D_REPORT_PRINT_TEMPLATE '
      'where prop_dlg_id = :p_report_id'
      'Order by is_main desc')
    Left = 160
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
    object quViewTemplateID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'D_REPORT_PRINT_TEMPLATE.ID'
      ReadOnly = True
      Visible = False
    end
    object quViewTemplateTEMPLATE: TMemoField
      FieldName = 'TEMPLATE'
      Origin = 'D_REPORT_PRINT_TEMPLATE.TEMPLATE'
      Visible = False
      BlobType = ftMemo
    end
    object quViewTemplateName: TStringField
      FieldName = 'Name'
      Origin = 'D_REPORT_PRINT_TEMPLATE.Name'
      Size = 50
    end
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 130
    Top = 138
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
    Left = 190
    Top = 138
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    ExportStyles = False
    ExportPictures = False
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 100
    Top = 168
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
    Left = 40
    Top = 168
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 160
    Top = 138
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
    Left = 70
    Top = 168
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 130
    Top = 168
  end
  object frxCrossObject: TfrxCrossObject
    Left = 190
    Top = 198
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 236
    Top = 142
  end
end
