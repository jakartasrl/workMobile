object FPampaSG0008: TFPampaSG0008
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  Caption = 'Cambio de Password'
  ClientHeight = 160
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 18
    Width = 29
    Height = 13
    Caption = 'Login:'
  end
  object Label2: TLabel
    Left = 26
    Top = 55
    Width = 49
    Height = 13
    Caption = 'Password:'
  end
  object Label3: TLabel
    Left = 26
    Top = 95
    Width = 84
    Height = 13
    Caption = 'Nuevo Password:'
  end
  object Label4: TLabel
    Left = 26
    Top = 135
    Width = 93
    Height = 13
    Caption = 'Confirma Password:'
  end
  object ELogin: TEdit
    Left = 128
    Top = 14
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 288
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object MPassword: TMaskEdit
    Left = 128
    Top = 51
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object MNuevoPassword: TMaskEdit
    Left = 128
    Top = 91
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object MConfirmaPassword: TMaskEdit
    Left = 128
    Top = 131
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
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
  object oper: TjktOperacion
    HTTP = IdHTTP1
    Servlet = 'com.jkt.framework.request.http.FrontServletXML'
    Host = 'localhost'
    Port = '8080'
    IgnoreException = False
    OnNuevoDataSet = operNuevoDataSet
    Left = 328
    Top = 96
  end
  object mtRespuesta: TkbmMemTable
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
    Left = 88
    Top = 8
    object mtRespuestaoid_usu: TIntegerField
      FieldName = 'oid_usu'
    end
  end
end
