inherited fmEditKred: TfmEditKred
  Left = 427
  Top = 181
  Width = 427
  Height = 349
  ActiveControl = RxDBGrid1
  Caption = #1044#1086#1083#1075#1080
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 281
    Width = 419
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 419
    Height = 281
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object RxDBGrid1: TRxDBGrid
      Left = 6
      Top = 6
      Width = 407
      Height = 269
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsDolgi
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = RxDBGrid1KeyDown
      OnKeyPress = RxDBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = #1050#1088#1077#1076#1080#1090#1086#1088
          Width = 229
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Dolg'
          Title.Caption = #1044#1086#1083#1075
          Width = 148
          Visible = True
        end>
    end
  end
  object quDolgi: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select sum(SummaDolg) Dolg,NaklP.PostNo,Post.Name'
      'from NaklP,Post'
      'where (SummaDolg<>0) and'
      '      (Buh>=:BuhB)   and'
      '      (Buh<=:BuhE)   and'
      '      (Post.PostNo=NaklP.PostNo)'
      '    and NaklP.OurFirmNo = :OurFirmNo'
      'group by NaklP.PostNo,Post.Name'
      'order by Post.Name')
    BeforeOpen = quDolgiBeforeOpen
    Left = 43
    Top = 189
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'BuhB'
      end
      item
        DataType = ftSmallint
        Name = 'BuhE'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
  end
  object dsDolgi: TDataSource
    DataSet = quDolgi
    Left = 7
    Top = 189
  end
end
