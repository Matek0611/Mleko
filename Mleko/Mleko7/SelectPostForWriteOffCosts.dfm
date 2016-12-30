inherited SelectPostForWriteOffCostsForm: TSelectPostForWriteOffCostsForm
  Left = 498
  Top = 378
  Width = 439
  Height = 359
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 279
    Width = 423
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btOk: TButton
      Left = 111
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1082
      ModalResult = 1
      TabOrder = 0
    end
    object btCancel: TButton
      Left = 231
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 423
    Height = 279
    Align = alClient
    Caption = #1055#1072#1088#1090#1085#1077#1088#1099' '#1089' '#1085#1077' '#1079#1072#1082#1088#1099#1090#1080#1084#1080' '#1088#1072#1089#1093#1086#1076#1072#1084#1080' :'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 419
      Height = 262
      Align = alClient
      DataSource = dsSelectPostForWriteOfCosts
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
          FieldName = 'PostNo'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 315
        end>
    end
  end
  inherited ActionList: TActionList
    Top = 16
  end
  object dsSelectPostForWriteOfCosts: TMSDataSource
    DataSet = quSelectPostForWriteOfCosts
    Left = 248
    Top = 72
  end
  object quSelectPostForWriteOfCosts: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct  pr.PostNo'
      
        '                ,(select Name from Post where PostNo = pr.PostNo' +
        ') as PostName'
      ' from PlatR pr'
      '  where SummaDolg <> 0'
      '    and VidRashodNo = isnull(:VidRashodNo,VidRashodNo)'
      'order by PostName')
    Left = 248
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VidRashodNo'
      end>
    object quSelectPostForWriteOfCostsPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quSelectPostForWriteOfCostsPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
  end
end
