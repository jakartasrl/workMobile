inherited FNVen0001: TFNVen0001
  Caption = 'ABM de Conceptos'
  ClientHeight = 405
  ClientWidth = 717
  ExplicitWidth = 733
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid [0]
    Left = 0
    Top = 0
    Width = 717
    Height = 405
    Align = alClient
    TabOrder = 4
    object jktExpDBGrid1DBBandedTableView1: TcxGridDBBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsConc
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = 'Concepto Presupuestario'
        end
        item
          Caption = 'Valor Clasificador'
        end>
      object jktExpDBGrid1DBBandedTableView1oid_conc: TcxGridDBBandedColumn
        DataBinding.FieldName = 'oid_conc'
        Width = 48
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1cod_conc: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod_conc'
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1des_conc: TcxGridDBBandedColumn
        Caption = 'Descripci'#243'n'
        DataBinding.FieldName = 'des_conc'
        Width = 300
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1pide_art: TcxGridDBBandedColumn
        Caption = 'Pide Art'#237'culo'
        DataBinding.FieldName = 'pide_art'
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1oid_val_cla: TcxGridDBBandedColumn
        DataBinding.FieldName = 'oid_val_cla'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1cod_val_cla: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod_val_cla'
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object jktExpDBGrid1DBBandedTableView1des_val_cla: TcxGridDBBandedColumn
        Caption = 'Descripci'#243'n'
        DataBinding.FieldName = 'des_val_cla'
        Width = 300
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
    end
    object jktExpDBGrid1Level1: TcxGridLevel
      GridView = jktExpDBGrid1DBBandedTableView1
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
    TipoPrograma = tp_abmIndividual
    OperacionesIniciales = <
      item
        Operacion = opTraerParametro
      end>
  end
  inherited mtParametroInicial: TjktMemTable
    object mtParametroInicialNombreParametro: TStringField
      FieldName = 'NombreParametro'
      Size = 100
    end
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
    OnNewRecord = mtConcNewRecord
    Left = 208
    Top = 208
    object mtConcoid_conc: TIntegerField
      FieldName = 'oid_conc'
    end
    object mtConccod_conc: TStringField
      FieldName = 'cod_conc'
      Size = 15
    end
    object mtConcdes_conc: TStringField
      FieldName = 'des_conc'
      Size = 150
    end
    object mtConcpide_art: TBooleanField
      FieldName = 'pide_art'
    end
    object mtConcoid_val_cla: TIntegerField
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
end
