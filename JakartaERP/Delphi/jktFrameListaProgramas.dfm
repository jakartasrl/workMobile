object frameListaProgramas: TframeListaProgramas
  Left = 0
  Top = 0
  Width = 572
  Height = 360
  TabOrder = 0
  object tc_Programas: TdxTileControl
    Left = 0
    Top = 0
    Width = 572
    Height = 360
    OptionsBehavior.ItemMoving = False
    TabOrder = 0
    object tc_ProgramasGroup1: TdxTileControlGroup
      Index = 0
    end
  end
  object cds_Programas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 80
    object cds_ProgramascodItemMenu: TIntegerField
      FieldName = 'codItemMenu'
    end
    object cds_ProgramasdescItemMenu: TStringField
      FieldName = 'descItemMenu'
      Size = 30
    end
    object cds_ProgramascodItemPadre: TIntegerField
      FieldName = 'codItemPadre'
    end
    object cds_ProgramasesGrupo: TBooleanField
      FieldName = 'esGrupo'
    end
    object cds_ProgramasesItemDeGrupo: TBooleanField
      FieldName = 'esItemDeGrupo'
    end
  end
end
