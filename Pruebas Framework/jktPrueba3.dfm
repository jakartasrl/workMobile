inherited FPrueba3: TFPrueba3
  Caption = 'FPrueba3'
  ClientHeight = 461
  ClientWidth = 773
  ExplicitWidth = 789
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton [0]
    Left = 136
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxDBTextEdit1: TcxDBTextEdit [1]
    Left = 136
    Top = 172
    DataBinding.DataField = 'oid'
    DataBinding.DataSource = DataSource1
    TabOrder = 5
    Width = 121
  end
  object cxDBTextEdit2: TcxDBTextEdit [2]
    Left = 136
    Top = 230
    DataBinding.DataField = 'Codigo'
    DataBinding.DataSource = DataSource1
    TabOrder = 6
    Width = 121
  end
  object cxLabel1: TcxLabel [3]
    Left = 136
    Top = 208
    Caption = 'Codigo :'
    Transparent = True
  end
  object cxLabel2: TcxLabel [4]
    Left = 136
    Top = 149
    Caption = 'Oid :'
    Transparent = True
  end
  inherited BarManager: TdxBarManager
    Left = 272
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    TipoPrograma = tp_Otro
    Left = 528
  end
  inherited IdHTTP: TIdHTTP
    Left = 424
  end
  inherited Service: TjktServiceCaller
    Left = 368
  end
  inherited OperacionSave: TjktOperacion
    Left = 592
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 688
  end
  inherited OperacionTraer: TjktOperacion
    Left = 592
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 424
  end
  object HelpGenerico: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'usuario'
    TipoFiltro = fi_Inactivos
    OidRespuesta = jktMemTable1oid
    CodigoRespuesta = jktMemTable1Codigo
    Left = 72
    Top = 176
  end
  object jktMemTable1: TjktMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'oid'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 72
    Top = 112
    object jktMemTable1Codigo: TStringField
      FieldName = 'Codigo'
      Size = 50
    end
    object jktMemTable1oid: TIntegerField
      FieldName = 'oid'
    end
  end
  object DataSource1: TDataSource
    DataSet = jktMemTable1
    Left = 32
    Top = 112
  end
end
