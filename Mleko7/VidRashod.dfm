inherited VidRashodForm: TVidRashodForm
  Left = 707
  Top = 332
  Height = 308
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 281
    Height = 228
    Align = alClient
    Caption = #1057#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074' :'
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 277
      Height = 211
      Align = alClient
      DataSource = dsVidRashod
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 228
    Width = 281
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtOk: TButton
      Left = 48
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 0
    end
    object BtCancel: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dsVidRashod: TMSDataSource
    DataSet = quVidRashod
    Left = 248
    Top = 16
  end
  object quVidRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct pr.VidRashodNo, vr.VidRashodName '
      ' from PlatR pr left join'
      '      VidRashod vr on vr.VidRashodNo = pr.VidRashodNo'
      '  where pr.SummaDolg <> 0'
      '    and vr.VidRashodDel<>1'
      '    and pr.PostNo = isnull(:PostNo,pr.PostNo) &_where'
      'order by &_order'
      ''
      ''
      '/*'
      'select VidRashodNo, VidRashodName'
      'from VidRashod'
      'where VidRashodDel<>1 &_where'
      'order by &_order'
      '*/')
    Left = 248
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'VidRashodName'
      end>
    object quVidRashodVidRashodNo: TSmallintField
      FieldName = 'VidRashodNo'
    end
    object quVidRashodVidRashodName: TStringField
      FieldName = 'VidRashodName'
      Size = 50
    end
  end
end
