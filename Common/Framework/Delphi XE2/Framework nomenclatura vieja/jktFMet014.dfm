object FMet014: TFMet014
  Left = 364
  Top = 155
  Caption = 'Importacion CSV'
  ClientHeight = 246
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GBImportCSV: TGroupBox
    Left = 0
    Top = 0
    Width = 564
    Height = 102
    Align = alTop
    Caption = ' Archivo a Exportar '
    TabOrder = 0
    object SBImportarCSV: TSpeedButton
      Left = 391
      Top = 44
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SBImportarCSVClick
    end
    object LTitFormato: TLabel
      Left = 19
      Top = 21
      Width = 41
      Height = 13
      Caption = 'Formato:'
    end
    object LFormato: TLabel
      Left = 65
      Top = 21
      Width = 47
      Height = 13
      Caption = '<formato>'
    end
    object LSeparador: TLabel
      Left = 19
      Top = 77
      Width = 85
      Height = 13
      Caption = 'Separador Campo'
    end
    object EPathArchivo: TEdit
      Left = 19
      Top = 44
      Width = 369
      Height = 21
      TabOrder = 0
    end
    object BImportar: TButton
      Left = 460
      Top = 60
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
      OnClick = BImportarClick
    end
    object ESeparador: TEdit
      Left = 114
      Top = 73
      Width = 26
      Height = 21
      MaxLength = 1
      TabOrder = 2
      Text = ','
    end
  end
  object PErrores: TPanel
    Left = 0
    Top = 102
    Width = 564
    Height = 144
    Align = alClient
    Caption = 'Errores'
    TabOrder = 1
    Visible = False
    object GBErrores: TGroupBox
      Left = 1
      Top = 1
      Width = 562
      Height = 142
      Align = alClient
      Caption = 'Errores'
      TabOrder = 0
      object DBGErrores: TjktExpDBGrid
        Left = 2
        Top = 15
        Width = 558
        Height = 125
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object DBGErroresDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DSErrores
          DataController.Filter.MaxValueListCount = 1000
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.FocusCellOnTab = True
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
        end
        object DBGErroresLevel1: TcxGridLevel
          GridView = DBGErroresDBTableView1
        end
      end
    end
  end
  object MTErrores: TjktMemTable
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
    Left = 113
    Top = 175
  end
  object OPImportCSV: TOpenDialog
    Left = 122
    Top = 9
  end
  object DSErrores: TDataSource
    DataSet = MTErrores
    Left = 169
    Top = 175
  end
end
