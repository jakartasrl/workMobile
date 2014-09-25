inherited FNCla0001: TFNCla0001
  Caption = 'ABM de Clasificadores'
  ClientHeight = 398
  ClientWidth = 763
  ExplicitWidth = 779
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Datos del Clasificador'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Height = 97
    Width = 763
    object txtCodigo: TcxDBTextEdit
      Left = 60
      Top = 30
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsClasificador
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 255
      Top = 30
      DataBinding.DataField = 'Descripcion'
      DataBinding.DataSource = dsClasificador
      TabOrder = 1
      Width = 245
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 32
      AutoSize = False
      Caption = 'C'#243'digo :'
      Properties.Alignment.Horz = taLeftJustify
      Transparent = True
      Height = 17
      Width = 46
    end
    object cxLabel2: TcxLabel
      Left = 179
      Top = 32
      AutoSize = False
      Caption = 'Descripci'#243'n :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 75
      AnchorX = 254
    end
    object cxLabel3: TcxLabel
      Left = 14
      Top = 66
      AutoSize = False
      Caption = 'Entidad a la que se aplica :'
      Properties.Alignment.Horz = taLeftJustify
      Transparent = True
      Height = 17
      Width = 139
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 439
      Top = 64
      Caption = 'Activo :'
      DataBinding.DataField = 'Activo'
      DataBinding.DataSource = dsClasificador
      Properties.Alignment = taRightJustify
      TabOrder = 4
      Transparent = True
      Width = 61
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 153
      Top = 64
      DataBinding.DataField = 'oid_Entidad'
      DataBinding.DataSource = dsClasificador
      Properties.KeyFieldNames = 'oid_Entidad'
      Properties.ListColumns = <
        item
          FieldName = 'Descripcion'
        end>
      Properties.ListSource = dsEntidades
      TabOrder = 2
      Width = 162
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 336
      Top = 64
      Caption = 'Obligatorio :'
      DataBinding.DataField = 'Obligatorio'
      DataBinding.DataSource = dsClasificador
      Properties.Alignment = taRightJustify
      TabOrder = 3
      Transparent = True
      Width = 83
    end
  end
  object cxGroupBox2: TcxGroupBox [1]
    Left = 0
    Top = 97
    Align = alClient
    Caption = 'Componentes'
    TabOrder = 5
    Height = 301
    Width = 763
    object cxDBTreeList1: TcxDBTreeList
      Left = 3
      Top = 15
      Width = 757
      Height = 250
      Align = alTop
      Bands = <
        item
        end>
      DataController.DataSource = dsComponentesClasificador
      DataController.ParentField = 'codInternoPadre'
      DataController.KeyField = 'codInterno'
      Navigator.Buttons.CustomButtons = <>
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsData.Deleting = False
      PopupMenu = PopupMenu
      RootValue = 0
      TabOrder = 0
      object cxDBTreeList1oid_CompClasif: TcxDBTreeListColumn
        DataBinding.FieldName = 'oid_CompClasif'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1oid_Clasificador: TcxDBTreeListColumn
        DataBinding.FieldName = 'oid_Clasificador'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1codInterno: TcxDBTreeListColumn
        DataBinding.FieldName = 'codInterno'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1codInternoPadre: TcxDBTreeListColumn
        DataBinding.FieldName = 'codInternoPadre'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Nivel: TcxDBTreeListColumn
        DataBinding.FieldName = 'Nivel'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Codigo: TcxDBTreeListColumn
        DataBinding.FieldName = 'Codigo'
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Descripcion: TcxDBTreeListColumn
        DataBinding.FieldName = 'Descripcion'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxDBTreeList1Activo: TcxDBTreeListColumn
        DataBinding.FieldName = 'Activo'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 240
    Top = 176
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtClasificador
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FocoEnAlta = mtClasificadorCodigo
    FocoEnModificacion = mtClasificadorDescripcion
    OperacionesIniciales = <
      item
        Operacion = OperTraerEntidades
      end>
    OnNuevo = DriverNuevo
    Left = 464
    Top = 176
  end
  inherited IdHTTP: TIdHTTP
    Left = 360
    Top = 176
  end
  inherited Service: TjktServiceCaller
    Left = 304
    Top = 176
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarClasificador'
    Atributos = <
      item
        Dataset = mtComponentesClasificador
        Tag = 0
      end>
    OnBeforeEjecutar = OperacionSaveBeforeEjecutar
    OnAfterEjecutar = OperacionSaveAfterEjecutar
    Left = 528
    Top = 176
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 624
    Top = 176
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerClasificador'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtClasificadoroid_Clasificador
        Tag = 0
      end>
    OnAfterEjecutar = OperacionTraerAfterEjecutar
    Left = 528
    Top = 240
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtComponentesClasificadorCodigo
        ValidadorGral = valCodigo1
      end
      item
        Field = mtComponentesClasificadorCodigo
        ValidadorGral = valCodigo2
      end>
    Left = 360
    Top = 240
  end
  object OperTraerEntidades: TjktOperacion
    OperName = 'TraerEntidadesClasificables'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 256
    Top = 64
  end
  object mtEntidades: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 312
    Top = 64
    object mtEntidadesoid_Entidad: TIntegerField
      FieldName = 'oid_Entidad'
    end
    object mtEntidadesDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
  end
  object mtClasificador: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Clasificador'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'oid_Entidad'
        DataType = ftInteger
      end
      item
        Name = 'Obligatorio'
        DataType = ftBoolean
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    AutoReposition = True
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
    Left = 536
    Top = 32
    object mtClasificadoroid_Clasificador: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasificador'
    end
    object mtClasificadorCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object mtClasificadorDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtClasificadoroid_Entidad: TIntegerField
      Tag = 1
      FieldName = 'oid_Entidad'
    end
    object mtClasificadorObligatorio: TBooleanField
      Tag = 1
      FieldName = 'Obligatorio'
    end
    object mtClasificadorActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object dsClasificador: TDataSource
    DataSet = mtClasificador
    Left = 576
    Top = 32
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'clasificadores'
    OidRespuesta = mtClasificadoroid_Clasificador
    Left = 464
    Top = 240
  end
  object dsComponentesClasificador: TDataSource
    DataSet = mtComponentesClasificador
    Left = 112
    Top = 144
  end
  object mtComponentesClasificador: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_CompClasif'
        DataType = ftInteger
      end
      item
        Name = 'oid_Clasificador'
        DataType = ftInteger
      end
      item
        Name = 'codInterno'
        DataType = ftInteger
      end
      item
        Name = 'codInternoPadre'
        DataType = ftInteger
      end
      item
        Name = 'Nivel'
        DataType = ftSmallint
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Clasificador'
    IndexDefs = <
      item
        Name = 'mtComponentesClasificadorIndex'
        Fields = 'oid_Clasificador'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Clasificador'
    MasterSource = dsClasificador
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 72
    Top = 144
    object mtComponentesClasificadoroid_CompClasif: TIntegerField
      Tag = 1
      FieldName = 'oid_CompClasif'
    end
    object mtComponentesClasificadoroid_Clasificador: TIntegerField
      Tag = 1
      FieldName = 'oid_Clasificador'
    end
    object mtComponentesClasificadorcodInterno: TIntegerField
      Tag = 1
      FieldName = 'codInterno'
    end
    object mtComponentesClasificadorcodInternoPadre: TIntegerField
      Tag = 1
      FieldName = 'codInternoPadre'
    end
    object mtComponentesClasificadorNivel: TSmallintField
      FieldName = 'Nivel'
    end
    object mtComponentesClasificadorCodigo: TStringField
      Tag = 1
      FieldName = 'Codigo'
      Size = 15
    end
    object mtComponentesClasificadorDescripcion: TStringField
      Tag = 1
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtComponentesClasificadorActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object valCodigo2: TjktValidador
    Entidad = 'componenteClasificador'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 176
    Top = 248
  end
  object valCodigo1: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 112
    Top = 248
  end
  object dsEntidades: TDataSource
    DataSet = mtEntidades
    Left = 352
    Top = 64
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 176
    Top = 304
    object menAnadirSubNivel: TMenuItem
      Caption = 'A'#241'adir SubNivel'
      OnClick = menAnadirSubNivelClick
    end
    object menEliminar: TMenuItem
      Caption = 'Eliminar'
    end
  end
end
