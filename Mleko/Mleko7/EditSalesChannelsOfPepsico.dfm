inherited EditSalesChannelsOfPepsicoForm: TEditSalesChannelsOfPepsicoForm
  Left = 817
  Top = 289
  Width = 469
  Height = 254
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1072#1085#1072#1083#1086#1074' '#1089#1073#1099#1090#1072' '#1087#1086' Pepsico'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 453
    Height = 174
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 64
      Height = 12
      Caption = #1050#1086#1076' '#1082#1072#1085#1072#1083#1072' :'
    end
    object Label2: TLabel
      Left = 12
      Top = 51
      Width = 49
      Height = 13
      Caption = #1050#1072#1085#1072#1083'L1 :'
    end
    object Label3: TLabel
      Left = 12
      Top = 77
      Width = 49
      Height = 13
      Caption = #1050#1072#1085#1072#1083'L2 :'
    end
    object Label4: TLabel
      Left = 12
      Top = 101
      Width = 49
      Height = 13
      Caption = #1050#1072#1085#1072#1083'L3 :'
    end
    object Label5: TLabel
      Left = 12
      Top = 125
      Width = 49
      Height = 13
      Caption = #1050#1072#1085#1072#1083'L4 :'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 152
      Width = 73
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1077#1085
      DataField = 'Active'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit1: TDBEdit
      Left = 84
      Top = 12
      Width = 45
      Height = 21
      DataField = 'Code'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 80
      Top = 48
      Width = 177
      Height = 21
      DataField = 'ChannelL1'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 80
      Top = 72
      Width = 177
      Height = 21
      DataField = 'ChannelL2'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 80
      Top = 96
      Width = 177
      Height = 21
      DataField = 'ChannelL3'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 80
      Top = 120
      Width = 177
      Height = 21
      DataField = 'ChannelL4'
      DataSource = dmDataModule.dsSalesChannelsOfPepsico
      TabOrder = 5
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 174
    Width = 453
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 161
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
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
    object bbCancel: TBitBtn
      Left = 244
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
