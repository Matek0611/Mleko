inherited MlekoListTovarWieghtForm: TMlekoListTovarWieghtForm
  Left = 189
  Top = 121
  Width = 680
  Height = 485
  Caption = 'MlekoListTovarWieghtForm'
  FormStyle = fsNormal
  Position = poMainFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 439
    Width = 672
  end
  inherited ToolBar: TToolBar
    Width = 672
  end
  inherited PageControlTop: TPageControl
    Width = 672
    Height = 51
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 664
        Height = 41
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 44
          Height = 39
          Align = alLeft
          AutoSize = False
          Caption = #1058#1086#1074#1072#1088':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ftTovar: TLabel
          Left = 45
          Top = 1
          Width = 268
          Height = 39
          Align = alLeft
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ftPrihod: TLabel
          Left = 364
          Top = 1
          Width = 197
          Height = 39
          Align = alLeft
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 561
          Top = 1
          Width = 53
          Height = 39
          Align = alLeft
          AutoSize = False
          Caption = #1056#1072#1089#1093#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ftRashod: TLabel
          Left = 614
          Top = 1
          Width = 227
          Height = 39
          Align = alLeft
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 313
          Top = 1
          Width = 51
          Height = 39
          Align = alLeft
          AutoSize = False
          Caption = #1055#1088#1080#1093#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 75
    Width = 672
    Height = 364
    inherited DBGrid: TcitDBGrid
      Width = 666
      Height = 358
      DisabledFont.Color = clGray
      OnIsDisabled = DBGridIsDisabled
      OnDrawDataCell = DBGridDrawDataCell
    end
  end
  inherited ActionList: TActionList
    inherited ActionItemAdd: TAction
      OnExecute = ActionItemAddExecute
    end
    inherited ActionItemProp: TAction
      OnExecute = ActionItemPropExecute
    end
    inherited ActionItemDel: TAction
      OnExecute = ActionItemDelExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_list_tovar_weight a')
    OrderBy.Strings = (
      'order by box_num, item_num')
    OnGetWhere = SQLBuilderGetWhere
    KeyFields.Strings = (
      'ID')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      '')
  end
  inherited ComponentProps: TcitComponentProps
    DefaultUser = 'MLEKOLISTTOVARWIEGHTFORM'
  end
  object spDelTovWeightPos: TMSStoredProc
    StoredProcName = 'sp_DelTovWeightPos;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_DelTovWeightPos;1(:p_id)}')
    Left = 248
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end>
  end
end
