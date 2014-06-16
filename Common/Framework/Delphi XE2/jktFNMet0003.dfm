object FMet003: TFMet003
  Left = 505
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ayuda'
  ClientHeight = 464
  ClientWidth = 524
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 435
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 0
    object dbgHelp: TjktExpDBGrid
      Left = 10
      Top = 10
      Width = 504
      Height = 415
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      LookAndFeel.SkinName = ''
      DataSource = dsHelp
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
  object Panel3: TPanel
    Left = 0
    Top = 435
    Width = 524
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnAceptar: TButton
      Left = 352
      Top = 0
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 440
      Top = 0
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object Button1: TButton
      Left = 264
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 2
      OnClick = Button1Click
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
