inherited MlekoListLogistForm: TMlekoListLogistForm
  Left = 195
  Top = 462
  Width = 812
  Height = 558
  Caption = #1051#1086#1075#1080#1089#1090#1080#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter [0]
    Left = 615
    Top = 29
    Width = 4
    Height = 483
    Align = alRight
    Beveled = True
  end
  inherited StatusBar: TStatusBar
    Top = 512
    Width = 804
  end
  inherited ToolBar: TToolBar
    Width = 804
  end
  object Panel1: TPanel [3]
    Left = 619
    Top = 29
    Width = 185
    Height = 483
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 30
      Width = 183
      Height = 452
      Align = alClient
      DataSource = dsFreeNakl
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
      OnStartDrag = DBGridEh1StartDrag
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 183
      Height = 29
      Caption = 'ToolBar1'
      TabOrder = 1
    end
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 29
    Width = 615
    Height = 483
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 3
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 1
      Top = 1
      Width = 613
      Height = 481
      Align = alClient
      ColCount = 5
      DataSource = DSHodka
      PanelHeight = 120
      PanelWidth = 119
      TabOrder = 0
      RowCount = 4
      object DBText1: TDBText
        Left = 0
        Top = 28
        Width = 119
        Height = 14
        Align = alTop
        DataField = 'ExpeditionSumma'
        DataSource = DSHodka
      end
      object DBText2: TDBText
        Left = 0
        Top = 14
        Width = 119
        Height = 14
        Align = alTop
        DataField = 'Shipping_AgentName'
        DataSource = DSHodka
      end
      object DBText3: TDBText
        Left = 0
        Top = 0
        Width = 119
        Height = 14
        Align = alTop
        DataField = 'CarsName'
        DataSource = DSHodka
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 42
        Width = 119
        Height = 78
        Align = alClient
        DataSource = DSHodka
        TabOrder = 0
        OnDragDrop = DBMemo1DragDrop
      end
    end
  end
  object quFreeNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from v_expedition_nakl')
    
    Left = 560
    Top = 184
  end
  object dsFreeNakl: TDataSource
    DataSet = quFreeNakl
    Left = 528
    Top = 184
  end
  object QuHodka: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     '
      '  SUM(NaklR.Summa) AS ExpeditionSumma'
      ', P1.Shipping_AgentName AS Shipping_AgentName'
      ', P2.CarsName AS CarsName'
      ', SUM(NaklR.KolPerPak) AS ExpeditionKolPerPak'
      ', SUM(NaklR.Weight) AS ExpeditionWeight'
      ', Expedition.TimeGo'
      ', Expedition.ExpeditionNo'
      'FROM ('
      'select Summa,KolPerPak,Weight,ExpeditionNo,PostNo from NaklR'
      'union all'
      
        'select Summa,0 as KolPerPak,Weight,ExpeditionNo,PostNo from E_BL' +
        'ank_head h'
      
        'where status=0 and not exists(select 1 from NaklR where id=h.id)' +
        ' and summa<>0'
      
        ') NaklR RIGHT OUTER JOIN Expedition ON NaklR.ExpeditionNo = Expe' +
        'dition.ExpeditionNo '
      
        '        INNER JOIN Shipping_Agent P1 ON Expedition.ExpeditionShi' +
        'pping_AgentNo = P1.Shipping_AgentNo '
      
        '        INNER JOIN Cars P2 ON Expedition.ExpeditionCarsNo = P2.C' +
        'arsNo '
      'WHERE Expedition.ExpeditionDateGo = '#39'2006-10-02'#39
      'GROUP BY '
      ' Expedition.TimeGo'
      ', Expedition.ExpeditionShipping_AgentNo'
      ', P1.Shipping_AgentName'
      ', P2.CarsName'
      ', Expedition.ExpeditionLook'
      ', Expedition.ExpeditionNo')
    
    Left = 248
    Top = 168
  end
  object DSHodka: TDataSource
    DataSet = QuHodka
    Left = 280
    Top = 168
  end
end
