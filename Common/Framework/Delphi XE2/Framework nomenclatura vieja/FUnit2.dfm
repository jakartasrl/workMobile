object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 468
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 282
    Width = 761
    Height = 186
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 24
      Width = 31
      Height = 13
      Caption = 'codigo'
    end
    object Label2: TLabel
      Left = 11
      Top = 51
      Width = 53
      Height = 13
      Caption = 'descripcion'
    end
    object Button1: TButton
      Left = 11
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 181
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object chk_validar: TcxDBCheckBox
      Left = 11
      Top = 72
      Caption = 'validar'
      DataBinding.DataField = 'validar'
      DataBinding.DataSource = ds
      TabOrder = 2
      Width = 121
    end
    object chk_activo: TcxDBCheckBox
      Left = 11
      Top = 99
      Caption = 'activo'
      DataBinding.DataField = 'activo'
      DataBinding.DataSource = ds
      TabOrder = 3
      Width = 121
    end
    object edt_codigo: TcxDBTextEdit
      Left = 70
      Top = 18
      DataBinding.DataField = 'codigo'
      DataBinding.DataSource = ds
      TabOrder = 4
      Width = 121
    end
    object edt_descripcion: TcxDBTextEdit
      Left = 70
      Top = 45
      DataBinding.DataField = 'descripcion'
      DataBinding.DataSource = ds
      TabOrder = 5
      Width = 121
    end
    object Button3: TButton
      Left = 96
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Abrir'
      TabOrder = 6
      OnClick = Button3Click
    end
    object btn_anterior: TButton
      Left = 270
      Top = 139
      Width = 27
      Height = 25
      Caption = '<'
      TabOrder = 7
      OnClick = btn_anteriorClick
    end
    object btn_siguiente: TButton
      Left = 303
      Top = 139
      Width = 27
      Height = 25
      Caption = '>'
      TabOrder = 8
      OnClick = btn_siguienteClick
    end
    object Button5: TButton
      Left = 448
      Top = 5
      Width = 121
      Height = 35
      Caption = 'Asociar DataSource'
      TabOrder = 9
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 575
      Top = 6
      Width = 121
      Height = 35
      Caption = 'Eliminar Columnas'
      TabOrder = 10
      OnClick = Button6Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 282
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 759
      Height = 280
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object ds: TDataSource
    DataSet = mtTipoCtaProv
    Left = 176
    Top = 112
  end
  object IdHTTP1: TIdHTTP
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
    Left = 344
    Top = 304
  end
  object Oper: TjktOperacion
    HTTP = IdHTTP1
    Host = 'localhost'
    Port = '8090'
    IgnoreException = False
    OnNuevoDataSet = operNuevoDataSet
    Left = 304
    Top = 304
  end
  object Driver: TjktDriver
    DataSetsActu = <>
    IgnoreTags = False
    UpdateHandler = False
    NoAutoEditarDataSets = False
    DataSetCab = mtTipoCtaProv
    ConfirmarCancelacion = False
    Opciones = [opNuevo, opOpen, opRehabilita, opBaja, opImprimir, opBuscar]
    TipoABM = abmIndividual
    ConFiltro = True
    OnLineaMensaje = DriverLineaMensaje
    OnOperacionTraer = DriverOperacionTraer
    OnGuardar = DriverGuardar
    Left = 264
    Top = 304
  end
  object mtTipoCtaProv: TkbmMemTable
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
    FilterOptions = []
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 240
    Top = 112
    object mtTipoCtaProvoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtTipoCtaProvcodigo: TStringField
      Tag = 1
      FieldName = 'codigo'
      Size = 10
    end
    object mtTipoCtaProvdescripcion: TStringField
      Tag = 1
      FieldName = 'descripcion'
      Size = 30
    end
    object mtTipoCtaProvvalidar: TBooleanField
      Tag = 1
      FieldName = 'validar'
    end
    object mtTipoCtaProvactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
  end
end
