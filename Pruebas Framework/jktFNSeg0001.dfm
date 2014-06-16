object FPampaSG0005: TFPampaSG0005
  Left = 336
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Login'
  ClientHeight = 323
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
      OnKeyDown = EIdentKeyDown
    end
    object EPasswd: TEdit
      Left = 114
      Top = 59
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
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
      Text = 'localhost'
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
    end
    object Button1: TButton
      Left = 256
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Cambiar Password'
      TabOrder = 6
      OnClick = Button1Click
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
    Left = 272
    Top = 96
  end
  object Usuario: TkbmMemTable
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
    object Usuariooid_usu: TIntegerField
      FieldName = 'oid_usu'
    end
    object UsuarioApeNom: TStringField
      FieldName = 'ApeNom'
      Size = 30
    end
    object Usuarioiniciales: TStringField
      FieldName = 'iniciales'
      Size = 10
    end
    object UsuariosesionID: TStringField
      FieldName = 'sesionID'
      Size = 50
    end
    object UsuariodecimalSeparator: TStringField
      FieldName = 'decimalSeparator'
      Size = 1
    end
    object Usuariocertificado: TStringField
      FieldName = 'certificado'
      Size = 2000
    end
  end
  object Empresa: TkbmMemTable
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
    Left = 192
    Top = 161
    object Empresaoid_emp: TIntegerField
      FieldName = 'oid_emp'
    end
    object EmpresadescEmpresa: TStringField
      FieldName = 'descEmpresa'
      Size = 40
    end
    object EmpresacodEmpresa: TStringField
      FieldName = 'codEmpresa'
      Size = 10
    end
    object Empresais_default: TBooleanField
      FieldName = 'is_default'
    end
    object Empresaoid_per_dat: TIntegerField
      FieldName = 'oid_per_dat'
    end
    object Empresaoid_per_fun: TIntegerField
      FieldName = 'oid_per_fun'
    end
    object Empresacolor: TStringField
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
    Left = 312
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
  object TAvisoCambioPassword: TjktMemTable
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 184
    Top = 224
    object TAvisoCambioPasswordcaduco_password: TBooleanField
      FieldName = 'caduco_password'
    end
    object TAvisoCambioPasswordaviso_prox_venc: TBooleanField
      FieldName = 'aviso_prox_venc'
    end
    object TAvisoCambioPassworddias: TIntegerField
      FieldName = 'dias'
    end
  end
  object mtSucursalLogin: TjktMemTable
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
    SubLanguageID = 1
    LocaleID = 1024
    Left = 272
    Top = 200
    object mtSucursalLoginoid_suc: TIntegerField
      Tag = 1
      FieldName = 'oid_suc'
    end
    object mtSucursalLogindesc_suc: TStringField
      FieldName = 'desc_suc'
      Size = 100
    end
  end
  object oper: TjktServiceCaller
    HTTP = IdHTTP1
    IgnoreException = False
    Left = 328
    Top = 104
  end
end
