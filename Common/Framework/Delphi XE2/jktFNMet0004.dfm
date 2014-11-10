object FormHelpCustomizado: TFormHelpCustomizado
  Left = 505
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Filtro Customizado'
  ClientHeight = 451
  ClientWidth = 564
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
    Width = 564
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 118
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 277
    Width = 564
    object dbgHelp: TjktExpDBGrid
      Left = 2
      Top = 2
      Width = 560
      Height = 273
      Align = alClient
      TabOrder = 0
      DataSource = dsInput
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
    Top = 395
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      564
      56)
    Height = 56
    Width = 564
    object btnAceptar: TButton
      Left = 396
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 477
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cxSplitter: TcxSplitter
    Left = 0
    Top = 113
    Width = 564
    Height = 5
    AlignSplitter = salTop
    Control = gbFiltroAvanzado
    Visible = False
  end
  object dsInput: TDataSource
    DataSet = mtInput
    Left = 408
    Top = 232
  end
  object popSeleccion: TPopupMenu
    OnPopup = popSeleccionPopup
    Left = 120
    Top = 200
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
    Left = 448
    Top = 232
    object mtInputoid: TIntegerField
      FieldName = 'oid'
    end
    object mtInputcodigo: TStringField
      FieldName = 'codigo'
      Size = 15
    end
    object mtInputdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 100
    end
    object mtInputseleccionado: TBooleanField
      FieldName = 'seleccionado'
    end
  end
  object opFiltro: TjktOperacion
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 120
    Top = 136
  end
  object Service: TjktServiceCaller
    HTTP = IdHTTP
    IgnoreException = False
    Left = 120
    Top = 40
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
    Top = 40
  end
end
