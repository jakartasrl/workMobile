inherited FNSeg0001: TFNSeg0001
  Caption = 'ABM de Empresas'
  ClientHeight = 252
  ClientWidth = 748
  ExplicitWidth = 764
  ExplicitHeight = 291
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitHeight = 252
    Height = 252
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 252
    Control = cxGroupBoxLeft
    ExplicitLeft = 185
    ExplicitTop = 0
    ExplicitHeight = 252
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 563
    ExplicitLeft = 563
    ExplicitTop = 0
    ExplicitHeight = 252
    Height = 252
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 555
    Height = 252
    Control = cxGroupBoxRight
    ExplicitLeft = 555
    ExplicitTop = 0
    ExplicitHeight = 252
  end
  inherited cxGroupBoxMain: TcxGroupBox
    ExplicitLeft = 193
    ExplicitTop = 0
    ExplicitWidth = 362
    ExplicitHeight = 252
    Height = 252
    Width = 362
    object dbgEmpresas: TjktExpDBGrid
      Left = 2
      Top = 5
      Width = 358
      Height = 245
      Align = alClient
      TabOrder = 0
      DataSource = dsEmpresas
      ExplicitLeft = 193
      ExplicitTop = 0
      ExplicitWidth = 362
      ExplicitHeight = 252
      object dbgEmpresasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsEmpresas
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
