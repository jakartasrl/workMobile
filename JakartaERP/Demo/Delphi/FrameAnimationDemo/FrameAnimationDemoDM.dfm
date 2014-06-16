object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 583
  Top = 329
  Height = 178
  Width = 355
  object dsHomePhotos: TDataSource
    DataSet = clHomePhotos
    Left = 40
    Top = 16
  end
  object clHomePhotos: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ParentID; ID'
    Params = <>
    Left = 40
    Top = 72
    object clHomePhotosID: TIntegerField
      FieldName = 'ID'
    end
    object clHomePhotosParentID: TIntegerField
      FieldName = 'ParentID'
    end
    object clHomePhotosPhoto: TBlobField
      FieldName = 'Photo'
    end
  end
  object dsHomesAndAgents: TDataSource
    DataSet = clHomesAndAgents
    Left = 152
    Top = 16
  end
  object clHomesAndAgents: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    Left = 152
    Top = 72
    object clHomesAndAgentsID: TIntegerField
      FieldName = 'ID'
    end
    object clHomesAndAgentsFirstName: TMemoField
      FieldName = 'FirstName'
      BlobType = ftMemo
    end
    object clHomesAndAgentsLastName: TMemoField
      FieldName = 'LastName'
      BlobType = ftMemo
    end
    object clHomesAndAgentsPhone: TMemoField
      FieldName = 'Phone'
      BlobType = ftMemo
    end
    object clHomesAndAgentsEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object clHomesAndAgentsPhoto: TBlobField
      FieldName = 'Photo'
    end
  end
  object dsHomesAndHomes: TDataSource
    DataSet = clHomesAndHomes
    Left = 264
    Top = 16
  end
  object clHomesAndHomes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 72
    object clHomesAndHomesID: TIntegerField
      FieldName = 'ID'
    end
    object clHomesAndHomesAddress: TMemoField
      FieldName = 'Address'
      BlobType = ftMemo
    end
    object clHomesAndHomesBeds: TSmallintField
      FieldName = 'Beds'
    end
    object clHomesAndHomesBaths: TSmallintField
      FieldName = 'Baths'
    end
    object clHomesAndHomesHouseSize: TFloatField
      FieldName = 'HouseSize'
      DisplayFormat = '#.00 Sq Ft'
    end
    object clHomesAndHomesLotSize: TFloatField
      FieldName = 'LotSize'
    end
    object clHomesAndHomesPrice: TFloatField
      FieldName = 'Price'
    end
    object clHomesAndHomesFeatures: TMemoField
      FieldName = 'Features'
      BlobType = ftMemo
    end
    object clHomesAndHomesYearBuilt: TMemoField
      FieldName = 'YearBuilt'
      BlobType = ftMemo
    end
    object clHomesAndHomesType: TIntegerField
      FieldName = 'Type'
    end
    object clHomesAndHomesStatus: TIntegerField
      FieldName = 'Status'
    end
    object clHomesAndHomesPhoto: TBlobField
      FieldName = 'Photo'
    end
    object clHomesAndHomesAgentID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'AgentID'
      Calculated = True
    end
    object clHomesAndHomesYearID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'YearID'
      Calculated = True
    end
  end
end
