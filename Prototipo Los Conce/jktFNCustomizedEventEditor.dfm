inherited EventEditorCustomized: TEventEditorCustomized
  Caption = 'EventEditorCustomized'
  ClientHeight = 452
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Top = 414
  end
  inherited pnlTime: TPanel
    Height = 86
    ExplicitLeft = 40
    ExplicitHeight = 86
    object lbDuracion: TcxLabel
      Left = 16
      Top = 66
      Caption = 'Duraci'#243'n (d'#237'as):'
      FocusControl = cxSpinEdit1
      Style.TransparentBorder = False
      Transparent = True
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 96
      Top = 62
      Properties.AssignedValues.EditFormat = True
      Properties.AssignedValues.MaxValue = True
      Properties.AssignedValues.MinValue = True
      Properties.OnChange = seTaskCompleteChange
      Properties.OnEditValueChanged = seTaskCompleteChange
      Properties.ZeroIncrement = True
      Properties.ZeroLargeIncrement = True
      TabOrder = 8
      Width = 49
    end
  end
  inherited pnlRecurrenceInfo: TPanel
    Top = 225
  end
  inherited pnlPlaceHolder: TPanel
    Top = 308
  end
  inherited pnlMessage: TPanel
    Top = 351
    Height = 63
    inherited Bevel1: TdxBevel
      Top = 55
    end
    inherited meMessage: TcxMemo
      Height = 25
    end
  end
  inherited pnlResource: TPanel
    Top = 265
  end
  inherited pnlTaskComplete: TPanel
    Top = 185
  end
end
