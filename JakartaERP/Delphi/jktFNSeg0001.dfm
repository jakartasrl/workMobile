inherited FNSeg0001: TFNSeg0001
  Caption = 'ABM de Empresas'
  ClientHeight = 349
  ClientWidth = 748
  ExplicitWidth = 764
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 349
    Height = 349
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 349
    ExplicitHeight = 349
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 718
    ExplicitLeft = 718
    ExplicitHeight = 349
    Height = 349
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 714
    Height = 349
    ExplicitLeft = 714
    ExplicitHeight = 349
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitWidth = 680
    ExplicitHeight = 349
    Height = 349
    Width = 680
    object dbgEmpresas: TjktExpDBGrid
      Left = 2
      Top = 2
      Width = 676
      Height = 345
      Align = alClient
      TabOrder = 0
      DataSource = dsEmpresas
      object dbgEmpresasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsEmpresas
        DataController.KeyFieldNames = 'oid_empresa'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsData.Deleting = False
        OptionsView.GroupByBox = False
        object dbgEmpresasDBTableView1oid_empresa: TcxGridDBColumn
          DataBinding.FieldName = 'oid_empresa'
          Visible = False
          Options.Editing = False
        end
        object dbgEmpresasDBTableView1Codigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'Codigo'
        end
        object dbgEmpresasDBTableView1RazonSocial: TcxGridDBColumn
          Caption = 'Raz'#243'n Social'
          DataBinding.FieldName = 'RazonSocial'
          Width = 250
        end
        object dbgEmpresasDBTableView1UrlDB: TcxGridDBColumn
          Caption = 'Url DB'
          DataBinding.FieldName = 'UrlDB'
          Width = 350
        end
        object dbgEmpresasDBTableView1Activo: TcxGridDBColumn
          DataBinding.FieldName = 'Activo'
          Width = 52
        end
      end
      object dbgEmpresasLevel1: TcxGridLevel
        GridView = dbgEmpresasDBTableView1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 184
    Top = 24
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = TEmpresas
    FocoEnAlta = TEmpresasRazonSocial
    FocoEnModificacion = TEmpresasRazonSocial
    Left = 512
    Top = 24
  end
  inherited IdHTTP: TIdHTTP
    Left = 400
    Top = 24
  end
  inherited Service: TjktServiceCaller
    Left = 352
    Top = 24
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarEmpresa'
    Atributos = <
      item
        Dataset = TEmpresas
        Tag = 0
      end>
    Left = 576
    Top = 24
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 672
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerEmpresas'
    Left = 576
    Top = 80
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = TEmpresasCodigo
        ValidadorModif = valCodigo1
      end
      item
        Field = TEmpresasCodigo
        ValidadorModif = valCodigo2
      end>
    Left = 400
    Top = 80
  end
  object TEmpresas: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_empresa'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RazonSocial'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UrlDB'
        DataType = ftString
        Size = 255
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
    OnNewRecord = TEmpresasNewRecord
    Left = 160
    Top = 112
    object TEmpresasoid_empresa: TIntegerField
      Tag = 1
      FieldName = 'oid_empresa'
    end
    object TEmpresasCodigo: TStringField
      Tag = 1
      FieldName = 'Codigo'
      Size = 15
    end
    object TEmpresasRazonSocial: TStringField
      Tag = 1
      FieldName = 'RazonSocial'
      Size = 255
    end
    object TEmpresasUrlDB: TStringField
      Tag = 1
      FieldName = 'UrlDB'
      Size = 255
    end
    object TEmpresasActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
  end
  object dsEmpresas: TDataSource
    DataSet = TEmpresas
    Left = 104
    Top = 112
  end
  object valCodigo1: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 288
    Top = 144
  end
  object valCodigo2: TjktValidador
    Entidad = 'empresa'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 360
    Top = 144
  end
end
