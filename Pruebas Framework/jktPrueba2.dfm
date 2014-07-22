inherited prueba3: Tprueba3
  Caption = 'prueba3'
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid [0]
    Left = 0
    Top = 0
    Width = 635
    Height = 364
    Align = alClient
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited Driver: TjktDriver
    DataSetCab = tabla1
  end
  inherited OperacionSave: TjktOperacion
    Atributos = <
      item
        Dataset = tabla1
        Tag = 0
      end>
  end
  inherited ValidadorForm: TjktValidadorForm
    ListaValidaciones = <
      item
        Field = tabla1a
        Validador = jktValidador1
      end
      item
        Field = tabla1b
        Validador = jktValidador2
      end>
  end
  object tabla1: TjktMemTable
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
    Left = 72
    Top = 256
    object tabla1a: TIntegerField
      FieldName = 'a'
    end
    object tabla1b: TStringField
      FieldName = 'b'
    end
  end
  object DataSource1: TDataSource
    DataSet = tabla1
    Left = 136
    Top = 264
  end
  object jktValidador1: TjktValidador
    Validacion = tMayorCero
    ListaAsignaciones = <>
    Left = 448
    Top = 224
  end
  object jktValidador2: TjktValidador
    Validacion = tDistintoEspacio
    ListaAsignaciones = <>
    Left = 520
    Top = 232
  end
end
