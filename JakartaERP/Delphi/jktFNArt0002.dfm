inherited FNArt0002: TFNArt0002
  Caption = 'ABM de Tipo de Producto'
  ClientHeight = 379
  ClientWidth = 735
  ExplicitWidth = 751
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Datos del Tipo de Producto'
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    Height = 73
    Width = 735
    object cxLabel1: TcxLabel
      Left = 12
      Top = 27
      Caption = 'C'#243'digo :'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 209
      Top = 27
      Caption = 'Descripci'#243'n :'
      Transparent = True
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 62
      Top = 26
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsTipoProd
      TabOrder = 2
      Width = 141
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 280
      Top = 26
      DataBinding.DataField = 'descr'
      DataBinding.DataSource = dsTipoProd
      TabOrder = 3
      Width = 337
    end
  end
  object cxGroupBox2: TcxGroupBox [1]
    Left = 0
    Top = 73
    Align = alClient
    Caption = 'Caracter'#237'sticas'
    TabOrder = 5
    ExplicitTop = 153
    ExplicitHeight = 260
    Height = 306
    Width = 735
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 3
      Top = 15
      Width = 630
      Height = 281
      Align = alLeft
      TabOrder = 0
      DataSource = dsDet
      ExplicitHeight = 226
      object jktExpDBGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsDet
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.GroupByBox = False
        object jktExpDBGrid1DBTableView1oid_det: TcxGridDBColumn
          DataBinding.FieldName = 'oid_det'
        end
        object jktExpDBGrid1DBTableView1oid_tipo: TcxGridDBColumn
          DataBinding.FieldName = 'oid_tipo'
        end
        object jktExpDBGrid1DBTableView1orden: TcxGridDBColumn
          DataBinding.FieldName = 'orden'
        end
        object jktExpDBGrid1DBTableView1oid_carac: TcxGridDBColumn
          DataBinding.FieldName = 'oid_carac'
        end
        object jktExpDBGrid1DBTableView1cod_carac: TcxGridDBColumn
          DataBinding.FieldName = 'cod_carac'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = jktExpDBGrid1DBTableView1cod_caracPropertiesButtonClick
        end
        object jktExpDBGrid1DBTableView1des_carac: TcxGridDBColumn
          DataBinding.FieldName = 'des_carac'
          Options.Editing = False
        end
        object jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
        end
        object jktExpDBGrid1DBTableView1oblig: TcxGridDBColumn
          DataBinding.FieldName = 'oblig'
        end
        object jktExpDBGrid1DBTableView1arma_cod: TcxGridDBColumn
          DataBinding.FieldName = 'arma_cod'
        end
        object jktExpDBGrid1DBTableView1arma_desc: TcxGridDBColumn
          DataBinding.FieldName = 'arma_desc'
        end
      end
      object jktExpDBGrid1Level1: TcxGridLevel
        GridView = jktExpDBGrid1DBTableView1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 288
    Top = 96
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtTipoProd
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FocoEnAlta = mtTipoProdCodigo
    FocoEnModificacion = mtTipoProddescr
    Left = 472
    Top = 96
  end
  inherited IdHTTP: TIdHTTP
    Left = 408
    Top = 96
  end
  inherited Service: TjktServiceCaller
    Left = 352
    Top = 96
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarTipoProducto'
    Atributos = <
      item
        Dataset = mtDet
        Tag = 0
      end>
    Left = 520
    Top = 96
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 352
    Top = 152
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerTipoProducto'
    Atributos = <
      item
        Attribute = 'oid'
        Field = mtTipoProdoid_tipo
        Tag = 0
      end>
    Left = 520
    Top = 152
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtDetcod_carac
        ValidadorGral = ValCarac
      end>
    Left = 240
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'tipoProducto'
    OidRespuesta = mtTipoProdoid_tipo
    Left = 472
    Top = 152
  end
  object mtTipoProd: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_tipo'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'descr'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
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
    OnNewRecord = mtTipoProdNewRecord
    Left = 624
    Top = 32
    object mtTipoProdoid_tipo: TIntegerField
      Tag = 1
      FieldName = 'oid_tipo'
    end
    object mtTipoProdCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object mtTipoProddescr: TStringField
      Tag = 1
      FieldName = 'descr'
      Size = 80
    end
    object mtTipoProdActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object mtDet: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'oid_tipo'
        DataType = ftInteger
      end
      item
        Name = 'orden'
        DataType = ftInteger
      end
      item
        Name = 'oid_carac'
        DataType = ftInteger
      end
      item
        Name = 'cod_carac'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_carac'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end
      item
        Name = 'oblig'
        DataType = ftBoolean
      end
      item
        Name = 'arma_cod'
        DataType = ftBoolean
      end
      item
        Name = 'arma_desc'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_tipo'
    IndexDefs = <
      item
        Name = 'mtDetIndex1'
        Fields = 'oid_tipo'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_tipo'
    MasterSource = dsTipoProd
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 80
    Top = 208
    object mtDetoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object mtDetoid_tipo: TIntegerField
      FieldName = 'oid_tipo'
    end
    object mtDetorden: TIntegerField
      Tag = 1
      FieldName = 'orden'
    end
    object mtDetoid_carac: TIntegerField
      Tag = 1
      FieldName = 'oid_carac'
    end
    object mtDetcod_carac: TStringField
      FieldName = 'cod_carac'
      Size = 15
    end
    object mtDetdes_carac: TStringField
      FieldName = 'des_carac'
      Size = 50
    end
    object mtDetActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
    object mtDetoblig: TBooleanField
      Tag = 1
      FieldName = 'oblig'
    end
    object mtDetarma_cod: TBooleanField
      Tag = 1
      FieldName = 'arma_cod'
    end
    object mtDetarma_desc: TBooleanField
      Tag = 1
      FieldName = 'arma_desc'
    end
  end
  object dsTipoProd: TDataSource
    DataSet = mtTipoProd
    Left = 664
    Top = 32
  end
  object dsDet: TDataSource
    DataSet = mtDet
    Left = 120
    Top = 208
  end
  object HelpCarac: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'caracteristicaProd'
    OidRespuesta = mtDetoid_carac
    CodigoRespuesta = mtDetcod_carac
    Left = 224
    Top = 208
  end
  object ValCarac: TjktValidador
    Entidad = 'caracteristicaProd'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtDetoid_carac
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtDetdes_carac
      end>
    Left = 264
    Top = 208
  end
end
