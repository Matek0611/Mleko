inherited TovarPrihForDateOfManufactureForm: TTovarPrihForDateOfManufactureForm
  Left = 581
  Top = 239
  Width = 414
  Height = 199
  Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 119
    Width = 398
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bOk: TButton
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = bOkClick
    end
    object bCancel: TButton
      Left = 240
      Top = 9
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 398
    Height = 119
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 62
      Width = 106
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072': '
    end
    object Label2: TLabel
      Left = 0
      Top = 38
      Width = 37
      Height = 13
      Caption = #1058#1086#1074#1072#1088': '
    end
    object Label3: TLabel
      Left = 0
      Top = 16
      Width = 75
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072':'
    end
    object Label4: TLabel
      Left = 208
      Top = 16
      Width = 40
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086': '
    end
    object DateTimePicker1: TDateTimePicker
      Left = 120
      Top = 62
      Width = 186
      Height = 21
      Date = 42271.000000000000000000
      Time = 42271.000000000000000000
      TabOrder = 0
    end
    object eTovarName: TEdit
      Left = 40
      Top = 38
      Width = 345
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object eTovarNo: TEdit
      Left = 79
      Top = 11
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object ceKol: TCurrencyEdit
      Left = 253
      Top = 11
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited ActionList: TActionList
    Left = 528
  end
  object spTovarDateOfManufacture: TMSStoredProc
    StoredProcName = 'pr_TovarDateOfManufacture'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_TovarDateOfManufacture (:TovarNo, :Date' +
        ', :Kol)}')
    Left = 368
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Kol'
        ParamType = ptInput
      end>
  end
end
