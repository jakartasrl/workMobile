object Form2: TForm2
  Left = 311
  Top = 146
  Caption = 'Form2'
  ClientHeight = 537
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object jktDBLeyenda1: TjktDBLeyenda
    Left = 8
    Top = 240
    Width = 190
    Height = 49
    Caption = 'jktDBLeyenda1'
    ParentBackground = False
    TabOrder = 6
    Visible = False
    DataField = 'codigo'
    DataSource = DataSource1
    Leyendas = <
      item
        Valor = '012348'
        Leyenda = 'El codigo es 012348'
        Visible = True
        ColorFondo = clOlive
        ColorLetra = clRed
      end
      item
        Valor = '1'
        Leyenda = 'El codigo es 1 !!!'
        Visible = True
        ColorFondo = clBlack
        ColorLetra = clWhite
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Traer'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 295
    Width = 765
    Height = 242
    Align = alBottom
    TabOrder = 1
    object cxGrid1: TjktExpDBGrid
      Left = 1
      Top = 1
      Width = 763
      Height = 240
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Seven'
      DataSource = DataSource1
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSource1
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        FilterRow.SeparatorWidth = 2
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsCustomize.NestedBands = False
        OptionsData.Appending = True
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        Bands = <
          item
            Caption = 'UNO'
          end
          item
            Caption = 'DOS'
          end>
        object cxGrid1DBBandedTableView1oid1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'oid'
          PropertiesClassName = 'TcxMaskEditProperties'
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1codigo1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'codigo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1descripcion1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'descripcion'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 100
          Properties.ReadOnly = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1validar1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'validar'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'False'
          MinWidth = 16
          Options.Filtering = False
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1activo1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'activo'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'False'
          MinWidth = 16
          Options.Filtering = False
          Width = 100
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
    end
  end
  object Button2: TButton
    Left = 104
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 2
    OnClick = Button2Click
  end
  object cxDBButtonEdit1: TcxDBButtonEdit
    Left = 8
    Top = 125
    Properties.Buttons = <
      item
        Kind = bkEllipsis
      end>
    TabOrder = 3
    Width = 153
  end
  object jktFiltro2: TjktFiltro
    Left = 8
    Top = 161
    DataBinding.DataField = 'descripcion'
    DataBinding.DataSource = DataSource1
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ViewStyle = vsHideCursor
    TabOrder = 4
    PropertysHelp.Operacion = Oper
    PropertysHelp.OSName = 'TipoValor'
    PropertysHelp.Query = 21
    Width = 153
  end
  object Button3: TButton
    Left = 8
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Validador'
    TabOrder = 5
  end
  object jktdxButtonEdit1: TjktdxButtonEdit
    Left = 8
    Top = 200
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = jktdxButtonEdit1PropertiesButtonClick
    TabOrder = 7
    Width = 121
  end
  object jktDBTreeList1: TjktDBTreeList
    Left = 216
    Top = 8
    Width = 541
    Height = 281
    Bands = <>
    DataController.DataSource = DataSource1
    DataController.ParentField = 'descripcion'
    DataController.KeyField = 'codigo'
    Navigator.Buttons.CustomButtons = <>
    OptionsView.Bands = True
    OptionsView.Footer = True
    RootValue = -1
    TabOrder = 9
  end
  object Button4: TButton
    Left = 568
    Top = 187
    Width = 138
    Height = 48
    Caption = 'CrearColumn DBTreeList'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Driver: TjktDriver
    DataSetsActu = <>
    IgnoreTags = False
    UpdateHandler = False
    NoAutoEditarDataSets = False
    ConfirmarCancelacion = False
    Opciones = []
    TipoABM = abmLista
    ConFiltro = False
    Left = 512
    Top = 80
  end
  object Oper: TjktOperacion
    HTTP = IdHTTP1
    IgnoreException = False
    OnNuevoDataSet = OperNuevoDataSet
    Left = 552
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = mtTipoCtaProv
    Left = 112
    Top = 410
  end
  object mtTipoCtaProv: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'oid'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'descripcion'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'validar'
        DataType = ftBoolean
      end
      item
        Name = 'activo'
        DataType = ftBoolean
      end>
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
    Left = 168
    Top = 410
    object mtTipoCtaProvoid: TIntegerField
      Tag = 1
      FieldName = 'oid'
    end
    object mtTipoCtaProvcodigo: TStringField
      Tag = 1
      FieldName = 'codigo'
      OnValidate = mtTipoCtaProvcodigoValidate
      Size = 10
    end
    object mtTipoCtaProvdescripcion: TStringField
      Tag = 1
      DisplayWidth = 30
      FieldName = 'descripcion'
      Size = 100
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
    Left = 592
    Top = 80
  end
  object jktImportCSV1: TjktImportCSV
    Left = 272
    Top = 136
  end
  object Help1: TjktHelp
    AltaNuevos = False
    OSName = 'TipoValor'
    Query = 21
    RefreshDatos = True
    Operacion = Oper
    SeleccionMultiple = True
    Left = 328
    Top = 136
  end
  object jktValidador1: TjktValidador
    OSName = 'Cliente'
    Operacion = Oper
    AsignarToFieldDesc = mtTipoCtaProvdescripcion
    Left = 384
    Top = 136
  end
  object cxEditRepository1: TcxEditRepository
    Left = 552
    Top = 320
    object cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem
    end
  end
end
