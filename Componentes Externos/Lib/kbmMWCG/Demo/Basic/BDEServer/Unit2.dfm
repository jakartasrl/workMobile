object TestQuery: TTestQuery
  OldCreateOrder = False
  GatherStatistics = True
  Query = ClientSideQuery
  AllowClientStatement = True
  AllowClientKeyFields = True
  AllowClientNamedQuery = True
  AllowClientTableName = True
  TransportStreamFormat = kbmMWBinaryStreamFormat1
  OnAuthenticateMetaData = kbmMWQueryServiceAuthenticateMetaData
  Left = 325
  Top = 193
  Height = 480
  Width = 696
  object SELECTED_EVENT: TkbmMWBDEQuery
    Cached = True
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'JENS'
    Resolver = kbmMWBDEResolver1
    TableName = 'events'
    KeyFieldNames = 'EventNo'
    Published = True
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'select * from events where eventno=:EventID and eventno=:EventID')
    Params = <
      item
        DataType = ftSmallint
        Name = 'EventID'
        ParamType = ptInput
        Value = 2
      end>
    Left = 64
    Top = 136
  end
  object kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 64
    Top = 16
  end
  object kbmMWBDEResolver1: TkbmMWBDEResolver
    OnDelete = kbmMWBDEResolver1Delete
    Left = 232
    Top = 16
  end
  object ALL_EVENTS: TkbmMWBDEQuery
    Cached = True
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'JENS'
    Resolver = kbmMWBDEResolver1
    TableName = 'events'
    KeyFieldNames = 'EventNo'
    Published = True
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    SQL.Strings = (
      'select * from events')
    Params = <>
    Left = 168
    Top = 136
  end
  object ClientSideQuery: TkbmMWBDEQuery
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'JENS'
    Resolver = kbmMWBDEResolver1
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Params = <>
    Left = 64
    Top = 232
  end
  object SPTEST: TkbmMWBDEStoredProc
    SessionName = 'JENS'
    CacheParams = ptUnknown
    CacheFlags = []
    DesignActivation = True
    AttachMaxCount = 1
    AttachedAutoRefresh = True
    EnableVersioning = True
    IndexDefs = <>
    SortOptions = []
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    StoredProcName = 'ALL_LANGS'
    Params = <>
    Left = 296
    Top = 136
  end
end
