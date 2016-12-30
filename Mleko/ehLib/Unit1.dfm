object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 190
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 277
    Height = 190
    Align = alClient
    DataSource = DataSource1
    DynProps = <>
    Flat = True
    IndicatorOptions = [gioShowRowIndicatorEh]
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'a'
        Footers = <>
        STFilter.ListSource = DataSource1
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'b'
        Footers = <>
        STFilter.ListSource = DataSource1
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh1
    Left = 208
    Top = 96
  end
  object MemTableEh1: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'a'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'b'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 96
    object MemTableEh1a: TIntegerField
      DisplayWidth = 10
      FieldName = 'a'
    end
    object MemTableEh1b: TStringField
      DisplayWidth = 10
      FieldName = 'b'
      Size = 10
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object a: TMTNumericDataFieldEh
          FieldName = 'a'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object b: TMTStringDataFieldEh
          FieldName = 'b'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            1
            #1054#1076#1080#1085)
          (
            2
            #1044#1074#1072)
          (
            2
            #1044#1074#1072)
          (
            3
            #1058#1088#1080)
          (
            3
            #1058#1088#1080)
          (
            3
            #1058#1088#1080))
      end
    end
  end
end
