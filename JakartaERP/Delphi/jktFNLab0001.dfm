inherited FNLab0001: TFNLab0001
  Caption = 'ABM de Determinaciones'
  ClientHeight = 499
  ClientWidth = 1250
  ExplicitWidth = 1266
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBoxLeft: TcxGroupBox
    ExplicitHeight = 499
    Height = 499
  end
  inherited cxSplitterLeft: TcxSplitter
    Height = 499
    ExplicitHeight = 499
  end
  inherited cxGroupBoxRight: TcxGroupBox
    Left = 1104
    ExplicitLeft = 1104
    ExplicitWidth = 146
    ExplicitHeight = 499
    Height = 499
    Width = 146
  end
  inherited cxSplitterRight: TcxSplitter
    Left = 1100
    Height = 499
    ExplicitLeft = 1100
    ExplicitHeight = 499
  end
  inherited cxGroupBoxMain: TcxGroupBox
    TabOrder = 7
    ExplicitWidth = 1066
    ExplicitHeight = 499
    Height = 499
    Width = 1066
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = 'Determinacion'
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = False
      Style.TextStyle = [fsItalic]
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 92
      Width = 1062
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 268
        Top = 25
        DataBinding.DataField = 'des_det'
        DataBinding.DataSource = DSDet
        TabOrder = 1
        Width = 571
      end
      object cxLabel2: TcxLabel
        Left = 29
        Top = 54
        Caption = 'Tipo Resultado'
      end
      object cxLabel3: TcxLabel
        Left = 413
        Top = 54
        Caption = 'Formato'
      end
      object cxLabel4: TcxLabel
        Left = 551
        Top = 54
        Caption = 'Leyenda Valor Cero'
      end
      object cxDBComboBox2: TcxDBComboBox
        Left = 463
        Top = 52
        DataBinding.DataField = 'formato'
        DataBinding.DataSource = DSDet
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '0'
          '0.0'
          '0.00'
          '0.000'
          '0.0000'
          '0E-000')
        TabOrder = 4
        Width = 82
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 655
        Top = 52
        DataBinding.DataField = 'ley_cero'
        DataBinding.DataSource = DSDet
        TabOrder = 5
        Width = 186
      end
      object cxLabel1: TcxLabel
        Left = 29
        Top = 26
        Caption = 'Codigo'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 129
        Top = 25
        DataBinding.DataField = 'cod_det'
        DataBinding.DataSource = DSDet
        TabOrder = 0
        Width = 121
      end
      object cxDBComboBox1: TcxDBComboBox
        Left = 129
        Top = 52
        DataBinding.DataField = 'tipo_res'
        DataBinding.DataSource = DSDet
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Numero'
          'Boolean'
          'Leyenda')
        TabOrder = 2
        Width = 121
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 268
        Top = 52
        Caption = 'Calcula Resultado'
        DataBinding.DataField = 'calc_res'
        DataBinding.DataSource = DSDet
        Properties.Alignment = taRightJustify
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 3
        Width = 121
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 94
      Align = alClient
      PanelStyle.Active = True
      Style.TextStyle = [fsItalic]
      TabOrder = 1
      Height = 403
      Width = 1062
      object cxGroupBox3: TcxGroupBox
        Left = 2
        Top = 202
        Align = alClient
        PanelStyle.Active = True
        TabOrder = 0
        Height = 199
        Width = 1058
        object cxSplitter1: TcxSplitter
          Left = 2
          Top = 2
          Width = 4
          Height = 195
        end
        object cxGroupBox5: TcxGroupBox
          Left = 6
          Top = 2
          Align = alClient
          Caption = 'Valores Esperados'
          Style.TextStyle = [fsItalic]
          TabOrder = 1
          Height = 195
          Width = 1050
          object cxGrid2: TcxGrid
            Left = 3
            Top = 15
            Width = 1044
            Height = 170
            Align = alClient
            TabOrder = 0
            object cxGrid2DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = DSVal
              DataController.KeyFieldNames = 'oid_val'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.Appending = True
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsView.GroupByBox = False
              object cxGrid2DBTableView1valor_desde: TcxGridDBColumn
                DataBinding.FieldName = 'Desde'
                HeaderAlignmentHorz = taCenter
              end
              object cxGrid2DBTableView1valor_hasta: TcxGridDBColumn
                Caption = 'Hasta'
                DataBinding.FieldName = 'valor_hasta'
                HeaderAlignmentHorz = taCenter
              end
              object cxGrid2DBTableView1limite: TcxGridDBColumn
                Caption = 'Valor Esperado'
                DataBinding.FieldName = 'limite'
                HeaderAlignmentHorz = taCenter
              end
            end
            object cxGrid2DBBandedTableView1: TcxGridDBBandedTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = DSVal
              DataController.KeyFieldNames = 'key'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Appending = True
              OptionsView.GroupByBox = False
              Bands = <
                item
                  Caption = 'Cambia al abrir'
                end
                item
                end>
              object cxGrid2DBBandedTableView1valor_desde: TcxGridDBBandedColumn
                Caption = 'Desde'
                DataBinding.FieldName = 'valor_desde'
                HeaderAlignmentHorz = taCenter
                Width = 86
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGrid2DBBandedTableView1valor_hasta: TcxGridDBBandedColumn
                Caption = 'Hasta'
                DataBinding.FieldName = 'valor_hasta'
                HeaderAlignmentHorz = taCenter
                Width = 78
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGrid2DBBandedTableView1limite: TcxGridDBBandedColumn
                Caption = 'Valor Esperado'
                DataBinding.FieldName = 'limite'
                HeaderAlignmentHorz = taCenter
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
            end
            object cxGrid2Level1: TcxGridLevel
              GridView = cxGrid2DBBandedTableView1
            end
          end
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 2
        Top = 2
        Align = alTop
        PanelStyle.Active = True
        TabOrder = 1
        Height = 200
        Width = 1058
        object cxGroupBox7: TcxGroupBox
          Left = 2
          Top = 2
          Align = alLeft
          Caption = 'Metodos'
          Style.TextStyle = [fsItalic]
          TabOrder = 0
          Height = 196
          Width = 631
          object jktExpDBGrid1: TjktExpDBGrid
            Left = 3
            Top = 15
            Width = 625
            Height = 171
            Align = alClient
            TabOrder = 0
            DataSource = DSMet
            ExplicitTop = 14
            object jktExpDBGrid1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = DSMet
              DataController.KeyFieldNames = 'key'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Appending = True
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsView.GroupByBox = False
              object jktExpDBGrid1DBTableView1metodo: TcxGridDBColumn
                Caption = 'Metodo'
                DataBinding.FieldName = 'metodo'
                HeaderAlignmentHorz = taCenter
                Width = 206
              end
              object jktExpDBGrid1DBTableView1expresion: TcxGridDBColumn
                Caption = 'Calculo Resultado'
                DataBinding.FieldName = 'expresion'
                HeaderAlignmentHorz = taCenter
              end
            end
            object jktExpDBGrid1Level1: TcxGridLevel
              GridView = jktExpDBGrid1DBTableView1
            end
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 633
          Top = 2
          Width = 8
          Height = 196
          Control = cxGroupBox7
        end
        object cxGroupBox4: TcxGroupBox
          Left = 641
          Top = 2
          Align = alClient
          Caption = 'Variables / Mediciones '
          Style.TextStyle = [fsItalic]
          TabOrder = 2
          Height = 196
          Width = 415
          object cxGrid1: TcxGrid
            Left = 3
            Top = 15
            Width = 409
            Height = 171
            Align = alClient
            TabOrder = 0
            object cxGrid1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = DSVar
              DataController.KeyFieldNames = 'key'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Appending = True
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsView.GroupByBox = False
              object cxGrid1DBTableView1cod_var: TcxGridDBColumn
                Caption = 'Codigo'
                DataBinding.FieldName = 'cod_var'
                HeaderAlignmentHorz = taCenter
              end
              object cxGrid1DBTableView1des_var: TcxGridDBColumn
                Caption = 'Descripcion'
                DataBinding.FieldName = 'des_var'
                HeaderAlignmentHorz = taCenter
                Width = 223
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
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
  inherited Driver: TjktDriver
    DataSetCab = TDet
    TipoPrograma = tp_abmIndividual
    Filtro = hlpDeter
    FocoEnAlta = TDetcod_det
    FocoEnModificacion = TDetdes_det
    Left = 120
    Top = 200
  end
  inherited IdHTTP: TIdHTTP
    Left = 96
    Top = 248
  end
  inherited Service: TjktServiceCaller
    Left = 160
    Top = 240
  end
  inherited OperacionSave: TjktOperacion
    OperName = 'SaveDeterminaciones'
    Atributos = <
      item
        Dataset = TDet
        Tag = 0
      end
      item
        Dataset = TMet
        Tag = 0
      end
      item
        Dataset = TVal
        Tag = 0
      end
      item
        Dataset = TVar
        Tag = 0
      end>
    Left = 104
    Top = 344
  end
  inherited mtParametroInicial: TjktMemTable
    Left = 1168
    Top = 192
  end
  inherited OperacionTraer: TjktOperacion
    OperName = 'TraerDeterminaciones'
    Atributos = <
      item
        Attribute = 'oid'
        Field = TDetoid_det
        Tag = 0
      end>
    Left = 40
    Top = 368
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = TDetcod_det
        ValidadorNew = valDeter
      end
      item
        Field = TMetexpresion
        ValidadorGral = valExpresion
      end>
    Left = 176
  end
  inherited mtParametrosForm: TjktMemTable
    Left = 1152
    Top = 120
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
        Name = 'tipo_res'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'activo'
        DataType = ftBoolean
      end
      item
        Name = 'oid_lab'
        DataType = ftInteger
      end
      item
        Name = 'calc_res'
        DataType = ftBoolean
      end
      item
        Name = 'formato'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ley_cero'
        DataType = ftString
        Size = 30
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
    OnNewRecord = TDetNewRecord
    Left = 280
    Top = 72
    object TDetoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object TDetcod_det: TStringField
      Tag = 2
      FieldName = 'cod_det'
    end
    object TDetdes_det: TStringField
      Tag = 1
      FieldName = 'des_det'
      Size = 60
    end
    object TDettipo_res: TStringField
      Tag = 1
      FieldName = 'tipo_res'
    end
    object TDetactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TDetoid_lab: TIntegerField
      Tag = 1
      FieldName = 'oid_lab'
    end
    object TDetcalc_res: TBooleanField
      Tag = 1
      FieldName = 'calc_res'
    end
    object TDetformato: TStringField
      Tag = 1
      FieldName = 'formato'
      Size = 10
    end
    object TDetley_cero: TStringField
      Tag = 1
      FieldName = 'ley_cero'
      Size = 30
    end
  end
  object TVal: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
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
        Name = 'limite'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'oid_val'
        DataType = ftInteger
      end
      item
        Name = 'oid_met'
        DataType = ftInteger
      end
      item
        Name = 'activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_met'
    IndexDefs = <
      item
        Name = 'TValIndex1'
        Fields = 'oid_met'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'oid_met'
    MasterSource = DSMet
    Version = '7.12.10 CodeGear Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnNewRecord = TValNewRecord
    Left = 240
    Top = 320
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
    object TVallimite: TStringField
      Tag = 1
      FieldName = 'limite'
      Size = 30
    end
    object TValoid_val: TIntegerField
      Tag = 1
      FieldName = 'oid_val'
    end
    object TValoid_met: TIntegerField
      Tag = 1
      FieldName = 'oid_met'
    end
    object TValactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TValkey: TIntegerField
      FieldName = 'key'
    end
  end
  object DSDet: TDataSource
    DataSet = TDet
    Left = 240
    Top = 72
  end
  object DSVal: TDataSource
    DataSet = TVal
    Left = 280
    Top = 320
  end
  object valDeter: TjktValidador
    Entidad = 'determinacion'
    Validacion = tInexistente
    ListaAsignaciones = <>
    Left = 16
    Top = 232
  end
  object valTabla: TjktValidador
    Validacion = tExistente
    ListaAsignaciones = <>
    Left = 32
    Top = 320
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
    Top = 144
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
    Left = 144
    Top = 408
  end
  object TMet: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_det'
        DataType = ftInteger
      end
      item
        Name = 'oid_met'
        DataType = ftInteger
      end
      item
        Name = 'metodo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'expresion'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'activo'
        DataType = ftBoolean
      end>
    IndexFieldNames = 'oid_det'
    IndexDefs = <
      item
        Name = 'TMetIndex1'
        Fields = 'oid_det'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
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
    OnNewRecord = TMetNewRecord
    Left = 512
    Top = 152
    object TMetoid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
    object TMetoid_met: TIntegerField
      Tag = 1
      FieldName = 'oid_met'
    end
    object TMetmetodo: TStringField
      Tag = 1
      FieldName = 'metodo'
      Size = 30
    end
    object TMetexpresion: TStringField
      Tag = 1
      FieldName = 'expresion'
      Size = 60
    end
    object TMetactivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TMetkey: TIntegerField
      FieldName = 'key'
    end
  end
  object DSMet: TDataSource
    DataSet = TMet
    Left = 480
    Top = 144
  end
  object TVar: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid_var'
        DataType = ftInteger
      end
      item
        Name = 'cod_var'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'des_var'
        DataType = ftString
        Size = 30
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
        Name = 'oid_det'
        DataType = ftInteger
      end>
    IndexFieldNames = 'oid_det'
    IndexDefs = <
      item
        Name = 'TVarIndex1'
        Fields = 'oid_det'
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
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
    OnNewRecord = TVarNewRecord
    Left = 744
    Top = 232
    object TVaroid_var: TIntegerField
      Tag = 1
      FieldName = 'oid_var'
    end
    object TVarcod_var: TStringField
      Tag = 1
      FieldName = 'cod_var'
      Size = 10
    end
    object TVardes_var: TStringField
      Tag = 1
      FieldName = 'des_var'
      Size = 30
    end
    object TVaractivo: TBooleanField
      Tag = 1
      FieldName = 'activo'
    end
    object TVarkey: TIntegerField
      FieldName = 'key'
    end
    object TVaroid_det: TIntegerField
      Tag = 1
      FieldName = 'oid_det'
    end
  end
  object DSVar: TDataSource
    DataSet = TVar
    Left = 696
    Top = 232
  end
  object hlpDeter: TjktHelpGenerico
    ServiceCaller = Service
    Entidad = 'determinacion'
    EntidadMaestra = 'laboratorio'
    OidEntidadMaestra = TLabooid_lab
    OidRespuesta = TDetoid_det
    CodigoRespuesta = TDetcod_det
    Left = 664
    Top = 144
  end
  object valExpresion: TjktValidador
    Validacion = tEspecial
    ListaAsignaciones = <>
    OperacionEspecial = operExpresion
    Left = 520
    Top = 376
  end
  object jktOperacion1: TjktOperacion
    EnviarTodo = False
    Atributos = <>
    ServiceCaller = Service
    Left = 544
    Top = 80
  end
  object operExpresion: TjktOperacion
    OperName = 'ValidarExpresion'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'expresion'
        Field = TMetexpresion
        Tag = 0
      end>
    ServiceCaller = Service
    OnAfterEjecutar = operExpresionAfterEjecutar
    Left = 592
    Top = 376
  end
  object jktMemTable1: TjktMemTable
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
    Left = 696
    Top = 64
  end
  object TVariWrk: TjktMemTable
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
    Left = 712
    Top = 360
    object TVariWrkcodigo: TStringField
      FieldName = 'codigo'
    end
  end
end
