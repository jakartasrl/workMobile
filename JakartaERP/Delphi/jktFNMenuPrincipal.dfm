object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  ClientHeight = 496
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    Style.Edges = [bBottom]
    TabOrder = 0
    Height = 73
    Width = 771
    object cxLabel1: TcxLabel
      Left = 20
      Top = 16
      Caption = 'Jakarta ERP'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clDefault
      Style.Font.Height = -27
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object gbx_Login: TcxGroupBox
      Left = 176
      Top = 20
      Align = alRight
      Ctl3D = True
      ParentCtl3D = False
      Style.BorderStyle = ebsNone
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      TabOrder = 1
      DesignSize = (
        594
        50)
      Height = 50
      Width = 594
      object cxLabel2: TcxLabel
        Left = 256
        Top = 3
        Anchors = [akRight, akBottom]
        Caption = 'Password'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 3
        Anchors = [akRight, akBottom]
        Caption = 'Usuario'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        Transparent = True
      end
      object txtPassword: TcxDBTextEdit
        Left = 344
        Top = 1
        Anchors = [akRight, akBottom]
        DataBinding.DataField = 'password'
        DataBinding.DataSource = dsLogin
        ParentFont = False
        Properties.EchoMode = eemPassword
        Properties.ValidateOnEnter = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        OnKeyDown = txtPasswordKeyDown
        Width = 160
      end
      object txtUsuario: TcxDBTextEdit
        Left = 80
        Top = 1
        Anchors = [akRight, akBottom]
        DataBinding.DataField = 'usuario'
        DataBinding.DataSource = dsLogin
        ParentFont = False
        Properties.ValidateOnEnter = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        OnKeyDown = txtPasswordKeyDown
        Width = 160
      end
      object cxButton1: TcxButton
        Left = 522
        Top = 1
        Width = 31
        Height = 31
        TabOrder = 4
      end
    end
  end
  object cxPageControl: TcxPageControl
    Left = 0
    Top = 73
    Width = 771
    Height = 423
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Properties.ActivePage = cxTabSheet3
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.Style = 11
    ClientRectBottom = 422
    ClientRectLeft = 1
    ClientRectRight = 770
    ClientRectTop = 1
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object dxTileControl: TdxTileControl
        Left = 0
        Top = 0
        Width = 769
        Height = 421
        OptionsBehavior.GroupMoving = True
        OptionsBehavior.ItemCheckMode = tcicmNone
        OptionsBehavior.ItemMoving = False
        OptionsBehavior.ScrollMode = smScrollButtons
        OptionsView.CenterContentHorz = True
        OptionsView.CenterContentVert = True
        OptionsView.ItemSize = 180
        TabOrder = 0
        object tcaExit: TdxTileControlActionBarItem
          Align = abiaRight
          Caption = 'Salir'
          Glyph.Data = {
            89504E470D0A1A0A0000000D494844520000007800000028080600000035EA3E
            25000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
            05B449444154785EED9C3D8F1C451445D70172B8B99D3A72EAC83F00E1C40112
            091242726822E7969C190224CB21728420F04F20222200C902814404C4184142
            6A3EB4BE67E6BED9EA99EAAEAA9EEE651BF591AE3C5BF5DEAB3B5DB33DDD55BD
            3E19C3D9D9D9A974477A283D975E482FA55716AF69A38F18624F9D3E3B8CE531
            577F2D6890DBD263E95BA91572C8BDED7293436D8F71D9FD7D27B542CE3CFE54
            F496F444E293157C2D3D95EE4918BF265DB5784D1B7DC4101B50835AB75CFE68
            A8E59ABF49C1CFD217D227D223E903E97D8BD7B4D1470CB10135E6F2F787742C
            D498C69F8A5C91EE4BDF4BF0BBF44CBA2BBDE1B022C43A875C6A0035A97DC561
            CD90EB1A3F48F0A7F4A5F4B1F49EF46EA58825875C6A0035A7F2F7A3047FFBDF
            63881AD41CEF4F89D7253E29C1E7D29BEE1E0D355C2B608CEBEEAE861CE7065F
            491F4AB9096C1135A8154CE56F2EDAFD29E186F429D9E217E98154FD1B5B825A
            AE496D60AC1BEE2E42AC73E057E933A9E537B6246A5193DA708CBFBFFCEF1C44
            ED7A7F0AE49317E6BE91DE76D7E450DB630063163F89C438167E92F804E72669
            0A519B31608CBF294EC925628CB23F05F09D11A7150EFC5BEE9A0DC6F058C0D8
            BDDF29F4390638F01F49B98999528C1193DCE2EF22263788B106FD61902F6DE0
            D439DB6FEE3E8CE531E1BE9B0FA06F1BB23975F26672133287182B4ED735FEE6
            3C2DF71163E6FDA9834BF9B85A7EE0E60B8331B7436F3C1CDC02D026C5D532DF
            8FB98998538C0978E8F31757CBFF257838BC8552639C5AB8C21DBCA052FF4DBF
            ACA694C3981E1B9EB879076DDBAECD156EE982EA66A6ADA4520E63C6D5F590BF
            CB40D79F1A58946001827BD4C15B21F5B340F08FF48E9B8A10EB9C476ECAA27E
            6EA1F08097DD8A0DAF251620B8472DDD0AEDFC256D25EDFC256D3931361EF0B2
            EF8F0588E2F7AE53C869C269357978C0CBF98A977E60090C9EB9298BFA390041
            D52413E3D8A034C92C86C06337A5FE5888C81DF8D0813F291797EAC09F948B0B
            E10172FE0671F80E371771F80E3797D8FAD30B16BE63EDF6EEA63183FA3885A5
            07020627993EC7A4F073EFE95A7DAC78019EF096FA63B52977D051AF3F29178F
            7AFD49B978840748FD55AD2DFB2D7670572F0EEBE0AE12783A25989D0A60BDB8
            F4DDDB77400E269936F7A5646353D4CF7771AC5DE32DFCB15E5CFAEEED1D533A
            2636151E62ED3AF55785DF6607771DE0EE0EEEAAE50E096C47C153D7184471C5
            89E3B5DB523A3143288E0D0AC05BF863532077C0F7553371353143C20BA4FEAA
            F1DBECE0AE1D6EEEE0AE161E92C49E23DC739D228A1D3A40BD7D4E2FA25876A1
            006FE18F9D9FDCC1CE69943F29572B27BC40EAAF09BFD50EEE9A6A72E139896C
            2C43D33EA3E27307EA5F2B6573F09C5685E2B92A05BC85BFD2C5CFBE9AFC49B9
            1A7D8A8BB9D45F337EBB451C3E861724C71EEF35D7AB4639B98398D23CB9A01C
            F693016FE18F3DDCDCC11E52953F29973B24BC40EA6F147ECBBD386C2C2F29C0
            232270D5359B501E0768FFB702686B9E5C501E0F0D403CC2026CD4E70E764983
            FEA45C4E497881D4DF68FCB60F70F731BC5A27389F53D2A226783D45E77387B4
            A853F47A91D53EC98BBAC85A6F93CEFB72B5725AD46DD2BAD0B1653F66488B5A
            E858972ACFE98B4DB5B8A5CA75B3A1CBC69F948B47CBDA6C70C2BA5D784EE962
            6E59DB85A01FD60D7FFB4BDA725AE6863FA8617D6427DF1E62CC653EB2036A5C
            1FBA1BD6B21FBA0375AC8FCDE6C558CB7E6C16D4B93EF87EA8FFCF83EFA080F5
            4F57CE45ED98DC31FE2E6292638C2A7F1B14B8FEF1D9B6669C968FF137E7E93A
            6A37F9DBA0043E8971BA01AE70D73F1FAD841CE7CECD287F1B94C8770A170E71
            75CD3DEAFA07E09590EB1A71753DC5293B6A50F3287F3B54845B003E29E9DE27
            EBC5EB7FE15001B55C93058863A1C6A4FE76A82893C6B25CAC0DB7400EB94DFB
            CE2D50DB635C767F556BD77B9033ABBF1D1A8405767651D82A633F944D6F7E33
            E311165ED3461F31C4AEFF4D91612C8F39B3BF9393D7327AE9E14E84147E0000
            000049454E44AE426082}
          GlyphFrameCount = 3
          Position = abipTopBar
          OnClick = tcaExitClick
        end
        object tcaBlackTheme: TdxTileControlActionBarItem
          Align = abiaRight
          Caption = 'Black Theme'
          OnClick = tcaChangeThemeClick
        end
        object tcaWhiteTheme: TdxTileControlActionBarItem
          Tag = 1
          Align = abiaRight
          Caption = 'White Theme'
          OnClick = tcaChangeThemeClick
        end
        object dxTileControlGroup3: TdxTileControlGroup
          Caption.Text = 'Mensajes Los Conce'
          Index = 0
        end
        object dxTileControlGroup2: TdxTileControlGroup
          Caption.Text = 'Mensajes Jakarta'
          Index = 1
        end
        object dxTileControlGroup1: TdxTileControlGroup
          Caption.Text = 'Acerca de ...'
          Index = 2
        end
        object tci_MsjsVarios: TdxTileControlItem
          GroupIndex = 2
          IndexInGroup = 0
          Style.BorderColor = 551798700
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clDefault
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.Gradient = gmVertical
          Style.GradientBeginColor = 551798700
          Style.GradientEndColor = 553316067
          Glyph.Align = oaBottomCenter
          Glyph.AlignWithText = itaTop
          Glyph.Image.Data = {
            89504E470D0A1A0A0000000D49484452000000500000005008060000008E11F2
            AD000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
            041C49444154785EE59801711B410C4503A11002A1100AA1100AA110CA20100A
            A1100A21100A2110DCD58C57B3F97E9795EE6CD9997D336F9AFEDC9E6C9DBC77
            CED3E9747A54BF365FCFDACF74CCDDC5F001FCD5542CA3632346A0755331BCA3
            7DEAB6D83B8D1168DD540CEF244DDD16D9698C40EBA66258EC6CEAB6C84C6304
            5A3715C3423353B745641A23D0BAA91816B877EAB6984D63045A3715C31BFBB3
            F9D68CF0F76C043BA79D9B6A46A0755331BC91CFCDBDCDC836DD6A8DB5238CC7
            87C5F006661A601FC7DE802F67ED67CBA21F7BBD0091BDB61F9B12C32B9A993A
            63BC21F47D52F7B7CC8D679CC6D9BEDBCF9F12C32B999DBA5993A8B911A2D3D8
            7F9F12C38366A7EEA5D9D7CE1AA38DB6B55166D3D8CF9912C303FE6846A7EE5F
            F35BB3AF8D4EAC4E949DC3CE15C1D6DA6BEC6BC769EC594A0C77681BFD9F6694
            DFCDF1E69099D8CE3851762E3B67147BADBD7E9FC6FE5E526298F47B333A7576
            9C1DDFD7662696D0893AF25A768961D0ECD48D573DBB76C691738F6BD3621830
            7BA5F74E49069DA8CC74EBDAB0187E60F6EA1ED9A7F66277E63E51D9FD353D8D
            186E989D9CBD77CA6B4077F828A969C450CC4ECEF8AC666B33CF6AD726F38CA9
            8C4F0A9B6238989D9CBDDF166EC97841CDAD6F22844EF2851836B3936385F6BE
            C82AF4E2660663DC57DF791134B353379EFC51A66E0B7B6DE34D2D3B2417D338
            FE277B42DB6C75A3CEDC64EE85BD46BDC1655EF7BB691C4F9299BAF176BFF7AB
            D8BDD147ACCCE3994FA32DCE4EDDDE87D54744DF4FF651EDC51645F72CBB627D
            EAB257ECD1193F51F66FF413F56A0B6C8C3FEABAFD6EDC33B257E9B3A0D338DB
            D3ED77CFFD60FB3C1347EE5A9F95F12661EF7DEB13EA7B6057BFEE8CCF4DD99B
            CC67471F59F4B9D6FF38D20FE8DAD717EBF8F850BCC2D46D61EFBDF7A13FE35A
            8F7A76D1407275A8272E86E2EA504F5C0CC5D5A19EB8188AAB433D7131145787
            7AE26228AE0EF5C4C5505C1DEA898BA1B83AD4131743B102AA1BB102AAEB6228
            564075235640755D0CC50AA86EC40AA8AE8BA15801D58D5801D57531142BA0BA
            112BA0BA2E8662055437620554D7C550AC80EA46AC80EABA188A1550DD881550
            5D1743B102AA1BB102AAEB6228564075235640755D0CC50AA86EC40AA8AE8BA1
            5801D58D5801D57531142BA0BA112BA0BA2E8662055437620554D7C550AC80EA
            46AC80EABA188A1550DD8815505D1743B102AA1BB102AAEB6228564075235640
            755D0CC50AA86EC40AA8AE8BA15801D58D5801D57531142BA0BA112BA0BA2E86
            62055437620554D7C550AC80EA46AC80EABA188AAB433D71311457877AE26228
            AE0EF5C4C5505C1DEA898BA1B83AD41317437175A8272E86E2EA504F5C0CC5D5
            A19EB8188AAB433D71311457877AE26228AE0EF5C4C5505C1DEA898BA1B83AD4
            1317437175A8272E86E2EA504F5C0CC5D5A19EB8188AAB433D397B7AFA0FDC9D
            F278E7E6E7B00000000049454E44AE426082}
          Text1.Align = oaMiddleCenter
          Text1.AssignedValues = []
          Text1.Value = 'jakartasrl.com.ar'
          Text2.AssignedValues = []
          Text3.AssignedValues = []
          Text4.AssignedValues = []
          OnClick = tci_MsjsVariosClick
        end
        object tci_MsjsCliente: TdxTileControlItem
          GroupIndex = 0
          IndexInGroup = 0
          Text1.AssignedValues = []
          Text2.AssignedValues = []
          Text3.AssignedValues = []
          Text4.AssignedValues = []
        end
        object tci_MsjsJakarta: TdxTileControlItem
          GroupIndex = 1
          IndexInGroup = 0
          Text1.AssignedValues = []
          Text2.AssignedValues = []
          Text3.AssignedValues = []
          Text4.AssignedValues = []
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 318
        Align = alBottom
        Caption = ' Novedades '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Height = 103
        Width = 769
        object tc_Novedades: TdxTileControl
          Left = 3
          Top = 30
          Width = 763
          Height = 63
          TabOrder = 0
        end
      end
      object tc_MenuUsuario: TdxTileControl
        Left = 305
        Top = 0
        Width = 464
        Height = 313
        OptionsBehavior.GroupMoving = True
        OptionsBehavior.ItemMoving = False
        OptionsBehavior.ScrollMode = smScrollButtons
        TabOrder = 0
      end
      object cxSplitter1: TcxSplitter
        Left = 300
        Top = 0
        Width = 5
        Height = 313
        AllowHotZoneDrag = False
        Control = tc_Favoritos
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 313
        Width = 769
        Height = 5
        AlignSplitter = salBottom
        Control = cxGroupBox2
      end
      object tc_Favoritos: TdxTileControl
        Left = 0
        Top = 0
        Width = 300
        Height = 313
        Align = alLeft
        OptionsBehavior.ItemMoving = False
        TabOrder = 4
        object tc_FavoritosGroup1: TdxTileControlGroup
          Caption.Text = 'Favoritos'
          Index = 0
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object cxGroupBox3: TcxGroupBox
        Left = 101
        Top = 36
        Caption = 'Par'#225'metros de Conexi'#243'n'
        ParentFont = False
        Style.Edges = [bTop, bBottom]
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 305
        Width = 567
        object cxLabel4: TcxLabel
          Left = 87
          Top = 51
          Caption = 'Servidor :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 87
          Top = 95
          Caption = 'Puerto :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 87
          Top = 140
          Caption = 'Aplicaci'#243'n :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel7: TcxLabel
          Left = 87
          Top = 185
          Caption = 'EServlet :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxCheckBox1: TcxCheckBox
          Left = 87
          Top = 240
          Caption = 'Usar por Defecto'
          ParentFont = False
          Properties.Alignment = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 5
          Transparent = True
          Width = 161
        end
        object EHost: TcxTextEdit
          Left = 184
          Top = 49
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          Text = 'EHost'
          Width = 147
        end
        object EPort: TcxTextEdit
          Left = 184
          Top = 93
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Text = 'EPort'
          Width = 91
        end
        object EAplicacion: TcxTextEdit
          Left = 184
          Top = 138
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Text = 'EAplicacion'
          Width = 297
        end
        object EServlet: TcxTextEdit
          Left = 184
          Top = 183
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          Text = 'EServlet'
          Width = 297
        end
      end
    end
  end
  object cds_MenuUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 96
    object cds_MenuUsuariocodItemMenu: TIntegerField
      FieldName = 'codItemMenu'
    end
    object cds_MenuUsuariodescItemMenu: TStringField
      FieldName = 'descItemMenu'
      Size = 30
    end
    object cds_MenuUsuariocodItemPadre: TIntegerField
      FieldName = 'codItemPadre'
    end
    object cds_MenuUsuarioesGrupo: TBooleanField
      FieldName = 'esGrupo'
    end
    object cds_MenuUsuarioesItemDeGrupo: TBooleanField
      FieldName = 'esItemDeGrupo'
    end
  end
  object cds_MsjsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 256
    object cds_MsjsClienteAlign: TByteField
      FieldName = 'Align'
    end
    object cds_MsjsClienteAlignWithText: TByteField
      FieldName = 'AlignWithText'
    end
    object cds_MsjsClienteImage: TBlobField
      FieldName = 'Image'
    end
    object cds_MsjsClienteAnimateText: TBooleanField
      FieldName = 'AnimateText'
    end
    object cds_MsjsClienteText1: TStringField
      FieldName = 'Text1'
      Size = 50
    end
    object cds_MsjsClienteText2: TStringField
      FieldName = 'Text2'
      Size = 50
    end
    object cds_MsjsClienteText3: TStringField
      FieldName = 'Text3'
      Size = 50
    end
    object cds_MsjsClienteText4: TStringField
      FieldName = 'Text4'
      Size = 50
    end
  end
  object cds_MsjsJakarta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 256
    object cds_MsjsJakartaAlign: TByteField
      FieldName = 'Align'
    end
    object cds_MsjsJakartaAlignWithText: TByteField
      FieldName = 'AlignWithText'
    end
    object cds_MsjsJakartaImage: TBlobField
      FieldName = 'Image'
    end
    object cds_MsjsJakartaAnimateText: TBooleanField
      FieldName = 'AnimateText'
    end
    object cds_MsjsJakartaText1: TStringField
      FieldName = 'Text1'
      Size = 50
    end
    object cds_MsjsJakartaText2: TStringField
      FieldName = 'Text2'
      Size = 50
    end
    object cds_MsjsJakartaText3: TStringField
      FieldName = 'Text3'
      Size = 50
    end
    object cds_MsjsJakartaText4: TStringField
      FieldName = 'Text4'
      Size = 50
    end
  end
  object cds_MsjsVarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 256
    object cds_MsjsVariosAlign: TByteField
      FieldName = 'Align'
    end
    object cds_MsjsVariosAlignWithText: TByteField
      FieldName = 'AlignWithText'
    end
    object cds_MsjsVariosImage: TBlobField
      FieldName = 'Image'
    end
    object cds_MsjsVariosAnimateText: TBooleanField
      FieldName = 'AnimateText'
    end
    object cds_MsjsVariosText1: TStringField
      FieldName = 'Text1'
      Size = 50
    end
    object cds_MsjsVariosText2: TStringField
      FieldName = 'Text2'
      Size = 50
    end
    object cds_MsjsVariosText3: TStringField
      FieldName = 'Text3'
      Size = 50
    end
    object cds_MsjsVariosText4: TStringField
      FieldName = 'Text4'
      Size = 50
    end
  end
  object IdHTTP: TIdHTTP
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
    Left = 632
    Top = 88
  end
  object Service: TjktServiceCaller
    HTTP = IdHTTP
    IgnoreException = False
    Left = 584
    Top = 88
  end
  object TUsuario: TjktMemTable
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
    SubLanguageID = 0
    LocaleID = 0
    Left = 640
    Top = 16
    object TUsuariooid_usuario: TIntegerField
      FieldName = 'oid_usuario'
    end
    object TUsuarioCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object TUsuarioApellido: TStringField
      FieldName = 'Apellido'
      Size = 30
    end
    object TUsuarioNombre: TStringField
      FieldName = 'Nombres'
      Size = 40
    end
    object TUsuarioEmail: TStringField
      FieldName = 'Mail'
      Size = 50
    end
    object TUsuariosesionID: TStringField
      FieldName = 'sesionID'
      Size = 50
    end
    object TUsuariodecimalSeparator: TStringField
      FieldName = 'decimalSeparator'
      Size = 1
    end
    object TUsuariocertificado: TStringField
      FieldName = 'certificado'
      Size = 2000
    end
  end
  object TLogin: TjktMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'usuario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'password'
        DataType = ftString
        Size = 20
      end>
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
    SubLanguageID = 0
    LocaleID = 0
    Left = 592
    Top = 16
    object TLoginusuario: TStringField
      FieldName = 'usuario'
    end
    object TLoginpassword: TStringField
      FieldName = 'password'
    end
  end
  object dsLogin: TDataSource
    DataSet = TLogin
    Left = 544
    Top = 16
  end
  object OperConsultaLogin: TjktOperacion
    OperName = 'Login'
    EnviarTodo = False
    Atributos = <
      item
        Attribute = 'usuario'
        Field = TLoginusuario
        Tag = 0
      end
      item
        Attribute = 'password'
        Field = TLoginpassword
        Tag = 0
      end>
    ServiceCaller = Service
    Left = 704
    Top = 88
  end
  object TMenues: TjktMemTable
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
    SubLanguageID = 0
    LocaleID = 0
    Left = 232
    Top = 96
    object TMenuesoid_menu: TIntegerField
      FieldName = 'oid_menu'
    end
    object TMenuesCodigo: TStringField
      FieldName = 'Codigo'
      Size = 50
    end
    object TMenuesDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
    object TMenuesTipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object TMenuesImagen: TStringField
      FieldName = 'Imagen'
      Size = 50
    end
    object TMenuesRutaDeImagen: TStringField
      FieldName = 'RutaDeImagen'
      Size = 255
    end
    object TMenuesOrden: TIntegerField
      FieldName = 'Orden'
    end
    object TMenuesArgumento: TStringField
      FieldName = 'Argumento'
      Size = 255
    end
  end
  object TTextosMenues: TjktMemTable
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
    SubLanguageID = 0
    LocaleID = 0
    Left = 296
    Top = 96
  end
end
