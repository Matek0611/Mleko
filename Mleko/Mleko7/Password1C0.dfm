inherited fmPassword1C: TfmPassword1C
  Left = 204
  Top = 350
  Width = 390
  Height = 123
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103' '#1076#1086#1089#1090#1091#1087#1072
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 52
    Top = 12
    Width = 76
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Image1: TImage [1]
    Left = 8
    Top = 16
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      0000200000000100040000000000000200000000000000000000100000000000
      000000000000800000000080000080800000000080008000800000808000C0C0
      C00080808000FF00000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFF
      FF00777777777777777077707777777777777777777777777770777077777777
      777777777777777777070770777777777777777777777EE77707077707777777
      77777777EEEEEEEEE7070700077777777777777EEEEFEEEEEE77777777777777
      777777EEEE7777EEEEEEE7777777777777777EEEE7998777EEEEEEEE77777777
      7777EEEEE9988C87EEEEEEEEEEEE7777777777EE8998CC87EEEEEEEEEEEEEEEE
      E7777FF7998CC87FEEEEEEEEEEEEEEEEEE77FF79988CC77FF77777EEEEEEEEEE
      E777989998CC877799998877EEEEEEEEE77799998CC877999899998877EEEEEE
      777779988CC7F99877759999887EEEEEEEE77787CC878988CCCCC59991877EEE
      EEEECC8CC87798CCC878CCC5999887EEEEEE78CCC7F7988C87FF7CCC59999887
      EEEEFF7C77F798CC887FFF8CCC59991877EE7EFFFFF791CC48777777CCCC5999
      887E77EEFEEF998CCC8CC877F7CCC5999188777EEEEF9998CCCC887877F8CCC5
      999877EEEEEEE791887879987FFE7CCC59997EEEEEEEEF79999999977FEEEE7C
      CC59EEEEEEEEEEFF7999977FFEEEEEEFCCCEEEEEEEEEEEEEEFFFFFFEEEEEEEEE
      E7C77EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE77777777EEEEEEEEEEEEEEEEEEEEE
      EEE7777777777777777777EEEEEEEEEEEE7777777777777777777777777EEEEE
      E777777777777777777777777777777777777777777777777777777777777777
      7777}
    Transparent = True
  end
  object Label2: TLabel [2]
    Left = 52
    Top = 40
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object ComboBox1: TComboBox [3]
    Left = 136
    Top = 8
    Width = 233
    Height = 22
    Style = csOwnerDrawVariable
    ItemHeight = 16
    Sorted = True
    TabOrder = 0
  end
  object Edit1: TEdit [4]
    Left = 136
    Top = 36
    Width = 233
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton [5]
    Left = 220
    Top = 68
    Width = 69
    Height = 24
    Caption = #1054#1050
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton [6]
    Left = 300
    Top = 68
    Width = 69
    Height = 24
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
  end
  object quUsers: TMSQuery
    Connection = dmDataModule.ADOConnection1C
    SQL.Strings = (
      'SELECT *'
      'FROM Sc4307')
    
    Left = 8
    Top = 56
    object quUsersid: TStringField
      FieldName = 'id'
      FixedChar = True
      Size = 9
    end
    object quUserscode: TStringField
      FieldName = 'code'
      FixedChar = True
      Size = 5
    end
    object quUsersdescr: TStringField
      FieldName = 'descr'
      FixedChar = True
      Size = 25
    end
    object quUsersismark: TStringField
      FieldName = 'ismark'
      FixedChar = True
      Size = 1
    end
    object quUsersverstamp: TStringField
      FieldName = 'verstamp'
      FixedChar = True
      Size = 6
    end
  end
end
