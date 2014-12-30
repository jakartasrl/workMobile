object FNVen0008: TFNVen0008
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tipos de cambio'
  ClientHeight = 123
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object jktExpDBGrid1: TjktExpDBGrid
    Left = 0
    Top = 0
    Width = 314
    Height = 123
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 0
    ExplicitHeight = 163
    object dbgDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object dbgDBTableViewoid_moneda: TcxGridDBColumn
        DataBinding.FieldName = 'oid_moneda'
        Visible = False
      end
      object dbgDBTableViewcod_moneda: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'cod_moneda'
        Options.Editing = False
        Width = 70
      end
      object dbgDBTableViewdes_moneda: TcxGridDBColumn
        Caption = 'Moneda'
        DataBinding.FieldName = 'des_moneda'
        Options.Editing = False
        Width = 180
      end
      object dbgDBTableViewcotizacion: TcxGridDBColumn
        Caption = 'Cotizaci'#243'n'
        DataBinding.FieldName = 'cotizacion'
      end
    end
    object jktExpDBGrid1Level1: TcxGridLevel
      GridView = dbgDBTableView
    end
  end
end
