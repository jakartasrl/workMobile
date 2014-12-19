inherited FNHlp0001: TFNHlp0001
  Caption = #205'tems de presupuesto'
  ClientHeight = 479
  ClientWidth = 835
  ExplicitLeft = -48
  ExplicitWidth = 841
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbFiltroAvanzado: TcxGroupBox
    ExplicitWidth = 828
    ExplicitHeight = 89
    Height = 89
    Width = 835
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 94
    ExplicitTop = 94
    ExplicitWidth = 828
    ExplicitHeight = 329
    Height = 329
    Width = 835
    inherited dbgHelp: TjktExpDBGrid
      Width = 831
      Height = 325
      ExplicitWidth = 824
      ExplicitHeight = 325
      inherited dbgHelpDBTableView: TcxGridDBTableView
        FilterRow.SeparatorWidth = 3
        OptionsView.CellAutoHeight = False
        OptionsView.DataRowHeight = 50
        OptionsView.GroupByBox = True
        OptionsView.GroupFooters = gfInvisible
        object dbgHelpDBTableViewseleccionado: TcxGridDBColumn
          Caption = 'Selec.'
          DataBinding.FieldName = 'seleccionado'
          Visible = False
          Width = 40
        end
        object dbgHelpDBTableViewnro_cotiz: TcxGridDBColumn
          Caption = 'Presupuesto'
          DataBinding.FieldName = 'nro_cotiz'
          Visible = False
          GroupIndex = 0
          Width = 70
        end
        object dbgHelpDBTableViewdes_estado: TcxGridDBColumn
          Caption = 'Estado'
          DataBinding.FieldName = 'des_estado'
          Visible = False
          GroupIndex = 1
        end
        object dbgHelpDBTableViewfecha: TcxGridDBColumn
          Caption = 'Fecha'
          DataBinding.FieldName = 'fecha'
          Width = 72
        end
        object dbgHelpDBTableViewdescripcion: TcxGridDBColumn
          Caption = 'Cliente / Sucursal'
          DataBinding.FieldName = 'descripcion'
          Width = 180
        end
        object dbgHelpDBTableViewnro_item: TcxGridDBColumn
          Caption = 'Nro '#237'tem'
          DataBinding.FieldName = 'nro_item'
          Width = 50
        end
        object dbgHelpDBTableViewdetalle: TcxGridDBColumn
          Caption = 'Descripci'#243'n del '#237'tem'
          DataBinding.FieldName = 'detalle'
          PropertiesClassName = 'TcxMemoProperties'
          Properties.ScrollBars = ssVertical
          Styles.Content = cxStyle1
          Width = 250
        end
        object dbgHelpDBTableViewcant: TcxGridDBColumn
          Caption = 'Cantidad'
          DataBinding.FieldName = 'cant'
        end
        object dbgHelpDBTableViewdes_vend: TcxGridDBColumn
          Caption = 'Vendedor'
          DataBinding.FieldName = 'des_vend'
          Width = 170
        end
        object dbgHelpDBTableViewoid: TcxGridDBColumn
          DataBinding.FieldName = 'oid'
          Visible = False
        end
        object dbgHelpDBTableViewcodigo: TcxGridDBColumn
          DataBinding.FieldName = 'codigo'
          Visible = False
        end
      end
    end
  end
  inherited cxGroupBox3: TcxGroupBox
    Top = 423
    ExplicitTop = 423
    ExplicitWidth = 828
    Width = 835
    inherited btnAceptar: TButton
      Left = 667
      ExplicitLeft = 660
    end
    inherited btnCancelar: TButton
      Left = 748
      ExplicitLeft = 741
    end
  end
  inherited cxSplitter: TcxSplitter
    Top = 89
    Width = 835
    ExplicitTop = 89
    ExplicitWidth = 828
  end
  inherited popSeleccion: TPopupMenu
    Left = 168
    Top = 280
  end
  inherited mtInput: TjktMemTable
    object mtInputnro_cotiz: TStringField
      FieldName = 'nro_cotiz'
      Size = 30
    end
    object mtInputfecha: TDateTimeField
      FieldName = 'fecha'
    end
    object mtInputdes_estado: TStringField
      FieldName = 'des_estado'
      Size = 40
    end
    object mtInputdes_vend: TStringField
      FieldName = 'des_vend'
      Size = 40
    end
    object mtInputnro_item: TIntegerField
      FieldName = 'nro_item'
    end
    object mtInputcant: TFloatField
      FieldName = 'cant'
    end
    object mtInputdetalle: TMemoField
      FieldName = 'detalle'
      BlobType = ftMemo
    end
  end
  inherited opFiltro: TjktOperacion
    OperName = 'HelpTraerItemsDePresupuesto'
    Left = 168
    Top = 216
  end
  inherited Service: TjktServiceCaller
    Left = 136
    Top = 24
  end
  inherited IdHTTP: TIdHTTP
    Left = 184
    Top = 24
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 416
    Top = 24
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15790320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
