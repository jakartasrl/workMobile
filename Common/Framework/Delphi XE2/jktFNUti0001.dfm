inherited FNUti0001: TFNUti0001
  Caption = 'FNUti0001'
  ClientHeight = 384
  ClientWidth = 738
  ExplicitWidth = 754
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid [0]
    Left = 0
    Top = 0
    Width = 738
    Height = 384
    Align = alClient
    TabOrder = 4
    DataSource = dsInput
    object jktExpDBGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsInput
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsData.Appending = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
    end
    object jktExpDBGrid1Level1: TcxGridLevel
      GridView = jktExpDBGrid1DBTableView1
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
    DataSetCab = mtInput
    TipoPrograma = tp_Otro
  end
  inherited OperacionSave: TjktOperacion
    Atributos = <
      item
        Attribute = 'mtInput'
        Dataset = mtInput
        Tag = 0
      end>
    Top = 88
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 600
  end
  inherited OperacionTraer: TjktOperacion
    Top = 32
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = mtConfigCamposlabel
        Validador = jktValidador1
      end
      item
      end>
    Left = 520
    Top = 88
  end
  object dsInput: TDataSource
    DataSet = mtInput
    Left = 344
    Top = 304
  end
  object mtInput: TjktMemTable
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
    OnNewRecord = mtInputNewRecord
    Left = 392
    Top = 304
  end
  object mtConfigOper: TjktMemTable
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
    Left = 616
    Top = 240
    object mtConfigOperoperSave: TStringField
      FieldName = 'operSave'
      Size = 50
    end
    object mtConfigOperoperTraer: TStringField
      FieldName = 'operTraer'
      Size = 50
    end
  end
  object operConfig: TjktOperacion
    OperName = 'TraerConfigAbmGenerico'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'key'
        Field = mtParametroInicialKey
        Tag = 0
      end
      item
        Attribute = 'value'
        Field = mtParametroInicialValue
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 520
    Top = 32
  end
  object mtConfigCampos: TjktMemTable
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
    Left = 616
    Top = 192
    object mtConfigCamposfieldName: TStringField
      FieldName = 'fieldName'
      Size = 40
    end
    object mtConfigCampostipo: TStringField
      FieldName = 'tipo'
      Size = 40
    end
    object mtConfigCamposlongitud: TIntegerField
      FieldName = 'longitud'
    end
    object mtConfigCamposlabel: TStringField
      FieldName = 'label'
      Size = 50
    end
    object mtConfigCamposvisible: TBooleanField
      FieldName = 'visible'
    end
    object mtConfigCamposreadOnly: TBooleanField
      FieldName = 'readOnly'
    end
    object mtConfigCamposorden: TSmallintField
      FieldName = 'orden'
    end
  end
  object mtConfigValidador: TjktMemTable
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
    Left = 616
    Top = 144
    object mtConfigValidadorfieldName: TStringField
      FieldName = 'fieldName'
      Size = 30
    end
    object mtConfigValidadortipoValidacion: TStringField
      FieldName = 'tipoValidacion'
      Size = 30
    end
    object mtConfigValidadorentidad: TStringField
      FieldName = 'entidad'
      Size = 40
    end
    object mtConfigValidadoroidName: TStringField
      FieldName = 'oidName'
    end
    object mtConfigValidadordescrName: TStringField
      FieldName = 'descrName'
    end
  end
  object jktValidador1: TjktValidador
    Validacion = tInexistente
    ListaAsignaciones = <
      item
      end>
    Left = 96
    Top = 280
  end
end
