object frmChild: TfrmChild
  Left = 0
  Top = 0
  Caption = 'frmChild'
  ClientHeight = 392
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBoxLeft: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Height = 392
    Width = 30
  end
  object cxSplitterLeft: TcxSplitter
    Left = 30
    Top = 0
    Width = 4
    Height = 392
  end
  object cxGroupBoxRight: TcxGroupBox
    Left = 685
    Top = 0
    Align = alRight
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Height = 392
    Width = 30
  end
  object cxSplitterRight: TcxSplitter
    Left = 681
    Top = 0
    Width = 4
    Height = 392
    AlignSplitter = salRight
    Control = cxGroupBoxRight
  end
  object cxGroupBoxMain: TcxGroupBox
    Left = 34
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 8
    Height = 392
    Width = 647
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 104
    Top = 32
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Grillas'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 429
      FloatTop = 308
      FloatClientWidth = 129
      FloatClientHeight = 84
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbCopiarGrilla'
        end
        item
          Visible = True
          ItemName = 'bbPegarGrilla'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object bbCopiarGrilla: TdxBarLargeButton
      Caption = 'Copiar datos de Grilla'
      Category = 0
      Hint = 'Copiar datos de Grilla'
      Visible = ivAlways
    end
    object bbPegarGrilla: TdxBarLargeButton
      Caption = 'Pegar datos a Grilla'
      Category = 0
      Hint = 'Pegar datos a Grilla'
      Visible = ivAlways
    end
  end
  object Driver: TjktDriver
    NoAutoEditarDataSets = False
    OperacionSave = OperacionSave
    OperacionTraer = OperacionTraer
    ConfirmarCancelacion = True
    Opciones = []
    TipoPrograma = tp_abmLista
    OperacionesIniciales = <>
    OperacionesDefault = <>
    Left = 360
    Top = 32
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
    Left = 256
    Top = 32
  end
  object Service: TjktServiceCaller
    HTTP = IdHTTP
    IgnoreException = False
    Left = 200
    Top = 32
  end
  object OperacionSave: TjktOperacion
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 424
    Top = 32
  end
  object mtParametroInicial: TjktMemTable
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
    Left = 520
    Top = 32
    object mtParametroInicialEntidad: TStringField
      FieldName = 'Entidad'
      Size = 255
    end
  end
  object OperacionTraer: TjktOperacion
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 424
    Top = 96
  end
  object ValidadorForm: TjktValidadorForm
    ListaValidaciones = <>
    Left = 256
    Top = 96
  end
  object mtParametrosForm: TjktMemTable
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
    Left = 560
    Top = 32
  end
end
