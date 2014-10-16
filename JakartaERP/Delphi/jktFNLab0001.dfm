inherited FNLab0001: TFNLab0001
  Caption = 'ABM de Determinaciones'
  ClientHeight = 499
  ClientWidth = 1105
  ExplicitLeft = -319
  ExplicitWidth = 1121
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1105
    Height = 499
    Align = alClient
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 673
      Top = 1
      Height = 497
      ExplicitLeft = 520
      ExplicitTop = 272
      ExplicitHeight = 100
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 672
      Height = 497
      Align = alLeft
      BorderStyle = bsSingle
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 666
        Height = 491
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DSDet
          DataController.KeyFieldNames = 'key'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsData.Appending = True
          object cxGrid1DBTableView1cod_det: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'cod_det'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid1DBTableView1des_det: TcxGridDBColumn
            Caption = 'Descripcion'
            DataBinding.FieldName = 'des_det'
            HeaderAlignmentHorz = taCenter
            Width = 257
          end
          object cxGrid1DBTableView1metodo: TcxGridDBColumn
            Caption = 'Metodo'
            DataBinding.FieldName = 'metodo'
            HeaderAlignmentHorz = taCenter
            Width = 123
          end
          object cxGrid1DBTableView1tipo_res: TcxGridDBColumn
            Caption = 'Tipo Resultado'
            DataBinding.FieldName = 'tipo_res'
            HeaderAlignmentHorz = taCenter
            Width = 91
          end
          object cxGrid1DBTableView1activo: TcxGridDBColumn
            Caption = 'Activo'
            DataBinding.FieldName = 'activo'
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object Panel3: TPanel
      Left = 676
      Top = 1
      Width = 428
      Height = 497
      Align = alClient
      BorderStyle = bsSingle
      Caption = 'Panel3'
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 422
        Height = 41
        Align = alTop
        TabOrder = 0
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 21
          Top = 12
          DataBinding.DataField = 'des_det'
          DataBinding.DataSource = DSDet
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 308
        end
      end
      object cxGrid2: TcxGrid
        Left = 1
        Top = 42
        Width = 422
        Height = 450
        Align = alClient
        TabOrder = 1
        ExplicitTop = 40
        object cxGrid2DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DSVal
          DataController.KeyFieldNames = 'key'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          object cxGrid2DBTableView1valor_desde: TcxGridDBColumn
            Caption = 'Desde'
            DataBinding.FieldName = 'valor_desde'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid2DBTableView1valor_hasta: TcxGridDBColumn
            Caption = 'Hasta'
            DataBinding.FieldName = 'valor_hasta'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid2DBTableView1cod_tabla: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'cod_tabla'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid2DBTableView1des_tabla: TcxGridDBColumn
            Caption = 'Descripcion'
            DataBinding.FieldName = 'des_tabla'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid2DBTableView1limite_inf: TcxGridDBColumn
            Caption = 'Inferor'
            DataBinding.FieldName = 'limite_inf'
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid2DBTableView1limite_sup: TcxGridDBColumn
            Caption = 'Superior'
            DataBinding.FieldName = 'limite_sup'
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Left = 56
    Top = 40
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'SaveDeterminaciones'
    Atributos = <
      item
        Dataset = TDet
        Tag = 0
      end
      item
        Dataset = TVal
        Tag = 0
      end
      item
        Tag = 0
      end>
    Left = 320
    Top = 136
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 288
    Top = 208
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerDeterminaciones'
    Left = 488
    Top = 65520
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = TDetcod_det
        ValidadorGral = valDeter
      end
      item
        Field = TValcod_tabla
        ValidadorGral = valTabla
      end>
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 400
    Top = 168
    object mtParametrosFormoid_param: TIntegerField
      FieldName = 'oid_param'
    end
    object mtParametrosFormcodigo: TStringField
      FieldName = 'codigo'
      Size = 30
    end
    object mtParametrosFormdescripcion: TStringField
      FieldName = 'descripcion'
      Size = 50
    end
    object mtParametrosFormvalor_cadena: TStringField
      FieldName = 'valor_cadena'
      Size = 100
    end
    object mtParametrosFormvalor_entero: TIntegerField
      FieldName = 'valor_entero'
    end
    object mtParametrosFormvalor_fecha: TStringField
      FieldName = 'valor_fecha'
      Size = 10
    end
    object mtParametrosFormvalor_float: TFloatField
      FieldName = 'valor_float'
    end
    object mtParametrosFormvalor_boolean: TBooleanField
      FieldName = 'valor_boolean'
    end
  end
  object TDet: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'cod_det'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'des_det'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'metodo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'tipo_res'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'activo'
        DataType = ftBoolean
      end
      item
        Name = 'key'
        DataType = ftInteger
      end
      item
        Name = 'oid_lab'
        DataType = ftInteger
      end>
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
    Left = 576
    Top = 216
    object TDetoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object TDetcod_det: TStringField
      Tag = 1
      FieldName = 'cod_det'
    end
    object TDetdes_det: TStringField
      Tag = 1
      FieldName = 'des_det'
      Size = 60
    end
    object TDetmetodo: TStringField
      Tag = 1
      FieldName = 'metodo'
      Size = 40
    end
    object TDettipo_res: TStringField
      Tag = 1
      FieldName = 'tipo_res'
    end
    object TDetactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TDetkey: TIntegerField
      FieldName = 'key'
    end
    object TDetoid_lab: TIntegerField
      Tag = 1
      FieldName = 'oid_lab'
    end
  end
  object TVal: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'oid_carac'
        DataType = ftInteger
      end
      item
        Name = 'valor_desde'
        DataType = ftFloat
      end
      item
        Name = 'valor_hasta'
        DataType = ftFloat
      end
      item
        Name = 'cod_tabla'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'des_tabla'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'oid_tabla'
        DataType = ftInteger
      end
      item
        Name = 'limite_inf'
        DataType = ftFloat
      end
      item
        Name = 'limite_sup'
        DataType = ftFloat
      end
      item
        Name = 'key'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_det'
    IndexDefs = <
      item
        Name = 'TValIndex1'
        Fields = 'oid_det'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_det'
    MasterSource = DSDet
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = TValNewRecord
    Left = 576
    Top = 272
    object TValoid_det: TIntegerField
      FieldName = 'oid_det'
    end
    object TValoid_carac: TIntegerField
      Tag = 1
      FieldName = 'oid_carac'
    end
    object TValvalor_desde: TFloatField
      Tag = 1
      FieldName = 'valor_desde'
    end
    object TValvalor_hasta: TFloatField
      Tag = 1
      FieldName = 'valor_hasta'
    end
    object TValcod_tabla: TStringField
      Tag = 1
      FieldName = 'cod_tabla'
      Size = 10
    end
    object TValdes_tabla: TStringField
      Tag = 1
      FieldName = 'des_tabla'
      Size = 30
    end
    object TValoid_tabla: TIntegerField
      Tag = 1
      FieldName = 'oid_tabla'
    end
    object TVallimite_inf: TFloatField
      Tag = 1
      FieldName = 'limite_inf'
    end
    object TVallimite_sup: TFloatField
      Tag = 1
      FieldName = 'limite_sup'
    end
    object TValkey: TIntegerField
      FieldName = 'key'
    end
  end
  object DSDet: TDataSource
    DataSet = TDet
    Left = 624
    Top = 216
  end
  object DSVal: TDataSource
    DataSet = TVal
    Left = 624
    Top = 272
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
  object valDeter: TjktValidador
    Entidad = 'determinacion'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 40
    Top = 200
  end
  object valTabla: TjktValidador
    Validacion = tExistente
    ListaAsignaciones = <>
    Left = 40
    Top = 256
  end
  object valLaboratorio: TjktValidador
    Entidad = 'laboratorio'
    Validacion = tExistente
    ListaAsignaciones = <
      item
        FieldName = 'oid'
        SourceName = 'oid'
        FieldTarget = TLabooid_lab
      end
      item
        FieldName = 'descripcion'
        SourceName = 'descripcion'
        FieldTarget = TLabodes_lab
      end>
    Left = 96
    Top = 128
  end
  object TLabo: TjktMemTable
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
    Top = 136
    object TLabooid_lab: TIntegerField
      FieldName = 'oid_lab'
    end
    object TLabodes_lab: TStringField
      FieldName = 'des_lab'
      Size = 30
    end
  end
  object operTraerCarac: TjktOperacion
    OperName = 'TraerCaracRangoDetLab'
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 24
    Top = 96
  end
  object TCarac: TjktMemTable
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
    Left = 96
    Top = 88
    object TCaracoid_carac: TIntegerField
      FieldName = 'oid_carac'
    end
    object TCaraccod_carac: TStringField
      FieldName = 'cod_carac'
    end
    object TCaracdes_carac: TStringField
      FieldName = 'des_carac'
      Size = 60
    end
  end
  object operParam: TjktOperacion
    OperName = 'TraerParametro'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'nombreParametro'
        Field = mtParametroInicialEntidad
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 152
    Top = 376
  end
end
