inherited fmCrossPostNaklR: TfmCrossPostNaklR
  Left = 883
  Top = 276
  Width = 544
  Height = 375
  ActiveControl = DBGridEh1
  Caption = 'fmCrossPostNaklR'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 307
    Width = 536
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbExit: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbPrint: TBitBtn
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
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
  end
  object DBGridEh1: TDBGridEh [1]
    Left = 0
    Top = 0
    Width = 536
    Height = 307
    Align = alClient
    DataSource = dsCrossPostNaklR
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    UseMultiTitle = True
  end
  object spCrossPostNaklR: TMSStoredProc
    StoredProcName = 'CrossPostNaklR;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL CrossPostNaklR;1(:PostNo, :AddressNo, :Dat' +
        'eBegin, :DateEnd)}')
    AfterOpen = spCrossPostNaklRAfterOpen
    Left = 144
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AddressNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end>
  end
  object dsCrossPostNaklR: TDataSource
    DataSet = spCrossPostNaklR
    Left = 144
    Top = 104
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsCrossPostNaklR
    Left = 144
    Top = 176
  end
  object frUserDataset1: TfrUserDataset
    OnCheckEOF = frUserDataset1CheckEOF
    OnFirst = frUserDataset1First
    OnNext = frUserDataset1Next
    Left = 224
    Top = 176
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 144
    Top = 240
    ReportForm = {19000000}
  end
end
