inherited FNImp0001: TFNImp0001
  Caption = 'ABM de Impuestos'
  ClientHeight = 390
  ClientWidth = 736
  ExplicitWidth = 752
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Datos del Impuesto'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Height = 113
    Width = 736
    object txtCodigo: TcxDBTextEdit
      Left = 95
      Top = 30
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsImpuesto
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 290
      Top = 30
      DataBinding.DataField = 'Descripcion'
      DataBinding.DataSource = dsImpuesto
      TabOrder = 1
      Width = 223
    end
    object cxLabel1: TcxLabel
      Left = 18
      Top = 32
      AutoSize = False
      Caption = 'C'#243'digo :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 77
      AnchorX = 95
    end
    object cxLabel2: TcxLabel
      Left = 214
      Top = 32
      AutoSize = False
      Caption = 'Descripci'#243'n :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 75
      AnchorX = 289
    end
    object cxLabel3: TcxLabel
      Left = 4
      Top = 66
      AutoSize = False
      Caption = 'Comportamiento :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 91
      AnchorX = 95
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 290
      Top = 65
      Caption = 'Activo :'
      DataBinding.DataField = 'Activo'
      DataBinding.DataSource = dsImpuesto
      Properties.Alignment = taRightJustify
      TabOrder = 3
      Transparent = True
      Width = 61
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 95
      Top = 64
      DataBinding.DataField = 'oid_Comportamiento'
      DataBinding.DataSource = dsImpuesto
      Properties.ListColumns = <>
      TabOrder = 2
      Width = 162
    end
  end
  object cxGroupBox2: TcxGroupBox [1]
    Left = 0
    Top = 113
    Align = alClient
    Caption = 'Categor'#237'as de Inscripci'#243'n'
    TabOrder = 5
    Height = 277
    Width = 736
    object dbgImpuestoCategorias: TjktExpDBGrid
      Left = 2
      Top = 18
      Width = 422
      Height = 257
      Align = alLeft
      TabOrder = 0
      DataSource = dsImpuestoCategorias
      ExplicitLeft = 3
      ExplicitTop = 15
      ExplicitHeight = 252
      object dbgImpuestoCategoriasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsImpuestoCategorias
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object dbgImpuestoCategoriasDBTableView1oid_ImpCat: TcxGridDBColumn
          DataBinding.FieldName = 'oid_ImpCat'
          Visible = False
        end
        object dbgImpuestoCategoriasDBTableView1oid_Impuesto: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Impuesto'
          Visible = False
        end
        object dbgImpuestoCategoriasDBTableView1oid_Categoria: TcxGridDBColumn
          DataBinding.FieldName = 'oid_Categoria'
          Visible = False
        end
        object dbgImpuestoCategoriasDBTableView1Codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'Codigo'
          Width = 70
        end
        object dbgImpuestoCategoriasDBTableView1Descripcion: TcxGridDBColumn
          Caption = 'Descripci'#243'n'
          DataBinding.FieldName = 'Descripcion'
          Width = 300
        end
        object dbgImpuestoCategoriasDBTableView1Activa: TcxGridDBColumn
          DataBinding.FieldName = 'Activa'
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
      end
      object dbgImpuestoCategoriasLevel1: TcxGridLevel
        GridView = dbgImpuestoCategoriasDBTableView1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 296
    Top = 200
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtImpuesto
    TipoPrograma = tp_abmIndividual
    FocoEnAlta = mtImpuestoCodigo
    FocoEnModificacion = mtImpuestoDescripcion
    OperacionesIniciales = <
      item
        Operacion = OperTraerComportamientos
      end>
    Left = 504
    Top = 200
  end
  inherited IdHTTP: TIdHTTP
    Left = 424
    Top = 200
  end
  inherited Service: TjktServiceCaller
    Left = 368
    Top = 200
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarImpuestos'
    Atributos = <
      item
        Dataset = mtImpuestoCategorias
        Tag = 0
      end>
    Left = 568
    Top = 200
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 664
    Top = 200
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerImpuestos'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtImpuestooid_Impuesto
        Tag = 0
      end>
    Left = 568
    Top = 264
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtImpuestoCategoriasCodigo
        ValidadorNew = valCodigo1
      end
      item
        Field = mtImpuestoCategoriasCodigo
        ValidadorNew = valCodigo2
      end>
    Left = 424
    Top = 264
  end
  object OperTraerComportamientos: TjktOperacion
    OperName = 'TraerComportamientosImpuesto'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 264
    Top = 64
  end
  object dsImpuesto: TDataSource
    DataSet = mtImpuesto
    Left = 536
    Top = 16
  end
  object mtImpuesto: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_Impuesto'
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
        Name = 'oid_Comportamiento'
        DataType = ftInteger
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
    Top = 64
    object mtImpuestooid_Impuesto: TIntegerField
      FieldName = 'oid_Impuesto'
    end
    object mtImpuestoCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object mtImpuestoDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtImpuestooid_Comportamiento: TIntegerField
      FieldName = 'oid_Comportamiento'
    end
    object mtImpuestoActivo: TBooleanField
      FieldName = 'Activo'
    end
  end
  object mtComportamientos: TjktMemTable
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
    Left = 264
    Top = 112
    object mtComportamientosoid_Comportamiento: TIntegerField
      FieldName = 'oid_Comportamiento'
    end
    object mtComportamientosDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'impuesto'
    Left = 504
    Top = 264
  end
  object mtImpuestoCategorias: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_ImpCat'
        DataType = ftInteger
      end
      item
        Name = 'oid_Impuesto'
        DataType = ftInteger
      end
      item
        Name = 'oid_Categoria'
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
        Name = 'Activa'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_Impuesto'
    IndexDefs = <
      item
        Name = 'mtImpuestoCategoriasIndex'
        Fields = 'oid_Impuesto'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_Impuesto'
    MasterSource = dsImpuesto
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 216
    object mtImpuestoCategoriasoid_ImpCat: TIntegerField
      FieldName = 'oid_ImpCat'
    end
    object mtImpuestoCategoriasoid_Impuesto: TIntegerField
      FieldName = 'oid_Impuesto'
    end
    object mtImpuestoCategoriasoid_Categoria: TIntegerField
      FieldName = 'oid_Categoria'
    end
    object mtImpuestoCategoriasCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object mtImpuestoCategoriasDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
    object mtImpuestoCategoriasActiva: TBooleanField
      FieldName = 'Activa'
    end
  end
  object dsImpuestoCategorias: TDataSource
    DataSet = mtImpuestoCategorias
    Left = 56
    Top = 168
  end
  object valCodigo2: TjktValidador
    Entidad = 'categoriasImpuesto'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 160
    Top = 216
  end
  object valCodigo1: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 160
    Top = 168
  end
end
