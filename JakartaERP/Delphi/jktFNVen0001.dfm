inherited FNVen0001: TFNVen0001
  Caption = 'ABM de Conceptos'
  ClientHeight = 405
  ClientWidth = 1042
  ExplicitWidth = 1058
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 405
    Height = 405
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 405
    ExplicitHeight = 405
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 1012
    TabOrder = 4
    ExplicitLeft = 687
    ExplicitHeight = 405
    Height = 405
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 1008
    Height = 405
    ExplicitLeft = 683
    ExplicitHeight = 405
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitWidth = 649
    ExplicitHeight = 405
    Height = 405
    Width = 974
    object jktExpDBGrid1: TjktExpDBGrid
      Left = 2
      Top = 2
      Width = 970
      Height = 401
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 645
      object DBGrid1DBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsConc
        DataController.KeyFieldNames = 'oid_conc'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.NestedBands = False
        OptionsData.Appending = True
        OptionsView.GroupByBox = False
        Bands = <
          item
            Caption = 'Concepto Presupuestario'
          end
          item
            Caption = 'Valor Clasificador'
          end>
        object DBGrid1DBBandedTableView1oid_conc: TcxGridDBBandedColumn
          DataBinding.FieldName = 'oid_conc'
          Visible = False
          Width = 48
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1cod_conc: TcxGridDBBandedColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'cod_conc'
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1des_conc: TcxGridDBBandedColumn
          Caption = 'Descripci'#243'n'
          DataBinding.FieldName = 'des_conc'
          Width = 300
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1cod_unid_med: TcxGridDBBandedColumn
          Caption = 'Unid. Med.'
          DataBinding.FieldName = 'cod_unid_med'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = DBGrid1DBBandedTableView1cod_unid_medPropertiesButtonClick
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1cod_mon: TcxGridDBBandedColumn
          Caption = 'Moneda'
          DataBinding.FieldName = 'cod_mon'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = DBGrid1DBBandedTableView1cod_monPropertiesButtonClick
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1pide_art: TcxGridDBBandedColumn
          Caption = 'Pide Art'#237'culo'
          DataBinding.FieldName = 'pide_art'
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1oid_val_cla: TcxGridDBBandedColumn
          DataBinding.FieldName = 'oid_val_cla'
          Visible = False
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1cod_val_cla: TcxGridDBBandedColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'cod_val_cla'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = DBGrid1DBBandedTableView1cod_val_claPropertiesButtonClick
          Width = 70
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object DBGrid1DBBandedTableView1des_val_cla: TcxGridDBBandedColumn
          Caption = 'Descripci'#243'n'
          DataBinding.FieldName = 'des_val_cla'
          Options.Editing = False
          Width = 300
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object jktExpDBGrid1Level1: TcxGridLevel
        GridView = DBGrid1DBBandedTableView1
      end
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = mtConc
    OperacionesIniciales = <
      item
        Operacion = opTraerParametro
      end>
    Left = 352
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarConceptoPresupuesto'
  end
  inherited mtParametroInicial: TjktMemTable
    object mtParametroInicialNombreParametro: TStringField
      FieldName = 'NombreParametro'
      Size = 100
    end
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerConceptoPresupuesto'
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtConccod_val_cla
        ValidadorGral = ValValorClasif
      end>
  end
  inherited mtParametrosForm: TjktMemTable
    object mtParametrosFormoid_param: TIntegerField
      FieldName = 'oid_param'
    end
    object mtParametrosFormcodigo: TStringField
      FieldName = 'codigo'
      Size = 30
    end
    object mtParametrosFormdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 50
    end
    object mtParametrosFormvalor_cadena: TStringField
      FieldName = 'valor_cadena'
      Size = 100
    end
    object mtParametrosFormvalor_entero: TIntegerField
      FieldName = 'valor_entero'
    end
    object mtParametrosFormvalor_fecha: TStringField
      FieldName = 'valor_fecha'
      Size = 10
    end
    object mtParametrosFormvalor_decimal: TFloatField
      FieldName = 'valor_float'
    end
    object mtParametrosFormvalor_boolean: TBooleanField
      FieldName = 'valor_boolean'
    end
  end
  object mtConc: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_conc'
        DataType = ftInteger
      end
      item
        Name = 'cod_conc'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_conc'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'pide_art'
        DataType = ftBoolean
      end
      item
        Name = 'oid_cla'
        DataType = ftInteger
      end
      item
        Name = 'oid_val_cla'
        DataType = ftInteger
      end
      item
        Name = 'cod_val_cla'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'des_val_cla'
        DataType = ftString
        Size = 100
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
    OnNewRecord = mtConcNewRecord
    Left = 208
    Top = 208
    object mtConcoid_conc: TIntegerField
      Tag = 1
      FieldName = 'oid_conc'
    end
    object mtConccod_conc: TStringField
      Tag = 1
      FieldName = 'cod_conc'
      Size = 15
    end
    object mtConcdes_conc: TStringField
      Tag = 1
      FieldName = 'des_conc'
      Size = 150
    end
    object mtConcpide_art: TBooleanField
      Tag = 1
      FieldName = 'pide_art'
    end
    object mtConcoid_cla: TIntegerField
      FieldName = 'oid_cla'
    end
    object mtConcoid_val_cla: TIntegerField
      Tag = 1
      FieldName = 'oid_val_cla'
    end
    object mtConccod_val_cla: TStringField
      FieldName = 'cod_val_cla'
      Size = 15
    end
    object mtConcdes_val_cla: TStringField
      FieldName = 'des_val_cla'
      Size = 100
    end
    object mtConcoid_unid_med: TIntegerField
      Tag = 1
      FieldName = 'oid_unid_med'
    end
    object mtConccod_unid_med: TStringField
      FieldName = 'cod_unid_med'
      Size = 10
    end
    object mtConcoid_mon: TIntegerField
      Tag = 1
      FieldName = 'oid_mon'
    end
    object mtConccod_mon: TStringField
      FieldName = 'cod_mon'
      Size = 15
    end
  end
  object dsConc: TDataSource
    DataSet = mtConc
    Left = 248
    Top = 208
  end
  object opTraerParametro: TjktOperacion
    OperName = 'TraerParametro'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'nombreParametro'
        Field = mtParametroInicialNombreParametro
        Tag = 0
      end>
    ServiceCaller = Service
    OnBeforeEjecutar = opTraerParametroBeforeEjecutar
    OnAfterEjecutar = opTraerParametroAfterEjecutar
    Left = 520
    Top = 96
  end
  object HelpValorClasif: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'valoresClasificador'
    OidEntidadMaestra = mtConcoid_cla
    TipoFiltro = fi_ValoresClasificador
    OidRespuesta = mtConcoid_val_cla
    CodigoRespuesta = mtConccod_val_cla
    Left = 328
    Top = 208
  end
  object ValValorClasif: TjktValidador
    Entidad = 'valoresClasificador'
    OidEntidadMaestra = mtConcoid_cla
    Validacion = tExistente
    ListaAsignaciones = <
      item
        SourceName = 'oid'
        FieldTarget = mtConcoid_val_cla
      end
      item
        SourceName = 'Descripcion'
        FieldTarget = mtConcdes_val_cla
      end>
    Left = 376
    Top = 208
  end
  object hlpUnidMed: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'unidadMedida'
    TipoFiltro = fi_Activos
    OidRespuesta = mtConcoid_unid_med
    CodigoRespuesta = mtConccod_unid_med
    Left = 328
    Top = 256
  end
  object hlpMoneda: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'moneda'
    TipoFiltro = fi_Activos
    OidRespuesta = mtConcoid_mon
    CodigoRespuesta = mtConccod_mon
    Left = 328
    Top = 304
  end
end
