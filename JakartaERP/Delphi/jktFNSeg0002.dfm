inherited FNSeg0002: TFNSeg0002
  Caption = 'ABM de Usuarios'
  ClientHeight = 363
  ClientWidth = 785
  ExplicitWidth = 801
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Datos del Usuario'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Height = 153
    Width = 785
    object dxBevel1: TdxBevel
      Left = 14
      Top = 96
      Width = 531
      Height = 14
      Shape = dxbsLineTop
    end
    object txtCodigo: TcxDBTextEdit
      Left = 91
      Top = 30
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsUsuarios
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 272
      Top = 30
      DataBinding.DataField = 'Apellido'
      DataBinding.DataSource = dsUsuarios
      TabOrder = 1
      Width = 178
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 515
      Top = 30
      DataBinding.DataField = 'Nombre'
      DataBinding.DataSource = dsUsuarios
      TabOrder = 2
      Width = 258
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 91
      Top = 64
      DataBinding.DataField = 'Email'
      DataBinding.DataSource = dsUsuarios
      TabOrder = 3
      Width = 233
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 32
      AutoSize = False
      Caption = 'Identificaci'#243'n :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 77
      AnchorX = 91
    end
    object cxLabel2: TcxLabel
      Left = 218
      Top = 32
      AutoSize = False
      Caption = 'Apellido :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 53
      AnchorX = 271
    end
    object cxLabel3: TcxLabel
      Left = 456
      Top = 32
      AutoSize = False
      Caption = 'Nombres :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 53
      AnchorX = 509
    end
    object cxLabel4: TcxLabel
      Left = 19
      Top = 66
      AutoSize = False
      Caption = 'E-mail :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 72
      AnchorX = 91
    end
    object cxDBCheckBox1: TcxDBCheckBox
      Left = 432
      Top = 108
      Caption = 'Sin vencimiento'
      DataBinding.DataField = 'SinVencimientoPwd'
      DataBinding.DataSource = dsUsuarios
      Properties.Alignment = taRightJustify
      TabOrder = 6
      Transparent = True
      Width = 97
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 91
      Top = 107
      DataBinding.DataField = 'Password'
      DataBinding.DataSource = dsUsuarios
      Properties.EchoMode = eemPassword
      TabOrder = 5
      Width = 121
    end
    object cxLabel6: TcxLabel
      Left = 19
      Top = 109
      AutoSize = False
      Caption = 'Password :'
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      Height = 17
      Width = 72
      AnchorX = 91
    end
    object cxDBCheckBox2: TcxDBCheckBox
      Left = 370
      Top = 65
      Caption = 'Activo :'
      DataBinding.DataField = 'Activo'
      DataBinding.DataSource = dsUsuarios
      Properties.Alignment = taRightJustify
      TabOrder = 4
      Transparent = True
      Width = 61
    end
  end
  object cxGroupBox3: TcxGroupBox [1]
    Left = 0
    Top = 153
    Align = alClient
    Caption = 'Empresas'
    TabOrder = 5
    Height = 210
    Width = 785
    object dbgUsuarioEmpresas: TjktExpDBGrid
      Left = 3
      Top = 15
      Width = 525
      Height = 185
      Align = alLeft
      TabOrder = 0
      DataSource = dsUsuarioEmpresas
      object dbgUsuarioEmpresasDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsUsuarioEmpresas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object dbgUsuarioEmpresasDBTableView1oid_usu_emp: TcxGridDBColumn
          DataBinding.FieldName = 'oid_usu_emp'
          Visible = False
        end
        object dbgUsuarioEmpresasDBTableView1oid_usuario: TcxGridDBColumn
          DataBinding.FieldName = 'oid_usuario'
          Visible = False
        end
        object dbgUsuarioEmpresasDBTableView1oid_empresa: TcxGridDBColumn
          DataBinding.FieldName = 'oid_empresa'
          Visible = False
        end
        object dbgUsuarioEmpresasDBTableView1Codigo: TcxGridDBColumn
          DataBinding.FieldName = 'Codigo'
          Options.Editing = False
        end
        object dbgUsuarioEmpresasDBTableView1RazonSocial: TcxGridDBColumn
          DataBinding.FieldName = 'RazonSocial'
          Options.Editing = False
          Width = 319
        end
        object dbgUsuarioEmpresasDBTableView1Default: TcxGridDBColumn
          DataBinding.FieldName = 'Default'
          HeaderAlignmentHorz = taCenter
          Width = 55
        end
        object dbgUsuarioEmpresasDBTableView1Habilitada: TcxGridDBColumn
          DataBinding.FieldName = 'Habilitada'
          HeaderAlignmentHorz = taCenter
          Width = 55
        end
      end
      object dbgUsuarioEmpresasLevel1: TcxGridLevel
        GridView = dbgUsuarioEmpresasDBTableView1
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 312
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = TUsuarios
    TipoPrograma = tp_abmIndividual
    Filtro = Help
    FocoEnAlta = TUsuariosCodigo
    FocoEnModificacion = TUsuariosApellido
    OperacionesDefault = <
      item
        Operacion = OperTraerEmpresas
      end>
    Left = 640
    Top = 8
  end
  inherited IdHTTP: TIdHTTP
    Left = 528
    Top = 8
  end
  inherited Service: TjktServiceCaller
    Left = 472
    Top = 8
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'GuardarUsuario'
    Atributos = <
      item
        Dataset = TUsuarios
        Tag = 0
      end
      item
        Dataset = TUsuarioEmpresas
        Tag = 0
      end>
    Left = 704
    Top = 8
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 704
    Top = 120
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerUsuariosYEmpresas'
    Atributos = <
      item
        Attribute = 'oid'
        Field = TUsuariosoid_usuario
        Tag = 0
      end>
    Left = 704
    Top = 64
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = TUsuariosCodigo
        ValidadorNew = valCodigo1
      end
      item
        Field = TUsuariosCodigo
        ValidadorNew = valCodigo2
      end>
    Left = 528
    Top = 64
  end
  object TUsuarios: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_usuario'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Apellido'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ConfPassword'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end
      item
        Name = 'SinVencimientoPwd'
        DataType = ftBoolean
      end>
    AutoReposition = True
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
    Left = 304
    Top = 80
    object TUsuariosoid_usuario: TIntegerField
      Tag = 1
      FieldName = 'oid_usuario'
    end
    object TUsuariosCodigo: TStringField
      Tag = 2
      FieldName = 'Codigo'
      Size = 15
    end
    object TUsuariosApellido: TStringField
      Tag = 1
      FieldName = 'Apellido'
      Size = 30
    end
    object TUsuariosNombre: TStringField
      Tag = 1
      FieldName = 'Nombre'
      Size = 40
    end
    object TUsuariosPassword: TStringField
      Tag = 1
      FieldName = 'Password'
      Size = 30
    end
    object TUsuariosEmail: TStringField
      Tag = 1
      FieldName = 'Email'
      Size = 50
    end
    object TUsuariosActivo: TBooleanField
      Tag = 1
      FieldName = 'Activo'
    end
    object TUsuariosSinVencimientoPwd: TBooleanField
      Tag = 1
      FieldName = 'SinVencimientoPwd'
    end
  end
  object TUsuarioEmpresas: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_usu_emp'
        DataType = ftInteger
      end
      item
        Name = 'oid_usuario'
        DataType = ftInteger
      end
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
        Name = 'Default'
        DataType = ftBoolean
      end
      item
        Name = 'Activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_usuario'
    IndexName = 'TUsuarioEmpresasIndex1'
    IndexDefs = <
      item
        Name = 'TUsuarioEmpresasIndex1'
        Fields = 'oid_usuario'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_usuario'
    MasterSource = dsUsuarios
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 568
    Top = 256
    object TUsuarioEmpresasoid_usu_emp: TIntegerField
      Tag = 1
      FieldName = 'oid_usu_emp'
    end
    object TUsuarioEmpresasoid_usuario: TIntegerField
      Tag = 1
      FieldName = 'oid_usuario'
    end
    object TUsuarioEmpresasoid_empresa: TIntegerField
      Tag = 1
      FieldName = 'oid_empresa'
    end
    object TUsuarioEmpresasCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object TUsuarioEmpresasRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Size = 255
    end
    object TUsuarioEmpresasDefault: TBooleanField
      Tag = 1
      FieldName = 'Default'
    end
    object TUsuarioEmpresasHabilitada: TBooleanField
      Tag = 1
      FieldName = 'Habilitada'
    end
  end
  object dsUsuarios: TDataSource
    DataSet = TUsuarios
    Left = 248
    Top = 80
  end
  object dsUsuarioEmpresas: TDataSource
    DataSet = TUsuarioEmpresas
    Left = 568
    Top = 200
  end
  object valCodigo2: TjktValidador
    Entidad = 'usuario'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 160
    Top = 64
  end
  object valCodigo1: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 96
    Top = 64
  end
  object OperTraerEmpresas: TjktOperacion
    OperName = 'TraerEmpresasParaUsuarios'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 88
    Top = 216
  end
  object Help: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'usuario'
    OidRespuesta = TUsuariosoid_usuario
    Left = 640
    Top = 64
  end
end
