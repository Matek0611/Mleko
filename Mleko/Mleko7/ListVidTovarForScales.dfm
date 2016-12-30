inherited ListVidTovarForScalesForm: TListVidTovarForScalesForm
  Left = 1033
  Top = 233
  Width = 306
  Height = 381
  Caption = #1042#1080#1076#1099' '#1090#1086#1074#1072#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 296
    Width = 290
    Height = 47
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 45
      Top = 16
      Width = 81
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
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
    object bbCancel: TBitBtn
      Left = 177
      Top = 16
      Width = 81
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 290
    Height = 296
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 288
      Height = 294
      Align = alClient
      DataSource = ds_ListVidTovarForScales
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
          Width = 237
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'CheckVid'
          Footers = <>
          Title.Caption = 'V'
          Width = 14
        end>
    end
  end
  object qu_ListVidTovarForScales: TMSQuery
    SQLInsert.Strings = (
      'declare'
      ' @cnt int'
      ''
      'select @cnt = count(*) from L_VidTovForExportForScales'
      ''
      'insert into L_VidTovForExportForScales (VidTov,VidName,CheckVid)'
      'values (:VidNo,:VidName,:CheckVid)')
    SQLDelete.Strings = (
      'delete L_VidTovForExportForScales'
      'where VidTov = :VidNo')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      ''
      
        'select @cnt = count(*) from L_VidTovForExportForScales where Vid' +
        'Tov = :VidNo'
      ''
      'if @cnt = 0 '
      
        ' insert into L_VidTovForExportForScales (VidTov,VidName,CheckVid' +
        ')'
      '  values (:VidNo,:VidName,:CheckVid)'
      'if @cnt is null'
      
        ' insert into L_VidTovForExportForScales (VidTov,VidName,CheckVid' +
        ')'
      '  values (:VidNo,:VidName,:CheckVid)'
      ''
      'if @cnt > 0'
      ' update L_VidTovForExportForScales'
      '  set CheckVid = :CheckVid'
      ' where VidTov = :VidNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select v.VidNo'
      '      ,v.VidName'
      '      ,isnull(lvp.CheckVid ,0) as CheckVid'
      ' from VidTov v left join'
      '      L_VidTovForExportForScales lvp on lvp.VidTov = v.VidNo'
      '  where Visible = 0'
      '    and v.VidName in (select distinct namegroup'
      '                       from work.dbo.V_TovarForScales )'
      'order by v.VidName')
    Left = 64
    Top = 8
    object qu_ListVidTovarForScalesVidNo: TSmallintField
      FieldName = 'VidNo'
    end
    object qu_ListVidTovarForScalesVidName: TStringField
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object qu_ListVidTovarForScalesCheckVid: TBooleanField
      FieldName = 'CheckVid'
    end
  end
  object ds_ListVidTovarForScales: TMSDataSource
    DataSet = qu_ListVidTovarForScales
    Left = 104
    Top = 8
  end
end
