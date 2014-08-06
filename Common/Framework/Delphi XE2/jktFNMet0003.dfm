object FMet003: TFMet003
  Left = 505
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ayuda'
  ClientHeight = 472
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    TabOrder = 0
    ExplicitTop = -1
    Height = 63
    Width = 523
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 63
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 388
    ExplicitTop = 8
    ExplicitWidth = 375
    ExplicitHeight = 303
    Height = 353
    Width = 523
    object dbgHelp: TjktExpDBGrid
      Left = 2
      Top = 5
      Width = 519
      Height = 346
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = ''
      DataSource = dsHelp
      ExplicitWidth = 371
      ExplicitHeight = 296
      object dbgHelpDBTableView1: TcxGridDBTableView
        PopupMenu = popSeleccion
        OnDblClick = dbgHelpDblClick
        OnKeyDown = dbgHelpKeyDown
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsHelp
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        FilterRow.SeparatorWidth = 2
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.FocusCellOnTab = True
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.MaxLineCount = 2
        object dbgHelpSeleccionar: TcxGridDBColumn
          Caption = 'Sel.'
          DataBinding.FieldName = 'seleccionado'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'False'
          Options.Filtering = False
          Width = 47
        end
        object dbgHelpDescripcion: TcxGridDBColumn
          Caption = 'Descripci'#243'n'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 326
        end
        object dbgHelpCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 128
        end
        object dbgHelSelec: TcxGridDBColumn
          Caption = 'Seleccion'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'False'
          Visible = False
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Options.Filtering = False
          Width = 73
        end
      end
      object dbgHelpLevel1: TcxGridLevel
        GridView = dbgHelpDBTableView1
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 416
    Align = alBottom
    TabOrder = 2
    Height = 56
    Width = 523
    object btnAceptar: TButton
      Left = 349
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 430
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dsHelp: TDataSource
    Left = 128
    Top = 72
  end
  object popSeleccion: TPopupMenu
    OnPopup = popSeleccionPopup
    Left = 184
    Top = 72
    object MISeleccionar: TMenuItem
      Caption = 'Seleccionar'
      OnClick = MISeleccionarClick
    end
    object MISeleccionarTodos: TMenuItem
      Caption = 'Seleccionar Todos'
      OnClick = MISeleccionarTodosClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MIInvertirSeleccion: TMenuItem
      Caption = 'Invertir Seleccion'
      OnClick = MIInvertirSeleccionClick
    end
    object MIAnularSeleccion: TMenuItem
      Caption = 'Anular Seleccion'
      OnClick = MIAnularSeleccionClick
    end
  end
end
