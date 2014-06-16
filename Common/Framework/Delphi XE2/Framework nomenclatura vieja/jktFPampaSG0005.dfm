object FPampaSG0005: TFPampaSG0005
  Left = 336
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Login Sistema PAMPA'
  ClientHeight = 323
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 370
    Height = 120
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 26
      Top = 26
      Width = 29
      Height = 13
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 26
      Top = 63
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object Label5: TLabel
      Left = 26
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Idioma'
      Enabled = False
      Visible = False
    end
    object EIdent: TEdit
      Left = 114
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'asutton'
      OnKeyDown = EIdentKeyDown
    end
    object EPasswd: TEdit
      Left = 114
      Top = 59
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = '1'
      OnKeyDown = EIdentKeyDown
    end
    object BOK: TButton
      Left = 273
      Top = 22
      Width = 75
      Height = 25
      Caption = '&OK'
      Default = True
      TabOrder = 2
      OnClick = BOKClick
    end
    object BCancel: TButton
      Left = 274
      Top = 55
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 3
      OnClick = BCancelClick
    end
    object CBIdioma: TComboBox
      Left = 114
      Top = 84
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
      Visible = False
    end
  end
  object GBConexion: TGroupBox
    Left = 0
    Top = 120
    Width = 370
    Height = 203
    Align = alClient
    Caption = 'Conexion'
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 26
      Top = 20
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label4: TLabel
      Left = 26
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Puerto'
    end
    object Label7: TLabel
      Left = 26
      Top = 84
      Width = 49
      Height = 13
      Caption = 'Aplicacion'
    end
    object EHost: TEdit
      Left = 112
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 0
    end
    object EPort: TEdit
      Left = 112
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '8090'
    end
    object CBDefault: TCheckBox
      Left = 24
      Top = 144
      Width = 102
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Usar por Defecto '
      TabOrder = 4
    end
    object CheckBox2: TCheckBox
      Left = 136
      Top = 144
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Trabajar Desconectado'
      Enabled = False
      TabOrder = 5
    end
    object EAplicacion: TEdit
      Left = 112
      Top = 80
      Width = 217
      Height = 21
      TabOrder = 2
      Text = 'JakartaERP'
    end
    object Button1: TButton
      Left = 256
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Cambiar Password'
      TabOrder = 6
    end
    object EServlet: TEdit
      Left = 112
      Top = 112
      Width = 249
      Height = 21
      TabOrder = 3
      Text = 'EServlet'
      Visible = False
    end
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
    Left = 296
    Top = 96
  end
  object TUsu: TkbmMemTable
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 272
    Top = 161
    object TUsuoid_usu: TIntegerField
      FieldName = 'oid_usu'
    end
    object TUsuApeNom: TStringField
      FieldName = 'ApeNom'
      Size = 30
    end
    object TUsuiniciales: TStringField
      FieldName = 'iniciales'
      Size = 10
    end
    object TUsusesionID: TStringField
      FieldName = 'sesionID'
      Size = 50
    end
    object TUsudecimalSeparator: TStringField
      FieldName = 'decimalSeparator'
      Size = 1
    end
    object TUsucertificado: TStringField
      FieldName = 'certificado'
      Size = 2000
    end
  end
  object TEmpre: TkbmMemTable
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 320
    Top = 161
    object TEmpreoid_emp: TIntegerField
      FieldName = 'oid_emp'
    end
    object TEmpredescEmpresa: TStringField
      FieldName = 'descEmpresa'
      Size = 40
    end
    object TEmprecodEmpresa: TStringField
      FieldName = 'codEmpresa'
      Size = 10
    end
    object TEmpreis_default: TBooleanField
      FieldName = 'is_default'
    end
    object TEmpreoid_per_dat: TIntegerField
      FieldName = 'oid_per_dat'
    end
    object TEmpreoid_per_fun: TIntegerField
      FieldName = 'oid_per_fun'
    end
    object TEmprecolor: TStringField
      FieldName = 'color'
      Size = 10
    end
  end
  object TOper: TkbmMemTable
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 344
    Top = 232
    object TOperoper: TStringField
      FieldName = 'oper'
      Size = 30
    end
    object TOperdataset: TStringField
      FieldName = 'dataset'
      Size = 30
    end
    object TOperfile: TStringField
      FieldName = 'file'
      Size = 120
    end
  end
  object csv1: TkbmCSVStreamFormat
    CommentChar = #0
    EscapeChar = '%'
    DefaultStringFieldSize = 255
    CSVQuote = '"'
    CSVFieldDelimiter = ','
    CSVRecordDelimiter = ','
    CSVTrueString = 'True'
    CSVFalseString = 'False'
    sfLocalFormat = []
    sfQuoteOnlyStrings = []
    sfNoHeader = []
    Version = '3.10'
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfPlaceHolders = []
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDisplayWidth = []
    sfAutoInc = []
    Left = 296
    Top = 232
  end
  object mtSucursalLogin: TkbmMemTable
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
    Left = 72
    Top = 24
    object mtSucursalLoginoid_Suc: TIntegerField
      FieldName = 'oid_Suc'
    end
    object mtSucursalLogindesc_suc: TStringField
      FieldName = 'desc_suc'
    end
  end
  object Oper: TjktOperacion
    HTTP = IdHTTP1
    IgnoreException = False
    OnNuevoDataSet = OperNuevoDataSet
    Left = 248
    Top = 96
  end
end
