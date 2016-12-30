inherited EditLinkTovarFromReturnForm: TEditLinkTovarFromReturnForm
  Left = 1088
  Top = 183
  Width = 409
  Height = 232
  Caption = 'EditLinkTovarFromReturnForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 393
    Height = 144
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 100
      Width = 31
      Height = 13
      Caption = #1058#1086#1074#1072#1088
    end
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 69
      Height = 13
      Caption = #1058#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
    end
    object DBLookupComboboxEhTovarForReturn: TDBLookupComboboxEh
      Left = 56
      Top = 100
      Width = 329
      Height = 21
      EditButtons = <>
      KeyField = 'TovarNo'
      ListField = 'NameTovar'
      ListSource = dsTovarForReturn
      TabOrder = 0
      Visible = True
    end
    object DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh
      Left = 96
      Top = 36
      Width = 225
      Height = 21
      EditButtons = <>
      KeyField = 'TypeReturnNo'
      ListField = 'TypeReturnName'
      ListSource = dsTypeReturn
      TabOrder = 1
      Visible = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 144
    Width = 393
    Height = 50
    Align = alBottom
    TabOrder = 1
    object bOk: TButton
      Left = 72
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = bOkClick
    end
    object bCancel: TButton
      Left = 192
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bCancelClick
    end
  end
  object quTypeReturn: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from D_TypeReturn'
      '  where Active = 1')
    Left = 120
    Top = 3
    object quTypeReturnTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
      ReadOnly = True
    end
    object quTypeReturnTypeReturnName: TStringField
      FieldName = 'TypeReturnName'
      Size = 50
    end
    object quTypeReturnActive: TFloatField
      FieldName = 'Active'
    end
  end
  object dsTypeReturn: TMSDataSource
    DataSet = quTypeReturn
    Left = 87
    Top = 3
  end
  object dsTovarForReturn: TMSDataSource
    DataSet = quSelectTovarForReturn
    Left = 8
    Top = 64
  end
  object quSelectTovarForReturn: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from Tovar')
    Left = 40
    Top = 64
    object quSelectTovarForReturnTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quSelectTovarForReturnNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quSelectTovarForReturnNameTovarShort: TStringField
      FieldName = 'NameTovarShort'
      Size = 64
    end
  end
  object dsLinkTovarForReturn: TMSDataSource
    Left = 96
    Top = 64
  end
  object quLinkTovarForReturn: TMSQuery
    SQLInsert.Strings = (
      '/*'
      
        'insert into l_TovarForReturn (TovarNo,TovarNoReturn,TypeReturnNo' +
        ')'
      'values (:TovarNo,:TovarNoReturn,:TypeReturnNo)'
      '*/')
    SQLDelete.Strings = (
      '/*'
      'DELETE FROM l_TovarForReturn'
      'WHERE'
      '  id = :Old_id'
      '*/')
    SQLUpdate.Strings = (
      '/*'
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*) '
      ' from l_TovarForReturn l'
      '  where TovarNo = :TovarNo'
      '    and TovarNoReturn = :TovarNoReturn'
      '    and TypeReturnNo = :TypeReturnNo'
      ''
      'if @Cnt = 0'
      
        ' insert into l_TovarForReturn (TovarNo,TovarNoReturn,TypeReturnN' +
        'o)'
      ' values (:TovarNo,:TovarNoReturn,:TypeReturnNo)'
      ''
      'update l_TovarForReturn'
      
        ' set TovarNo = :TovarNo ,TovarNoReturn = :TovarNoReturn ,TypeRet' +
        'urnNo = :TypeReturnNo'
      'where id = :Old_id'
      '*/')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '   @Cnt int'
      '  ,@TovarNo int'
      '  ,@TovarNoReturn int'
      '  ,@TypeReturnNo int'
      ''
      'set @TovarNo = :TovarNo'
      'set @TovarNoReturn = :TovarNoReturn'
      'set @TypeReturnNo = :TypeReturnNo'
      ''
      'select @Cnt = count(*) '
      ' from l_TovarForReturn l'
      '  where TovarNo = @TovarNo'
      '    and TovarNoReturn = @TovarNoReturn'
      '    and TypeReturnNo = @TypeReturnNo'
      ''
      'if @Cnt > 0'
      ' begin'
      '   '
      '   delete from l_TovarForReturn'
      '   where TovarNo = @TovarNo'
      '     and TovarNoReturn = @TovarNoReturn'
      '     and TypeReturnNo = @TypeReturnNo'
      ''
      
        '   insert into l_TovarForReturn (TovarNo,TovarNoReturn,TypeRetur' +
        'nNo)'
      '   values (@TovarNo,@TovarNoReturn,@TypeReturnNo)'
      ' end'
      ''
      
        'insert into l_TovarForReturn (TovarNo,TovarNoReturn,TypeReturnNo' +
        ')'
      'values (@TovarNo,@TovarNoReturn,@TypeReturnNo)'
      ''
      '/*'
      'select *'
      ' from l_TovarForReturn l'
      '  where TovarNo = :TovarNo'
      '    and TovarNoReturn = :TovarNoReturn'
      '    and TypeReturnNo = :TypeReturnNo'
      '*/')
    BeforePost = quLinkTovarForReturnBeforePost
    Left = 136
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftInteger
        Name = 'TovarNoReturn'
      end
      item
        DataType = ftInteger
        Name = 'TypeReturnNo'
      end>
    object quLinkTovarForReturnid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quLinkTovarForReturnTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object quLinkTovarForReturnTovarNoReturn: TIntegerField
      FieldName = 'TovarNoReturn'
    end
    object quLinkTovarForReturnTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
    end
  end
end
