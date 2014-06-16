object Form1: TForm1
  Left = 458
  Top = 179
  Width = 538
  Height = 593
  Caption = 'Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 0
    Top = 0
    Width = 530
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'kbmMW client demo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 25
    Width = 530
    Height = 541
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Standard services like the inventory service'
      DesignSize = (
        522
        513)
      object Label1: TLabel
        Left = 88
        Top = 0
        Width = 84
        Height = 13
        Caption = 'Connect to server'
      end
      object Label2: TLabel
        Left = 88
        Top = 32
        Width = 109
        Height = 13
        Caption = 'Disconnect from server'
      end
      object Label6: TLabel
        Left = 208
        Top = 56
        Width = 100
        Height = 13
        Caption = 'Transport parameters'
      end
      object Label9: TLabel
        Left = 208
        Top = 0
        Width = 109
        Height = 13
        Caption = 'Connection parameters'
      end
      object Button1: TButton
        Left = 8
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Connect'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Disconnect'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 64
        Width = 193
        Height = 25
        Caption = 'Request Inventory 100 times'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 96
        Width = 193
        Height = 25
        Caption = 'Request abstract for inventory'
        TabOrder = 3
        OnClick = Button4Click
      end
      object lbDebug: TListBox
        Left = 0
        Top = 136
        Width = 522
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 4
      end
      object mParams: TMemo
        Left = 208
        Top = 72
        Width = 297
        Height = 49
        Lines.Strings = (
          'KBMMWHTTPPOSTURL=http://192.168.2.3:80'
          'KBMMWPROXYUSERNAME=HANS'
          'KBMMWPROXYPASSWORD=JENS')
        TabOrder = 5
      end
      object mConnection: TMemo
        Left = 208
        Top = 16
        Width = 297
        Height = 41
        Lines.Strings = (
          'HOST=192.168.2.100'
          'PORT=8888'
          'STREAMFORMAT=HTTP'
          'VERIFYTRANSFER=NO')
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Query services'
      ImageIndex = 1
      DesignSize = (
        522
        513)
      object PageControl1: TPageControl
        Left = 0
        Top = 8
        Width = 521
        Height = 505
        ActivePage = TabSheet4
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Client side defined queries and resolving'
          ImageIndex = 1
          DesignSize = (
            513
            477)
          object Label3: TLabel
            Left = 8
            Top = 40
            Width = 497
            Height = 185
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 
              'This will access the event database via the server.'#13#10'In this cas' +
              'e the TkbmMWClientQuery component contains the full query in its' +
              ' Query property. Syntax of a client side query is dependent on t' +
              'he backend database.'#13#10'Generally its easier to maintain a distrib' +
              'uted application, not using client side defined queries, since a' +
              'ny changes to business logic often will require a redistribution' +
              ' of the client.'#13#10'The query service on the server has a Query pro' +
              'perty. That one points to a TkbmMWPooledQuery which is in turn u' +
              'sed to actually serve the query from the client.'#13#10#13#10'The TkbmMWCl' +
              'ientQuery is connected to a client connection pool via a pooled ' +
              'session component.'#13#10'The TkbmMWPooledSession is then connected to' +
              ' a TkbmMWClientConnectionPool which takes care of all query conn' +
              'ections to the server.'#13#10'The TkbmMWClientConnectionPool is then c' +
              'onnected to a TkbmMWTCPIPIndyClientTransport which defines the a' +
              'ctual transport method towards the server.'
            WordWrap = True
          end
          object btnClientSideQuery: TButton
            Left = 8
            Top = 16
            Width = 75
            Height = 17
            Caption = 'Query'
            TabOrder = 0
            OnClick = btnClientSideQueryClick
          end
          object btnClientSideQueryResolve: TButton
            Left = 96
            Top = 16
            Width = 75
            Height = 17
            Caption = 'Resolve'
            TabOrder = 1
            OnClick = btnClientSideQueryResolveClick
          end
          object btnSaveToBriefCase: TButton
            Left = 272
            Top = 16
            Width = 107
            Height = 17
            Caption = 'Save to briefcase'
            TabOrder = 2
            OnClick = btnSaveToBriefCaseClick
          end
          object btnLoadFromBriefCase: TButton
            Left = 384
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Load from briefcase'
            TabOrder = 3
            OnClick = btnLoadFromBriefCaseClick
          end
          object dbgClientSide: TDBGrid
            Left = 0
            Top = 256
            Width = 513
            Height = 113
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsClientSide
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object dbiClientSide: TDBImage
            Left = 0
            Top = 372
            Width = 105
            Height = 105
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'Event_Photo'
            DataSource = dsClientSide
            TabOrder = 5
          end
          object dbmClientSide: TDBMemo
            Left = 104
            Top = 372
            Width = 409
            Height = 105
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Event_Description'
            DataSource = dsClientSide
            ScrollBars = ssBoth
            TabOrder = 6
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Named queries and resolving'
          DesignSize = (
            513
            477)
          object Label4: TLabel
            Left = 8
            Top = 40
            Width = 497
            Height = 169
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 
              'This will access the event database via the server.'#13#10'In this cas' +
              'e the TkbmMWClientQuery component use a named query scheme.'#13#10'The' +
              ' named query is called by setting the client side query statemen' +
              't to f.ex. @ALL_EVENTS to'#13#10'call the ALL_EVENTS server side query' +
              '.'#13#10'Its also possible only to use the default query on the servic' +
              'e by not specifying any query statement.'#13#10'On the server are two ' +
              'standard queries defined: ALL_EVENTS and SELECTED_EVENT.'#13#10'The SE' +
              'LECTED_EVENT query allows for one parameter - EventID - to be sp' +
              'ecified at the client side.'#13#10#13#10'The TkbmMWClientQuery is connecte' +
              'd to a client connection pool via a pooled session component.'#13#10'T' +
              'he TkbmMWPooledSession is then connected to a TkbmMWClientConnec' +
              'tionPool which takes care of all query connections to the server' +
              '.'#13#10'The TkbmMWClientConnectionPool is then connected to a TkbmMWT' +
              'CPIPIndyClientTransport which defines the actual transport metho' +
              'd towards the server.'
            WordWrap = True
          end
          object btnNamedServerSideQueryAll: TButton
            Left = 8
            Top = 16
            Width = 75
            Height = 17
            Caption = 'Query all'
            TabOrder = 0
            OnClick = btnNamedServerSideQueryAllClick
          end
          object btnNamedServerSideQuerySelected: TButton
            Left = 88
            Top = 16
            Width = 89
            Height = 17
            Caption = 'Query selected'
            TabOrder = 1
            OnClick = btnNamedServerSideQuerySelectedClick
          end
          object btnNamedQueryServerSideResolve: TButton
            Left = 200
            Top = 16
            Width = 75
            Height = 17
            Caption = 'Resolve'
            TabOrder = 2
            OnClick = btnNamedQueryServerSideResolveClick
          end
          object dbgServerSide: TDBGrid
            Left = 0
            Top = 256
            Width = 513
            Height = 113
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsServerSide
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object dbiServerSide: TDBImage
            Left = 0
            Top = 372
            Width = 105
            Height = 105
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'Event_Photo'
            DataSource = dsServerSide
            TabOrder = 4
          end
          object dbmServerSide: TDBMemo
            Left = 104
            Top = 372
            Width = 409
            Height = 105
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Event_Description'
            DataSource = dsServerSide
            ScrollBars = ssBoth
            TabOrder = 5
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Master/Detail'
          ImageIndex = 2
          DesignSize = (
            513
            477)
          object Label7: TLabel
            Left = 0
            Top = 32
            Width = 32
            Height = 13
            Caption = 'Master'
          end
          object Label8: TLabel
            Left = 0
            Top = 264
            Width = 27
            Height = 13
            Caption = 'Detail'
          end
          object dbgMaster: TDBGrid
            Left = 0
            Top = 48
            Width = 510
            Height = 89
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsMaster
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object Button5: TButton
            Left = 88
            Top = 16
            Width = 75
            Height = 17
            Caption = 'Query'
            TabOrder = 1
            OnClick = Button5Click
          end
          object dbiMaster: TDBImage
            Left = 0
            Top = 140
            Width = 105
            Height = 105
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'Venue_Map'
            DataSource = dsMaster
            TabOrder = 2
          end
          object dbmMaster: TDBMemo
            Left = 104
            Top = 140
            Width = 409
            Height = 105
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Remarks'
            DataSource = dsMaster
            ScrollBars = ssBoth
            TabOrder = 3
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 280
            Width = 513
            Height = 89
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsDetail
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object DBMemo1: TDBMemo
            Left = 104
            Top = 372
            Width = 409
            Height = 105
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Event_Description'
            DataSource = dsDetail
            ScrollBars = ssBoth
            TabOrder = 5
          end
          object DBImage1: TDBImage
            Left = 0
            Top = 372
            Width = 105
            Height = 105
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'Event_Photo'
            DataSource = dsDetail
            TabOrder = 6
          end
          object btnResolveMaster: TButton
            Left = 168
            Top = 16
            Width = 89
            Height = 17
            Caption = 'Resolve master'
            TabOrder = 7
            OnClick = btnResolveMasterClick
          end
          object btnResolveDetail: TButton
            Left = 168
            Top = 256
            Width = 89
            Height = 17
            Caption = 'Resolve detail'
            TabOrder = 8
            OnClick = btnResolveDetailClick
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Performance'
      ImageIndex = 2
      object Button6: TButton
        Left = 8
        Top = 32
        Width = 153
        Height = 25
        Caption = 'Call inventory 10000 times'
        TabOrder = 0
        OnClick = Button6Click
      end
      object mPerformancelog: TMemo
        Left = 0
        Top = 64
        Width = 513
        Height = 433
        TabOrder = 1
      end
    end
  end
  object kbmMWSimpleClient1: TkbmMWSimpleClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Left = 24
    Top = 360
  end
  object kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 8888
    Host = '192.168.2.100'
    Params.Strings = (
      'KBMMWHTTPPOSTURL=http://192.168.2.3:80'
      'KBMMWPROXYUSERNAME=HANS'
      'KBMMWPROXYPASSWORD=JENS')
    StreamFormat = 'HTTP'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    OnException = kbmMWTCPIPIndyClientTransport1Exception
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 480
    Top = 8
  end
  object kbmMWInventoryClient1: TkbmMWInventoryClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Inventory.Strings = (
      'KBMMW_INVENTORY'
      'KBMMW_QUERY')
    SelectedService = 'KBMMW_QUERY'
    InventoryService = 'KBMMW_INVENTORY'
    InventoryServiceVersion = 'kbmMW_1.0'
    Left = 16
    Top = 448
  end
  object kbmMWClientConnectionPool1: TkbmMWClientConnectionPool
    Transport = kbmMWTCPIPIndyClientTransport1
    MaxConnections = 5
    MaxCacheAge = 600
    EnableCache = True
    Left = 448
    Top = 344
  end
  object kbmMWPooledSession1: TkbmMWPooledSession
    ConnectionPool = kbmMWClientConnectionPool1
    AutoSessionName = True
    SessionName = 'DEMO'
    Left = 480
    Top = 344
  end
  object dsClientSide: TDataSource
    DataSet = qClientSide
    Left = 128
    Top = 504
  end
  object kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat
    Version = '1.04'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    Left = 448
    Top = 376
  end
  object qClientSide: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'KBMMW_QUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'DEMO'
    ConnectionWaitTimeout = 10
    CacheFlags = []
    Query.Strings = (
      'select * from events where eventno>:SOMEDATA')
    Params = <
      item
        DataType = ftInteger
        Name = 'SOMEDATA'
        ParamType = ptInput
        Value = 3
      end>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = False
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'eventno'
    TableName = 'events'
    OnResolveError = qClientSideResolveError
    ForceCacheUpdate = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'EventNo'
        DataType = ftInteger
      end
      item
        Name = 'VenueNo'
        DataType = ftInteger
      end
      item
        Name = 'Event_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Event_Date'
        DataType = ftDate
      end
      item
        Name = 'Event_Time'
        DataType = ftTime
      end
      item
        Name = 'Event_Description'
        DataType = ftMemo
        Size = 100
      end
      item
        Name = 'Ticket_price'
        DataType = ftCurrency
      end
      item
        Name = 'Event_Photo'
        DataType = ftGraphic
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '5.60'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 128
    Top = 472
  end
  object kbmMWClientBriefCaseBinaryStreamFormat1: TkbmMWClientBriefCaseBinaryStreamFormat
    Version = '1.04'
    sfCalculated = []
    sfLookup = []
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfAppend = []
    sfFromStart = [sfLoadFromStart]
    Left = 480
    Top = 376
  end
  object dsMaster: TDataSource
    DataSet = qMaster
    Left = 224
    Top = 504
  end
  object qMaster: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'KBMMW_QUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'DEMO'
    CacheFlags = []
    Query.Strings = (
      'select * from venues')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'venueno'
    TableName = 'venues'
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'VenueNo'
        DataType = ftInteger
      end
      item
        Name = 'Venue'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Capacity'
        DataType = ftInteger
      end
      item
        Name = 'Venue_Map'
        DataType = ftGraphic
      end
      item
        Name = 'Remarks'
        DataType = ftMemo
        Size = 80
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '5.60'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 224
    Top = 472
  end
  object qServerSide: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'KBMMW_QUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'DEMO'
    ConnectionWaitTimeout = 10
    CacheFlags = []
    Query.Strings = (
      '')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = False
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    ForceCacheUpdate = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'EventNo'
        DataType = ftAutoInc
      end
      item
        Name = 'VenueNo'
        DataType = ftInteger
      end
      item
        Name = 'Event_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Event_Date'
        DataType = ftDate
      end
      item
        Name = 'Event_Time'
        DataType = ftTime
      end
      item
        Name = 'Event_Description'
        DataType = ftMemo
        Size = 100
      end
      item
        Name = 'Ticket_price'
        DataType = ftCurrency
      end
      item
        Name = 'Event_Photo'
        DataType = ftGraphic
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '5.60'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 160
    Top = 472
  end
  object dsServerSide: TDataSource
    DataSet = qServerSide
    Left = 160
    Top = 504
  end
  object qDetail: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'KBMMW_QUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    Cached = True
    CacheParams = ptUnknown
    SessionName = 'DEMO'
    CacheFlags = []
    Query.Strings = (
      'select * from events where venueno=:venueno')
    Params = <
      item
        DataType = ftInteger
        Name = 'venueno'
        ParamType = ptInput
      end>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'eventno'
    TableName = 'events'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'EventNo'
        DataType = ftInteger
      end
      item
        Name = 'VenueNo'
        DataType = ftInteger
      end
      item
        Name = 'Event_Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Event_Date'
        DataType = ftDate
      end
      item
        Name = 'Event_Time'
        DataType = ftTime
      end
      item
        Name = 'Event_Description'
        DataType = ftMemo
        Size = 100
      end
      item
        Name = 'Ticket_price'
        DataType = ftCurrency
      end
      item
        Name = 'Event_Photo'
        DataType = ftGraphic
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'venueno'
    DetailFields = 'venueno'
    MasterSource = dsMaster
    Version = '5.60'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 256
    Top = 472
  end
  object dsDetail: TDataSource
    DataSet = qDetail
    Left = 256
    Top = 504
  end
end
