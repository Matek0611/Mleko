inherited fmInputPlan: TfmInputPlan
  Left = 353
  Top = 141
  Width = 544
  Height = 375
  Caption = 'fmInputPlan'
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TDBGridEh [0]
    Left = 0
    Top = 0
    Width = 536
    Height = 307
    Align = alClient
    DataSource = dsInputPlan
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 307
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbPrint: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object bbOk: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333377F3333333333000033334224333333333333
        337337F3333333330000333422224333333333333733337F3333333300003342
        222224333333333373333337F3333333000034222A22224333333337F337F333
        7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
        33333337F73337F337F33333000033A33333A222433333337333337F337F3333
        0000333333333A222433333333333337F337F33300003333333333A222433333
        333333337F337F33000033333333333A222433333333333337F337F300003333
        33333333A222433333333333337F337F00003333333333333A22433333333333
        3337F37F000033333333333333A223333333333333337F730000333333333333
        333A333333333333333337330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object spInputPlan: TMSStoredProc
    StoredProcName = 'dbo.InputPlan'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.InputPlan (:DatePlan)}')
    CachedUpdates = True
    UpdateObject = UpdateSQL1
    AfterOpen = spInputPlanAfterOpen
    Left = 96
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DatePlan'
        ParamType = ptInput
        Value = '01.04.2003'
      end>
  end
  object dsInputPlan: TDataSource
    DataSet = spInputPlan
    Left = 96
    Top = 184
  end
  object quCompany: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select NameCompany'
      'from Company'
      'where CompanyNo=:CompanyNo'
      ' ')
    Left = 240
    Top = 80
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'CompanyNo'
        ParamType = ptInput
      end>
    object quCompanyNameCompany: TStringField
      FieldName = 'NameCompany'
      Origin = 'BASE.Company.NameCompany'
      FixedChar = True
      Size = 30
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 192
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
      OnClick = N2Click
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 104
    Top = 48
  end
  object quUpdatePlanSotrudCompany: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'if exists (select * from PlanSotrudCompany where DatePlan=:DateP' +
        'lan and SotrudNo=:SotrudNo and CompanyNo=:CompanyNo)'
      ' begin'
      '  update PlanSotrudCompany set Summa=:Summa'
      '  where DatePlan=:DatePlan and'
      '        SotrudNo=:SotrudNo and'
      '        CompanyNo=:CompanyNo'
      ' end'
      'else'
      ' begin'
      '  insert into PlanSotrudCompany'
      '   (DatePlan,SotrudNo,CompanyNo,Summa)'
      '  values'
      '   (:DatePlan,:SotrudNo,:CompanyNo,:Summa)'
      ' end'
      ''
      ' ')
    Left = 104
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePlan'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'CompanyNo'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlan'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'CompanyNo'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlan'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'CompanyNo'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end>
  end
  object UpdateSQL1: TMSUpdateSQL
    Left = 104
    Top = 304
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 344
    Top = 208
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsInputPlan
    Left = 336
    Top = 168
  end
  object frUserDataset1: TfrUserDataset
    OnCheckEOF = frUserDataset1CheckEOF
    OnFirst = frUserDataset1First
    OnNext = frUserDataset1Next
    Left = 400
    Top = 168
  end
  object frReport2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport2GetValue
    Left = 336
    Top = 48
    ReportForm = {19000000}
  end
  object frUserDataset2: TfrUserDataset
    OnCheckEOF = frUserDataset2CheckEOF
    OnFirst = frUserDataset2First
    OnNext = frUserDataset2Next
    Left = 400
    Top = 48
  end
end
