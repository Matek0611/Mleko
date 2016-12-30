inherited MlekoTestForm: TMlekoTestForm
  Left = 395
  Top = 308
  Caption = 'MlekoTestForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = Action1
    end
    object EdDate1: TcxDateEdit
      Left = 23
      Top = 0
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 121
    end
    object EdDate2: TcxDateEdit
      Left = 144
      Top = 0
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 121
    end
  end
  object DBGrid1: TDBGrid [2]
    Left = 0
    Top = 29
    Width = 547
    Height = 352
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited ActionList: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 200
    Top = 56
    object Action1: TAction
      Caption = 'Open'
      ImageIndex = 28
      OnExecute = Action1Execute
    end
  end
  object quDSPEC: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'Select * from e_blank_head where dateNakl>= :DateNakl1 and dateN' +
        'akl<= :DateNakl2')
    Debug = True
    Options.StrictUpdate = False
    MasterFields = 'pkey'
    Left = 42
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl1'
      end
      item
        DataType = ftUnknown
        Name = 'DateNakl2'
      end>
  end
  object DataSource1: TDataSource
    DataSet = quDSPEC
    OnStateChange = DataSource1StateChange
    OnDataChange = DataSource1DataChange
    OnUpdateData = DataSource1UpdateData
    Left = 272
    Top = 56
  end
end
