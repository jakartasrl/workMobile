inherited frmHomePhotosBase: TfrmHomePhotosBase
  Width = 746
  Height = 450
  ExplicitWidth = 746
  ExplicitHeight = 450
  object tcHomePhotos: TdxTileControl
    Left = 0
    Top = 0
    Width = 249
    Height = 450
    Align = alLeft
    AutoSize = True
    BorderStyle = cxcbsDefault
    LookAndFeel.NativeStyle = False
    OptionsBehavior.ItemCheckMode = tcicmNone
    OptionsBehavior.ItemMoving = False
    OptionsView.IndentHorz = 8
    OptionsView.IndentVert = 8
    OptionsView.ItemSize = 170
    OptionsView.GroupLayout = glVertical
    OptionsView.GroupMaxRowCount = 1024
    TabOrder = 0
    object tcHomePhotosdxTileControlGroup1: TdxTileControlGroup
      Index = 0
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 0
    Width = 4
    Height = 450
    Control = tcHomePhotos
    OnBeforeClose = cxSplitter1BeforeClose
  end
end
