object FMet003: TFMet003
  Left = 505
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtro de '
  ClientHeight = 512
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbFiltroAvanzado: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    Visible = False
    Height = 113
    Width = 523
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 118
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    ExplicitLeft = 320
    ExplicitTop = 503
    ExplicitHeight = 333
    Height = 338
    Width = 523
    object dbgHelp: TjktExpDBGrid
      Left = 2
      Top = 2
      Width = 519
      Height = 334
      Align = alClient
      TabOrder = 0
      DataSource = dsInput
      ExplicitLeft = 115
      ExplicitTop = 107
      ExplicitWidth = 517
      ExplicitHeight = 327
      object dbgHelpDBTableView: TcxGridDBTableView
        PopupMenu = popSeleccion
        OnDblClick = dbgHelpDblClick
        OnKeyDown = dbgHelpKeyDown
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsInput
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        FilterRow.SeparatorWidth = 2
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.FocusCellOnTab = True
        OptionsCustomize.ColumnHiding = True
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
      end
      object dbgHelpLevel1: TcxGridLevel
        GridView = dbgHelpDBTableView
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 456
    Align = alBottom
    TabOrder = 2
    Height = 56
    Width = 523
    object btnAceptar: TButton
      Left = 349
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 430
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cxSplitter: TcxSplitter
    Left = 0
    Top = 113
    Width = 523
    Height = 5
    AlignSplitter = salTop
    Control = gbFiltroAvanzado
    Visible = False
  end
  object dsInput: TDataSource
    DataSet = mtInput
    Left = 392
    Top = 304
  end
  object popSeleccion: TPopupMenu
    OnPopup = popSeleccionPopup
    Left = 88
    Top = 344
    object MISeleccionar: TMenuItem
      Caption = 'Seleccionar'
      OnClick = MISeleccionarClick
    end
    object MISeleccionarTodos: TMenuItem
      Caption = 'Seleccionar Todos'
      OnClick = MISeleccionarTodosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MIInvertirSeleccion: TMenuItem
      Caption = 'Invertir Seleccion'
      OnClick = MIInvertirSeleccionClick
    end
    object MIAnularSeleccion: TMenuItem
      Caption = 'Anular Seleccion'
      OnClick = MIAnularSeleccionClick
    end
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
    Left = 231
    Top = 160
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
    object mtConfigCamposcolumnWidth: TSmallintField
      FieldName = 'columnWidth'
    end
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
    Left = 440
    Top = 304
  end
  object opConfig: TjktOperacion
    OperName = 'TraerConfigHelpGenerico'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'entidad'
        Field = mtParametrosEntidad
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 304
    Top = 160
  end
  object opFiltrado: TjktOperacion
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'entidad'
        Field = mtParametrosEntidad
        Tag = 0
      end
      item
        Dataset = mtFiltros
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 304
    Top = 216
  end
  object mtFiltros: TjktMemTable
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
    Left = 232
    Top = 216
  end
  object mtParametros: TjktMemTable
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
    Left = 97
    Top = 160
    object mtParametrosEntidad: TStringField
      FieldName = 'Entidad'
      Size = 255
    end
  end
  object Service: TjktServiceCaller
    HTTP = IdHTTP
    IgnoreException = False
    Left = 120
    Top = 64
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 168
    Top = 64
  end
end
