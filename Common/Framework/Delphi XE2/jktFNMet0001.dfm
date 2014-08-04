object frmChild: TfrmChild
  Left = 0
  Top = 0
  Caption = 'frmChild'
  ClientHeight = 318
  ClientWidth = 674
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    object mtParametroInicialKey: TStringField
      FieldName = 'Key'
      Size = 255
    end
    object mtParametroInicialValue: TStringField
      FieldName = 'Value'
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
end
