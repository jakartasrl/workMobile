inherited EventEditorCustomized: TEventEditorCustomized
  Caption = 'EventEditorCustomized'
  ClientHeight = 452
  OnShow = FormShow
  ExplicitWidth = 466
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Top = 414
    ExplicitTop = 414
  end
  inherited pnlTime: TPanel
    Height = 86
    ExplicitHeight = 86
    inherited cbAllDayEvent: TcxCheckBox
      Left = 311
      ExplicitLeft = 311
      ExplicitWidth = 129
      ExplicitHeight = 21
      Width = 129
    end
    object lbDuracion: TcxLabel
      Left = 16
      Top = 66
      Caption = 'Duraci'#243'n (d'#237'as):'
      FocusControl = seDuracion
      Style.TransparentBorder = False
      Transparent = True
    end
    object seDuracion: TcxSpinEdit
      Left = 96
      Top = 62
      Properties.AssignedValues.EditFormat = True
      Properties.MaxValue = 365.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = seDuracionPropertiesChange
      Properties.ZeroLargeIncrement = True
      TabOrder = 8
      Value = 1
      Width = 49
    end
  end
  inherited pnlRecurrenceInfo: TPanel
    Top = 225
    ExplicitTop = 225
  end
  inherited pnlPlaceHolder: TPanel
    Top = 308
    ExplicitTop = 308
    inherited pnlReminder: TPanel
      inherited cbReminder: TcxCheckBox
        Left = 10
        ExplicitLeft = 10
        ExplicitWidth = 85
        ExplicitHeight = 21
        Width = 85
      end
    end
  end
  inherited pnlMessage: TPanel
    Top = 351
    Height = 63
    ExplicitTop = 351
    ExplicitHeight = 63
    inherited Bevel1: TdxBevel
      Top = 55
      ExplicitTop = 55
    end
    inherited meMessage: TcxMemo
      ExplicitHeight = 25
      Height = 25
    end
  end
  inherited pnlResource: TPanel
    Top = 265
    ExplicitTop = 265
  end
  inherited pnlTaskComplete: TPanel
    Top = 185
    ExplicitTop = 185
    inherited lbTaskStatus: TcxLabel
      Left = 223
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 223
      ExplicitWidth = 95
      ExplicitHeight = 21
      Height = 21
      Width = 95
      AnchorX = 318
    end
  end
end
