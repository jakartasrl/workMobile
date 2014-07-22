inherited FNUti0001: TFNUti0001
  Caption = 'FNUti0001'
  ClientHeight = 384
  ClientWidth = 738
  ExplicitWidth = 754
  ExplicitHeight = 423
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
  end
  inherited OperacionSave: TjktOperacion
    Atributos = <
      item
        Attribute = 'mtInput'
        Dataset = mtInput
        Tag = 0
      end>
    Left = 440
    Top = 216
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 576
  end
  inherited ValidadorForm: TjktValidadorForm
    Left = 288
    Top = 256
  end
  object dsInput: TDataSource
    DataSet = mtInput
    Left = 328
    Top = 144
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
    Left = 560
    Top = 120
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
    Left = 664
    Top = 200
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
        Attribute = 'ParametroInicial'
        Field = mtParametroInicialvalor
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 512
    Top = 56
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
    Left = 576
    Top = 200
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
    Left = 640
    Top = 120
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
    Left = 144
    Top = 288
  end
end
