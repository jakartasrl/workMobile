inherited frmRibbonNotepadMain: TfrmRibbonNotepadMain
  Caption = 'ExpressBars RibbonNotepadDemo'
  ClientHeight = 621
  ClientWidth = 879
  PixelsPerInch = 96
  TextHeight = 13
  object Ribbon: TdxRibbon [0]
    Left = 0
    Top = 0
    Width = 879
    Height = 159
    ApplicationButton.ScreenTip = stAppMenu
    ApplicationButton.Menu = BackstageView
    BarManager = dxBarManager
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'Blue'
    PopupMenuItems = [rpmiItems, rpmiQATPosition, rpmiQATAddRemoveItem, rpmiMinimizeRibbon]
    QuickAccessToolbar.Toolbar = dxbQAT
    SupportNonClientDrawing = True
    Contexts = <
      item
        Caption = 'Selection Tools'
        Color = 13468115
      end>
    TabOrder = 4
    TabStop = False
    OnHelpButtonClick = RibbonHelpButtonClick
    object tabHome: TdxRibbonTab
      Active = True
      Caption = 'Home'
      Groups = <
        item
          ToolbarName = 'dxbFile'
        end
        item
          ToolbarName = 'dxbClipboard'
        end
        item
          ToolbarName = 'dxbEditing'
        end
        item
          ToolbarName = 'dxbParagraph'
        end
        item
          ToolbarName = 'dxbFontAndColors'
        end>
      KeyTip = 'H'
      Index = 0
    end
    object rtAppearance: TdxRibbonTab
      Caption = 'Appearance'
      Groups = <
        item
          ToolbarName = 'dxbRibbonOptions'
        end
        item
          Caption = 'Quick Access Toolbar'
          ToolbarName = 'dxbQATOptions'
        end
        item
          ToolbarName = 'dxbColorScheme'
        end
        item
          ToolbarName = 'dxbContextMenuStyle'
        end>
      KeyTip = 'A'
      Index = 1
    end
    object rtHelp: TdxRibbonTab
      Caption = 'Help'
      Groups = <
        item
          Caption = 'About'
          ToolbarName = 'dxBarManagerBar1'
        end>
      KeyTip = 'E'
      Index = 2
    end
    object rtSelection: TdxRibbonTab
      Caption = 'Selection'
      Groups = <
        item
          ToolbarName = 'dxbSelectionTools'
        end>
      Index = 3
      ContextIndex = 0
    end
  end
  object dxStatusBar: TdxRibbonStatusBar [1]
    Left = 0
    Top = 598
    Width = 879
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'dxbStatusBarToolbar1'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'dxbStatusBarToolbar2'
        Bevel = dxpbRaised
      end
      item
        PanelStyleClassName = 'TdxStatusBarToolbarPanelStyle'
        PanelStyle.ToolbarName = 'dxbStatusBarToolbar3'
        Bevel = dxpbRaised
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
        Bevel = dxpbRaised
      end>
    Ribbon = Ribbon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object tbZoom: TdxZoomTrackBar [2]
    Left = 573
    Top = 545
    Properties.TickMarks = cxtmBoth
    Properties.TickSize = 1
    Properties.OnChange = tbZoomPropertiesChange
    Style.TransparentBorder = False
    TabOrder = 6
    Height = 20
    Width = 148
  end
  object BackstageView: TdxRibbonBackstageView [3]
    Left = 8
    Top = 165
    Width = 841
    Height = 400
    Buttons = <
      item
        Item = bbNew
      end
      item
        Item = bbOptions
        Position = mbpAfterTabs
      end
      item
        Item = bbExit
        Position = mbpAfterTabs
      end>
    OnPopup = BackstageViewPopup
    OnTabChanged = BackstageViewTabChanged
    Ribbon = Ribbon
    object bvtsOpen: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = 'Open'
      SizeOptions.MinWidth = 700
      object bvlSpacer1: TBevel
        Left = 667
        Top = 60
        Width = 42
        Height = 314
        Align = alRight
        Shape = bsSpacer
      end
      object bvSpacer2: TBevel
        Left = 0
        Top = 60
        Width = 42
        Height = 314
        Align = alLeft
        Shape = bsSpacer
      end
      object bvSpacer7: TBevel
        Left = 0
        Top = 374
        Width = 709
        Height = 26
        Align = alBottom
        Shape = bsSpacer
      end
      object gbBackstageViewTabCaption: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        PanelStyle.Active = True
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Height = 60
        Width = 709
        object bvSpacer4: TBevel
          Left = 667
          Top = 0
          Width = 42
          Height = 60
          Align = alRight
          Shape = bsSpacer
        end
        object bvSpacer3: TBevel
          Left = 0
          Top = 0
          Width = 42
          Height = 60
          Align = alLeft
          Shape = bsSpacer
        end
        object lbbvTabCaption2010: TcxLabel
          Left = 42
          Top = 0
          Align = alClient
          AutoSize = False
          Caption = 'Support'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -20
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Transparent = True
          Height = 60
          Width = 625
        end
        object lbbvTabCaption2013: TcxLabel
          Left = 42
          Top = 0
          Align = alClient
          Caption = 'Open'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -35
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TransparentBorder = False
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object gbLocationsMain: TcxGroupBox
        Left = 42
        Top = 60
        Align = alClient
        PanelStyle.Active = True
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Height = 314
        Width = 625
        object gbLocationsPane: TcxGroupBox
          Left = 0
          Top = 0
          Align = alLeft
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          Style.TransparentBorder = False
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Transparent = True
          Height = 314
          Width = 337
          object bvSpacer5: TBevel
            Left = 305
            Top = 0
            Width = 32
            Height = 314
            Align = alRight
            Shape = bsSpacer
          end
          object dxBevel1: TdxBevel
            Left = 299
            Top = 0
            Width = 6
            Height = 314
            Align = alRight
            AutoSize = True
            Shape = dxbsLineLeft
            ExplicitLeft = 304
            ExplicitWidth = 1
          end
        end
        object gbRecentPathsPane: TcxScrollBox
          Left = 337
          Top = 0
          Width = 288
          Height = 314
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 1
          Transparent = True
          object bvSpacer6: TBevel
            Left = 0
            Top = 28
            Width = 288
            Height = 16
            Align = alTop
            Shape = bsSpacer
          end
          object gbRecentPathsPaneBottom: TcxGroupBox
            Left = 0
            Top = 151
            Align = alTop
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Transparent = True
            Height = 95
            Width = 288
            object btnBrowsePath: TcxButton
              Left = 0
              Top = 9
              Width = 86
              Height = 86
              Caption = 'Browse'
              OptionsImage.ImageIndex = 1
              OptionsImage.Images = cxLargeImages
              OptionsImage.Layout = blGlyphTop
              TabOrder = 0
              OnClick = btnBrowsePathClick
            end
          end
          object gbRecentPathsPaneCurrentFolder: TcxGroupBox
            Left = 0
            Top = 44
            Align = alTop
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = False
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 2
            Transparent = True
            Height = 85
            Width = 288
            object lbCurrentFolder: TcxLabel
              Left = 0
              Top = 0
              Align = alTop
              Caption = 'Current Folder'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
            end
          end
          object lbComputer: TcxLabel
            Left = 0
            Top = 0
            Align = alTop
            Caption = 'Computer'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -20
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            Transparent = True
          end
          object lbRecentFolders: TcxLabel
            Left = 0
            Top = 129
            Align = alTop
            Caption = 'Recent Folders'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
        object gbRecentDocumentsPane: TcxScrollBox
          Left = 337
          Top = 0
          Width = 288
          Height = 314
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 2
          Transparent = True
          object bvSpacer8: TBevel
            Left = 0
            Top = 28
            Width = 288
            Height = 16
            Align = alTop
            Shape = bsSpacer
          end
          object lbRecentDocuments: TcxLabel
            Left = 0
            Top = 0
            Align = alTop
            Caption = 'Recent Documents'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -20
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            Transparent = True
          end
        end
      end
    end
    object bvtsSaveAs: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Caption = 'Save As'
      SizeOptions.MinWidth = 700
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 42
        Height = 374
        Align = alLeft
        Shape = bsSpacer
      end
      object Bevel2: TBevel
        Left = 667
        Top = 0
        Width = 42
        Height = 374
        Align = alRight
        Shape = bsSpacer
      end
      object Bevel3: TBevel
        Left = 0
        Top = 374
        Width = 709
        Height = 26
        Align = alBottom
        Shape = bsSpacer
      end
    end
    object bvtsAbout: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Caption = 'About this Demo'
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 42
        Height = 374
        Align = alLeft
        Shape = bsSpacer
      end
      object Bevel5: TBevel
        Left = 667
        Top = 0
        Width = 42
        Height = 374
        Align = alRight
        Shape = bsSpacer
      end
      object Bevel6: TBevel
        Left = 0
        Top = 374
        Width = 709
        Height = 26
        Align = alBottom
        Shape = bsSpacer
      end
      object meAbout: TcxMemo
        Left = 42
        Top = 0
        Align = alClient
        ParentFont = False
        Properties.ScrollBars = ssVertical
        Style.BorderStyle = ebsNone
        Style.TransparentBorder = False
        StyleFocused.BorderStyle = ebsNone
        StyleHot.BorderStyle = ebsNone
        TabOrder = 0
        Height = 374
        Width = 625
      end
    end
  end
  inherited cxLargeImages: TcxImageList
    FormatVersion = 1
  end
  inherited cxSmallImages: TcxImageList
    FormatVersion = 1
  end
  inherited dxBarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    object dxbFile: TdxBar [0]
      Caption = 'File'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 216
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000020000
        000C000000160000001A0000001B0000001C0000001D0000001E0000001F0000
        00210000002200000023000000240000002100000013000000040000000A8D6A
        44C9B46F38FFB26C34FF242424FF1F1F1FFF1C1C1CFF181818FF141414FF1212
        12FF0F0F0FFF0C0C0CFFA0541AFF9F5218FF805328D20000001300000011BB77
        40FFEEC08EFFEFCA9EFF333333FF2E2E2EFF2A2A2AFF272727FF222222FF1F1F
        1FFFE7BD8FFF171717FFE5BC8CFFDDA96EFFA05319FF0000002000000011BF7D
        47FFF1C593FFF1CDA4FF444444FF3F3F3FFF3B3B3BFF363636FF323232FF2D2D
        2DFFE9BF91FF262626FFE6BC8EFFDFAD70FFA2561BFF000000220000000FC482
        4DFFF3CA99FFF3D1A7FF575757FF525252FF4D4D4DFF484848FF434343FF3E3E
        3EFFE9C192FF353535FFE8BE90FFE1AD73FFA4591FFF000000200000000EC987
        52FFF5CEA0FFF5D5ADFF6A6A6AFF656565FF606060FF5B5B5BFF565656FF5151
        51FF4C4C4CFF474747FFE9C191FFE3AF76FFA75D24FF0000001E0000000CCE8C
        58FFF8D4A7FFF8D8B2FFF5D5ACFFF4D0A5FFF1CDA0FFEFCA9CFFEEC89AFFEDC8
        99FFEDC497FFECC395FFEAC394FFE4B277FFA96027FF0000001C0000000BD291
        5DFFFBD7ADFFF8D1A6FFF6CE9DFFF3C996FFF0C38FFFEEBF89FFECBC83FFEBBA
        82FFE9B980FFE9B77FFFE8B57CFFE7B47BFFAD652CFF0000001B00000009D796
        63FFFDDCB3FFDBA26BFFDAA16AFFD9A069FFD99F68FFD89D66FFD69C65FFD69B
        64FFD59962FFD49861FFD3965FFFE8B67DFFB06931FF0000001900000008DA9B
        68FFFFDFBAFFD99E67FFFBFBFBFFFAFAFAFFF8F8F8FFF7F7F7FFF5F5F5FFF4F4
        F4FFF2F2F2FFF1F1F1FFD0925BFFE9B980FFB46E37FF0000001700000006DE9F
        6DFFFFE5C0FFD69A64FFFDFDFDFF8D8D8DFF8A8A8AFF898989FF868686FF8383
        83FF818181FFF5F5F5FFCD8E57FFEBBB82FFB8733CFF0000001500000005E1A3
        70FFFFE7C7FFD3965FFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFB
        FBFFFAFAFAFFF8F8F8FFCA8A54FFEEBC85FFBC7842FF0000001400000004E3A5
        73FFFFEACDFFD1915CFFFFFFFFFFACACACFFAAAAAAFFA8A8A8FFA6A6A6FFA4A4
        A4FFA2A2A2FFFBFBFBFFC88650FFEFBF88FFC17D47FF0000001200000002E5A7
        75FFFFF0D2FFCE8D58FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFFC5834DFFF1C18AFFC5824DFF0000000E00000001AA93
        75C0E5A775FFCB8A55FFABABABFFABABABFFABABABFFABABABFFABABABFFABAB
        ABFFABABABFFABABABFFC3804BFFCD8B57FF94754EC500000007000000000000
        0001000000020000000300000003000000040000000500000005000000060000
        000700000008000000090000000A0000000A0000000600000001}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbNew'
        end
        item
          Visible = True
          ItemName = 'bbOpen'
        end
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbPrint'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbQAT: TdxBar [1]
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbNew'
        end
        item
          Visible = True
          ItemName = 'bbOpen'
        end
        item
          Visible = True
          ItemName = 'bbSave'
        end
        item
          Visible = True
          ItemName = 'bbTouchMode'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbClipboard: TdxBar [2]
      Caption = 'Clipboard'
      CaptionButtons = <>
      DockedLeft = 180
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 64
      FloatClientHeight = 216
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000B97B49FFB77946FFB677
        44FFB47542FFB37340FFB1713EFFB1703DFFAF6D3AFFAE6D39FF000000050000
        000C0000001100000014000000170000001A0000001DBD814EFFFFF4E9FFFEF3
        E8FFFEF3E6FFFEF2E6FFFEF1E5FFFEF1E3FFFDF0E1FFB1713DFF03263F7B054B
        7BE505548BFF045189FF054F87FF044E85FF044D84FFC18655FFFFF5EBFFCB8D
        5EFFC88B5BFFC58858FFC38555FFC08352FFFDF0E2FFB57642FF065080E3198D
        BDFF17B8E6FF15B2E2FF13AEDEFF12AADBFF1297C4FFC58C5CFFFFF7EDFFFFF6
        ECFFFFF6ECFFFFF5EBFFFFF5EAFFFEF2E5FFFCEEE0FFB87A48FF065F96FF37CA
        EFFF1DBDE9FF1AB8E6FF16B4E2FF14B0DFFF139FCDFFCB9262FFFFF7EFFFE0A4
        77FFDDA274FFDA9F71FFD89C6EFFD5996BFFFAEADBFFBD7F4DFF07649BFF48D1
        F3FF23C2EDFF1FBEEAFF1DBAE7FF1AB7E5FF18A9D5FFCF9869FFFFF9F1FFFFF8
        F1FFFFF8F0FFFEF5ECFFFCF0E5FFFAECDEFFF7E6D6FFC08553FF08699FFF59D8
        F6FF29C9F1FF27C4EEFF23C1ECFF22BFEAFF1EB4DFFFD39E70FFFFFAF4FFFFF9
        F2FFFEF5EEFFFCF1E7FFFAEDDFFFF6E5D4FFF4DFCBFFC58B5AFF096FA5FF72E0
        F9FF3AD0F5FF34CDF2FF2EC9F0FF29C5EEFF26BDE6FFD7A477FFFFFAF5FFFEF7
        EFFFFCF2EAFFFAEDE2FFF7E9DAFFCE9667FFCB9363FFC99160FF0A75ABFF8DE8
        FCFF4ED9F9FF48D6F7FF41D2F5FF39CFF3FF30C9EEFFDBAA7EFFFEF8F1FFFCF3
        EBFFFAEEE4FFF7E9DBFFF5E4D4FFD19C6EFFFFF9F3FFD5D0CAD50B7BB1FFA6EE
        FDFF63E0FCFF5EDDFBFF55DAF9FF4CD7F8FF43CFF2FFDFB085FFDEAE81FFDCAC
        7FFFDAA97DFFD9A77AFFD7A476FFD6A274FFD5D1CCD5171716170C83B6FFBBF3
        FEFF7BE7FEFF74E5FDFF69DCF5FF59C2DDFF4FB3D0FF48B6D3FF40BDDDFF38C4
        E6FF34CBEEFF085C92FF000000150000000000000000000000000E8ABDFFCFF7
        FFFF91ECFFFF77C8DBFF61A7BCFF5BA3B8FF58AAC2FF53B4CEFF4CBCD9FF43C5
        E4FF3BCDEFFF096196FF000000110000000000000000000000001091C3FFDFFA
        FFFFC0854AFFBD8045FFBB7C3FFFB8783AFFB57535FFB37132FFB16F2FFFAF6C
        2DFF43D1F1FF09669CFF0000000E0000000000000000000000001199CBFFEAFB
        FFFFE9C08FFFE6B986FFE2B37DFFDFAD74FFDCA76CFFD9A166FFD69D5FFFB979
        3CFF4DDFFEFF086CA1FF0000000B000000000000000000000000118DB8E083CD
        E7FFEEFCFFFFEAFAFDFFF0D5AFFFEFCB9DFFECC494FFE5C193FFA8EFFDFF94ED
        FEFF45AFD5FF096593E300000007000000000000000000000000094A5F701190
        BBE013A1D1FF129BCDFF7BBBC8FFFCE5C1FFF0DBB8FF7DA3A3FF0E85B9FF0D81
        B5FF0B6E9BE106364C7500000003000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbPaste'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbCut'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbCopy'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbSelectAll'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbEditing: TdxBar [3]
      Caption = 'Editing'
      CaptionButtons = <>
      DockedLeft = 308
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 99
      FloatClientHeight = 196
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000B0000001A0000002000000015000000050000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000010000000C0E0C096336271DDE412D1FF60B0A09B6010101290000
        0009000000010000000000000000000000000000000000000000000000000000
        0000000000040808073F6C5A4EF2F2CDAAFFFFD1A3FF533C2DFF101010D30303
        03470000000E0000000100000000000000000000000000000000000000050000
        000B000000121616158CD5C3B5FFFFE9D2FFFFE5C9FF8F735EFF414344FF1D1E
        1EE90505056200000014000000030000000000000000000000000808083F1A16
        14C60F0D0D90171717B4F3EAE3FFFFF1E5FFFFEFDFFFA19285FF8C8C8CFF7878
        78FF282828F8070707880000001A000000040000000000000000343332D0E7D7
        C7FF675547FF2F2F2FFFBAB8B7FFFFFFFDFFE6DFD9FFBCB8B5FFCBCBCBFFB5B5
        B5FF8C8C8CFF1D1D1DFF121212A90101012100000007000000017B7C7BF8FFFF
        FFFFA89C93FF8A8A8AFF656565FF8A8989FFBABABAFFE1E3E3FFE7E7E7FFE1E1
        E1FFBCBCBCFF6D6D6DFF686868FF222222C6040404350000000B747474F0E3E4
        E4FFD0D0D0FFE0E0E0FFC3C3C3FF6A6A6AFF646464FFA8A8A8FFE0E0E0FFF0F0
        F0FFD4D4D4FFD1D1D1FFC4C4C4FF9C9C9CFF464646E20E0E0E523C3C3C656F6F
        6FDABCBCBCFFDCDCDCFFF0F0F0FFC4C4C4FF787878FF585858FF707070FFAEAE
        AEFFE0E0E0FFF2F2F2FFEBEBEBFFE3E3E3FFCCCCCCFF666666E5000000000303
        0305292929494D4D4D86878787D7BCBCBCFBD9D9D9FFC4C4C4FF9B9B9BFF9E9E
        9EFF9E9E9EFFBFBFBFFFE9E9E9FFF3F3F3FFF3F3F3FFA9A9A9FB000000000000
        00000000000000000000010101012424243D464646798D8D8DCCB7B7B7F4D4D4
        D4FFCCCCCCFFA8A8A8FF8E8E8EEDC4C4C4F9DADADAFF808080BD000000000000
        00000000000000000000000000000000000000000000020202031C1C1C294242
        42717D7D7DBB969696DC2727273D25252539474747721414141C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbFind'
        end
        item
          Visible = True
          ItemName = 'bbReplace'
        end
        item
          BeginGroup = True
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbClear'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbUndo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'rgiItemSymbol'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbParagraph: TdxBar [4]
      Caption = 'Paragraph'
      CaptionButtons = <>
      DockedLeft = 558
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 75
      FloatClientHeight = 378
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00002D2824FF2A2622FF282420FF26211EFF241F1BFF211D19FF1F1B17FF1D19
        15FF1B1814FF1A1513FF181411FF161310FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000332E2AFF302B28FF2E2925FF2B2723FF292420FF2722
        1EFF24201CFF221E1AFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000433D39FF403B37FF3E3935FF3B3632FF393430FF36312EFF342F2BFF312C
        28FF2F2A26FF2C2723FF2A2621FF27231FFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000048433FFF46403CFF443E3AFF413C38FF3E3A36FF3C37
        33FF393431FF37322EFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000056514DFF544F4BFF524D49FF504B47FF4E4844FF4B4642FF494440FF4741
        3EFF443F3BFF423C38FF3F3A36FF3D3834FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          ButtonGroup = bgpStart
          Visible = True
          ItemName = 'bbBold'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbItalic'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbUnderline'
        end
        item
          ButtonGroup = bgpStart
          Visible = True
          ItemName = 'bbAlignLeft'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignCenter'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignRight'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbBullets'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbFontAndColors: TdxBar [5]
      Caption = 'Font and Colors'
      CaptionButtons = <
        item
          KeyTip = 'FN'
          ScreenTip = stFontDialog
          OnClick = dxbFontAndColorsCaptionButtons0Click
        end>
      DockedLeft = 639
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 100
      FloatClientHeight = 89
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000060360DD273400EFF5C330CCD000000000000000000000000000000000000
        0000160C02345A3007D7693807FF683807FF0000000000000000000000000000
        00000000000055300CBA2917065A000000000000000000000000000000000000
        00000D07021E6A3A09FC693909FC0A0601180000000000000000000000000000
        000000000000271606545A330DC3000000000000000000000000000000000000
        0000391F06846D3B09FF482707AB000000000000000000000000000000000000
        000000000000020101036B3D10E7120B03270000000000000000000000000302
        010665380BE76E3C0BFF1D100342000000000000000000000000000000000000
        000000000000000000003F240A8743260A900000000000000000000000002716
        0557703E0DFF5D330AD500000000000000000000000000000000000000000000
        0000000000000000000010090321784512FF774411FF754210FF74420FFF7341
        0FFF72400EFF301B066C00000000000000000000000000000000000000000000
        000000000000000000000000000057330EB72D1A076000000000150C032D7541
        10FF6E3D0FF30704010F00000000000000000000000000000000000000000000
        0000000000000000000000000000271707515E370FC60000000048290B997643
        11FF45270A960000000000000000000000000000000000000000000000000000
        0000000000000000000000000000020101036F4112E71C100539734212F37744
        12FF150C032D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003F250B815D360FC17A4613FF5D35
        0EC3000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000F09031E7B4714FC7B4713FF2A18
        0757000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000058340FB4764413F00302
        0106000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          ViewLevels = [ivlLargeIconWithText, ivlLargeControlOnly, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'beFontName'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 47
          ViewLevels = [ivlLargeIconWithText, ivlLargeControlOnly, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'beFontSize'
        end
        item
          Visible = True
          ItemName = 'bbFontColor'
        end
        item
          Visible = True
          ItemName = 'rgiColorTheme'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbStatusBarToolbar1: TdxBar [6]
      Caption = 'Document Status'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 63
      FloatClientHeight = 106
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbCursorLine'
        end
        item
          Visible = True
          ItemName = 'bbCursorColumn'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbLocked'
        end
        item
          BeginGroup = True
          ViewLevels = [ivlLargeIconWithText, ivlLargeControlOnly, ivlSmallIconWithText, ivlControlOnly]
          Visible = True
          ItemName = 'bbModified'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbStatusBarToolbar2: TdxBar [7]
      Caption = 'Alignment'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 75
      FloatClientHeight = 162
      ItemLinks = <
        item
          ButtonGroup = bgpStart
          Visible = True
          ItemName = 'bbAlignLeft'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignCenter'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignRight'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbStatusBarToolbar3: TdxBar [8]
      Caption = 'Zoom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 148
      FloatClientHeight = 38
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bsZoom'
        end
        item
          Visible = True
          ItemName = 'bccZoom'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbSelectionTools: TdxBar [9]
      Caption = 'Selection Tools'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 189
      FloatClientHeight = 164
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbCopy'
        end
        item
          Visible = True
          ItemName = 'bbCut'
        end
        item
          BeginGroup = True
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbBold'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbItalic'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'bbUnderline'
        end
        item
          BeginGroup = True
          UserDefine = [udWidth]
          UserWidth = 189
          Visible = True
          ItemName = 'beFontName'
        end
        item
          Visible = True
          ItemName = 'beFontSize'
        end
        item
          Visible = True
          ItemName = 'bbFontColor'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbRibbonOptions: TdxBar [10]
      Caption = 'Ribbon Options'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 116
      FloatClientHeight = 108
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000A27353B0360A4CA0077CEF3006FCDEF02539DC4012A4D640106
        090B0000000000000000000000000A101313336F91972B6E98A0000000000000
        000010242D3028A5D5E71CAEECFF0FABD1FF049FACFF019ADAFF0088E2FF015D
        A5CD011A2F3D0000000013222A343785B4C5369BECFB0F2E4450000000000000
        0000438BA0A555DDFFFF48D5FFFF199F61FF048100FF088D39FF08A8DAFF01A1
        EDFF007FCFF710375A882782BCE92081DCFF16476F9200000000000000000000
        00006BC8DCDD6EE0FAFF66E2FFFF36BC81FF129700FF0B9000FF17A77EFF1EC4
        FEFF0EC0F5FF0597DCFE0F407FE112447CC803080C0D00000000000000000000
        000076C3D0E3293F43FF30565FFF65D2E7FF52BC94FF36AA4BFF39C7A7FF42D6
        FFFF32A3E7FF24A6E9FF0D99DCFE073150640000000000000000000000000000
        00007EC1CDD43F5355FF080000FF5997A7FF80EDFFFF6BD8F8FF67E9FFFF59C5
        F3FF4C2AB7FF4416B0FF3492E0FF138DC4E30316212700000000000000000000
        00005E909B9B9EE0EAFF79AEB5FF92DFE9FF90E6F8F87DDAF2F77DECFFFF72DB
        FAFF7569CAFF671EADFF4B40C0FF3FD4F8FF0A5988A600000000000000000000
        000021343B3CA9EBF7F9C3FFFFFFA7F3FCFF488097AF2585B0B679C9D9DA89F0
        FFFF81D5F4FF7B8EDBFF6398E6FF60EAFFFF33ADE0F9031D2E3A000000000000
        00000000000057899799BFFEFFFFBDDACCFF22A8E3FC0888F2FF25517E9AA0F3
        FFFF8FEDFFFF87D4DFFF82CED5FF77EFFFFF5DD5F7FF09426B86000000000000
        0000000000000C151818A4BDB1DBF8BB77FF8D847EFF1255A8E8366D8A9FB0F8
        FFFFA3F2FFFFAB8A69FFAC4206FF96A698FF7FEBFFFF1E5D88A4000000000000
        000000000000312A2341EAD1A4ECF0AA73FFD4622AFF9BD4E1FA71ACBDC0A0DC
        E5E9B4FBFFFFBCBCA8FFC05B24FFB15721FF99DBDCFF22668C9F00000000060B
        131F0A214494807E7EDFFFD6A6FFBD6E3EEA7C908EC756879698000000001620
        242472A3ADADB9FCFEFFBCD4CBFFB8CABAFF99E4F2FF173A4C56060A0E142B59
        92E40B316FFF0A1A3FFF795439E02D1D10350102020201010101000000000000
        000001010101334A4F4F7FB5BCBC9EDCE0E04A6F7A7D000000002B455D78225C
        A0FF082968FF000D2CF403050E66000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000005C92B9DC2A66
        A6FF082356EB0308157A01030826000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000006696B7D11D39
        58850309143401040B2900000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRibbonForm'
        end
        item
          Visible = True
          ItemName = 'bbApplicationButton'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbQATOptions: TdxBar [11]
      Caption = 'Quick Access Toolbar Options'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 140
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 83
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001160
        9BBD0E61C8FE0338B8FF093492E4000000000000000000000000000000000000
        000000000000000000001F93CDF41173BCFE094A9CFA00000000000000003296
        D5F34FA6E3FF125FC9FF021CACFF000000000000000000000000000000000000
        000000000000000000002C9ED6F8197BC2FF07479AFE000000000000000061BA
        D9E688C3E7FF227ED0FF0437B9FF000000000000000000000000000000000000
        0000000000000000000036A5D5F02686CAFF074DA2FE00000000000000007CCA
        DBE191C9E8FF2587D1FF064BBEFD000000000000000000000000000000000000
        0000000000000000000040AAD4EA3595D3FF0751A4FE000000000000000084CE
        DDE088C5E7FF248CD2FF0B5AC2FB000000000000000000000000000000000000
        0000000000000000000049ADD0E145A4DBFF0958ACFC000000000000000083CF
        DEE29EE0F4FF259FDEFF0E66C5FA000000000000000000000000000000000000
        000000000000000000004EADCBD856B1E3FF0C61B3FA000000000000000087E8
        FAFEC18F55FFBD7F41FF034FC1FF000000000000000000000000000000000000
        0000000000000000000053ABC5CE66C0E9FF0E6BB8F700000000000000000000
        0000C7874CEBCA7F39FB00000000000000000000000000000000000000000000
        00000000000000000000489BB7CF71C9EDFF1177BDF200000000000000000000
        0000C7905DE1CF8744F9000000000000000000000000000000000C09060D3D2E
        204117110C19050403053486A7E06BBBEAFF127ABCEE02020102000000000000
        0000C7986CDAD58F50F90000000000000000000000000000000003020103C888
        4DDFDF9451FCD48D4DEDCA9158F8CA9968FFCB935DFBBD793DD5C3712CEB0000
        0000C69F79D4DA995BFB00000000000000000000000000000000000000002D22
        182ED68E4DF3D17727FFD3792AFFD57C2FFFD88032FFD88135FEE28F47FB0000
        0000C3A281CEDEA167FC00000000000000000000000000000000000000000000
        0000201A1420BF8E60C9DB8D47FED2782BFFCE7425FFCF792CFBF4AE6BF99D67
        38ACFDA253FEEDA15EFE07050208000000000000000000000000000000000000
        000000000000000000004F3F2E4FA57E59A6D0955DD9D08D50DCE6C19BE6BC95
        6DBCFAC18AFFE19E61FB160E071A000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008561
        3E85F8B87BFF976536AA01010101000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000573E
        2557F0BB88F3674A2F6F00000000000000000000000000000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbQATVisible'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbQATAboveRibbon'
        end
        item
          Visible = True
          ItemName = 'bbQATBelowRibbon'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbColorScheme: TdxBar [12]
      Caption = 'Color Scheme'
      CaptionButtons = <
        item
          OnClick = bbOptionsClick
        end>
      DockedDockingStyle = dsTop
      DockedLeft = 329
      DockedTop = 0
      FloatLeft = 1149
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 21
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000035ADECFE0795
        E9FF0792E4FF078CE0FF0C7EC9FEBB6712EFB64700F7B04100F7AC3900F79A26
        00EF00000000000000000000000000000000000000000000000055C1F6FF12AA
        F5FF08A5F5FF00A1F5FF0691E6FFD88B22F8D77000FFD06700FFCA5C00FFB13F
        00F800000000000000000000000000000000000000000000000066C8F7FF27B1
        F7FF1DADF5FF13AAF5FF0B9BECFFDA952DF7DE7D00FFD97700FFD56F00FFB94F
        00F700000000000000000000000000000000000000000000000070CCF9FF33B5
        F8FF23AEF7FF1CADF6FF0A9FEEFFDA9B39F8E18600FFE07D00FFDC7900FFC258
        00F8000000000000000000000000000000000000000000000000A5DFF9FE7CD1
        F9FF70CCF8FF6CCAF8FF5ABFF1FED3AC71EFDAA147F7DA9A3BF7DA9839F7C57F
        32EF000000000000000000000000000000000000000000000000EFD172EFF7B8
        40F7F7B33DF7F7AC37F7EF972BEF1DC4EFEF00A6F7F700A1F7F7009AF7F70081
        E9EFDEA054EFDD8D2AF7DA8927F7D78222F7C67218EF00000000F8F093F8FFE3
        5EFFFFD958FFFFD04FFFF8B33DF844E4F8F800CAFFFF00C2FFFF00BCFFFF00A0
        F8F8F5BE6EF8F8AD42FFF3A73DFFEF9F36FFDA8726F800000000F7F4A3F7FFF0
        6CFFFFE766FFFFE160FFF7BF4AF75DEAF7F70BD4FFFF01CFFFFF00CAFFFF00AD
        F7F7F7C67BF7FDB74EFFF9B249FFF7AD44FFDF9232F700000000F8F8ADF8FFF8
        77FFFFEF68FFFFEB63FFF8C94DF86CEFF8F81EDEFFFF06D3FFFF00D0FFFF00B5
        F8F8F8CB83F8FFBD56FFFEB74AFFFCB347FFE69A34F800000000EFEFD4EFF7F6
        B9F7F7F2ABF7F7F1A5F7EFDE94EFB0ECEFEF7EECF7F76BE7F7F763E5F7F74DD6
        EFEFEFD3A9EFF7CE8DF7F7C982F7F7C87EF7E5B26FEF00000000DEA054EFDD8D
        2AF7DA8927F7D78222F7C67218EF28A3E6EF0090E7F7008DE2F70088DEF70076
        C7EF006CD5EF004AD3F70044CAF7003BC3F70025A3EF00000000F5BE6EF8F8AD
        42FFF3A73DFFEF9F36FFDA8726F84EBBF3F812AAF5FF08A5F5FF00A1F5FF008D
        E4F8088CE3F8006CE3FF0064E2FF005EE3FF0043CDF800000000F7C67BF7FDB7
        4EFFF9B249FFF7AD44FFDF9232F75EC1F3F727B1F7FF1DADF5FF13AAF5FF0496
        EAF71595E4F70077E6FF0071E3FF006CE2FF0052D6F700000000F8CB83F8FFBD
        56FFFEB74AFFFCB347FFE69A34F869C6F5F833B5F8FF23AEF7FF1CADF6FF049B
        ECF8199BE7F8007EE7FF0074E5FF0072E4FF0059D9F800000000EFD3A9EFF7CE
        8DF7F7C982F7F7C87EF7E5B26FEF97D2EEEF74CAF4F768C5F4F764C3F4F74BB4
        EAEF5BB5E1EF33A4E6F72A9CE5F72898E5F71885DBEF00000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'scgiLookAndFeel'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar1: TdxBar [13]
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 913
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbAbout'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbContextMenuStyle: TdxBar [14]
      Caption = 'Context Menu Style'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 438
      DockedTop = 0
      FloatLeft = 913
      FloatTop = 8
      FloatClientWidth = 84
      FloatClientHeight = 108
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        200000000000000400000000000000000000000000000000000000000000B0AB
        A7FF969089FF958E87FF938D86FF938C85FF928B84FF918A83FF8F8982FF8F88
        80FF8D8780FF8C857EFF8C857DFF8B847CFFA6A29BFF00000000000000009A93
        8DFFF9F4F0FFF4EAE1FFF3E9E0FFF3E9E0FFF2E8DEFFF3E8DEFFF2E7DEFFF2E7
        DCFFF2E7DDFFF1E6DCFFF1E6DBFFF0E5DBFF8C857DFF00000000000000009B95
        8FFFFAF6F1FFF4EAE2FFF4EAE1FFF4EAE0FFAFA297FF8C7E73FFF2E8DEFFF3E7
        DDFFF2E7DDFFF2E7DCFFF1E6DCFFF1E6DBFF8C857EFF00000000000000009D97
        91FFFBF7F3FFF5EBE2FF87796EFFC4B9AEFF68594DFF9A8D82FFF3E9DEFFF3E8
        DEFFF2E8DEFFF2E7DDFFF1E6DCFFF1E6DCFF8E877FFF00000000000000009F99
        93FFFBF7F4FFF4ECE3FF615246FF6A5D51FF524437FF9B8E82FFE3D8CEFFF3E8
        DFFFF2E8DEFFF2E7DEFFF2E7DDFFF1E7DCFF8F8981FF0000000000000000A19B
        95FFFBF8F5FFF5EDE3FF68594DFF9A9084FF8F8679FF716458FF918378FFF3E9
        DFFFF3E9DFFFF3E8DEFFF2E7DDFFF2E7DDFF908A83FF0000000000000000A29C
        97FFFCF9F6FFF6ECE4FF6F6056FF9E968AFF817469FF9B8E83FFF3EAE1FFF3E9
        E0FFF3E9DFFFF3E9DEFFF3E7DEFFF2E7DDFF928B84FF0000000000000000A49F
        99FFFCFAF7FFF6EDE4FF75675CFF8B7F74FFA79B91FFF5EBE2FFF4EBE2FFF4EA
        E1FFF3E9E0FFF3E9E0FFF3E8DEFFF2E8DEFF948E86FF0000000000000000A5A0
        9BFFFCFAF8FFF6EEE6FF796B60FFB0A49AFFF5ECE4FFF5EBE2FFF5EBE2FFF4EB
        E2FFF3EAE1FFF3EAE0FFF3E9DFFFF3E8DFFF958F88FF0000000000000000A7A1
        9DFFFDFBF9FFF6EDE6FFB3A89FFFF1E8E1FFEEE6DEFFEDE5DDFFEBE4DBFFEBE3
        DAFFEAE1D9FFE9E0D7FFECE3DAFFF1E7DEFF97918BFF0000000000000000A9A3
        9FFFFDFBFAFFF5EDE5FFD0A77DFFC28C54FFBE8950FFBB854EFFB8824AFFB47F
        47FFB17B43FFAD7840FFB88F65FFECE2D9FF98938DFF0000000000000000AAA5
        A0FFFDFCFAFFF5EDE6FFC79259FFF9DCC2FFF5CAA4FFF4C8A1FFF2C59EFFF2C4
        9BFFF0C297FFEFC094FFAD7840FFE9E0D7FF9A958EFF0000000000000000ABA6
        A2FFFEFCFBFFF5EDE6FFCA945CFFF9DEC5FFF8DBC1FFF7D8BDFFF6D6B9FFF5D4
        B5FFF3D1AFFFF3CDABFFB17B44FFEAE2D8FF9D9790FF0000000000000000ACA7
        A4FFFEFDFCFFF6EFE8FFD6AC80FFCA945BFFC89259FFC58F56FFC28C53FFBF89
        50FFBB854DFFB7824AFFBF9669FFEEE5DEFF9F9993FF0000000000000000AEA9
        A5FFFEFDFCFFFEFDFCFFFDFBFAFFFBFAF8FFFAF8F7FFF9F7F5FFF9F6F4FFF7F4
        F2FFF5F3F0FFF4F1EDFFF6F2EEFFF9F5F1FFA09A95FF0000000000000000BFBB
        B9FFAEA9A5FFADA8A4FFACA7A3FFABA7A2FFABA6A1FFAAA5A0FFA8A49FFFA8A2
        9EFFA7A19CFFA6A09BFFA49F99FFA39D98FFB6B1ADFF00000000}
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRadialMenu'
        end
        item
          Visible = True
          ItemName = 'bbMiniToolbar'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    inherited beFontSize: TcxBarEditItem
      Width = 50
    end
    inherited scgiLookAndFeel: TdxSkinChooserGalleryItem
      OnPopulate = scgiLookAndFeelPopulate
      OnSkinChanged = scgiLookAndFeelSelected
    end
    object bbNew: TdxBarLargeButton
      Action = acNew
      Category = 0
      Description = 'Creates a blank document'
      ScreenTip = stNew
    end
    object bbOpen: TdxBarLargeButton
      Action = acOpen
      Category = 0
      Description = 'Opens existing RTF file'
      ScreenTip = stOpen
    end
    object bbSave: TdxBarLargeButton
      Action = acSave
      Category = 0
      Description = 'Updates the file with your most recent changes'
    end
    object bbPrint: TdxBarLargeButton
      Action = acPrint
      Category = 0
      Description = 'Prints the current document'
    end
    object bsSaveAs: TdxBarSubItem
      Caption = 'Save As'
      Category = 0
      Visible = ivAlways
      ImageIndex = 2
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSeparator1'
        end
        item
          Visible = True
          ItemName = 'bbSaveAsRTF'
        end
        item
          Visible = True
          ItemName = 'bbSaveAsText'
        end>
    end
    object dxBarSeparator1: TdxBarSeparator
      Caption = 'Save a copy of the document'
      Category = 0
      Hint = 'Save a copy of the document'
      Visible = ivAlways
    end
    object bbSaveAsRTF: TdxBarLargeButton
      Caption = '&Rich Text Format'
      Category = 0
      Description = 'Save the document in the default file format'
      Hint = 'Rich Text Format'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = bbSaveAsRTFClick
      SyncImageIndex = False
      ImageIndex = 2
    end
    object bbSaveAsText: TdxBarLargeButton
      Caption = '&Text'
      Category = 0
      Description = 'Save the document as a text file'
      Hint = 'Text'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = bbSaveAsTextClick
      SyncImageIndex = False
      ImageIndex = 2
    end
    object bbTouchMode: TdxBarLargeButton
      Caption = 'Touch Mode'
      Category = 0
      Hint = 'Toggle Touch Mode'
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 38
      OnClick = bbTouchModeClick
      SyncImageIndex = False
      ImageIndex = 38
    end
    object bbPaste: TdxBarLargeButton
      Action = acPaste
      Category = 0
      ScreenTip = stPaste
    end
    object bbCut: TdxBarLargeButton
      Action = acCut
      Category = 0
      ScreenTip = stCut
    end
    object bbCopy: TdxBarLargeButton
      Action = acCopy
      Category = 0
      ScreenTip = stCopy
    end
    object bbSelectAll: TdxBarLargeButton
      Action = acSelectAll
      Category = 0
      KeyTip = 'EA'
    end
    object bbFind: TdxBarLargeButton
      Action = acFind
      Category = 0
      KeyTip = 'FD'
      ScreenTip = stFind
    end
    object bbReplace: TdxBarLargeButton
      Action = acReplace
      Category = 0
      ScreenTip = stReplace
    end
    object bbClear: TdxBarLargeButton
      Action = acClear
      Category = 0
    end
    object bbUndo: TdxBarLargeButton
      Action = acUndo
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = UndoDropDownGallery
      SyncImageIndex = False
      ImageIndex = 11
    end
    object rgiItemSymbol: TdxRibbonGalleryItem
      Caption = 'Symbol'
      Category = 0
      Visible = ivAlways
      ImageIndex = 36
      LargeImageIndex = 36
      GalleryOptions.ItemSelectionMode = gsmNone
      GalleryFilter.Categories = <>
      GalleryFilter.Visible = True
      GalleryInRibbonOptions.Collapsed = True
      ItemLinks = <>
      OnGroupItemClick = rgiItemSymbolGroupItemClick
      object dxRibbonGalleryItem1Group1: TdxRibbonGalleryGroup
        Header.Caption = 'Basic Math'
        Header.Visible = True
        Options.AssignedValues = [avItemTextKind]
        Options.ItemTextKind = itkNone
      end
      object dxRibbonGalleryItem1Group2: TdxRibbonGalleryGroup
        Header.Caption = 'Greek Letters'
        Header.Visible = True
        Options.AssignedValues = [avItemTextKind]
        Options.ItemTextKind = itkNone
      end
      object dxRibbonGalleryItem1Group3: TdxRibbonGalleryGroup
        Header.Caption = 'Symbols'
        Header.Visible = True
        Options.AssignedValues = [avItemTextKind]
        Options.ItemTextKind = itkNone
      end
      object dxRibbonGalleryItem1Group4: TdxRibbonGalleryGroup
        Header.Caption = 'Currency Symbols'
        Header.Visible = True
        Options.AssignedValues = [avItemTextKind]
        Options.ItemTextKind = itkNone
      end
    end
    object bbBold: TdxBarLargeButton
      Action = acBold
      Category = 0
      KeyTip = '1'
      ScreenTip = stBold
      ButtonStyle = bsChecked
    end
    object bbItalic: TdxBarLargeButton
      Action = acItalic
      Category = 0
      KeyTip = '2'
      ScreenTip = stItalic
      ButtonStyle = bsChecked
    end
    object bbUnderline: TdxBarLargeButton
      Action = acUnderline
      Category = 0
      KeyTip = '3'
      ScreenTip = stUnderline
      ButtonStyle = bsChecked
    end
    object bbAlignLeft: TdxBarLargeButton
      Action = acAlignLeft
      Category = 0
      KeyTip = 'AL'
      ScreenTip = stAlignLeft
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object bbAlignCenter: TdxBarLargeButton
      Action = acAlignCenter
      Category = 0
      KeyTip = 'AC'
      ScreenTip = stAlignCenter
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object bbAlignRight: TdxBarLargeButton
      Action = acAlignRight
      Category = 0
      KeyTip = 'AR'
      ScreenTip = stAlignRight
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object bbBullets: TdxBarLargeButton
      Action = acBullets
      Category = 0
      ScreenTip = stBullets
      ButtonStyle = bsChecked
    end
    object bbFontColor: TdxBarButton
      Caption = 'Font Color'
      Category = 0
      Hint = 'Font Color'
      KeyTip = 'FC'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = ppmFontColor
      OnClick = bbFontColorClick
    end
    object rgiColorTheme: TdxRibbonGalleryItem
      Caption = 'Color Theme'
      Category = 0
      Visible = ivAlways
      GalleryFilter.Categories = <>
      ItemLinks = <>
    end
    object rgiFontColor: TdxRibbonGalleryItem
      Caption = 'Font Color'
      Category = 0
      Visible = ivAlways
      GalleryFilter.Categories = <>
      GalleryInMenuOptions.CollapsedInSubmenu = False
      GalleryInMenuOptions.DropDownGalleryResizing = gsrNone
      ItemLinks = <>
    end
    object bccZoom: TdxBarControlContainerItem
      Caption = 'Zoom'
      Category = 0
      Hint = 'Zoom'
      Visible = ivAlways
      Control = tbZoom
    end
    object bbOptions: TdxBarButton
      Caption = 'Options'
      Category = 0
      Hint = 'Options'
      Visible = ivAlways
      ImageIndex = 35
      OnClick = bbOptionsClick
    end
    object bbExit: TdxBarButton
      Action = acExit
      Category = 0
      ImageIndex = 4
    end
    object bbRibbonForm: TdxBarLargeButton
      Caption = 'Ribbon &Form'
      Category = 0
      Hint = 'Ribbon Form'
      ScreenTip = stRibbonForm
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 15
      OnClick = bbRibbonFormClick
      SyncImageIndex = False
      ImageIndex = 15
    end
    object bbApplicationButton: TdxBarLargeButton
      Caption = '&Application Button'
      Category = 0
      Hint = 'Application Button'
      ScreenTip = stAppButton
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 16
      OnClick = bbApplicationButtonClick
      SyncImageIndex = False
      ImageIndex = 16
    end
    object bbQATVisible: TdxBarLargeButton
      Caption = '&Visible'
      Category = 0
      Hint = 'Visible'
      ScreenTip = stQAT
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 17
      OnClick = bbQATVisibleClick
      SyncImageIndex = False
      ImageIndex = 17
    end
    object bbQATAboveRibbon: TdxBarButton
      Action = acQATAboveRibbon
      Category = 0
      ScreenTip = stQATAbove
      ButtonStyle = bsChecked
      GroupIndex = 3
      Glyph.Data = {
        76020000424D760200000000000036000000280000000C0000000C0000000100
        2000000000004002000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008080
        8080808080808080808000000000000000000000000000000000808080808080
        808080808080000000008080808080808080696969FF80808080808080800000
        0000000000008080808080808080464646FF8080808080808080808080807373
        73FF6E6E6EFF696969FF80808080808080808080808080808080505050FF4B4B
        4BFF464646FF808080808080808080808080737373FF6E6E6EFF696969FF8080
        8080808080805B5B5BFF565656FF505050FF8080808080808080000000008080
        808080808080747474FF6F6F6FFF6A6A6AFF656565FF5F5F5FFF5B5B5BFF8080
        8080808080800000000000000000000000008080808080808080747474FF6F6F
        6FFF6A6A6AFF656565FF80808080808080800000000000000000000000000000
        0000000000008080808080808080747474FF6F6F6FFF80808080808080800000
        0000000000000000000000000000000000000000000000000000808080808080
        8080808080808080808000000000000000000000000000000000000000000000
        0000000000000000000000000000808080808080808000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bbQATBelowRibbon: TdxBarButton
      Action = acQATBelowRibbon
      Category = 0
      ScreenTip = stQATBelow
      ButtonStyle = bsChecked
      GroupIndex = 3
      Glyph.Data = {
        76020000424D760200000000000036000000280000000C0000000C0000000100
        2000000000004002000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008080
        8080808080800000000000000000000000000000000000000000000000000000
        0000000000000000000080808080808080808080808080808080000000000000
        0000000000000000000000000000000000000000000080808080808080805F5F
        5FFF5A5A5AFF8080808080808080000000000000000000000000000000000000
        00008080808080808080696969FF646464FF5F5F5FFF5B5B5BFF808080808080
        80800000000000000000000000008080808080808080747474FF6F6F6FFF6A6A
        6AFF656565FF5F5F5FFF5B5B5BFF808080808080808000000000808080808080
        80807D7D7DFF787878FF747474FF8080808080808080656565FF606060FF5B5B
        5BFF808080808080808080808080868686FF828282FF7D7D7DFF808080808080
        80808080808080808080656565FF606060FF5B5B5BFF80808080808080808080
        8080878787FF8080808080808080000000000000000080808080808080806666
        66FF808080808080808000000000808080808080808080808080000000000000
        0000000000000000000080808080808080808080808000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object bbFont: TdxBarButton
      Action = acFont
      Category = 0
    end
    object rgiUndo: TdxRibbonGalleryItem
      Caption = 'Undo'
      Category = 0
      Visible = ivAlways
      GalleryFilter.Categories = <>
      ItemLinks = <>
      OnGroupItemClick = rgiUndoGroupItemClick
      OnHotTrackedItemChanged = rgiUndoHotTrackedItemChanged
    end
    object bsSelectionInfo: TdxBarStatic
      Caption = 'SelectionInfo'
      Category = 0
      Hint = 'SelectionInfo'
      Visible = ivAlways
    end
    object bsZoom: TdxBarStatic
      Caption = '100 %'
      Category = 0
      Hint = '100 %'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Undo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'bbUndoAll'
        end>
    end
    object dxBarButton1: TdxBarButton
      Action = acRedo
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = acUndo
      Category = 0
    end
    object bbUndoAll: TdxBarButton
      Caption = 'Undo &All'
      Category = 0
      Hint = 'Undo All'
      Visible = ivAlways
      ImageIndex = 40
      LargeImageIndex = 40
      OnClick = bbUndoAllClick
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'Align'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          ButtonGroup = bgpStart
          Visible = True
          ItemName = 'bbAlignLeft'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignCenter'
        end
        item
          ButtonGroup = bgpMember
          Visible = True
          ItemName = 'bbAlignRight'
        end>
    end
    object bbRadialMenu: TdxBarLargeButton
      Caption = '&Radial Menu'
      Category = 0
      Hint = 'Radial Menu'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      Down = True
      LargeImageIndex = 44
      SyncImageIndex = False
      ImageIndex = 44
    end
    object bbMiniToolbar: TdxBarLargeButton
      Caption = 'Mini Toolbar'
      Category = 0
      Hint = 'Mini Toolbar'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 2
      LargeImageIndex = 45
    end
    object bbAbout: TdxBarLargeButton
      Caption = '&About'
      Category = 0
      Hint = 'About'
      Visible = ivAlways
      LargeImageIndex = 19
      OnClick = bbAboutClick
      SyncImageIndex = False
      ImageIndex = 19
    end
  end
  inherited dxTabbedMDIManager1: TdxTabbedMDIManager
    Active = True
  end
  inherited alActions: TActionList
    object acQATAboveRibbon: TAction
      Caption = 'Ab&ove the Ribbon'
      GroupIndex = 3
      OnExecute = acQATBelowRibbonExecute
      OnUpdate = acQATAboveRibbonUpdate
    end
    object acQATBelowRibbon: TAction
      Tag = 1
      Caption = 'B&elow the Ribbon'
      GroupIndex = 3
      OnExecute = acQATBelowRibbonExecute
      OnUpdate = acQATAboveRibbonUpdate
    end
  end
  object dxBarScreenTipRepository1: TdxBarScreenTipRepository
    StandardFooter.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      200000000000000400000000000000000000000000000000000000000000CD81
      45FFCC7E41FFC97A3CFFC77637FFC47232FFC26E2EFFC06B2AFFBE6927FFBD66
      24FFBC6422FFBB6320FFBA611EFFBA611EFFBA611EFF0000000000000000EEAE
      76FFFFEDCAFFFFE9C3FFFFE8C0FFFFE6BDFFFFE6BBFFFFE4B8FFFFE3B5FFFFE2
      B2FFFFE1AFFFFFE0ACFFFFDEA9FFFFE5B1FFBA611EFF0000000000000000EEAF
      77FFFFE9CBFFFFE6C4FFFFE5C1FFFFE3BDFFFFE2BAFFFFE0B7FFFFDEB4FFFFDE
      B0FFFFDCADFFFFDAAAFFFFD9A6FFFFDFACFFBA621FFF0000000000000000EFB0
      79FFFFEDD3FFD7AB74FFE7BA7FFFE1B885FFC5A077FFA4825FFF9C7B59FFAA8C
      68FFD4B48BFFF9D8ABFFFFDCADFFFFE2B2FFBB6421FF0000000000000000EFB2
      7CFFFFF1DCFFD4A25AFFD6BB9CFFB48757FFBC762DFFCC8935FFCD9846FF9F80
      49FF705535FFB29771FFF8D9ADFFFFE5B9FFBD6624FF0000000000000000F0B5
      81FFFFF3E1FFDCA34BFF9C6522FFDA8E2EFFF59B34FFE59337FFEA9F3EFFFFCD
      5EFFDCBC74FF7B5F3DFFD1B28BFFFFE8C0FFBE6927FF0000000000000000F1B8
      86FFFFF4E5FFDFB87CFFF9B033FFEF9F2BFFB26F21FFB69370FFD6B38EFFBF7F
      37FFDFAB52FFA78652FFB1916CFFFFEAC7FFC06C2CFF0000000000000000F2BC
      8CFFFFF5E8FFF0E2CDFFE7B34AFFEEA529FFBD7623FF9A5D1FFFA26422FFB26E
      2AFFB87027FFA16629FF9A7859FFFFEDCEFFC27031FF0000000000000000F3C1
      92FFFFF6EBFFEDE0CCFFEAD3A1FFF5C143FFCC8922FFE2A85BFFE7B069FFD389
      2FFFF99F35FFC88131FFA3866BFFFFEED1FFC57537FF0000000000000000F4C5
      9AFFFFF8EFFFE2D1B7FFECD5A0FFF7E2A6FFC09A41FF987752FFB69160FFD18B
      28FFF7A433FFAD793CFFDBC4A8FFFFEFD5FFC97B3FFF0000000000000000F5CB
      A2FFFFFAF2FFFFF7EDFFE3D3B0FFF0DBA0FFF5DC85FFD7AF3CFFDFA228FFF0A8
      2AFFD69639FFC2A47DFFF8E5CCFFFFF0D7FFCD8248FF0000000000000000F7D0
      AAFFFFFBF5FFFFF9F1FFFDF5ECFFDECDAAFFE3D090FFE9D26AFFE8BC44FFE6B6
      49FFC4A579FFE4CEAAFFE4C99DFFFFF1D9FFD18A50FF0000000000000000F8D6
      B2FFFFFCF8FFFFFAF4FFFFFAF3FFFFF9F2FFF9F2E7FFF0E4D4FFEBDBC3FFEDD9
      B4FFE5CA97FFE4C791FFE9D2B2FFFFF1DBFFD6935CFF0000000000000000F9DB
      BAFFFFFDFBFFFFFBF6FFFFFBF5FFFFFAF5FFFFFAF4FFFFFAF3FFFFFAF3FFFFF8
      F0FFFFF7ECFFFFF3E6FFFFF1DEFFFFF2DEFFDB9C68FF0000000000000000FBE0
      C5FFFFFFFFFFFFFEFDFFFFFEFDFFFFFEFDFFFFFEFCFFFFFEFCFFFFFEFCFFFFFC
      F9FFFFFBF4FFFFF8EEFFFFF5E7FFFFF5E5FFDEA573FF0000000000000000FCE1
      C2FFFBE3C9FFFBE1C4FFFBDEBFFFFBDDBCFFFADBB8FFFAD9B5FFFAD7B2FFFAD6
      B0FFF9D4ACFFF9D3AAFFF8D0A6FFF8CEA3FFE4AC79FF00000000}
    StandardFooter.Text = 'Visit www.devexpress.com'
    Left = 632
    Top = 8
    object stBold: TdxBarScreenTip
      Header.Text = 'Bold'
      Description.Text = 'Make the selected text bold'
    end
    object stItalic: TdxBarScreenTip
      Header.Text = 'Italic'
      Description.Text = 'Italicize the selected text'
    end
    object stNew: TdxBarScreenTip
      Header.Text = 'New'
      Description.Text = 'Create a new document'
    end
    object stUnderline: TdxBarScreenTip
      Header.Text = 'Underline'
      Description.Text = 'Underline the selected text'
    end
    object stBullets: TdxBarScreenTip
      Header.Text = 'Bullets'
      Description.Text = 'Starts a bulleted list'
    end
    object stFind: TdxBarScreenTip
      Header.Text = 'Find'
      Description.Glyph.Data = {
        B6280000424DB628000000000000360000002800000060000000240000000100
        18000000000080280000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC04A28B95D3C
        BD5E41BD5C3FBE5B3FBE5B3FBF5B3FBF5B3FBF5B3FBE5B3FBE5B3FBE5B3FBE5B
        3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBF
        5B3FBF5B3FBE5B3FBE5B3FBE5B3FBF5B3FBF5B3FBE5B3FBE5B3FBE5B3FBF5B3F
        BF5B3FBE5B3FBE5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B
        3FBF5B3FBF5B3FBE5B3FBE5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF
        5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBF5B3FBF5B3FBE5B3FBE5B3FBE5B3F
        BE5B3FBE5B3FBF5B3FBF5B3FBF5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B3FBE5B
        3FBE5B3FBE5B3FBE5B3FBF5B3FBF5B3FBF5B3FBE5B3FBE5B3FBF5B3FBF5B3FBF
        5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FC05C3FC25A39AB3C24EE834EE7FFFF
        E7FFFFE7FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FF
        FFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8
        FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFF
        E8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FF
        FFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8
        FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFF
        E8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FF
        FFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8
        FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFE8FFFFF8FFFFC05F43E17A4AD8FDFF
        D8F0F7D8ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7EC
        F1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7
        ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1
        D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7EC
        F1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7
        ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1
        D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7EC
        F1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7
        ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7ECF1D7F1F7E5FFFFBA5B40E17949D8FAFE
        D8EEF4D9EBF0D9EBEFD9EBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA5A3FE17949DAFDFF
        D7EEF2CCDCDBC8D7D6D0E3E4E0F1F4DFEFF1DCECEEE6F7FAEAFBFDE2F3F6E8FA
        FDE1F0F2DCEBEDDEEFF2E6F8FBE5F7FAEAFBFDE1F2F5E7FAFDE2F4F7D5E6E9D8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FEFFBA5A3FE17949D9FFFF
        C4C5BBCCC0B0D8D0C3CAC2B2C9D8D9D9E7EAD7E4E6BBCACDBCCBCDC8D8DAB6C4
        C6D0E0E3D4E5E8CCDCDEBAC9CBBFCED0BBC9CBC5D4D7C3D3D5CDDDE0DCEDF1D8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA5A3FE17949D3F7FB
        C4C1B6F5F1F0FFFFFFE7DDD0ABB3AF6E797D909C9E838D8F484E4E747E7F848F
        91869192ABB8BBA3B0B2848F907C8587555B5C8791934C5253808A8CEBFEFFD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA5A3FE17949D7FBFF
        BCBAAFDAD8D5FDFFFFE6DBCF99A09C7E8A8E9AA6A7BBCACC8F9A9C9EAAADC2D1
        D4848F90BBCACCD0E0E3BBCACDBBCACCA8B5B7C6D6D9A3AFB2AEBCBEE2F4F7D8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA5A3FE17949DBFFFF
        C0C3B9BAB1A1C8C1B5C4BDAECBDADBE1F3F6D6E7EADEEEF0EBFCFDE1F3F5E5F6
        F9D9EAEDE2F3F6DDEEF0E7F8FCE5F6F7ECFDFDE3F5F8EDFEFFE7F8F9D4E5E9D8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA593FE17949D9FBFF
        DAF1F5D4E5E5CFDFE0D4E7E9E0F1F4DCECEFDDEDEFDAEAEDD9EAEDDAEBEED8E9
        ECDFEFF1D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EEF2E6FFFFBA593FE17949D7F9FD
        DAF1F8DDF1F8DCF1F7DBEFF4D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E8EB
        DCEEF1DAEBEED7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E8EBD8E9ECDEF4FCE0F8FFDFF7
        FEDFF7FEDFF7FEDFF7FEDFF7FEDFF7FEDFF7FEDFF6FEDFF6FEDFF6FEDFF6FEDF
        F6FEDFF6FEDFF6FEDFF6FEE0F7FFDEF6FED7EEF4E5FDFDBA5A3FE17949DAFEFF
        D4E7EAC7D1CCC3CDC8CBDADAE0F0F4E3F1F3E0EEF0E8F7FAEDFBFDE6F6F8E9FB
        FDE4F1F3DEEBEDDFEEF0E5F4F6E4F2F4E1ECEEE7F7F9E9F9FBEAF7F8E5F9FCDA
        EBEEE3F1F4E3F1F3E8FBFDE7F5F7E4F4F6EAF9FBDDEBEEE9FCFEE4F3F5E6F0F2
        DFE9EADBEDEFD7E8ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECDBEEF2CACFC8C1BEB3C4C4
        BBC4C4BBC4C4BBC4C4BBC4C4BBC4C4BBC4C4BBC5C5BBC5C5BBC5C5BBC5C5BBC5
        C5BBC5C5BBC5C5BBC5C5BBC2C1B7C9C9BFDEF1F3E6FFFFBA593FE17949D8FEFF
        C2C0B4D1C3B2E1D7CBCEC2B0C4D2D1CDDFE2CDDDDFAFBCBFA9B7BABCCACDAEBC
        BFCADADDCFDFE2C7D7DABAC6C8C3D1D3D0E0E4B3C1C4B3C1C4B2BFC2BCCACDD5
        E7EABFCCCDC2D0D2B5C4C7B7C5C8BFCED0AEBCBFCFDFE2AFBDC0C5D4D7CDDDE0
        818B8CB0BEC1E9FCFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECDFF5FDC7CDC7B8A996CCC8C0C8C2
        B8C8C2B8C7C1B7D1CBC1D0CBC1D5CFC5DAD5CBD6D0C6D6D0C6D2CCC2D6D0C6D7
        D1C7CDC7BDC5BFB5C8C2B8CCC8C0B8A996C7CAC1EEFFFFBA5A3FE17949D3F6FA
        C6C6BDF8F7F7FFFFFFE8DFD2A9B2AD646E718B9698858F91474C4D747E808691
        93818C8DA6B3B5A9B6B85F67686C7576828C8E7882847B8586505758697172C2
        D1D4757F80687071707A7B7B85867E898A818C8EB3C1C3727C7D7C8688818B8C
        606768879294DBECEFDBECEFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE0F8FEBDBEB9D8D2CBFFFFFFF5FF
        FFF5FFFFFFFFFFCED7DAB7BEC3BDC6C998A0A3CDD0D0B9BFC2CDD6D9B6BFC2B5
        BDC1EAF3F4FDFFFFF5FEFFFEFFFFDDDCDABDBFBCEDFFFFBA5A3FE17949D8FDFF
        B9B5AAD0C9C2F2F0EFDFD2C39AA29F8F9A9DA4AFB0C1CED0A3AFB2ACBABCC6D5
        D78B9597C3D3D6D7E7E9D1E0E29CA7A995A1A3D7E8EBA7B4B69CA8ABC3D3D6D5
        E5E8C6D4D6C8D7D9BDCCCEBCCBCEC6D6D9949FA1C3D2D5C8D7DABBCACCA3B0B3
        A3AFB0D2E1E3D3E5E8D9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE0F7FEC0C3BAD5CEC2F9FFFFEEF3
        F3EEF3F3F3F8F8B8BCBCE7EBEB9C9F9F5456568E92918A8C8CA8ABAB6F717171
        7474DFE3E3FCFFFFEEF3F3F6FDFFDAD5CCC1C4BAEDFFFFBA5A3FE17949DBFFFF
        C4CAC3BBB4A5C3C0B3C3C0B3D5E4E5E6F7FADCECEEDEF0F2EAFBFDE4F5F8E2F5
        F8DFF0F3E0F3F6DBEAEDE6F4F6DEEDEFDFF1F4E9FBFEE0F2F6DCEDF0E8FBFDDA
        EAEDE2F1F3E1F0F2E6F8FBE6F7FAE8F9FCDEF0F3D5E6E9E6F9FCE9F9FCE2F4F7
        DBEAECE4F2F4D9E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE0F7FEBFC0B9DED3CBFFFFFFF8FD
        FFF8FDFFFFFFFFC3C8CAB4B9BBE9EDEEF0F4F6E9EEEFE4E7E8E5E9EBFDFFFFC5
        C8CADCE1E3FFFFFFF8FDFFFFFFFFE3DFDCC1C3BEECFFFFBA5A3FE17949D8F9FD
        DDF5FADCF2F7D8EDF3DAEFF3DDEEF1DAEBEEDAECEFD9EAEDD8E9ECD9E9ECD8E9
        ECDCEDF0D8E9ECD8E9ECD7E8EBDBECEFDBECEFD6E7EADAEBEEDCEDF0D7E8EBD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E8EBDCEDF0DAEBEED7E8EBD7E8EBDAEBEE
        DCEDF0D7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE0F7FFBFC4BBD2BEAAFBF3EFF0E6
        DEF0E6DEF3E9E1EAE2DCDDD3CBF9EFE7FAF1E9F6EDE5F8EFE7F7EEE6F7EDE5F9
        F1E9F1E8E0EFE5DDF0E6DEF8F0EBDBC6B4C0C3B8ECFFFFBA5A3FE17949D8FAFF
        D8EDF2D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EAEDD9EBEED9EBEED9EBEED9
        EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEE
        D9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EB
        EED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9
        EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEED9EBEE
        D9EBEED9EBEED9EBEED9EBEED9EBEED8E9ECDAECEFD5E7EAC1C2B7C2BCAFC3C0
        B4C3C0B4C2BFB3C5C2B6C7C4B8C3C0B4C3C0B4C2BFB3C1BFB3C1BFB3C1BFB3C2
        C0B4C2C0B4C1BFB3C1BFB3C1BEB2C0BDB0D2E5E8E9FFFFBA5A3FE17949D8FAFF
        D8EDF2D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9E9ECD8EAEDD0E0E2CDDDDECEDEDFCE
        DEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDF
        CEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDE
        DFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCE
        DEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDFCEDEDF
        CEDEDFCEDEDFCEDEDFCCDCDCD2E3E6DAECEFD7E7E9DBEDF0DEF7FED8F3FBD9F3
        FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9F3FBD9
        F3FBD9F3FBD9F3FBD9F3FBD8F2FADDF7FFDCF4F9E4FCFCBA5A3FE17949D7F9FE
        DAF0F5DAEBEEDCEDF0DBECEFDFF1F4E0F1F4D8E9ECDBEDF0DBEDF0DAEBEEDDEF
        F2E1F2F5DDEEF1DAEBEED7E8EBD8E9ECD9EEF4D2DAD7E7E0D5EAE8E2E4E1DAE5
        E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DB
        E5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2
        DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5
        E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DBE5E2DB
        E5E2DBE5E2DBE5E2DBE9E5DEDBD6CDD3E1E2DAEDF1D6E7EAD3E1E4D5E3E6D5E3
        E6D6E4E7D6E4E6D6E4E7D7E5E7D7E5E8D9E7E9D6E4E7D6E5E7D5E4E6D8E6E8D8
        E6E8D7E5E7D7E5E7D5E4E6D6E4E6D3E1E3D5EAEFE7FFFFBA5A3FE17949D7FAFE
        DAEFF4DDEFF2D8E9ECDFF1F4CEDCDEC4D5D7DFEDF0E1E9EAE0ECEDDDEEF1D1E2
        E6D3E3E6D3E1E3CEDFE2DBECEFD8E9ECD8EEF5DBDFD9CBC3BEF3F4F6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE9E3DBCDD9D7DBF0F5D0E1E3DFE8E9EFF7F8EAF3
        F4EAF3F4ECF5F6EAF3F4EBF4F5E8F2F2E2ECECEAF3F4ECF5F6EEF7F8E9F2F3E9
        F1F2EDF5F5E8F1F2E9F2F3EDF6F7E4ECEDD1E5E9E7FFFFBA593FE17949E9FFFF
        A7B8BCB0BEC08C97998893957781829FABADB4C2C47680817C86889EAAAC8A95
        97585F60909C9DDCEEF1DDEEF1D8E9ECD8EDF3DFE5E1B8B2ACEAECEEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEAE6DFCEDBD9DBEFF4D1E2E5E2ECEEEFF9FAF2FB
        FCDAE5E6DDE7E8CDD9D9C4D1D1CAD6D7CBD7D7DCE7E8D1DDDDCBD7D8C4D1D1C2
        CFCFBECBCBD8E4E4F1FBFCEDF7F8E7F0F1D3E7EBE6FFFFBA593FE17949F0FFFF
        96A6AA7F898B96A2A48C97999FACAE9DA9ACB7C5C799A5A67E888A7F898BB3C1
        C37B8587929DA0E0F2F5DBEDF0D8E9ECD8EDF3DFE5E1B8B2ACEAECEEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEAE6DFCEDBD9DBEFF4D1E2E5E1EBECEEF8F9F4FD
        FED3DEDFC1CDCED3DEDFC9D4D5D9E3E4CCD7D8CCD8D9BAC7C7CED9DACCD7D8CF
        DBDCC4D0D1CED9DAF3FDFEEDF6F7E5EFF0D3E7EBE6FFFFBA5A3FE17949E3FFFF
        BDD0D59FADB0D8E7E9EDF9FBE5F0F1BACBCDD7E5E8F3FFFFD3E2E3CAD6D8ECFB
        FEE3F1F4D0DEE0D8EAEDD8E9ECD8E9ECD8EFF6DADED8CCBFB6F3EFEEFFFFFCFF
        FAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7
        FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFA
        F7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FF
        FAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7FFFAF7
        FFFAF7FFFAF7FFFAF7FFFFFFE9DFD5CDD9D7DBF0F5D0E0E3E4EEEEF4FDFEF2FB
        FCE8F2F2D8E3E3ECF4F5F7FDFEF7FDFDE9F2F3E0EAEBE2ECEDEDF5F6F5FCFCF7
        FFFFF2FAFBEAF4F5F0F9FAF2FBFCE9F2F3D2E6EAE6FFFFBA5A3FE17949D4F7FC
        E3F5F9ECFBFEDBEEF1D7E8EBD8E9ECE2EFF1DBEBEDD5E8EBDFEDF0E1EEF0D4E7
        EADCECEFDFEFF1D7E8EBD8E9ECD8E9ECD9EDF2D3DEDDDFDED6DEE0DAD8DAD4D9
        DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5
        D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DB
        D5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9
        DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5D9DBD5
        D9DBD5D9DBD5D9DBD5DADBD5D5D7D1D6E6E8DAEDF1D3E4E7D7E3E4E1EBEDDDE8
        EAE1ECEEE7F2F2E0EBEDDEE9EBDDE8EAE1ECEDE4EEF0E4EFF1E0EBEDDFEAEBDE
        E9EAE0EBECE1ECEDDDE8EAE0EBEDD9E4E6D3E7ECE7FFFFBA5A3FE17949D8FAFF
        D8EDF3D8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9
        EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E8EBD9ECF1D6EDF2D4E9EED4EAEFD4
        EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEF
        D4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EA
        EFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4
        EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEF
        D4EAEFD4EAEFD4EAEFD3E9EED7EDF3D9EBEFD8E8ECD9EAEED3E4E8D0E1E5D1E2
        E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1E2E6D1
        E2E6D1E2E6D1E2E6D1E2E6D0E1E5D1E3E7D8EEF4E6FFFFB9593FE2814DD6FFFF
        D5FFFFD5FFFFD4FEFFD4FEFFD4FEFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FF
        FFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4
        FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFF
        D3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3FFFFD3FFFFD3FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFF
        D4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD4FFFFD5FFFFD5FFFFD5FF
        FFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FEFFD5FDFFD5FDFFD5FDFFD5
        FDFFD6FFFFD6FFFFD6FEFFD6FEFFD6FEFFD5FFFFE2FFFFB85D43DF5624D68C5F
        D7875BD98759DC8859DE8A58DE8958DD8758DE8758DD8758DB8658DC8658DC86
        58DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC
        8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658DC8658
        DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD86
        58DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD8658DD
        8658DD8658DD8658DD8658DD8658DC8558DC8458DC8458DC8458DC8458DC8458
        DC8458DC8458DC8458DC8458DC8458DC8458DC8458DC8458DC8458DC8458DC84
        58DC8458DC8458DC8458DC8458DC855BDC7D4DDF8C5DE19D75DF946BDF9873E1
        9873D8794AF18643FF9C51FF964FFF984EFF9B4EF6884EBC3F21E13C0EF54300
        F63E00FD5500FC4900FC4900FC4700FF4100F83400FC4900FF5200FF4F00FF4F
        00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF
        4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00FF4F00
        FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E
        00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF4E00FF
        4E00FF4E00FF4E00FF4E00FF4E00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00
        FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D00FF4D
        00FF4D00FF4D00FF4D00FF4D00FF4800FF570AED6A29E15E22E66424EA621AE3
        611BFF6310B85A59513F92704A825D41884D4295DF553CE0340EE5450EFF7C14
        E17A42F86801F29046D77848D67244EC8949E09873E66619FF6900FF6A02FF6A
        02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF
        6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02FF6A02
        FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE69
        02FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE6902FE
        6902FE6902FE6902FE6902FE6902FF6701FF6601FF6601FF6601FF6601FF6601
        FF6601FF6601FF6601FF6601FF6601FF6601FF6601FF6601FF6601FF6601FF66
        01FF6601FF6601FF6601FF6601FF5C00FF822BF17D4FEC5C26F29363F76B0BE4
        5300FF94455063D72D76FF295EFB2E6FFF085DFF915E96F6490EDD3F0EFE7B1B
        D9A28DE3661EF0A375D1A197DBA695E2A890D5C7D2D9652CF94F00F05900F059
        00F05900F05900F05900F05900F05900F05900F05900F05900F05900F05900F0
        5900F05900F05900F05900F05900F05900F05900F05900F05900F05900F05900
        F05700F05700F05700F05700F05700F05700F05700F05700F05700F05700F057
        00F05700F05700F05700F05700F05700F05700F05700F05700F05700F05700F0
        5700F05700F05700F05700F05700F05700F05700F05700F05700F05700F05700
        F05700F05700F05700F05700F05700F05700F05700F05700F05700F05700F057
        00F05700F05700F05700F05700EF4B00F27025F8976FF76830FBB899FFA868ED
        600AFC8D487372C8517CFFF5F8FFBDCFFD004AFF96688DE53A0ED2390EF66E10
        E2BCACCD7B57E38854E68249F0823BEA5801E4B4A2DA723EE84700E55400E554
        00E55400E55400E55400E55400E55400E55400E55400E55400E55400E55400E5
        5400E55400E55400E55400E55400E55400E55400E55400E55400E55400E55400
        E55400E55400E55400E55400E55400E55400E55400E55400E55400E55400E554
        00E55400E55400E55400E55400E55400E55400E55400E55400E55400E55400E5
        5400E55400E55400E55400E55400E55300E55300E55300E55300E55300E55300
        E55300E55300E55300E55300E55300E55300E55300E55300E55300E55300E553
        00E55300E55300E55300E55300E34600E86C24F89871F99671F9AE92FFCDB6EC
        6D34F28444817FC8678EFFCFD5F7AABBF7155CFF97658AD3300EC0320EE55D00
        EB7420E16C21E7640CE64B01E34200DF4100E44F0DE35B08DF4D00E05000E050
        00E05000E05000E05000E05000E05000E05000E05000E05000E05000E05000E0
        5000E05000E05000E05000E05000E05000E05000E05000E05000E05000E05000
        E05000E05000E05000E05000E05000E05000E05000E05000E05000E05000E050
        00E05000E05000E05000E05000E05000E05000E05000E05000E05000E05000E0
        5000E05000E05000E05000E05000DF4F00DE4F00DE4F00DE4F00DE4F00DE4F00
        DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F
        00DE4F00DE4F00DE4F00DE4F00DB4100E26621F9B49DFBB9A8FBCDC3FDA88DE9
        6B41EC8149959FD67BBEFF3069FF467CFF2B85FF85639BC6280ECB4724DD4700
        F06300F76A01F56A02F26D03F16904F06504EE5B01EF5F02EF6403EF6303EF63
        03EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF
        6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303EF6303
        ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED63
        03ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED6303ED
        6303ED6303ED6303ED6303ED6303ED6203ED6203ED6203ED6203ED6203ED6203
        ED6203ED6203ED6203ED6203ED6203ED6203ED6203ED6203ED6203ED6203ED62
        03ED6203ED6203ED6203ED6203EC5D00ED6406FAA871FDA570FB9257FC9255F8
        9A61F1741CDD9068A897BAAD8EA4A187A49189B4C9563AC42A0EFF00FFE75E00
        F26C0CF77E22FA8628FA8728FA8526FB8326FB8326FB8326FB8326FB8326FB83
        26FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB
        8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326
        FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC84
        27FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC8427FC
        8427FC8427FC8427FC8427FC8427FB8326FB8326FB8326FB8326FB8326FB8326
        FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB83
        26FB8326FB8326FB8326FB8326FB8529FA7E21F77614F8801EF88121F88324FB
        8625FA7A1CFC7110FF770CFF7A0CFF790CFF700CF05500FF00FF}
      Description.Text = 'Find text in the document'
    end
    object stPaste: TdxBarScreenTip
      Header.Text = 'Paste'
      Description.Text = 'Paste the contents of the Clipboard'
    end
    object stCut: TdxBarScreenTip
      Header.Text = 'Cut'
      Description.Text = 'Cut the selection from the document and put it on the Clipboard'
    end
    object stReplace: TdxBarScreenTip
      Header.Text = 'Replace'
      Description.Glyph.Data = {
        B63A0000424DB63A000000000000360000002800000060000000340000000100
        180000000000803A0000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC14D2DBC6344
        BD5E42BD5D40BF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B
        3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF
        5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3F
        BF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B
        3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF
        5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3F
        BF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B
        3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF
        5B3FBF5B3FBF5B3FBF5B3FBF5B3FBF5B3FC05D41C45F42AC4029EC7940E8FFFF
        E7FFFFE7FBF9E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FA
        F8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8
        FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8
        E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FA
        F8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8
        FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8
        E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FA
        F8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8
        FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FAF8E8FFFFF7FFFFBB5235E17A4AD7FFFF
        D7F6FFD7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0
        F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7
        F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6
        D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0
        F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7
        F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6
        D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0
        F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7
        F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F0F6D7F7FFE5FFFFBA5A41E17847D8F8FA
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FBFABA583FE17847D8F8FA
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FBFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FAFABA583FE17847D8F8FA
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FAFABA583FE17847D8F8FA
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FAFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FBFABA583FE17847D7F7F9
        DAF2F9DFF7FFDCF4FDDDF6FEDCF2F9D8E9ECD9EAEDD8E9ECDBECEFDBECEFDAEB
        EEDBECEFD9EAEDD8EAEDD9EAEDDAEBEEDAECEFDCEDF0D9EAEDDBECEFDAECEFD7
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8F0F5E6FBFABA583FE17847DAFAFB
        D6ECF1C7C9BFC5C5BAC3C2B8CAD2CDE0F4F6E9FBFFE5F7FADBECEFE1F3F6DFF0
        F3D6E7EAE2F3F7DCEDF0DDEEF1D9EAEDDCEEF1DCEEF1E2F4F7E1F3F6DBECF0DA
        EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E9EDD8EAEDD8E9EDD8E9
        EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD7E9EDD7E9EDD7E9EDD7E9EDD7E9EDD7
        E9EDD7E9EDD7E9EDD7EAEDD7E9EDD7E9ECD8F0F5E6FBFABA583FE17847DFFFFF
        C6D4D1C5B4A0ECE1D5E7D5C8D0C8B8B9CCCEA1ADB0B3C1C48B9799858F91A9B6
        B99AA7A9ADBABDC5D4D7B1BFC1A3B0B29AA6A87D8789A0ACAF8690929EABADDF
        EDEFDAEBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E8EADEF3F9DDEEF1D9E8E9DAEAEBDAEA
        EBDAEAEBDAEAEBDAEAEBDAEAEBDAEAEBDBEAEBDBEAEBDBEAEBDBEAEBDBEAEBDB
        EAEBDBEAEBDBEAEBD9E8E9DFF0F3DEF2F8D6EEF3E6FBFABA583FE17847DEFFFF
        C4D1CDD2CFC7FFFFFFFFFFFFF1F0E6839093363B3C859091959FA04B50517D87
        88909C9D646B6DB0BEC1AFBCBF949FA18C9799666E6F939FA16067697C8688E3
        EFF0DBECEFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECDCF2F6CAD1CBB9AE9EBDB8B0BDB8ABBDB8
        ABBDB7ABC8C2B5C7C1B5C6C1B4CAC4B8C0BAADC9C2B6C7C0B4C7C0B4C9C2B6C0
        B9ADBEB7ABBFB8ACBEB8B1B9AF9ED3D7D2DEF8FAE5FAFABA583FE17847DFFFFF
        C8D5D2B5A793D8D5D1D9CABDD5CEBEA7B8BA9AA7A9B3C1C3E3F1F4BAC8CABECD
        D0C2D2D4A1AEB0D6E7EADCEDF0C8D8DBD2E2E5D2E2E6D8E9ECD0E1E4CFDFE2DC
        EBEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9EFF4B9B1A1CFC7BCDDE1E2D9DBD9D8DA
        D8DFE0DEC9CAC8BEC0BED2D4D1D2D3D1E3E5E3CCCDCBCACBC9DCDEDCD4D5D3DA
        DCD9D9DCD9D9DBD9DFE4E6C5BDB1BCB4A5E0FDFFE5FAFABA583FE17847DBFAFC
        D5EAEFC2C2B7C0C0B5BFBCB1C7CDC7E3F7F9E9FBFFDFF0F3DBEDF0E7FAFDE5F7
        FADFF0F3E2F4F7DCEEF1DAEBEEE1F2F5DFF1F4E1F3F6DCEDF0E2F4F7E0F2F5D6
        E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD4E8EDC3BFB2EDEBE6F5FCFDF2F8F8F7FC
        FDE7EAEBB0B4B4C6C9CA90949567696AA8ACAC949798B0B5B57F82838A8D8EE5
        EAEAFFFFFFF2F8F8F8FFFFE2E0DAC1BDB1DBF8FFE5FAFABA583FE17847D7F7F9
        DAF2FAE0F8FFDDF4FBDEF6FEDCF2F9D9E9EDDAEBEED9EBEED8E9ECD8E9ECD8E9
        ECD9EAEDDAEBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD5E9EEC2BEB1E9E6E1F2F9FAEFF3F3F8FC
        FCD0D4D4A4A8A8E8EAEAA6A9A98183839DA0A0ADB0B0BDC1C1949595757777CE
        D3D3FFFFFFEFF3F3F6FDFFDEDBD4C2BEB1DCF8FFE5FAFABA583FE17848D7F7F8
        D9F1F7DEF5FDDEF5FDDFF6FEDCF1F7D7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D6E7EBDEF0F3E1F3F6D6E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD2E7EBC4BDAFFDFAF8FFFFFFFFFFFFFFFF
        FFFDFFFFC8CDD2C8CED2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8EEF2EA
        F0F5FFFFFFFFFFFFFFFFFFF1EEEBC2BCAFDAF7FFE5FAFABA583FE17848D9F9FA
        D8EFF5C9D0CAC3C7BFC2C6BFCCD7D5E3F6F8E9FBFEE5F7FAE4F6F9E8FBFEE4F6
        F9E3F5F8E5F7FADCEDF1DFF1F4E9FBFEE7F9FCE3F5F8E4F5F9E4F6F9EDFFFFE3
        F5F8DAEBEEE3F5F8EAFCFFE4F6F9E5F7FAE8FAFDE4F5F9E0F1F4DEEFF2E7F9FD
        EAFBFED8E9ECD2E3E6E2F1F4D6E6E9D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EFF5C0BBAEDBC6B3E4D7CEE4D8CDE3D7
        CCE8DCD1EEE2D7E8DDD1E9DED2E7DBD0E5DACEE6DBCFE6DACFE4D9CDEFE4D8E9
        DED2E1D6CAE3D8CCE4D6CDD6C1AEC2BFB3DCFBFFE6FBFABA583FE17848DEFFFF
        C8D8D6C3B4A0E3D8CADFCDBFCCC6B6C2D5D7B7C5C9BDCCCF98A5A79AA7A9B4C3
        C5A5B2B5BDCCCFCDDDDFC0CFD1A5B2B4B2BFC2C4D4D7A9B7B9A8B6B89BA7A9A4
        B1B3D3E4E7BAC8CBA7B4B7A9B7B9A3B0B2B2C0C3A3B0B2C3D2D5BDCCCE9EABAD
        C1CFD097A3A5828D8FD2E0E2DEF0F3D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECDBEFF3D1E0E2BFC0B6C0C0B9C2C4BAC2C4
        BAC2C4BAC2C4BAC2C4BAC2C4BAC2C4BAC1C3B9C0C2B8C0C2B8C0C2B8C0C3B9C0
        C3B9C0C2B8C0C2B8BEBFB8C1C3B8D3E3E5DBF4F7E6FBFABA583FE17848DEFFFF
        C4D0CCD3CEC6FFFFFFFFFFFFEFEDE28895983B4041889395848D8E4247487882
        84859091676F70AEBCBEAAB8BA676F7060686970797A848E8F767F814A505163
        6A6CC1D0D2899496666D6F7A83856F7779747D7F6A7374A3AFB2AAB7B95E6567
        737D7F6A7274666E70BAC9CDEBFEFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E8EBDAEDF2D8F0F9D8F0F7D7EFF7D7EF
        F7D7EEF6D9F0F8DAF1F9D7EEF6D7EFF7D8EFF7D8EFF7D8EFF7D8EFF7D8EFF7D8
        EFF7D8EFF7D8EFF7D8F0F7D8F0F9DAEDF1D8EFF5E6FBFABA583FE17848DFFFFF
        C7D3CFB8AB98E1E1E1E2D5CADBD4C49CACAF828C8EAAB8BADBE9EBA5B2B4B3C2
        C4BCCBCD929D9FCEDFE2D8E9ECD9EAEEA3B0B299A6A7DAE6E7ADBBBEA6B3B5C4
        D4D6D2E2E5CEDEE1D2E3E5C2D2D4BECDCFD7E7EA9AA5A8B1C0C2D8E9EBBDCCCF
        C9D8DB9FACAEB5C3C5DAEBEEDCEDF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EAEDD3E1E4DEE7E8E4EEEFE4EEEFE4EE
        EFE9F3F4E3EDEFE1EBECEAF3F5E7F1F3E8F2F3E5EFF1E6F0F1E5EFF0E4EEEFE7
        F1F3E9F2F4E8F2F3E3EDEEDCE7E7D2E2E4D8F1F7E6FBFABA583FE17848DBFBFC
        D3E7EABDB9ACC1BEB3C0B9ACC6C9C0DDF1F3E7F9FCDAEBEEDFF1F5E8FBFEE6F8
        FBE1F3F6DFF1F4E0F2F5DBECEFE5F7FADEF0F3E0F2F5E8F9FCE2F3F7DBECEFE8
        FAFDDBECEFE0F2F5E0F2F5E5F7FAE7FAFDE5F7FAE3F4F8D5E6E9E2F4F7E8FBFE
        E6F9FCDCEEF1E1F3F6DCEEF1D6E7EAD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD5E7EAD5E3E6EFF8F8EAF4F5EAF4F5EBF5
        F5DBE6E6D2DDDED1DDDCDFEAEAD7E2E2D3DEDFE1EBECDCE7E8E0EAEAE5EFF0E1
        EBECDAE4E5DBE5E6F2FBFCEDF5F6D4E3E5D7F0F6E6FBFABA583FE17848D7F7F8
        DAF3FBDDF3FAD8ECF0D8EEF3DAEFF5DCEDF0DCEDF0DBEDF0D8E9ECD9EAEDD8E9
        ECD9EAEDDCEDF1D8E8EBD8E9ECD7E8EADBEDF0DBEDF0D6E7EADAEBEEDCEDF0D7
        E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E8EBDBEDF0DCEDF0D7E7EAD8E9EC
        D7E8EBDCEDF0DAEBEED7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD6E8EBD5E3E6EDF6F6E2EDEEC9D5D6D2DD
        DEBAC7C7B2BFC0C3CFD0C1CECFBBC8C8B2BFC0D0DBDCBFCBCCBFCBCCDDE8E9BE
        CACBBAC7C8BECBCBEEF7F8EAF2F4D4E3E5D7F0F6E6FBFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD6E8EBD6E3E6EDF6F6E9F3F4C3CFCFCBD7
        D8E1EBECDEE9EAE4EEEFD7E3E3D9E4E5E5F0F0E4EEEFDFEAEBDFE9EAEEF8F9D8
        E3E4D1DDDDCAD5D6EDF7F8EAF3F4D4E3E5D7F0F6E6FBFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E9ECD3E1E4E9F1F1EEF7F8E3ECECE4ED
        EEF2FAFBF3FBFCF3FCFCEBF4F5EEF7F7F2FAFBF0F8F9F1FAFBF1F9FAECF5F6ED
        F6F7EBF4F4E9F1F2EEF7F8E7EFEFD2E1E3D7F1F7E6FBFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E8EBD9EBEFD8
        EFF5D7EEF4D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3
        D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7ED
        F3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7
        EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3
        D7EDF3D7EDF3D7EEF4D9EEF4D9E9ECD9EAEDD4E4E7D4E2E3D8E5E7DDEAECDCE9
        EBD6E4E6D7E4E6D6E4E6D9E6E8D8E6E8D7E4E6D7E4E6D7E4E6D7E4E6D7E4E6D8
        E6E8D9E7E9DAE8EAD8E5E7D4E2E3D4E4E7D9F2F7E6FBFABA583FE17848D8F8F9
        D8EFF5D8E9ECD8E9ECD7E8EBE0F2F5DDEEF1D7E8EBD9EAEDD9EAEDD9EAEDD9EA
        EDD8E9ECD8E9ECD8EAEDD8E9ECD9EAEDD9EAEDD9EAEDD8E9ECD9EBEFD7E7E9D2
        D8D4D2D8D2D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4
        D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9
        D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3
        D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4D3D9D4
        D3D9D4D3D9D4D2D6D0D4DCD9D8EAEED8E9EDDAECEFD4E7EBD2E5E8D2E6E9D2E6
        E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2E6E9D2
        E6E9D2E6E9D2E6E9D1E5E8D5E8ECDAECEFD8F0F4E6FBFABA583FE17847D5F7F9
        DEF5FBE0F1F4E4F6F9E6F8FBCADADDD7E8EBEDFFFFE4F6F9E1F2F5DDEEF1E6F8
        FCD8EAEDDFF1F4E8FBFEE9FBFFE6F8FBE1F2F6DCEEF1D5E6E9DAEFF5CFD9D7E7
        DBD0F6EFE9F7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EA
        F7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0
        EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7
        F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EAF7F0EA
        F7F0EAF7F0EAF6EEE7DED7CDCFE1E2DAEDF1D5E5E8D3E1E4D5E4E6D4E3E5D5E4
        E6D5E4E6D5E3E6D5E4E6D9E7EAD9E8EAD4E3E5D7E5E8D7E5E8D6E4E7D6E5E7D6
        E5E7D4E3E5D4E3E6D5E4E6D2E1E4D5E6E9D9F1F7E6FAFABA583FE17848E2FCFD
        C2D7DDBDCCCFB1BEC1A4B1B3879193919C9EA4B0B38A959794A0A2B5C3C6919D
        9ECAD7D9C7D7D99BA7A99EAAACA3B0B2B8C6C9B8C6C9D9EAEDDBF0F5CED8D6F2
        EDE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE6E3DECDDDDDD7EBEFD3E1E3E4ECEDE9F2F3E7F0F1E8F1
        F2E9F3F3EBF3F4ECF5F6E1EBEBDDE7E7EEF7F8E8F1F2E8F1F2E5EFF0E8F1F2E8
        F1F2E8F1F2E7F0F1EAF2F3E2EBEBD2E1E3D8F1F7E6FAFABA583FE17847F3FFFF
        9FB2B670797B8A95976D76777881836E77796E77786870726F787998A4A65157
        58B0BBBCAEBCBE6870726067685057586C75779EABADE0F1F4DDF2F6CFD9D7EE
        E8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE3E0DACEDFDFD5EAEED6E3E7ECF5F5EDF7F8EFF9FAE4EE
        EFDBE6E7E0EAEBCED9DAC0CDCDC7D3D3D4E0E0C9D5D6C2CECEDBE5E6CCD8D8CD
        D9D9EEF7F8EEF7F8EEF8F9EAF3F3D4E3E5D7F0F6E6FAFABA583FE17847EDFEFE
        ACBFC56B7475BCCACDDAEAECC1D0D3B0BEC0B1BFC2D8E8EBC8D8DBC5D4D7CADA
        DDCBDCDFD5E6E9DAECEFC0D0D28A9497A0ACAED4E5E8D6E7EADBF0F5CED8D6F2
        EDE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE6E3DECDDDDDD6EAEED5E3E6E9F2F3EBF5F6F0F9FADEE9
        EABFCBCCCDD9D9C2CECFBECBCBCDD9DAC4D0D0C1CECEC0CCCCD7E2E2C4D0D0C3
        CFCFECF6F6ECF6F7ECF6F7E7F1F1D4E3E5D7F0F6E6FAFABA583FE17848DAF8F9
        D5ECF2C9D9DCDAEBEEE4F5F8E7FAFDE4F7FADAEBEEE2F3F7E3F5F9E2F4F7E4F5
        F9DDEFF2DCEDF0E2F4F7DEF0F3E0F2F5E3F4F8E2F4F7D8E9ECD8EEF3CFD9D7E7
        DBD0F6EFE8F6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EA
        F6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0
        EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6
        F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EAF6F0EA
        F6F0EAF6F0EAF5EEE7DED7CDCFE1E2D5EAEED6E3E6ECF5F6EEF8F8F0F9FAE9F3
        F4CCD8D9D8E3E4EFF7F8EDF6F7EBF5F6E0EAEBE5EFF0F1FBFCE9F3F4ECF5F6ED
        F6F7EEF8F8EDF6F7EFF9FAEAF4F4D4E3E5D7F0F6E6FAFABA583FE17848D6F8F9
        DCF3F9E3F5F8DAEBEED7E8EBD8E9ECD9EAEDDBECEFD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD7E8EBDAEBEEDCEDF0DAEBEED7E8EBD8E9ECD9EBEFD7E7E9D2
        D9D4D2D8D3D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5
        D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9
        D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3
        D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5D3D9D5
        D3D9D5D3D9D5D2D6D1D4DCD9D8EAEED8EAEDD3E1E4E2EBECE7F0F1E5EEEFE8F1
        F2E3EDEEE4EEEFEAF3F4E8F2F3E8F2F3E8F1F2E9F2F3E8F1F2E7F1F2E8F1F2E8
        F1F2E5EEEFE5EFF0E8F1F2E1EAEAD2E1E3D8F1F7E6FAFABA583FE17847D8F8FA
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E7E9DBEEF2D5
        EFF7D1EAF1D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0
        D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EA
        F0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1
        EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0D1EAF0
        D1EAF0D1EAF0D1EBF2D7F0F7DAEBEED9EAECD6E7E9D3E3E5D5E5E7D5E4E7D5E4
        E7D6E6E9D6E5E8D4E4E7D5E4E7D5E4E7D5E5E7D5E4E7D5E4E7D5E4E7D5E4E7D5
        E4E7D5E4E7D5E4E7D5E5E7D3E3E6D6E7EAD9F1F6E6FAFABA583FE17847D5F7F9
        DFF6FCDCEDF0E2F3F6E2F4F7E4F6F9EAFCFFDCEEF1DEEFF3E3F5F8E1F3F6E0F2
        F5EBFEFFE8FBFEDDEFF2D7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD9ECF1D5E3E4D7
        D6CFDBDBD4DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6
        DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDC
        D6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DB
        DCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6DBDCD6
        DBDCD6DBDCD6DAD9D1D6D9D3D6E8EBD9EBEED8EAEDD1E4E7D0E3E6D1E3E6D1E3
        E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1E3E6D1
        E3E6D1E3E6D1E3E6D0E2E6D2E4E7D9EAEDD9F0F5E6FAFABA583FE17848DAF9FA
        D2E8EEDEEFF2CDDDE0D1E1E4C5D5D8B5C4C6D3E4E7D5E6E8CDDDDFD4E4E7CBDB
        DDB8C7C9C3D2D5CDDDE0DAEBEED8E9ECD8E9ECD8E9ECD8E9ECD9EFF5CED7D4EE
        E2D8FFFAF7FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8
        FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFB
        F8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FF
        FBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8FFFBF8
        FFFBF8FFFBF8FFFAF6E2DAD2CDDFDFD9ECF1D3E2E4DBE5E7DFEAEBDDE8E9E1EC
        EDE0EBECE3EEEFE2EDEFE5F0F1E4EEF0E0EBEDE3EEEFE3EEEFE3EEEFE4EEF0E5
        F0F1E2EDEEDDE8E9DFEAECDAE5E6D3E2E5D8F1F7E6FBFABA583FE17847EDFFFF
        A0B2B7ABB8BA848E906A72747B85867D8789B2C0C2828C8E61696A7D8788929E
        A04D5354565D5EC5D4D7E1F3F6D8E9ECD8E9ECD8E9ECD8E9ECD9EEF3CFD9D7EF
        EAE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE4E1DCCEDFDED5EAEED5E2E5EEF6F7F1FAFBF0FAFBEBF5
        F5EFF9F9E5EFF0EAF3F4DFE9EAE2ECECECF5F6E8F1F2E5EEEFE6F0F1E4EDEEE2
        ECECE9F2F3F0F9FAF2FBFCECF5F4D3E2E4D7F0F6E6FAFABA583FE17847F4FFFF
        93A4A9737D7EA7B4B698A3A6B9C8CA8B9698AFBDBFB9C8CA949FA26F787ABDCC
        CFACB9BB7A8486BCCBCDE1F3F6D8E9ECD8E9ECD8E9ECD8E9ECD9EEF3CFD9D7EE
        E8E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE3E0DACEDFDFD6EAEED5E3E6E9F2F3EBF5F6F1FBFCCFDA
        DBD6E1E2C3CFD0BDC9CABECACACAD7D6D7E3E3BECBCBC4D0D0BDCACABCC9C9B3
        C1C1CDD9D9F2FCFDECF6F7E7F1F1D4E3E5D7F0F6E6FAFABA583FE17847E1FAFB
        C5DBE1ACBABCD6E6E9F0FFFFEDFFFFCADADCCEDFE1F0FFFFE0F1F5D0E1E4E4F7
        FAECFEFFDEF0F3D5E5E8D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9EEF3CED7D4F4
        EDE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE7E3DDCCDDDCD6EAEED5E3E6E9F2F3EBF5F6F4FCFCCAD6
        D6C1CDCED9E4E5DAE4E6E0EAEAD4DFDFCED9DABECBCBDCE6E7D8E4E4DCE7E8D5
        DFE0D3DEDFF0FAFBECF6F7E7F1F1D4E3E5D7F0F6E6FAFABA583FE17848D3F7F8
        E2FAFFECFEFFDDEFF2D7E8EBD5E6E9E1F3F6DEEFF2D5E5E9DCEDF0E2F3F6D7E8
        EBD7E8EBDEEFF2DAEBEED7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD9EEF3D1DDDCE0
        D7CDEBE5DEEBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0
        EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6
        E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EB
        E6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0EBE6E0
        EBE6E0EBE6E0EAE4DBDAD6CDD2E4E6D6EAEED4E1E4ECF4F4F0F9FAF1F9F9E7F1
        F1DEE8E8F0F9FAF8FFFFF6FEFFF0F8F9E7F0F1EAF3F4EEF7F7F7FFFFF6FFFFF4
        FCFDF1F9FAEEF7F8F1FAFBEAF3F2D3E1E3D7F0F6E6FAFABA583FE17948D8F7F9
        D8EFF5D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EAEDD9EAEDD0
        DDDCCED9D6CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8
        CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDA
        D8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CE
        DAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8CEDAD8
        CEDAD8CEDAD8CDD8D5D3E1E1DAECEFD9EBEED3E3E6D7E3E5DBE7E9D8E5E7DFEB
        EDE3EFF0DCE8EAD9E6E7DAE6E8DCE8EADEEAECDEEAECDCE8EADAE6E8DAE6E8DB
        E7E9DBE7E9DAE6E8DBE8E9D6E3E4D3E3E6D9F2F7E6FAFABA583FE17F4DD8FFFF
        D9FEFFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8
        FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F8FFD8F7FFD9F8FFDA
        FCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFF
        DAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFC
        FFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDA
        FCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFFDAFCFF
        DAFCFFDAFCFFDAFDFFDAFCFFD8F8FFD9F8FFD9F9FFD2F3FCD1F2FBD2F2FCD2F2
        FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2F2FCD2
        F2FCD2F2FCD2F2FCD1F2FBD3F3FDD9F9FFD9FFFFE6FFFFBA5B44E07444D2E8EB
        D0DFE6D1D9DDD1D8DDD1D8DDD3DADCD3DADDD1D9DED1D9DED1D9DED1D9DED1D9
        DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1
        D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DED1D9DE
        D0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9
        DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0
        D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DE
        D0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED0D9DED1DADFD1DADFD1DADFD1DA
        DFD1DADFD1DADFD1DADFD1DADFD1DCDFD2D7DAD5CFC8D5D0CAD5CFC9D5D1CAD4
        D1CBD2D9DADAD3C9E0D2BFDFD1BFDFD1BEDED5C4E1E7E0BB573CDE4714E05E0F
        E35D0EE86310EE640AEE660CE45500EB5D08EB620FEC5F0AEF600AEE600AED61
        0CEC600BEF610AE96111E86011E86011E86011E86011E86011E86011E86011E8
        6011E86011E86011E86011E86011E86011E86011E86011E86011E86011E86011
        E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F
        10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E95F10E9
        5F10E95F10E95F10E95F10E95F10E85E11E85E11E85E11E85E11E85E11E85E11
        E85E11E85E11E85E11E85E11E85E11E85E11E85E11E85E11E85E11E85E11E85E
        11E85E11E85E11E85E11E85E11E85B10E76014E17841DE7239DF6F36DF7545E2
        7641E7570EEB6A25DF6F3BE1723CE06F3BE4743EFA6017C33513E44410FA5800
        F94E00FD5A00F85E00FF6B00EA8444E25200FF5300FF5800F85100FD5800F85F
        00FD5300FE5D00FF6100FF6300FF6200FF6200FF6200FF6200FF6200FF6200FF
        6200FF6200FF6200FF6200FF6200FF6200FF6200FF6200FF6200FF6200FF6200
        FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF61
        00FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF6100FF
        6100FF6100FF6100FF6100FF6100FF6000FF6000FF6000FF6000FF6000FF6000
        FF6000FF6000FF6000FF6000FF6000FF6000FF6000FF6000FF6000FF6000FF60
        00FF6000FF6000FF6000FF6000FF5800FF7B23E97A4DE66E39EC7E45ED671CEA
        6D25FF863B7B69AA2E49D1324CC92A4AD02E55E7CA685CEB3C10E43D10F8822D
        E19C78ED9B66DDB3A1CD8669E5B4A0CB9180E08A5EE4B199DBB3A7D7A290E878
        39E5AD90C38677F25801FF6701FB6501FB6501FB6501FB6501FB6501FB6501FB
        6501FB6501FB6501FB6501FB6501FB6501FB6501FB6501FB6501FB6501FB6501
        FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB64
        01FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB6401FB
        6401FB6401FB6401FB6401FB6401FB6200FC6100FC6100FC6100FC6100FC6100
        FC6100FC6100FC6100FC6100FC6100FC6100FC6100FC6100FC6100FC6100FC61
        00FC6100FC6100FC6100FC6100FC5800FA8644F47243F88759FBA36EFE5800F0
        5E00F19C6F395CE7628EFF4D7AF75D8EFF0A60FF855F91F84810DA3010F78F46
        E6D5D4DBADA0DFD4D8E4B09CE5A282E9B6A3E1AE9CD7BCBEEFDBD7DFBBB4E689
        5AEBDAD7D8B1AAE74903F15600ED5700ED5700ED5700ED5700ED5700ED5700ED
        5700ED5700ED5700ED5700ED5700ED5700ED5700ED5700ED5700ED5700ED5700
        ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED55
        00ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED5500ED
        5500ED5500ED5500ED5500ED5500ED5600ED5600ED5600ED5600ED5600ED5600
        ED5600ED5600ED5600ED5600ED5600ED5600ED5600ED5600ED5600ED5600ED56
        00ED5600ED5600ED5600ED5600EB4800F38144F9946FF67643FAB998FE934FEF
        6412EB92655968D76081F7FFFFFFAEC2FA003EFFA56D85DE3810CD2E10F28137
        E5B298DD8D64E97535F6711AEC7124EC6424E78B59DC7A48ED5C16EC691BE471
        30E8681EF07122E65000E35300E45400E45400E45400E45400E45400E45400E4
        5400E45400E45400E45400E45400E45400E45400E45400E45400E45400E45400
        E45400E45400E45400E45400E45400E45400E45400E45400E45400E45400E454
        00E45400E45400E45400E45400E45400E45400E45400E45400E45400E45400E4
        5400E45400E45400E45400E45400E45300E45300E45300E45300E45300E45300
        E45300E45300E45300E45300E45300E45300E45300E45300E45300E45300E453
        00E45300E45300E45300E45300E04300EE8349FBA384F99A75FBC5B2FFC3AAEA
        5914E29067727FDC87A3FAB0BBF398ABF52D69FF996385D13110BE3010E25C00
        EA701AED6C0DE94B00E34E00E24800DF4000E35607E44C00DF4000DF4300E043
        00DF4000DF4200E15200E05000E05000E05000E05000E05000E05000E05000E0
        5000E05000E05000E05000E05000E05000E05000E05000E05000E05000E05000
        DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F
        00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF
        4F00DF4F00DF4F00DF4F00DF4F00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00
        DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E00DE4E
        00DE4E00DE4E00DE4E00DE4E00D93800E98957FCC4B8F9BEAEFAC9BEFB9372E8
        6A3BE18E6791ACFE75B2FF2764FF4780FF2A8AFF916C92C31D10CC4806DC4000
        F26700F76E00F77507F47207F36D06F26907F06100F16401F16906F16806F168
        06F16806F16806F16806F16806F16806F16806F16806F16806F16806F16806F1
        6806F16806F16806F16806F16806F16806F16806F16806F16806F16806F16806
        EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF67
        06EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF6706EF
        6706EF6706EF6706EF6706EF6706EF6606F06606F06606F06606F06606F06606
        F06606F06606F06606F06606F06606F06606F06606F06606F06606F06606F066
        06F06606F06606F06606F06606EE5C06F27A25FDB07CFB9658FB8E4DFB8E4BF7
        9958F17421DB9572B08C9DBB9297AB8696A38B9FCF4D28C32A05FF00FFE7682B
        EE6C1AF77F26F9882CFA892CFA882BFB872BFB862AFB862AFB862AFB862AFB86
        2AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB
        862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862AFB862A
        FC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC87
        2BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC872BFC
        872BFC872BFC872BFC872BFC872BFB862AFA852AFA852AFA852AFA852AFA852A
        FA852AFA852AFA852AFA852AFA852AFA852AFA852AFA852AFA852AFA852AFA85
        2AFA852AFA852AFA852AFA852AFB882AF97C1DF87916F88223F88224F88628FB
        8726F8791AFF7411FF7911FF7B11FF7A11FF6E11F45E18FF00FF}
      Description.Text = 'Replace text in the document'
    end
    object stCopy: TdxBarScreenTip
      Header.Text = 'Copy'
      Description.Text = 'Copy the selection and put it on the Clipboard'
    end
    object stAlignLeft: TdxBarScreenTip
      Header.Text = 'Align Text Left'
      Description.Text = 'Align text to the left'
    end
    object stAlignRight: TdxBarScreenTip
      Header.Text = 'Align Text Right'
      Description.Text = 'Align text to the right'
    end
    object stAlignCenter: TdxBarScreenTip
      Header.Text = 'Center'
      Description.Text = 'Center text'
    end
    object stAppMenu: TdxBarScreenTip
      Header.Text = 'Application Menu'
      Description.Glyph.Data = {
        B6260000424DB62600000000000036040000280000005E0000005C0000000100
        08000000000080220000130B0000130B000000010000000000002466E4001C82
        EC009C8E84008CC2E400D4C2AC00D4E2DC00ECC69400D4D2CC00BC968400FCE2
        B40034BAFC00CCA68C00F4F2E400D4AE9C00DCC2B400ECD6BC00ECE2DC00748A
        8C00D4D2D4005CBEF400A4DEFC00DCC2C400F4EADC0024AAFC00ECD6CC00BCBE
        C400D4BABC00FC02FC00D4DADC0074D6FC00FCF2DC00D4BAAC0074BAEC00CC42
        CC003492EC00BCC2C400FCEEDC00CCC6CC00ECCEB800C4AAA400E4CAA40094AE
        BC00ECEAEC001492E400BC9A9400FCEACF00FCDAB400DCCAC500ECDECD00FCF2
        F400CCF6FC00E4D2BC00F4E2DE006CA2D400B4E2FC00E4DAD70074CEF400148A
        D800ACA2F4004CBAF400D4B6AA00E4D2D40024B2FC00DCBAB000A46ACC00CCCE
        D400F4EAEC00E4CAC4009C968C00E4E2E500F4E2D400F4DEBC00CCB6A800ACD2
        CC00CCB2A800DC9ABC008CDAE400F4CEA400ECF2F400E4C2B400F4D6BC00DCD2
        D400F4DACC00EC22EC007CC2EC00ECD2CC00DCCABC00FCFAFC00248ADC00CCAE
        9400D4B2AC006C96B4005CC6F400ECDADC00DCDADA00D4C6C400F4D2B400CCA2
        9C00DCCED400E4D2CA00F4E6EC00B4EEF400BC6AD400ACDAF400F4F2F400E4CA
        BA00D4C2BC00ECCAAC00D4DAC4002CCEFC00CCA69C00D4B2A200ECE6EC0094EE
        F4003C9EDC00ECDACE00FCF2EC00D4BEB200ECD2BC00CCAAA400ECEEF100C4A2
        9400DCCEC900F4DEDC00FCF6F900F4E6E20084AABC00E4DEE400148EE8004472
        D400CC5EE4006482D40084EEFC001C7EE40064B2F4003CB6E400C48AB400B486
        6C008CBEE400BC76F400F42EF40094A2AC005C8EB40044C2FC009CD2F400E4BA
        D4006CBAEC004492EC00A4F2F40044AAE4008CCEF400C472EC00FC0AFC0034C6
        FC0084BEE40084CEF4006CCAEC00C4EAFC00BCD6EC00DCF2FC0054C6FC0034B2
        FC00CCE2F400649ACC003C9AE4006CDEFC00149AF40094DAFC00FCDEC400248E
        F400C4BAB400C49E8800D45AF4009C9E9C00F4CA9400A49A9400FCE2D00084C2
        E9009CEAFC0044B2EC00C47AEC00FC32EC00D4E6EC00FCE6C400C4C6C400CCBA
        B400DCDEE400B4D6F40034D2FC00DCD2CB00C4967C0074A2CC00D4CECE00BCEE
        FC00FCEEEC00ECDEDC00BCE2FC00D4B6B400CCB2B40094BEE4001C86E400CCAA
        9400DCC6BC00ECDAC400ECE6E400D4D6D400F4EEE400CCCAC900FCEED400FCDE
        AC00E4D6B400E4DEDC00DCBEB200F4EEEE00E4CECA00E4E6E700CCBAAC00E4C6
        B900F4DAC400DCD6D800DCDEDC00E4D6CC00F4F6F900E4CEBA003CA2E400CCAE
        A5009CD6FC00FC0EF40084D2FC00C4BEBC00FCE6CC0084C6EC009C9284005CC2
        F400DCC6C400D4BEBC00E4D6D400F4D2A400D4CAC400D4C6BC00CCAA9C00FCF6
        EC0044C6FC00BCDAEC00D4C2B400ECC69C00FCE2BC00D4AEA400DCC2BC00ECD6
        C400ECE2E400D4D2DC00F4EAE400ECD6D400FCF2E400D4BAB4001B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B52DA73DA73
        DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73
        DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73
        DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA73DA1B0000767676767660
        7676766076767660767676607676766076767660767676607676766076767660
        7676766076767660767676607676766076767660767676607676766076767660
        7676766076767660767676607676766076767660767676750000262626262626
        2626262626262626262626262626262626262626262626262626262626262626
        2626262626262626262626262626262626262626262626262626262626262626
        2626262626262626262626262626262626262626262626750000767660607660
        7660766076607660766076607660766076607660766076607660766076607660
        7660766076607660766076607660766076607660766076607660766076607660
        76607660766076607660766076607660766076607660767500000FF9F918F9F9
        F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9
        F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9F91850F9
        F91850F9F91850F9F91850F9F91850F9F91850F9F9F9DA040000CB7D7C317C31
        7C317C317C317C317C317C317C317C317C317C317C317C317C317C317C317C31
        7C317C317C317C31D5CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCD375000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C702A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10040000CBD55757BBB6
        9EC7C75757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A1004000073C2575754B6
        A117A45757575757575757575757575757575757575757575757575757575757
        5757575757575757DE2AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10040000CBD55757B105
        8F3EE05757575757FA10FD5D5DC37C5D42C3D52F7343FA5D18FA5D7D31575757
        57575757575757577C2A2A2A162AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A1075000073D55757E7DB
        A00A955757575757FD62D4756FFFD5F0CA3FFAE1EAC51F636F75F8D430575757
        57575757575757577CCC2AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10040000CBC25757E7D2
        1D8FB35757575757D57D57575757574257575757575742575768575757575757
        57575757575757577C2A2A2A2AFC2A162A162A162A162A162A162A162A162A16
        2A162A162A162A162A162A162A162A162A162AFC2A2A1004000073D55757B106
        499C135757575757573434575757575757575757575757575757575757575757
        57575757575757577C2AFC2AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10040000CBD55757C49B
        9B9BA757575757573C6A4AAB2457575757575757575757575757575757575757
        57575757575757577C2A2A2A2ACCFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162A1075000073C257575757
        57575757575757571FFDEC6E7457575757575757575757575757575757575757
        5757575757575757DE2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10040000CBD557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162A162AFC2A2A2A1004000073D557575757
        5757575757575757DE6868686868686868686868686868686868686868686868
        686868686868680C2A2A2AFC2A162A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFC2A10F40000CBC257575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162A2A2A107500007368575757D5
        7870575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFC2A2A10040000CBD55757EEE8
        4402AFDB57575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A2A2ACCFC4504000073C2575745D7
        5EC0AA5E57575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2ACC2AFC2A2A1004000073D5575737DF
        7628C02A5757575743DD3F7A5A34EBD60B70F8F4D443E173EC2F5A3CCA3C2F6E
        3C371857575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A2AFC1004000030D55757572D
        2DED74575757575755C3FAFA7331EA306457C37C34427D64732A55D53468FA42
        7DCC3457575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2ACC78CC2A2A45F40000CBC2575757FE
        FEA8F15757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162AFC2A1004000073D557575774
        F1E6575757575757D4EC73557AD6637457575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A1004000073D557575757
        57575757575757577979C9592C50575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2AFC2A10F40000CB7457575757
        5757575757575757D57C31577C57575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A1004000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162A2A2A1004000030D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A162A10F4000073C257575757
        57575757575757573DD9EAD6CAECD4183DC26255CA7D3755CCD4634342C33CD6
        7A695757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2A2A1004000073D557575757
        5757575757575757514373C35DD6EC637AFC5D37E173D53437ECECFA4218EC63
        5D735757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFC2A2A10F4000073D557575757
        57575757575757577D646831FAFCD5C242345DD5C2426857646442D557FA7DD5
        31347C68575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A2A2A2AFC45040000737457575757
        57575757575757573D3C3C1A3C3F62432FB96FC5632FE1C2EB4ACAF770D42F5A
        1AE15643575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A162A2A10F4000073D557575757
        5757575757575757C37C57575757575757575757575742FC5757575757575757
        57575731575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2AFC1004000030D557575757
        57575757575757575757575757577C5757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A45F4000073C257575757
        5757575757575757FA5AD4FF43106F793CD67357575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162A162A1004000073D557575757
        575757575757575759CA0ECA0ED67A6F0E575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2AFC2A10F40000737457575757
        5757575757575757575757575757575757575757575757575757575757575757
        5757575757575757DE2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162A2A2A1004000030D55757E6DA
        50504D5757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A162A10F4000073C25757E6B7
        D1D1AE3157575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2A2A10F4000073D557572424
        2DF64D7C57575757FA107D10FA73C342106818FA73D57D42C3105D737DFAC374
        42575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFC2A2A10F4000030D55757FEFE
        FED02E7457575757733DEBF81F5AD4186A105A75E1EA0E5D3CEA2F3D1FFF3C56
        43575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A2A2A2AFC4504000073C25757F1F1
        F150F57C57575757423157577C5757575757C2C2577C3157D557575757575757
        7C575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A162A2A10F4000030D55757F157
        F1B0E65757575757107D57575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2AFC10F4000073D55757F1F1
        F174575757575757EB086F77D457575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A45F4000030C257575757
        57575757575757571FCADDDD7D57575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162A162A1004000030D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        5757575757575757DE2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2AFC2A10F40000737457575757
        57575757575757575757DE7C57577CDE7C575757DE577C5778D5685757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000030D55757D545
        5ECD70685757575751C0CDC07F7FCFDB4151C068DBC04107EECF12DB57575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2AFC2A2A2A10F4000073D5577C2A7F
        12255ED5575757577C577C7C68DE7C7CDE7CD57CDE427C7C577C7C5757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A162A10F4000030C2577C7870
        45BA70D5575757572ADB457FD3D7704568704568D54545DE452AD7D5D72A4545
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2A2A10F4000073D5577C6878
        D52A2A685757575742CDBA5ECD5E12BA70CD5E7FBA12FB68D7DBC0422A7FD345
        7C575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2AFC2A2A10F4000030D5575731DE
        D5D57868575757575757577C57575757577C57577C6857575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A2A2ACCCE45F4000073C2577C7C57
        7CDED5D5575757572AD557575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A78CC2ACE2A2A10F4000030D557575757
        5757575757575757CD23E519255E575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A2AFC10F4000073D557575757
        575757575757575745D5D568687C575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A45F4000030C257575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A162A162A162A162A162A162A162A162A162A
        162A162A162A162A162A162A162A162AFC2A162A162A10EF000073D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000030D557575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A
        FC2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2AFC2A10F4000073C257C41D5C
        E9139B5757575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A162AFC2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000030D55714A5BC
        6D99874E5757575757575757575757575757575757D557575757575757575757
        57575757575757577C2AF0BDCAEF56CA0E56CADDCA6337162A162A162A162A16
        2A162A162A162A162A162A162A162AFC2A162AFC2A2A10EF000073D557C1B284
        84714CF357575757EC3F7A3F37D4420ED92FEAF8100DFA637D7D57ECEBF95757
        5757575757575757DE2AEF7A1FEBF47AFF48E1754A2F302A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A10F4000030C25732947C
        0C24DA4E57575757FDEA733D63ECD5FD5D3D2F4373D6C343CA4A7D77F8C35757
        57575757575757577C2ACC2ACC2AFC2A2A2A2A2ACC2A2AFC2AFC2AFC2AFC2AFC
        2AFC2AFC2AFC2AFC2AFC2AFC2AFC2A162AFC2A162AFC45F4000073D55757650C
        24F6AECE57575757575757575757575757575757575757575757575757575757
        57575757575757577C2A2A2A2A2A2A2A2A2A2A2A2A2ACC2ACC2ACC2ACC2ACC2A
        CC2ACC2ACC2ACC2ACC2ACC2ACC2ACC2A2ACC2A2A2A2A10F4000030D557575724
        7DD5575757575757632FD942104234D557575757575757575757575757575757
        57575757575757577C2A2A2ACC2A2ACCFC2ACC2ACC2A2A2A2A2A2A2A2A2A2A2A
        2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2ACC78CC2ACC2A10EF000030C257575757
        57575757575757573C2789ABAB0BCCC257575757575757575757575757575757
        57575757575757577C2A594A3C48C9BD566A3C1F75481F4AC956D80ECC2ACECC
        2ACECC2ACECC2ACECC2ACECC2ACECC2ACE2A2A16782A10F4000030D557575757
        5757575757575757FA3457575757575757575757575757575757575757575757
        57575757575757577C2A5ABDBDD62FBDCA6A5F632F37CA7A7A7A75632A2A2A2A
        162A2AFC2A2AFC2A2AFC2A2AFC2A2AFC2A2A162A2ACCCCF400007310FC42FC42
        FC42CE42CE42CE42FCFC42FC42FC42FC42FCD5FCD5FCD5FCD5FCD5FCD5FCD5FC
        D5FCD5FCD5FCD5FCCC45103010D31030C3103045C3301010C310301010101010
        D31010D31010D31010D31010D31010D31010D310101030F400005526DF262626
        2626B0506B59AB0808AB0D6B26262626262626DF2626DF2626DF2626DF2626DF
        2626DF2626DF262626DF26DF26DF26DFDF26DF26DFDFDFDF26DFDFDF26DF26DF
        26DF26DF26DF26DF26DF26DF26DF26DF26DF26DF26DFDFF40000CB7352525252
        52F66B27BFF2BCBCBCF25B445926525252525273527352735273527352735273
        5273527352735273735273527352735273527352735252527352527352CBDA73
        DA73DA73DA73DACB52CBDA73DACB52CB52CB52CB523052EF0000734646464646
        461F7E6DBCA0A5A5A5BCBCBC5B084F4646464646464646464646464646464646
        4646464646464646464646464646464646464646464610464610464646464646
        46464646464646464646464646464646464646464646469100001BDFDFDFDFF6
        04876D6DBCA0A5A5A55CBC6D6D87086BDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1B00001B1B1B1B1B60
        9C3E3E6D6DF2875CA5BC3E873E3EA3081B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1B29
        3E3E3E6D6D3E0058BC3E00583E3E3E111F1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B6087
        173E6D6D6DBC6D222200586D6D3E178708DA1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B233E
        173E6D6D6D6DBC6D22003E6D6D3E173E44261B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B234C3E
        3E6D6D5B11111187A400176D6D6D3E175BDD1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B234C17
        3E6D6D7E8989BF5B83722222876D3E175B631B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B234C38
        A0BCBCBC5C895C20208987932299A0387E631B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B234C14
        E484A5A5A5BE7E8484898DA538A51D147E631B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B2349B2
        A78484274C0BAF7171BE44848484E4B229521B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1BDD84
        657171592727BEF34989AA717171B284271B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1BB04C
        C1949465040BBE0BBE0B6594B294659A691B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1BDD
        843265C132323232323232C165C184AA1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1B52
        49713232329F9F9F9F9F3232327149F91B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1B1B
        524971329F9F9F9F9F9F9F327149F91B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1B1B
        1B465E4C71C19FDE9FC1714C6C461B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B00001B1B1B1B1B1B
        1B1B1B46DDF34C4C4C49BD461B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B0000}
      Description.Text = 
        'Click here to open, save, print or perform any  other action you' +
        ' see in the menu.'
      UseStandardFooter = True
    end
    object stOpen: TdxBarScreenTip
      Header.Text = 'Open'
      Description.Glyph.Data = {
        36510000424D3651000000000000360000002800000060000000480000000100
        18000000000000510000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD16A48CB9E89
        CE9580CF947FD0937ED0937ED0937ED0937ED0937ED0937ED0937ED0937ED093
        7ED0927ED0927ED0927ED0927ECF927DCF927DCF927DCF927DCF927DCF927DD0
        927DD0927DCF927DCF927DD0927DD0927DD0927DCF927DCF927DCF917CD0937E
        D09785CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF96
        84CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF
        9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9684
        CF9684CF9684CF9684CF9684CF9684CF9684CF9684CF9886CF9988D09987CF92
        7ECF917CCF927DCF927DCF917CD0937ED19784D09784D09784D09784D09784D0
        9784D09784D09784D09784D09784D09784D19885D6A38FC2674EEB9C73DFFFFF
        D9FFFFDAFFFFE0FFFFE6FFFFE2FFFFDFFFFFE9FFFFE8FFFFE4FFFFEBFFFFE8FF
        FFE0FFFFD9FFFFD9FFFFDEFFFFE4FFFFE6FFFFE8FFFFE9FFFFE5FFFFE7FFFFE3
        FFFFE6FFFFF0FFFFEBFFFFE5FFFFE0FFFFE1FFFFE1FFFFE1FFFFE1FFFFDEFFFF
        E2FFFFE4FFFFEDFFFFF0FFFFE4FFFFDDFFFFEFFFFFF2FFFFE4FFFFDDFFFFECFF
        FFF2FFFFE9FFFFE1FFFFE5FFFFE8FFFFE0FFFFE0FFFFE5FFFFE2FFFFDBFFFFDD
        FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFF
        DDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFE0FFFFDDFFFFE0FF
        FFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFDAFEFFD8FFFFD8FFFFDDFFFFE1FFFFDF
        FFFFDFFFFFE1FFFFE3FFFFDCFFFFD9FFFFDAFFFFEDFFFFD29B86DE8E6ADBFFFF
        E3EDEFE0E9EBDBE5E6BBC5C6C9D1D3E3EAEBB4BDBFBEC7C9C9D2D4B1BABCBDC6
        C8D5DEE0E1EAECE1E9EBDAE8EAD7E9ECD7E7EAD0E0E2D1E1E4D1E1E4D4E5E7DD
        EFF2CADADDB2C0C2CBDBDED9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD7EBF0D9E7E7
        E6DED6F3ECE7CDC7C1CBC5C0E4DED9FBF5F0C7C1BBBFB9B3EBE5DFFBF5F0D3CD
        C8BFB9B3D8D1CBEBE8E4E9E6E2E2DBD5F3EDE8F8F2EDE1DBD6E6E0DAFEF8F2F8
        F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F2EC
        F8F2ECF8F2ECF8F2ECF8F2ECF8F2ECF8F4EFF8F2ECF3CEBDF0BC9FEBC8AFD4E6
        E9D8ECF1D8E9ECD8E9ECDCF0F6CED8D5CFCAC1DAD9D5DAD9D4CFCFC9C8C7C2D3
        D2CDD6D5CFCFCDC9D2D1CCD7D6D1DBDAD5D2CCC4D7F7F8CD9686DB8C68E1FFFF
        FFFFFFFDFFFFA7A7A89E9FA0C2C4C4BEC0C1A9ABAB898C8CA7ADACA1A2A2A3A4
        A4D2D4D5FFFFFFFFFEFFEFFBFDBBCCCF8D999A7D87897F898ABCCBCD9BA8AAAB
        B9BBB0BEC16C7577656D6EA8B5B7E6F8FBD9EAEDD8E9ECD8E9ECD7EAEEEBF8F9
        C4C2C0AFAFB1B5B5B78F8F91CBCBCCF5F5F69798998D8E90CECECEE7E8E99494
        958B8C8ECECECFC8C8C9C8C9CAA9A9AAE6E7E8DBDCDDB8B8BADDDCDCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2CFC1CF9679ECC4ADD9EC
        F0D7EBF0D8E9ECD8E9ECDAF0F4CDD4D3EAEAEAFAFFFFFEFFFFD5DBDEB4BABD9C
        A2A4B9C0C2B0B6BA808587DDE3E6FFFFFFEFF2F5D8F9FFCA917FDB8C68E1FFFF
        F9FDFFF1F6F7D6DADBE8EBECEEF2F3CED2D2F6F7F8D0CACCD8D8DBFCFFFFF1F4
        F4E9EDEEF8FCFDF6F9FAE8F4F6C2D4D7A7B5B7BDCCCFC4D3D6D8E9ECC6D5D8BD
        CCCFCFDEE1CEDDE0C0CFD2CADADDDCEDF0D8E9ECD8E9ECD8E9ECD7EAEFDFECED
        DBD7D3D5D2D2FFFFFFE9E7E7F5F3F2E4E2E1F8F8F8FFFFFFF3F3F2E4E2E1E1E0
        DFFBFBFBFFFFFFDAD8D6D5D3D2DEDCDBE9E7E6DBD8D7DCDAD9FAFAF9FFFFFFFF
        FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE
        FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFCE4D9FDCCB9F1CDBCD5E8
        EAD7EBF0D8E9ECD8E9ECDBF0F6CBD2D0ECE4DDFFFFFDFEFCF9E3E1DEE1DEDCE6
        E4E2E8E6E3F3F1EECCC9C7E6E4E1FFFFFFF4EDE7D9F7F9C99282DB8C68E1FFFF
        F7FCFDF3F8F9F9FBFCF7FBFBF5FCFDFFFFFFE9EEF4CFCDDFA67F86CAB5B8FFFF
        FFF5FAFBF3F8F9F6F9FADEEAEDD9E9ECE5F2F4E3F3F5E3F4F7D9EBEEE2F3F6E2
        F2F4DDECEFE3F5F8E5F6F9DEEFF2D6E7EAD8E9ECD8E9ECD8E9ECD8EAEDD4E5E7
        DEE5E3E5EBE9D8E1DEE1E7E6DAE2E0DCE4E2DAE2E0D9E2DFDCE4E1DDE4E2E2E9
        E7DBE2E0D7DFDDE5EDEBE4EBE9E2E8E6DCE4E2DEE6E4E2E9E8DBE3E0D4DDDAD6
        DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDC
        D6DFDCD6DFDCD6DFDCD6DFDCD6DFDCD6DFDBD6DFDCD8E6E5DAE9EAD7E4E4D7E7
        E9D8EAEDD8E9ECD8E9ECD9EBEFD5E5E8D0D8D4D2D9D3D0D8D2D8DEDADCE3DEDF
        E7E2DBE2DDD8DFDAE2E7E3D6DCD8CED5D0D0D6D1DEFFFFCC9281DB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F9FAF6FFFFE9CFD8DEB3B1E9C3A4B36D76CEBFCDFDFF
        FFF3F8F9F3F8F9F6F9FADEEAEDD7E9ECE3F2F4E8F3F5E0EFF2E2F1F4E5F4F6E4
        F3F5E2F1F4DBECEED6E7EAD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EAEED7E6E8
        DFE5E4E4EAE9E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9
        E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2
        E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8
        E2E9E8E2E9E8E2E9E8E2E9E8E2E9E8E2EAE9E1E8E7E2E0DCEAE4DDDEDFD8D6E7
        EAD8EAEED8E9ECD8E9ECDBEFF4D2E0DFCBB2A2D4B4A6D1B5A7D3B7A9D2B7A9D5
        BAACE2C6B8DDC2B4D5B9ABD0B4A6D3B6A9CFAD9BDCFBFDCD9989DB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F9FFFFFABBA5761A008F5C1EFFBF3CF09B38CBAC9CF1FF
        FFF5FAFBF3F8F9F6F9FAE9F5F7C4D6D9B2BFC28C97999EABADB1BFC1828D8E8B
        9697A4B1B3ABB9BCDEEFF2DAECEFD8E9ECD8E9ECD8E9ECD8E9ECD7EBEFD4E1E1
        F5F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD4C5F3B899F3CCB2D5E7
        EBD7ECF0D8E9ECD8E9ECDCF6FEC9C5BCE0BEACF6F3F2F4EBE7EAE1DDCEC4C0A9
        9F9C918681AFA4A0E6DDD9F8EFEBF1EEEEEBCCBCD9E3DCCA9A8DDB8C68E1FFFF
        F8FCFDF3F8F9F3F9FBFFFFFFBA9059466200D4BB66FFF397FEE563D7BA90EEF8
        FFF4FAFBF3F8F9F6F9FAEEFBFDBBCCCF7780827E888AA8B5B7B2C0C3939FA18E
        999B9DA9ABAEBBBDDDEEF1DBECEFD8E9ECD8E9ECD8E9ECD8E9ECD7EAEED4E2E2
        F5F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1C3CF947AEBC2AED9EC
        F0D7EBF0D8E9ECD8E9ECDAF3F9CCC9C3F2DCD0FFFFFFFFFFFFF3F4F5B7BFC4C2
        CACFB0B9C0BAC5CCF1F4F6FFFFFFFFFFFFFEEDE3DFEFEBC79486DB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9FFFDFFAFE4B369E77CCECB97EAD6BCDFC7A1D9C6BCF9FF
        FFF3F8F9F3F8F9F6F9FAE1EDEFD2E5E8C3D3D6DFEDF0E8F7F9E2F0F2EBFBFDEB
        F7F9E7F6F8E2F4F6D6E7EAD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7EBEFD5E2E3
        F2EDE8FFFDFAFBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8
        F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FB
        F8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5
        FBF8F5FBF8F5FBF8F5FBF8F5FBF8F5FBF9F7FBF9F7F9E6DCFFDACAEED2C3D5E6
        E8D7EBF0D8E9ECD8E9ECDBF1F8CFD7D3D4BCA5DECDBBDCCBB9D8C7B5C4B3A1E4
        D4C2F4E3D1EBDBC9DECCBAD9C7B5DCCBBAD8BDA5DAF4F0CC9889DB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F1F7F9FFFEFFE4FBEACBE8D0ECE9F8E1DEEBECEDF1F7FD
        FDF3F8F9F3F8F9F6F9FAE0EAECD5ECF1DFF6FAD7ECF0D1E6EAD2E7EBD2E7EBD2
        E7EBD2E7EBD2E7EBD2E7EBD2E7EBD2E7EBD2E7EBD2E7EBD2E7EBD2E8ECD2E6EA
        D1E0E0D1E0DFD1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0
        E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1
        E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0
        D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D1E0E0D2E4E5D2E6E9D2E4E7D2E6
        E9D2E8ECD2E7EBD2E7EBD3E8ECD3EAF0C1CECABCC1B8BDC5BDBFC7C0C9D1C9BF
        C7C0BCC4BDBDC5BEBDC5BEBDC5BEBCC3BBBCC7C0DDFFFFCE9381DB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F2F8F8F4F8FBFFFBFFFDFFFFF5FEFFF9FFFFF7FCFCF2F7
        F8F3F8F9F3F8F9F6F9FADFEDF0D3DFDEDFE3E0DFE6E5DFE6E4DFE6E4DFE6E4DF
        E6E4DFE6E4DFE6E4DFE6E4DFE6E4DFE6E4DFE6E4DFE6E4DFE6E4DFE6E3DFE7E5
        DEE8E8DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7
        E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DD
        E7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7
        DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE7E7DDE8E8DDE8E8DEE9E9DFE7
        E5DFE6E3DFE6E4DFE6E4DEE5E3DFE6E5E5F0F1E6F2F4E5F1F3E5F1F3E5F1F3E5
        F1F3E5F1F4E5F1F4E5F1F4E5F1F4E5F2F5E6F0F2E5FFFFC98F7DDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8
        F9F3F8F9F3F8F9F6F9FADBEBEFD5D8D1FFF9F5FFFFFFFFFEFDFFFEFDFFFEFDFF
        FEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFD
        FFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFE
        FDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFF
        FEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFD
        FFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFE
        FDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFEFDFF
        FEFDFFFEFDFFFEFDFFFEFDFFFEFDFFFFFEFFFEFBEDFFFFC58D7CDB8C68E1FFFF
        F7FCFDF4F9F9F7FBFBF9FCFDF8FBFCFDFFFFF9FCFCF7FAFBFCFEFEFDFFFFFCFE
        FEFBFDFDF4F9FAF6F9FADBEBEED7DBD5FFFBF8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F9FEFFF1F5F6E9ECEDD0D3D4E6EBEBE0E5E6EBEFF0D5D6D6CBCECFD8DCDDDDE1
        E2E5E9E9F0F4F5F8FCFCDBEBEED7DBD6FFFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        FFFFFFD8DCDE8B8D8EB3B7B7B6BABBB0B5B6BFC6C683878777787A8E91929194
        959FA2A3DBDFE0FFFFFFDBEBEED7DBD6FFFBF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        FFFFFFE3E7E8C1C5C5F1F5F5DCDFDFBAB9BBDDE1E4E3E9EAEFF4F4EDF0F1DFE2
        E3E2E7E8EEF3F4F9FCFDE4F0F1CBD4D3A6CCDA93CBDDB8CCD3CFC7C4D5D5D5FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F6FBFDF5F9FAFBFEFFF6FAF9EEEEF1DCDFEEB2969DC2ACAFF6FFFFFCFEFFFBFD
        FDFBFDFEF5FAFAF5F9F9F3F4F2AEC7CE4DC1E33DC2E87CAFC5A7928B9D9D9DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F9FAF4FCFFEEE8E5E7C4ACBD7880BD8D9BA58B8BB6B0B1FCFF
        FFF4FAFBF3F8F9F6F9FADFECEFD4DDD8D5E0E2DAD6DBFAF7F8FFFFFFFFFFFFFC
        FCFCFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F8FFFFE9DAD4F49C24FEAB3CE7AD95AF7D87A08385F4FF
        FFF6FCFDF3F8F9F6F9FAE5F1F2CED4D392B7C876B2C3B0C4CBFFFDFAF2F2F2C7
        C7C7C3C3C3E9E9E9DBDBDBE3E3E3F0F0F0E6E6E6CCCCCCE0E0E0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F4FFFFE4D0BAFAD366FFF56FE8B987B97185AC777CF2FF
        FFF6FCFCF3F8F9F6F9FAF2F4F2ACC6CD60CEEC5CD4F678AABECEBBB5C2C2C2B0
        B0B0B9B9B9B0B0B09A9A9ABEBEBEB5B5B5A7A7A78B8B8BB7B7B7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F4F9FAF3FBFFDFDACFDFD5B7E3D1A8DBBDB0E3C6CDDDC9CAF3FE
        FFF4F9FAF3F8F9F6F9FADDEBEFD9DFD8DFE4E4D0CDD7F5F2F4FCFDFCFDFDFDFB
        FBFBFDFDFDFFFFFFFAFAFAFDFDFDF5F5F5F0F0F0F8F8F8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F4F8F8F3FCFEE9F1FEE0DCE9E8E8ECF9FFFFFBFFFFF3F7
        F8F3F8F9F3F8F9F6F9FAE7F1F1C5D0D19AC8DA85D0E2A4C4CEF3E7E4C2C2C2E4
        E4E4C2C2C2949494B3B3B3DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F8F9F4F9FAF5FCFDF9FFFFF8FEFEF3F9FAF3F8F9F3F8
        F9F3F8F9F3F8F9F6F9FAF1F3F1AEC9CE61D2EF6FDFFE8BB9CCB5A39D7A7A7AB5
        B5B5B2B2B2848484B0B0B0BBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8
        F9F3F8F9F3F8F9F6F9FADDECF0DBE0D8C7D6DCCBC8D3F7F3F3F4F6F5EDEDEDFD
        FDFDFFFFFFF7F7F7F8F8F8F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E0FFFF
        F8FCFEF9FBFCFAFDFEF7FCFCF8FDFDFAFDFEFBFFFEFCFFFFF8FBFBF7FBFBF8FC
        FDF8FBFBFBFFFFF7FAFAE9F1F2C0CED086C1D76EC4DB92B6C3E4D6D2C0C0C0C7
        C7C7C5C5C5B6B6B6D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFEEEF0F1DFE3E4E6EBECECF0F1EBEEEFE8EDEEE1E6E7E5E9E9F3F7F7EDF2
        F3EFF3F3EAEFF0F4F7F8EFF2F2B1CACE85E2F291EEFF9EC5D6B5A6A1A6A6A6C1
        C1C1BCBCBCAFAFAFD5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68F0FFFF
        E2E5E7777A7A7D7F80C3C7C8B3B5B6929494A8ACAD999D9D9A9E9FB2B6B79CA0
        A18E91929FA2A3F9FCFDE1F1F5DEE1D9DDD9D9C4BFC9F8F4F4FFFFFFFCFCFCFF
        FFFFFDFDFDFDFDFDFBFBFBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68EAFFFF
        E9EDEEADAFB0D0D3D4E9EFF0CACBCBE5D9D4FFF7F2FBF7F6EBEEEFDFE5E6E4E8
        E9CFD3D4DADFE0FBFEFFECF3F3BDCDD07ABDD259BAD180AAB9E4D4D0B6B6B6B9
        B9B9AFAFAFBBBBBBBFBFBFE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E0FFFF
        F9FDFEFCFDFDFAFCFCFFFFFED7F2F97CC4DF93C3D6B3D3DFEDEFF1FFFFFFFBFD
        FDFAFEFEFBFEFEF7FAFAEBF0F0B4CBCF8DE8F4B6FFFFAECDD9CABEBBD2D2D2C9
        C9C9C3C3C3DADADACDCDCDE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9FFFFFAB9DEF465DEFF70EAF856C0DA78B2C6FFF5F0F7FC
        FDF3F8F9F3F8F9F6F9FADEEDF0DADED7C1CDD6BEC1CEF5F1EEFFFFFFFFFFFFF4
        F4F4FCFCFCFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFF5F5F5E5E5E5FCFCFCFFFFFF
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9FFFDF9BBE6F75EDFFFB6E8DFFFF6CD89C2CAB8C9D2FFFF
        FFF3F8F9F3F8F9F6F9FAEFF4F3B7CACE62BCD93AB6D782B0C4C2AFA992929297
        9797C4C4C4CFCFCF9E9E9E979797BFBFBF838383D3D3D3F5F5F5AEAEAE858585
        C0C0C0FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9FFF9F9C4F7FF92E3E7F0C5A5FFDCA8CDCDBDC6DCE6FFFF
        FFF3F8F9F3F8F9F6F9FAEAF0F0BACFD2A1E9F5B5F8FFCDE9F4BCB2AFB1B1B1D6
        D6D6D5D5D5D3D3D3DCDCDCC7C7C7D3D3D3BEBEBEE9E9E9FFFFFFD8D8D8C3C3C3
        D5D5D5FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F5F9FAEAF7FCEEF2EFFFECCBFAD3ADF0E5DFF7FDFFF2F8
        FAF3F8F9F3F8F9F6F9FADEEDF1D8DDD7C7CBD1C0BFC8F7F0EEFFFFFFFDFDFDFD
        FDFDFDFDFDFBFBFBFEFEFEF6F6F6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F1F7F9FAFAFAFAFEFFF5F2E8EFECE6F0FBFFF6FAFBF3F8
        F9F3F8F9F3F8F9F6F9FAF0F4F3B4C9CF5DBDD747BBD86A97AACCBAB5CDCDCDC9
        C9C9A6A6A68B8B8BB5B5B5A8A8A8F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F8F9F3F8F9F3F7F9F1FBFDF3FDFFF5F9FAF3F7F8F3F8
        F9F3F8F9F3F8F9F6F9FAE6EEF0C0D2D2B7F3F6CCFBFFCDDDE6C2BBB9F0F0F0F6
        F6F6D5D5D5B4B4B4EEEEEEE6E6E6FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8F9F3F8
        F9F3F8F9F3F8F9F6F9FADEEDF0D9DCD6C8D3DBB4C8D6EAEAEBFFFFFEF4F4F4F3
        F3F3F2F2F2F9F9F9F4F4F4F5F5F5E8E8E8F1F1F1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F1F7F8F8FBFBFBFDFDF9FDFDFAFCFDF6FAFBFAFDFEFFFFFFF7FB
        FBF1F7F8F3F8F9F6F9FAF2F4F2B2C9CE53BDDC36B7DC71A0B6BBA7A0AAAAAAB3
        B3B39E9E9E929292A3A3A39F9F9F8F8F8FB0B0B0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F8FDFEE4E9EADDE0E1EBF0F1EAEFF0F3F6F7EBEEEFCCD0D1E6EB
        ECF9FEFFF3F8F9F6F9FAE4EDEFC7D6D5C4EDF3D8F3FBEAF5FAEAE6E4F5F5F5F5
        F5F5F2F2F2DDDDDDEEEEEEFBFBFBE8E8E8F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9FFFFFFD3D7D8AAADAE979A9B9B9F9F9FA2A38B8E8E737576C1C5
        C6FFFFFFF3F8F9F6F9FAE0EEF1D5D9D5B8CAD6ABC8D5E1E5E5FFFFFFFCFCFCFD
        FDFDF5F5F5F4F4F4FCFCFCFAFAFAFBFBFBFDFDFDF3F3F3ECECECEDEDEDFFFFFF
        F5F5F5F5F5F5FFFFFFF9F9F9F0F0F0E0E0E0F6F6F6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9FBFFFFE0E4E4D1DADEF0FCFFEBF1F4C8CDCED0D4D5E4E9EAE9EE
        EFF6FBFCF3F8F9F6F9FAF3F5F3ADC7CD52BFDE3EBADE76A5BABEABA4A9A9A9B9
        B9B99696968D8D8DB5B5B5ACACACAFAFAFC0C0C0C1C1C17B7B7B848484B2B2B2
        CCCCCCA0A0A0A6A6A6848484AAAAAA979797B9B9B9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F9FAFBFFFFDABCA8BA937CCBD4DAE7E2E2FAFBFBFFFFFFF7FB
        FBF1F7F8F3F8F9F6F9FAE1ECEECAD9D6DDF9F8EAFDFEF1F7FAF4F1F0F9F9F9F0
        F0F0F2F2F2F0F0F0F1F1F1EFEFEFE0E0E0F1F1F1F7F7F7E1E1E1DEDEDED3D3D3
        F4F4F4EBEBEBDADADAD6D6D6E5E5E5EFEFEFF2F2F2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9FFFFFFCEA88FA68F67BBB594ABA8929E7E61DED7D1FFFF
        FFF3F8F9F3F8F9F6F9FAE2F6FBD5CBBFA3959C7892B1CBD0D3FBF9F7E1E1E1EB
        EBEBD1D1D1CBCBCBDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9E9F08EC5D994C6
        D6DCE2E3EFEAE9D4D4D4D8D8D8EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF3F8F9F4FAFBF4F3F4D2D0C8E1F4D9FFDEA5E5D3A5B29F7FD2C0B2FFFF
        FFF3F8F9F3F8F9F6F9FAF1FDFFB4B8B05B8CA43099CE729FB3C9B8B1AFAFAFC0
        C0C0838383828282ACACACC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FCEE740D0F158C6
        E698A7AF998E8A909090858585B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF3F8F9F5FBFDEFEFF2D8BEA3F1EFCCFDF3DEFDD3A3A992849BA4C2FFFF
        FFF3F8FAF3F8F9F6F9FADFEBEECFDAD7D4F0F2F5FAF6FDFCFCEDECECF8F8F8F7
        F7F7F3F3F3FAFAFAFCFCFCF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF5FBCEE6ECF6EC
        ECEAEAEBE0E1E0FEFEFEF1F1F1E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF3F8F9F4FAFCEFFAFFE8B785ECBF87F3E2C7FFF8D6BF9675BAB6C1FFFF
        FFF3F8F9F3F8F9F6F9FAE4F0F1CFD5D397C1D47DBFD3BBCFD6FFFEFBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8E6EE84BED496CA
        D9D6DCDDE7E1E0E6E6E6D7D7D7DFDFDFEAEAEAECECECD4D4D4E3E3E3F5F5F5FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F8F9F4FAFBF5FAFAEBE2DBE4DAD0EFE2CFEED2B3F2F3EEF5FD
        FFF3F8F9F3F8F9F6F9FAF3F4F2ABC6CD60CDEA50C9EB7FB1C5DFCCC6FCFCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96D4EA4ED0F25DC3
        E5A2B1B7B5AAA6A0A0A08C8C8CA7A7A7BCBCBCBEBEBE9D9D9DB2B2B2E3E3E3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF1F7F8F8FCFCFAFEFEFAFEFEFCFFFFFCFFFFF8FFFFFDFFFFFAFBFCF9FC
        FDF8FCFCF3F8F9F6F9FADEECEFD6DED8DFE3E3DAD2D8FAF6F7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FDFED2D9DFE7DB
        DFF7F4F4ECEDEDF4F4F4FAFAFAFEFEFEFBFBFBF0F0F0EFEFEFF4F4F4FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF5FAFBECF0F1EAEFF0EDF3F4EAEFF1EAEEEFE2E4E4E4E8E9EEF2F3EAEE
        EEEEF3F5F4F9FAF6F9FAE5F0F2CBD3D397BFCF7CBFCFA5BFC8FEF4F1FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E1EB84BECF8EC6
        D3C7D0D3EAE4E2F4F4F4D6D6D6D0D0D0DADADADDDDDDE5E5E5F7F7F7E1E1E1DE
        DEDEDADADAB2B2B2DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDFFFFFFABAEAFA5A7A8B7BABBB7BBBCBEC2C3929595898C8C9EA1A29A9B
        9CCDD0D1FCFFFFF7FAFAF2F3F1ACC7CD61D3F070E2FD86B3C5D9C7C2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92D3EB56DDFD7BD7
        F3A4B3B99F9491A6A6A69D9D9DB6B6B6CACACAC4C4C4CBCBCBB3B3B3D3D3D3BF
        BFBFA2A2A2959595CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDFDFFFFC7CBCCC8CBCBD3D6D7EFF2F2EFF2F3E5E8E9E1E4E5DFE3E4E1E5
        E5EBF0F1F6FBFCF6F9FADDECF0D9DFD8D0DADDDBD0D6F9F4F4FDFEFEFEFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF7FAC7D1DAEADA
        DCF3F2F2EDEEEEEEEEEEECECECF9F9F9FFFFFFFFFFFFFCFCFCF5F5F5FFFFFFFC
        FCFCF5F5F5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDFFFFFFDCDFE09C9FA0939696D4D5D6CBCECF9A9C9DA4A7A89C9E9E8183
        84C7CBCCFFFFFFF6F9FAE9F2F2C3CFD081BFD75DBCD889AEBCEBDDD9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2DDE96CBFDA6DBE
        D6BAC6CAF5ECEAC3C3C3D2D2D2F1F1F1D2D2D2BCBCBCC2C2C2C5C5C5C3C3C3B1
        B1B1E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDFFFFFFD8DCDDA8ABABD3D8D8BEC7CAB9BFC1D3D8D7DDE4E5C9CCCCB0B3
        B4D8DCDDFEFFFFF6F9FAF0F2F1B0C9CF70D8F275E3FF87B4C7CFBEB9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FDAEE61DEFC81DC
        FAABB9BFBFB5B1ACACACD5D5D5C3C3C3C0C0C0CCCCCCBBBBBBCCCCCCC2C2C2AB
        ABABE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF1F7F8F7FBFBFFFFFFE9E5E5C2B4B1AEA8AAB5B8C4C4C4C6FDFFFFFFFF
        FFF8FBFCF2F7F8F6F9FADEEDF0DADFD9D0D1D5CAC0C9F6F1F0FFFFFFFFFFFFFF
        FFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9FABFC4CED8CC
        D0FFFEFCFFFFFFFCFCFCFDFDFDFBFBFBFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F5FBFCEFF6FCE3C5B6D7B196BCB191DAC5A6A79287B6B9BFFFFF
        FFF3F8F9F3F8F9F6F9FAEBF2F2BDCDD081BFD36BC4D78BB2C0DED0CCC1C1C1B3
        B3B3A6A6A6B2B2B2B2B2B2B0B0B0AEAEAEE4E4E4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8D8E771C2D771BF
        D2B0BEC3B9B0AD9A9A9AB4B4B4C4C4C4ABABABA0A0A09E9E9ED3D3D3FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F4FAFBEDF4FAF4DAC2E7D1B2EFFAF7DFD4A89A8976B3B4BEFFFF
        FFF3F8F9F3F8F9F6F9FAEDF1F1B1CACF8EE7F39AF3FFABD1E2C6B8B3A1A1A1C8
        C8C8AEAEAEABABABC8C8C8B5B5B5BDBDBDE8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5DEEF86EEFD9DE6
        FCB8C4C9B9B0AEA1A1A1C1C1C1CCCCCCA6A6A69B9B9BB2B2B2D8D8D8FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC58D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F9FBEFF6F9F6E2CFFCD8B3EEE5E2D0DBDEA7A394E5ECEEFCFF
        FFF3F8F9F3F8F9F6F9FADDECF0DDE0D8D2D8DCB7BECEF3F1F1FFFFFFFFFFFFFF
        FFFFFFFFFFF9F9F9FCFCFCFFFFFFFEFEFEF9F9F9FEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FCFBBBC9D6CCCB
        D4FFFCFAFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        F8FCFDF3F8F9F3F9FBF1F2F0FAEDE1FFFFFFFDEFDECCA689DBD8DBFFFFFFF1F7
        F8F3F8F9F3F8F9F6F9FAEDF3F2B9CBCF75C3DC54C0DC7DAABCFFF6F1CACACA84
        84848A8A8AA4A4A4C7C7C7909090797979A3A3A3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD6E860C4E05EBC
        D7AABABFC0B6B2A7A7A79F9F9FA5A5A5A6A6A6C8C8C8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEDFFFFC48D7CDB8C68E1FFFF
        FBFEFFF7FAFBF7FBFCF7F8F7FCF4EDF9FAFEF1EAE7F0DFCCFBFDFDF7FBFDF7FA
        FBF7FAFBF8FAFBFBFBFCEDF1F0B8CDCF7FD7EF90E1FAB9D8E6EFE2DECFCFCFCB
        CBCBCCCCCDD6D5D5CDCDCDB0AFB0BEBEBEE2E1E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEE1F472DAF79DDD
        F4CAD3D8DDD4D2E5E4E5C2C1C1CCCCCCD2D1D2E7E7E7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDFFFFC48D7CDC8D68DEFFFF
        F1F8FAEEF5F6EEF5F6EEF6F7EDF6F6EBF0F0EBF3F4F1FDFEF0F7F8EDF4F5EEF5
        F6EEF5F6EEF5F6F1F6F7DCECF0D7DEDADEE3E6F7F0F1FFFDFCEDF1F1F0F2F2FF
        FFFFFFFFFFF6F7F7F7FAF9FFFFFFFCFCFDF9FCFBF3F5F5F2F5F5F3F5F5F3F5F5
        F3F5F5F3F5F5F3F5F5F3F5F5F3F5F5F3F5F5F3F5F5F6F7F6EBF3F4DFE6EBFFF6
        F3F7F8F7F7FBFAFFFEFEFCFDFDFBFCFBFEFFFFF9FBFAF1F3F3F3F5F5F3F5F5F3
        F5F5F3F5F5F3F5F5F3F5F5F3F6F5F3F6F5F3F6F6F2F2F1F2F0EEF2F1EFF2F1EF
        F2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1
        EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2
        F1EFF2F1EFF2F1EFF2F1EFF2F1EFF2F2F0F5F0ECE9FFFFC68F7EE18F6BD7FFFF
        D5E9EDD6E8EBD6E8EBD6E8EBD6E8EBD6E8EBD6E8ECD7E9ECD8EAEDD8EAEDD8EA
        EDD7E9ECD7E9ECD7E9ECD9ECF1D5E3E4D5D6CED3DAD5CDD7D3C9D3CFCCD6D1C9
        D3CFC9D3CFCCD6D1CCD6D1C9D3CFCAD4D0CAD4D0C9D3CFCCD6D2C9D3CFCCD6D1
        C9D3CFC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC5D1CDD0D5D0D8DAD2C9D3
        CEC9D3CFC9D3CFC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC8D2CEC8
        D2CEC8D2CEC8D2CEC8D2CDC8D8D5C7D9D8C9D8D8D1DFDFD1E0E2D1E0E1D8E9EA
        DCEDEED1E2E4D4E0DEE9E8E6E0E6E7CCDEDFD7E2E1E4E6E2D7E2E1CFDEDED1E4
        E7D0EAF0D1EBF3D2E4E7D1DEDED1E0E1D1E0E1D1E0E1D1E0E1D1E0E1D1E0E1D1
        E0E1D1E0E1D1E0E1D1E0E1D1E0E1D1E0E1D0DFDFE0FFFFCC917FE08F6AD7FFFF
        D7EAEED7E9ECD7E9ECD7E9ECD7E9ECD7E9ECD6E8EBDAEBEED9EAECDCEEF1E4F5
        F8DCEDF0D9ECEEE1F3F7D5EBF0D5D7D1F8EFE7ECE8E4ECE9E3F8F6F1E6E3DFF2
        EFEAF3F1ECF8F5F0F7F5F1E7E4E0F0EDE9FAF7F2F1EEE9E6E3DEEAE7E2EAE7E2
        ECE9E4EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEB
        E6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EEEBE6EE
        EBE6EEEBE6EEECE7ECECE8EED6C9FDD8C3EAC9B1D0DAD8D9F3FBDCF0F4BFCED2
        B5C3C6DFEDEFCAE8F2A0D7E6C7E4EFE4EFF2CEE8EEB2DCECD9EEEBE7F7F5D4E2
        E3D4D4CAD4CFC6E2EDECE3FAFED5E8ECD8EBEFD8EBEFD8EBEFD8EBEFD8EBEFD8
        EBEFD8EBEFD8EBEFD8EBEFD8EBEFD8EBEFD8EBF0E2FFFFCA8F7CE0906BD7FFFF
        D8EAEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE4F6F9C1D0D398A3A59AA6A77982
        84AAB8BABDCCCF97A2A5CADEE3EBECE6F2EDEBABACB0959294DCDBDCEAEBECC8
        C9CAC9CACBA7A8AA9FA0A1F1F1F3CACACBA9AAACDFDFE0D7D7D8E6E6E9E0E0E0
        F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF9D6C8D49D82E9B89BD9DFDCDDF7FFC9D9DBC6CACB
        B1B3B3CACBC8C9EFFF4CCAD05BC4A0F5F3F9ADD9EA56DEF77CD1F8C6E2FFE0D1
        C0E9C8C6D5D4B5A7B1A2B8CBD5E4F5F9D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE2FFFFCB8F7DE0906BD7FFFF
        D8EAEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE3F5F8BDCBCEADBBBDC4D3D69EAA
        ACB9C8CACBDBDEACBABCCDE2E7E6E7E0E8E1DEDBDADBE5E0E0DDDBDBF1F2F2E9
        E8E8E5E3E3CAC8C8AEADADE2E1E1DFDDDDCDCBCBEBEAEADAD9D9E4E2E2ECEBEB
        FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8DCCFD99F87E5B098DAE0DCDBF4FCD0E0E3D2D9DA
        C3C9CACDD7D8EAF8FF6AC9AA2EA948E7EAEDC4E5F39EF1F36FB2FBA0CCFFEBDA
        B8F1A86FD5B15CB3BBA0C5DCEDDFF1F4D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECE2FFFFCB8F7DE19672D7FFFF
        D8F6FFD7F5FED7F5FED7F5FED7F5FED7F5FED6F4FEDAF6FEDEF8FEE4FDFFE9FF
        FFDEFAFFDCF7FEE7FDFFD7F8FFD3E7EAF4F9F8F7FFFFF9FFFFF4FCFEEBFAFDF8
        FDFEFAFEFFFCFFFFF7FDFEE4F3F6F1FBFCFAFFFFF1FCFEEAF6F9E7F3F6EFFBFD
        ECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFA
        FDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDECFAFDEC
        FAFDECFAFDECFAFDEAFBFEEEF2F1FBF1ECEAE0D9D1E8ECD7F9FFDBF9FFD2F0F7
        D0EEF6DAFAFFE2F8FFC8E9E2B1E2D2D8F5FFDEF8FFE0F4FBDFF5FCDCFBFFD5F0
        F6D1D2BBD8D0C0E3F5F6DEFFFFD5F3FED7F5FED7F5FED7F5FED7F5FED7F5FED7
        F5FED7F5FED7F5FED7F5FED8F6FED8F6FED8F6FEE2FFFFCB9686DE8B65D1F6FF
        D4D9D8D7D7D2D4DEE2D5DCDED5DCDED4DCDFD4DCDFD5DDE0D5DDE0D4DBDED4DC
        DFD4DDE0D4DCDFD4DCDFD5DDE0D3DCE0CCD6D8CDD6D9CDD6D8CDD6D8CED7D9CD
        D6D8CDD6D8CDD6D8CFD8DACFD8DACDD6D9CED7D9CDD6D8CED7DACFD8DACDD6D8
        CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6
        D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CDD6D8CD
        D6D8CDD6D8CDD6D8CDD5D7CEDBDFCEDFE5CFE0E5D3DDE2D3DBDFD3DCE0D6DFE3
        D7E0E4D3DCE0CFDADCDFE1EBE8E5F5D1DBDED3DCDFD5DCE0D7DEDFD5DBDCD3DF
        E6D4EAFBD4EBFBD3DFE6D3DADCD3DCE0D3DCE0D3DCE0D3DCE0D3DCE0D2DDE3D4
        DADBD8DAD1D7DAD6D3DBDEE0D9CCFADDB4FCDEB5FFFEDDCC856EE24910F06308
        EF6F1CED7324F95E00F65C03F56008F56B0FF56A0EF56A0EF56A0EF56A0EF56A
        0EF56A0EF56A0EF56A0EF56A0EF56B0FF56B0FF56B0FF56B0FF56B0FF56B0FF5
        6B0FF56B0FF56B0FF56B0FF56B0FF56B0FF56B0FF56B0FF56B0FF56B0FF66A0E
        F66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A
        0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF6
        6A0EF66A0EF66A0EF66A0EF66A0EF66A0EF66A0EF5680EF5680DF5680DF5680D
        F5680DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF568
        0DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF5680DF76606F2
        6D1AE3703AE46B2AF06E1FDD6F3C8C5B79734B7B9D697EDB5526EA480DFB8834
        ED965DE49F7DE48F63EBA174EF8A4DFE5700FF5D00FF5E00FF5E00FF5E00FF5E
        00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF
        5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5E00FF5D00
        FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C
        00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF
        5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5C00FF5B00FF5B00FF5B00FF5B00
        FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B
        00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5B00FF5400FD
        6A1DF37A4FF9813BFF6C00A56274286DFF5492FF2F71FFCA5746D8400DEDA673
        E4A17CE7854FDA835CDF9473E38251E64A00E65100E65200E65200E65200E652
        00E65200E65200E65200E65200E65200E65200E65200E65200E65200E65200E6
        5200E65200E65200E65200E65200E65200E65200E65200E65200E65200E65100
        E65100E65100E65100E65100E65100E65100E65100E65100E65100E65100E651
        00E65100E65100E65100E65100E65100E65100E65100E65100E65100E65100E6
        5100E65100E65100E65100E65100E65100E65100E65100E65100E65100E65100
        E65100E65100E65100E65100E65100E65100E65100E65100E65100E65100E651
        00E65100E65100E65100E65100E65100E65100E65100E65100E65100E34400EB
        6722FC9D7EFFC1A7FF89359F586970A4FFC5E1FF508BFFAB4745C6310DED670C
        F1700DEF5300ED5000E94700E74D00E65B00E65900E65900E65900E65900E659
        00E65900E65900E65900E65900E65900E65900E65900E65900E65900E65900E6
        5900E65900E65900E65900E65900E65900E65900E65900E65900E65900E55800
        E45800E45800E45800E45800E45800E45800E45800E45800E45800E45800E458
        00E45800E45800E45800E45800E45800E45800E45800E45800E45800E45800E4
        5800E45800E45800E45800E45800E45800E45800E45700E45700E45700E45700
        E45700E45700E45700E45700E45700E45700E45700E45700E45700E45700E457
        00E45700E45700E45700E45700E45700E45700E45700E45700E45700E04800EA
        7026FEBC9EFFBA9DFF8A4BCE7E618AA1F16D87EA7C93E7B23C3AFF00FFE64F00
        F67412F78324F67D21F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A
        20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F6
        7A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F77B21
        F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B
        21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F77B21F7
        7B21F77B21F77B21F77B21F77B21F77B21F67B21F67A20F67A20F67A20F67A20
        F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A
        20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F67A20F6791FF6
        7D24F6822CF67820F6812BFA8024F37828EB732AEB5300FF00FF}
      Description.Text = 'Open the existing document'
      Footer.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        200000000000000400000000000000000000000000000000000000000000CD81
        45FFCC7E41FFC97A3CFFC77637FFC47232FFC26E2EFFC06B2AFFBE6927FFBD66
        24FFBC6422FFBB6320FFBA611EFFBA611EFFBA611EFF0000000000000000EEAE
        76FFFFEDCAFFFFE9C3FFFFE8C0FFFFE6BDFFFFE6BBFFFFE4B8FFFFE3B5FFFFE2
        B2FFFFE1AFFFFFE0ACFFFFDEA9FFFFE5B1FFBA611EFF0000000000000000EEAF
        77FFFFE9CBFFFFE6C4FFFFE5C1FFFFE3BDFFFFE2BAFFFFE0B7FFFFDEB4FFFFDE
        B0FFFFDCADFFFFDAAAFFFFD9A6FFFFDFACFFBA621FFF0000000000000000EFB0
        79FFFFEDD3FFD7AB74FFE7BA7FFFE1B885FFC5A077FFA4825FFF9C7B59FFAA8C
        68FFD4B48BFFF9D8ABFFFFDCADFFFFE2B2FFBB6421FF0000000000000000EFB2
        7CFFFFF1DCFFD4A25AFFD6BB9CFFB48757FFBC762DFFCC8935FFCD9846FF9F80
        49FF705535FFB29771FFF8D9ADFFFFE5B9FFBD6624FF0000000000000000F0B5
        81FFFFF3E1FFDCA34BFF9C6522FFDA8E2EFFF59B34FFE59337FFEA9F3EFFFFCD
        5EFFDCBC74FF7B5F3DFFD1B28BFFFFE8C0FFBE6927FF0000000000000000F1B8
        86FFFFF4E5FFDFB87CFFF9B033FFEF9F2BFFB26F21FFB69370FFD6B38EFFBF7F
        37FFDFAB52FFA78652FFB1916CFFFFEAC7FFC06C2CFF0000000000000000F2BC
        8CFFFFF5E8FFF0E2CDFFE7B34AFFEEA529FFBD7623FF9A5D1FFFA26422FFB26E
        2AFFB87027FFA16629FF9A7859FFFFEDCEFFC27031FF0000000000000000F3C1
        92FFFFF6EBFFEDE0CCFFEAD3A1FFF5C143FFCC8922FFE2A85BFFE7B069FFD389
        2FFFF99F35FFC88131FFA3866BFFFFEED1FFC57537FF0000000000000000F4C5
        9AFFFFF8EFFFE2D1B7FFECD5A0FFF7E2A6FFC09A41FF987752FFB69160FFD18B
        28FFF7A433FFAD793CFFDBC4A8FFFFEFD5FFC97B3FFF0000000000000000F5CB
        A2FFFFFAF2FFFFF7EDFFE3D3B0FFF0DBA0FFF5DC85FFD7AF3CFFDFA228FFF0A8
        2AFFD69639FFC2A47DFFF8E5CCFFFFF0D7FFCD8248FF0000000000000000F7D0
        AAFFFFFBF5FFFFF9F1FFFDF5ECFFDECDAAFFE3D090FFE9D26AFFE8BC44FFE6B6
        49FFC4A579FFE4CEAAFFE4C99DFFFFF1D9FFD18A50FF0000000000000000F8D6
        B2FFFFFCF8FFFFFAF4FFFFFAF3FFFFF9F2FFF9F2E7FFF0E4D4FFEBDBC3FFEDD9
        B4FFE5CA97FFE4C791FFE9D2B2FFFFF1DBFFD6935CFF0000000000000000F9DB
        BAFFFFFDFBFFFFFBF6FFFFFBF5FFFFFAF5FFFFFAF4FFFFFAF3FFFFFAF3FFFFF8
        F0FFFFF7ECFFFFF3E6FFFFF1DEFFFFF2DEFFDB9C68FF0000000000000000FBE0
        C5FFFFFFFFFFFFFEFDFFFFFEFDFFFFFEFDFFFFFEFCFFFFFEFCFFFFFEFCFFFFFC
        F9FFFFFBF4FFFFF8EEFFFFF5E7FFFFF5E5FFDEA573FF0000000000000000FCE1
        C2FFFBE3C9FFFBE1C4FFFBDEBFFFFBDDBCFFFADBB8FFFAD9B5FFFAD7B2FFFAD6
        B0FFF9D4ACFFF9D3AAFFF8D0A6FFF8CEA3FFE4AC79FF00000000}
      Footer.Text = 'visit to ww.dfetdl'
      UseStandardFooter = True
    end
    object stPrint: TdxBarScreenTip
      Header.Text = 'Print'
      Description.Glyph.Data = {
        76530000424D76530000000000003600000028000000600000004A0000000100
        18000000000040530000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1633CCB9C85
        CE9581CF937ECF927DCF927DD0927DD0927DD0927DCF927DCF927DCF927DCF92
        7DCF927DCF927DCF927DCF927DCF927DCF927DCF927DCF927DCF927DCF927DD0
        927DD0927DCF927DCF927DCF927DD0927DD0927DCF927DCF927DD0927DD0927D
        D0927DCF927DCF927DD0927DD0927DD0927DD0927DD0927DD0927DD0927DD092
        7DD0927DD0927DCF927DCF927DD0927DD0927DD0927DD0927DD0927DD0927DD0
        927DD0927DCF927DCF927DCF927DCF927DD0927DD0927DD0927DCF927DCF927D
        CF927DCF927DD0927DD0927DD0927DCF927DCF927DCF927DCF927DCF927DCF92
        7DCF927DCF927DCF927DD0927DD0927DD0927DCF927DCF927DD0927DD0927DD0
        927DD0927DD0927DD0927DD0927DD0927DD0927DD5A18CC1684FEA8A57E1FFFF
        E2FFFFE2FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FF
        FFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1
        FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFF
        E1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FF
        FFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1
        FFFFE1FFFFE1FFFFE1FFFFE1FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFF
        E2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE1FFFFE1FF
        FFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2
        FFFFE2FFFFE2FFFFE2FFFFE2FFFFE2FFFFE1FFFFECFFFFD19B86E17F51D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECDAEAEDD8F0F5D1EBF0D2EBEFD2EBEFD2EBEFD2EBEF
        D2EBEFD2EBEFD2EBEFD2EBEFD2EBEFD2EBEFD2EBEFD1EAEDD4EFF5DCF1F5DAE9
        ECDCEFF1D4E3E4D5E4E5D5E4E5D5E4E5D5E4E5D5E4E5D5E4E5D5E4E5D5E4E5D5
        E4E5D5E4E5D5E4E5D5E3E4D6E5E6DAECEED8E9ECE2FFFFCB8F7DE17F51D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD9EAEED6EEF4CDBCADD7A991D7B19DD7B19DD7B19DD5AF9B
        E5BFACEAC4B1E1BBA7D9B39FD6B09CD7B19DD7B19DD9B29ED1A48BD0CDC4DBF5
        FDC4C5BDC8C9C3CACFCBC7CBC7D5D9D5D8DCD8DFE3DFD7DAD7D6DAD5DBDFDADC
        E0DCD5D8D4C9CCC8CCCFCBC5C5BECFD5D0DDF0F5E2FFFFCB8F7DE17F51D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECDAECF0CEE0E3D1B29FF3DED3EDE0DAEDDFD8EDDFD8F6E8E1
        CBBCB5C4B6AFE4D8D1E5D6CFF0E2DBEDDFD8EDDFD8F1EBE9E3B69FC5A691CDE9
        F1C0B6AEEFF5F6E8EEF0F0F6F7D2D7D9C6CBCCB3B7B9D1D6D7D7DCDDC6CBCDC0
        C4C6D6DBDDEDF2F4EAF0F2E2E3E3CECFCDDAEDF1E2FFFFCB8F7DE17F50D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD9ECF0CFDEDED6C6B7F4FCFDEEFAFEEEF9FCF3FEFFE1EBEE
        B5BEC19EA6A97B8284F0FBFFF4FFFFEEF9FCEEF9FCF1FFFFE7D6C8CAB29CCAE3
        E8CAC4B8F9FDFFF0F4F4FDFFFFB1B4B4C5C9C9747676808282979A9995979766
        6868A8ABABFFFFFFF2F6F7EDEDEBD4D7D3D7EBEFE2FFFFCB8F7DE17F50D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD9ECEFCCDCDEE0CDC1FFFFFFFFFFFFFFFFFFFFFFFFFCFBFB
        D0D3D6BDC0C3B4B6B9FCFDFEFFFFFFFFFFFFFFFFFFFFFFFFFAE2D5CDB6A6C4DD
        E3CDC2BCFFFFFFFFFFFFFFFFFFCFD1D4D1D6DAFFFFFFEFF2F5E9EDF0F8FCFFED
        EFF2D5D5D6FFFFFFFFFFFFFEFAF8D9DAD8D5E9EDE2FFFFCB8F7DE17F51D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD9EBEFD2E8EECEBEACDEBEA2DBC2AADBC2AADAC1A9E1C9B1
        D4BDA5D6BEA6ECD4BCD6BDA5DBC2ABDAC1AADAC1AADCC4AED3AF91C8C2B5D4F1
        FAC4BCAEDFCFC1DED3C7DFD4C8DCD3C7D6CBBFE7DCD0E6DCCFE7DDD0E5DACEE5
        DBCEE3D8CCDBD0C4DDD2C7DAC8B8CFD0C8D9EFF6E2FFFFCB8F7DE17F51D8FEFF
        D8ECF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECDBEFF3CCDBD9BEC3BAC2C8C1C2C8C1C2C8C1C1C7C0
        C5CBC4C5CCC4C1C8C1C1C8C1C0C7C0C0C7C0C0C7C0BFC5BDC0C9C3D4E8EAE0F3
        F9D0DFDEBDC3BAC1C9C2C0C8C1C3CBC4C4CBC5C0C8C1C1C9C2C0C8C1C0C8C1C0
        C8C1C1C9C2C0C8C1BFC7C0BEC5BDD1E0DFDBEEF3E2FFFFCB8F7DE07F50D8FEFF
        D8ECF0D8E9EDD9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EA
        EED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9
        EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEE
        D9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EAEED9EA
        EED9EAEED9EAEED9EAEED9EAEED9EAEED8E9EDD8E9ECD8E9ECD8E9EDD9EAEED9
        EAEED9EAEED9EAEED9EAEED8E8ECDEF1F7E1F8FFE0F6FDE0F6FDE0F6FDE0F6FD
        E0F6FDE0F6FDE0F6FDE0F6FDE0F6FDE0F6FDE0F6FDE0F6FDE1F7FEDBEDF2D7E7
        EADDF0F5E1F7FEE0F5FCE0F5FCE0F5FCE0F5FCE0F5FCE0F5FCE0F6FCE0F6FCE0
        F6FCE0F6FCE0F6FCE0F6FCE1F7FEDBEEF2D7E7E9E2FFFFCB8F7DE07F50D8FEFF
        D9EDF1D7E8EBD4E4E6D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5
        E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4
        E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7
        D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5
        E7D4E5E7D4E5E7D4E5E7D4E5E7D3E4E6D7E8EBD9EAEDD9EAEDD7E8EBD3E4E6D4
        E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7
        D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5
        E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4
        E5E7D4E5E7D4E5E7D4E5E7D3E4E6D7E8EBD9EAEDE2FFFFCB8F7DE17F51D8FEFF
        D9EDF2D3E4E6D1E2E3D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3
        E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6
        D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D1E2E4D0E1E3D9EAEDD9EAEED2E2E4D1E2E4D3
        E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6
        D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3
        E4E6D3E4E6D3E4E6D3E4E6D2E3E5D1E2E4D8E9ECE2FFFFCB8F7DE17F51D8FEFF
        D8ECF0D5E6E9D9EAEDDAEBEEDAEBEEDBECF0DAEBEEDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDA
        EBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEE
        DAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDBECEFD1E3E5D6E7E9D7E8EBD5E6E9DBECEFD9
        E9ECE0F1F4DFF3F7DCF0F4E0F4F8E1F1F4D8E9ECDAEBEEDAEBEEDAEBEEDAEBEE
        DBEBEEE0F3F6DDF1F6DBF0F4E2F4F8DFEFF2D8E9ECDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDA
        EBEEDAEBEEDAEBEEDAEBEEDBECEFD2E3E5D5E6E9E3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD9EAEDD8E9ECD4E5E8D8E9ECDAEBEEDBEDF0DCEDF0DFF0
        F3DEEFF3DCEDF0DBECEFDDEEF2DDEEF1DDEEF1D9EAEDD7E8EBD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECE2
        F4F8BAC7C99BA1A3B2BABCA2A8AAC5D4D6F6FFFFECFDFEDCEAEDD6E7EBD9EBEE
        DBEDF0AFB9BCA1A8AAB2B9BBA3ABADD6E8EAF6FFFFE9F8FAD7E7EAD7E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD8EAECD4E4E7D1E1E4D5E6E9D5E6E9CEDFE1C7D8DAC2D3
        D5C3D4D6C6D6D8CEDEE0C8D8DAC4D4D5C7D8DAD3E4E7DCEDF0D8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD8
        EDF1C2C9CBECE5E4E9E6E6D8D3D29CA3A4A7B7B9A8B5B7E0F2F6ECFFFFE5F7FA
        CADDE0C7C9CAF8F2F1EEEAE9C6C3C2939E9FAAB8BAB3C1C4ECFEFFE8FBFFDEEF
        F2D6E7E9D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D8E9ECD4E5E7D2E2E5DEF0F3D8E9ECC9D9DCC2D2D4C1D1D3ADBC
        BEB2C2C4C3D4D5C7D8DABBCBCDBFD0D2BBCBCDD1E2E5DDEEF1D8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD5
        E9ECCED7D8FFFFFFCECECECDCDCDBBBABAC4C0C09594948B9B9DB0C1C4C4D4D7
        D1E4E7D8DCDDFFFFFFCDCDCDD3D3D3A4A2A2C2BEBD8D91919AACAFACBDC0CEDE
        E1DEEFF2D8E9ECD8EAEDD9EBEED9EBEED9EAEDD8E9ECD9EAEDD8E9ECD8E9ECD9
        EAEDD9EAEDD9EAEDD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD8E9ECD3E4E7D1E1E4D7E8EBCFE0E3CADBDDDEEFF2D2E2
        E5D9EAEDDBECF0D4E5E8D5E6E9DBECF0DAEBEED9EAEDD7E8EBD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD5
        E9EDCED6D8FFFFFFF2F2F2E5E5E5C9C9C9CBCBCBAEAEAE999A9AC9C8C7919697
        C1D5D9DBE0E1FFFFFFF4F4F4E8E8E8B0B1B1CACACAACACACA9AAAAB3B1B1AEB9
        BBE3F6FAD9EAEDD5E6E9D7E8EBD4E5E8D4E5E8D8EAEDD8E9ECDCEEF1DDEFF2DB
        ECEFDEEFF3DDEEF2D9EAEDD8E9ECD2E3E5D6E7EAE3FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD9EAEDD8E9ECD4E5E8D7E8EBDBECF0DCEDF0D8E9ECDCED
        F0DAEBEED8E9ECDAEBEEDAEBEED9EAEDD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9EBD8EAEDD9ECF0D9EBEFD9EBEFD9EBEFD9EBEFD9EBEFD9EBEFD9EBEFD9EBEF
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9EBEFD9EBEFD9EBEFD9EBEFD9EB
        EFD9EBEFD9EBEFD9EBEFD9EBEFD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD5
        E9EDCAD2D4FBF8F7FFFFFFEAEAEAD6D6D6FDFDFDB1B2B2C8C7C7FAF6F6B5BABA
        B2C7CAD8DCDCFFFFFFFFFFFFDEDEDED3D3D3EEEEEEBBBCBCDBDADADDD9D9C8D3
        D4D9EDF1D7E9EDDEEBEED4DCDDE0E4E5E0EBEDD0E4E7CCDCDEC2D2D5C1D2D4C2
        D2D4BECED0BFCFD1D2E3E6DDEEF1D2E3E5D6E7EAE3FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD8E9ECD9EAEDDCEDF0D9EAEDD8E9ECD8E9ECD7E8EBDDEE
        F1DEEFF2D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8EAEDD8EAEDD7E9ECD8
        EAEDD8E9EDD6E4E4D6E2E2D6E3E3D6E3E3D6E3E3D6E3E3D6E3E3D6E2E2D7E5E6
        D8EAEDD8E9ECD8E9ECD9EAEDD9EBEED7E9EDD7E5E6D6E2E2D6E3E3D6E3E3D6E3
        E3D6E3E3D6E3E3D6E2E2D7E5E6D9EBEED2E3E6D6E7EAD8E9EBD5E6E9D8E9ECDA
        EEF1C8D3D5D3D5D6D4D8D9D4D3D2E5E4E4FFFFFFC9C9C9A5A5A5CDCBCABDC1C2
        BDD1D5CCD4D6D9DCDDD8DBDBD4D2D1EBEBEBFFFFFFC9C9C9B1B1B1B9B7B6D1DB
        DDDAEEF2D5E8ECDCEAECEAEBEBEBEAEADCE8EACBDEE2CCDDDFBECED0AEBEBFB8
        C9CAB4C3C5B2C1C3D0E1E3DEEFF2D2E3E5D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBDAEBEED7E8EBD2E2E4D6E7EADBEDF0DDEEF1DBEDEFCEDF
        E2CBDCDFDEEFF2DBECEFD8E9ECD8E9ECD7E8EBDAEAEDDCEBEEDAE9ECDFEDF0DD
        EEF3D5DEDCCFD4CED7E5E7D5E1E1D5E1E1D5E1E1D5E1E1D5E1E1D5E2E2D0D4CE
        D6E5E6D9EAEED8E9ECD8E9ECDBEAEDDAE7E7CFD4CED5E2E2D5E1E1D5E1E1D5E1
        E1D5E1E1D5E1E1D5E2E2D0D4CED7E6E7D3E4E7D6E7EAD8E9EBD5E6E9D8E9ECDA
        EBEDD7E8ECCEE3E6B8CACDC3C4C5EEEEEEF2F3F3B5B5B5D4D4D4FFFFFFACB1B2
        C5D8DBD7EAEDCDE3E7B4C3C5CECDCCECEDEDE3E3E3B6B5B5F1F1F1F2EFEFBDC8
        CADAEEF2D7EAEDD6E6E8EDF2F3E5EBECD3E2E4D2E4E7D3E3E6DCEDF0D1E1E4D7
        E9EBDAEBEEDAEBEED9EAEDD8E9ECD2E3E5D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D8E9ECD7E8EBD2E3E5D4E4E7D8E9ECCBDCDECFE0E2C9D9DCAEBE
        BFAFBEBFBDCDCFC2D2D4D5E6E9DAEBEED7EAEDD5E2E5D0D9DBC6D1D4CED6D9D1
        DEE2D3D9D6D2DBD8DCF3FAD9ECF0D9ECF0D9ECF0D9ECF0D9ECF0DAEFF5D1D7D2
        D5E2E2D9EBEFD9EBEECDDADCC7D1D4D5DFDED2DAD5DAEFF5D9ECF0D9ECF0D9EC
        F0D9ECF0D9ECF0DAEFF5D1D7D2D6E3E3D3E5E8D6E7EAD8E9EBD5E6E9D8E9ECD8
        E9ECD9EAEDDBECEFDBECEFCCDCDFCADDE1B0BCBECDC9C8FDFAFAFDF8F7A0A4A5
        C4D8DBDEEFF2DCEDF0D8E9EBC8D8DBC5D9DCB2B9BADCD7D6FFFEFEE4DFDFB6C0
        C2DDF1F4D9EAEDD7E8ECCEE2E6CFE3E7D6E8EBDCECEFDBECEFD8E9ECDDEEF1DA
        EBEEDAEBEED9EAEDD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D8E9ECD4E5E8D1E2E4DCEDF0DCEDF0C1D2D3B1C1C2C9DADCC8D8
        DAC7D8DAC3D4D6C8D9DBD6E7EADAEBEEDAEBEFD0DFE2CEDDDFD0E1E5CBDBDED1
        E4E9D3DCD9D3DCDADDF4FCDAEDF2DAEDF2DAEDF2DAEDF2DAEDF2DBF0F7D1D9D5
        D5E2E2D9EBEFD7E8EBD1E0E3CFE0E4D3E0E0D3DAD6DBF0F7DAEDF2DAEDF2DAED
        F2DAEDF2DAEDF2DBF0F7D1D9D5D6E3E3D3E5E7D6E7EAD8E9EBD5E6E9D8E9ECD8
        E9ECD8E9ECD8E8EBD9EAEDDCEFF2DFF4F7D5E6E9CDD9DBCAD7D9C4D0D2C1CFD2
        D7E8EBD9EAEDD7E8EBDAEBEEDDF0F3DFF3F6D2E2E5CCD8DAC8D5D7C2CED0CCDC
        DEDCEDF1D8E9ECD8E9ECD9EAEDD9EAEDD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD9EAEDD5E6E8D2E3E6D7E8EBD4E5E8CBDBDEDAEBEFDFF0
        F3DDEEF1DEEFF3DDEEF1D8E9EDD8E9ECD8E9ECD8E9ECDAECEFDCEDF0DDEEF1DE
        F2F7D3DDDBCDCEC5D5E2E1D3DDDAD3DDDAD3DDDAD3DDDAD3DDDAD3DDDBCDCFC6
        D6E5E6D9EAEED8E9ECDAEBEEDDEFF3D7E5E6CDCFC6D3DDDBD3DDDAD3DDDAD3DD
        DAD3DDDAD3DDDAD3DDDBCDCFC6D7E5E7D3E5E8D6E7EAD8E9EBD5E6E9D8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E7EADBEDF0DEF1F5DBEEF2DCF0F4E3F2F5
        DAE9ECD7E9ECD8E9ECD8E9ECD8E9ECD7E8EADCEEF2DEF1F5DBEEF2DFF1F5DEEE
        F1D6E7EAD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD8E9ECD9EAEDD8E9ECD8E9ECDBECEFDEF0F3D8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD9EAEDD8E9ECD8E9ECD9
        EAEED7E8EAD1D9D5D1D8D4D1D9D5D1D9D5D1D9D5D1D9D5D1D9D5D0D7D2D3DCDA
        D9EAEED8E9EDD8E9ECD8E9ECD8E9EDD9EAEED3DCDAD0D7D2D1D9D5D1D9D5D1D9
        D5D1D9D5D1D9D5D0D7D2D3DCDAD9EBEFD2E3E6D6E7EAD8E9EBD5E6E9D8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9EBD8EAEED3E9EFD3E8ECD3E8EDD3E8EDD3E8EDD3E7ECD4EAEFD4
        EDF3D3ECF2D5EDF4D9EBEFD9E9EBD2E3E5D6E7EAE2FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D7E8EBD8E8EBDBF0F5DCF3FBDAEEF4DBECEEDFF0F3E1F3F6D9EA
        EDD7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E8EBD9EAEEDBF0F5DAEFF4DAEFF4DAEFF4DAEFF4DAEFF4DAEFF4DAF0F5DAEFF4
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECDAEFF4DAF0F5DAEFF4DAEFF4DAEF
        F4DAEFF4DAEFF4DAF0F5DAEFF4D9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD9
        E9ECE4F1F3E2F3F5E8F7FAE7F2F4E8F3F4EAF9FCEAFEFFE4F4F5D9E9ECE9FAFD
        DFEDF0DEF0F3E6F8FBE4F5F8E8F9FCE8F7F9E7F7F9E6F7F9DFF0F3D6E7EBD8E9
        ECD8E9ECD8ECF0D6E2E2DDDDD5E0E2DCD9DBD5DBDDD7DBDDD7DBDED8D8D9D3E2
        E1DAE7E5DFD5D4CBD5E1E0DAEEF3D2E3E5D6E7EAE2FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D7E7EADAF0F4D3DBD9D9C5C4D3DBD9D3E8ECCCDCDECFDFE2D9EA
        EDD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D9EBEED6
        E7EAC8D7D9C7D6D9B2C0C2BDCCCEB9C7CAB7C6C8ADBABDC0CED1D7E8EBB6C4C6
        D0E0E3CFDFE2C0CFD2B3C2C49DA9ABBAC9CCB5C3C6BDCBCECBDBDDDBEDF0D8E9
        ECD8E9ECD5EAEFDBE3E1FBF2EDFFFCFAFFFCFAFFFBF9FFFBF9FFFFFFFFEBE1DF
        AC94DDAA90FACEB7D3DDDAD9F0F7D2E3E5D6E7EAE2FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9DBEFF4D4DADDB8BC9F89CC81E4E3D3A4ABAF798487798284C1D0
        D3E5F7FAD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9DCEEF1D5
        E6E97D8788869192828C8E6F78796B74767983845960627E888ACDDDE0727B7D
        A0ADAFBBCACC848F917B8587727B7D7882846871727C8587B0BEC1E3F5F8D9EA
        EDD8E9ECD5E9EEEAF3F2D5D0CECCCCCDFFFFFFFFFFFFFFFFFFFFFFFFFFEBE3E0
        AE98DFAC91F7CEB8D4E0DFD8EFF5D2E3E5D6E7EAE2FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9DAEDF2D5DDE0BABEA799CA91D8D8CAC1CCCFA4B3B6889394BFCE
        D0E4F6F9D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9DBEDF0D2
        E3E68D989AADBABDDEEFF2CFDFE2B7C6C7AEBBBEDBECEFCDDDE0D9EAEDC9D9DC
        AAB7BACDDDE0CADADDD5E6E9CCDCDFC3D2D5CFDFE2CDDDE0D1E2E5D9EAEDD8E9
        ECD8E9ECD5EAEEEEF7F5C2BEBCC5C7C8FFFFFFFFFFFFFFFFFFFFFFFFFFF3ECDF
        AF9CDBA58CF9CFB8D4DFDED8EFF6D2E3E5D6E7EAE2FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D7E7EADAF0F2D6E2E3DDCFD7D2DFE0DDF1F3DDECEEDBECEFD8EA
        EDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD8
        E9ECE6F6F7E1F2F4DDEEF2E3F5F8E2F3F5E3F4F6E1F3F6E0F2F5D8E9EDE3F3F6
        E0EDEFDBEDF0E2F3F6DDEFF2E4F5F8DCEEF1DEEFF2E1F2F5DDEEF1D7E8EBD8E9
        ECD8E9ECD7ECF1DAE3E1E5DBD3EDE8E2EFEAE4EEE9E3EEE9E3EEECE7F1E7DEE3
        CCBDE1C5B6E9CFBED3DDDAD9F0F6D2E3E5D6E7EAE2FFFFCB907DE17F51D8FEFF
        D8ECF1D5E6E9D7E8EBD8E9EBDBEEF3DDF4FCD9EDF2D8E9ECDAECEFDCEFF2D9EB
        EED7E9ECD8F2F9D8ECF0D8E9EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAD8E9EBD5E6E9D8E9ECD8
        EAEDD9ECEFD9EAEED8ECEFD8EAEDD9EAEDD9EBEED8E9ECD8E9ECD8E9ECD8E9EC
        D9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD9EBEFD5E5E7D3DEDBD2DDDBCED9D7CFDAD8CFDAD8CFD9D6CEDCDBD3
        E6E7D4E8EACFE0E1D7E6E8DAEBEFD2E3E5D6E7EAE2FFFFCB907DE17F51D8FEFF
        D8ECF1D6E7E9D7E7EBD8EFF2D8EDF1D8F0F2D8F5F7D8EEF0D8EBEDD8F1F5D8F1
        F5D8F1F3D7D6D0D8ECEDD8F1F6D8E8EBD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8
        E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9ED
        D8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9
        EDD8E9EDD8E9EDD8E9EDD8E9EDD9EAEFD3E4E6D6E7EAD7E8EBD6E7EAD9EAEFD8
        EAEBD8E9E9D8EEEFD8E7E7D8EEEFD8F3F7D8EFF5D8EAEED8E8ECD8E9EDD8E9ED
        D8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9EDD8E9
        EDD8E9EDD8E8ECD9EBEFDAEFF4DAEEF3DAEEF3DAEEF3DAEEF3DAEEF3DAEEF3DA
        EEF3DAEEF3DAEFF4D9EAEFD9E9EDD2E3E6D6E7E9E2FFFFCB907DE17F51D8FEFF
        D9EDF2D3E4E6D4EAEFD8CFC8D8E1DDD7C7B9D7A88FD7CABFD8D9D6D7BCABD7BA
        A8D7C0B2D79F81D79E80D7CEC5D6F1F9D6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6
        E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EA
        D6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7
        EAD6E7EAD6E7EAD6E7EAD6E7EAD5E6E9D0E0E2D7E8EBD8E9ECD2E3E5D5EBF0D8
        D7D1D8C8BBD7BDACD8BEB1D7B5A1D7B49FD7BDABD7DDDAD6EEF4D6E7EAD6E7EA
        D6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7
        EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6
        E7EAD6E7EAD6E7EAD6E7EAD6E7EAD1E1E3D7E8EBE2FFFFCB907DE17F51D8FEFF
        D9EDF2D4E5E7D1F0F7D7AEA6D79B81D7A88CD6A080D7AEA3D7C6BDD7B39CD7A7
        8CD7AF97D7BFAED79673D7BFAFD3F2FAD2E3E4D2E3E5D2E3E5D2E3E5D2E3E5D2
        E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5
        D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3
        E5D2E3E5D2E3E5D2E3E5D2E3E5D0E1E3D3E4E6D9EAEEDAEBEED3E4E6D0E9EDD7
        BEBAD8C4BAD7B39DD7B8A4D7A990D7A183D8AF98D6D8D4D2ECF2D2E3E5D2E3E5
        D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3
        E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2
        E3E5D2E3E5D2E3E5D2E3E5D1E2E3D4E5E7D9EAEDE2FFFFCB907DE17F51D8FEFF
        D7EBF0DAEBEEDBEFF5D9DFDED9D1C8D9E3E3DAF6FAD9E3E1D9E6E8D9EEF1D9F0
        F4DAEDEDD9E7E5D9F0F1D9F0F3DAEAEEDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDA
        EBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEF
        DAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEB
        EFDAEBEFDAEBEFDAEBEFDAEBEFDBECEFDBECF0D9EAEED9EAEEDBECF0DBEFF5D9
        DCDBD9DBD6D9ECEBD9E9E7D9EAEBD9F1F4D9F0F4D9EAEFDAEBEFDAEBEFDAEBEF
        DAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEB
        EFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDAEBEFDA
        EBEFDAEBEFDAEBEFDAEBEFDAEBF0DAEBEED8E9ECE2FFFFCB907DE17F51D8FEFF
        D9EDF1D7E8EBD4E3E4D4ECEFD4F0F6D4EAEED4E5E8D4EAEDD4E7EBD4E7EAD4E7
        EAD4E6E9D4E7EAD4E7EBD4E6E8D4E5E6D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4
        E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7
        D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5
        E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E3E5D4
        ECF0D4ECF2D4E6E9D4E6E9D4E8ECD4E7EBD4E6E9D4E6E8D4E5E6D4E5E7D4E5E7
        D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5
        E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4E5E7D4
        E5E7D4E5E7D4E5E7D4E5E7D3E4E6D7E8EBD9EAEDE2FFFFCB907DE17F51D8FEFF
        D9EDF2D3E4E6D1E2E3D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3
        E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6
        D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3
        E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6
        D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4
        E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3E4E6D3
        E4E6D3E4E6D3E4E6D3E4E6D2E3E5D1E2E4D8E9ECE2FFFFCB907DE17F51D8FEFF
        D8ECF0D5E6E9D9EAEDDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDA
        EBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEE
        DAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDA
        EBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEE
        DAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEB
        EEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDAEBEEDA
        EBEEDAEBEEDAEBEEDAEBEEDBECEFD2E3E5D5E6E9E3FFFFCB907DE17F51D8FEFF
        D8ECF1D5E6E9D6E8EBD9E9ECE2F2F5E3F4F7E7F4F6E5F1F3E5F0F2E6F0F2E8F5
        F7E4F6F8E6F0F2E7F3F5D6E8ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE17F51D8FEFF
        D8ECF1D5E6E9D8E9ECDCEDF0B5C3C6ACB9BCA0ADAFAFBDBFADBBBDB0BEC19CA9
        ABA5B3B5B6C4C7AAB8BADBEDF0DAEBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE07F51D8FEFF
        D8ECF1D5E6E9DBECEFCEDFE19CA8ABA4B1B4818B8D838D8F848E90879193727B
        7D798385818B8C838E8FE5F7FADAEBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE07F51D8FEFF
        D8ECF1D5E6E9D8E9ECDCEDF0AAB7BABDCCCFDCEEF0D4E3E6D4E3E6D4E3E5DAEA
        ECD6E7EAD1E0E3C9D8DAD7E8EBD9EAEDD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD7E8EBDBEC
        EFDAEBEED7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD9EAEDD9EAEDD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB907DE17F50D8FEFF
        D8ECF1D5E6E9D6E8EBD7E8EBEBF7F9ECFBFCDFF0F3E9F6F8F0FDFEE9F6F8ECFD
        FEE2F4F6DDEDF0E2F1F3D6E8EBD9EAEDEBFDFFE1F3F6D9E8EBEDFCFEE1F3F6E2
        F4F7E7F9FCE5F8FBE7F7F9E4EFF0E4F3F6E9FCFEE0EDF0E5F4F6E5F7FADBEEF1
        EDFCFEE7F1F2E8F8FAE0F1F4DEF0F3E5F7FAE5F6F9E4F7FAE7F5F8E3EFF1DDEB
        EDE5F4F6DEF1F4DFEEF0E1F1F3E7F3F5DCECEFE6F8FCE2F4F7E5F7F9E8F9FBE3
        F3F6E0F3F6E3F1F3E2F1F2E6F7F9E8FAFCE8F9FBE6F4F6E4F6F9E9FAFDEBF8FA
        E4F4F6E8F9FBE1EEF0E1EEF0E7F7FADFF2F5EAFBFDE8F9FBE4F5F7DDECEFE2EF
        F1DFF0F3E8FAFDE7F8FBE2EFF1E4F3F5E5F7FAE3EFF1E8F3F5EAF7F9DEEDF0DB
        EAEDE6F8FAE3F5F8E4F0F2DFEFF2D0E1E4D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D6E7EAE2F3F6CEDADCB6C1C2E1F0F3C1D1D4AAB8BAC3D2D4B9C8
        CACDDDE0DCEDF0D8E9ECDAEBEEDBECEFACBBBDC2D2D4DEEFF1A2AFB0C8D8DAC8
        D8DAB8C7C9BECDCFB3C2C4C6D5D8BFCED1B2C1C3CDDDDFC5D4D7C1D1D4D1E2E5
        A8B5B7B8C7C9B8C7C9CCDCDECFDFE2B8C7CABDCCCFCCDCDFC0CFD2CEDFE18E99
        9B8D999BE0F2F4CDDCDDC5D5D7B8C6C9D6E6EABCCBCEC5D5D7BBCBCDB5C4C6C2
        D2D5CFDFE1BFCDCFC3D3D5A5B2B497A3A5A8B5B7BFCED1BFCED1B2C0C2B1BFC1
        C1D0D3B7C6C8CADADDC8D7DAB7C6C9C5D5D8B4C2C5BAC8CBC2D1D3D0DFE1C2D1
        D4CADBDDB3C2C4BAC8CACEDEE1C3D2D5B8C7C9C4D4D6B8C6C9B4C2C5DAEBEED7
        E6E8B9C8CAC1D0D3BECDD0C7D6D9D9EAECD6E7EAE3FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9DAEBEEDBECEF95A1A3879193A3B0B2838D8F666F707F898B737C
        7EB9C7CAE4F6F9D8E9ECE5F7FAB9C7CA909B9ECFDFE29FACAE96A2A49FACAF83
        8D8F7A8486899496899496768081828D8F6B74758D999A717A7C828D8EC6D6D8
        6A72736D76776D7678AFBCBFADBBBD858F917F8A8B6E7778717A7C848E907C86
        88757E80A1AEB097A3A5848E90828C8EAFBDBF8A94969AA6A88994956A72738C
        98998E999B8F9B9D838E907F8A8B6F7879717A7C727B7D919D9F859092677071
        828C8E7A8385828C8EA0ADAFA3B0B2B9C8CA61696A717A7B8F9A9CA5B3B5B5C4
        C6A5B2B4666F70858F91848F90838D8F97A3A5838E90656E6F646C6E95A1A2A6
        B3B58993958A9597788283B9C8CBE0F2F5D6E7EAE3FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9DFF1F3C0D0D3B3BFC1DBE9EA949FA2C9D8DBDCEDF0CBDBDECDDE
        E1D3E3E6D9EAEDD8E9ECE0F2F5C8D8DB9EAAACBCCCCFB6C3C5B6C3C4ABB9BCCE
        DDE1D1E1E4D0E1E3D9EAEDC3D3D5CFE0E2D0E0E3CCDCDEB4C2C5C5D5D8D7E8EB
        D2E3E6D2E2E4C6D6D8C7D7DAACB9BCB7C5C8D8E9EC9FACAEB3C1C3D1E1E3CAD9
        DCD8E9ECB5C4C7AFBABBBDC9CAB1BDBFACBABCA8B6B8C0CFD2DDEEF1CCDCDFD3
        E4E7B9C9CCCCD9DAC4D0D1CEDDDFCBDBDEC1D0D3BAC9CBD2E3E5D7E9EBC1D0D3
        BDCBCED3E3E6D0E0E3C0CFD2939EA0D7E8EAC2D2D4C3D2D4BFD0D2BDCACCA6B1
        B3B5C4C6DFF1F4C7D6D9A9B7B9B6C5C7B1BFC2D5E6E9C9D9DBA6B3B59CA9ABC2
        D0D2B1BDBFAEBCBFD9EAECE0F1F3D1E2E4D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBD7E7EAE1EFF2E3F2F5EAF5F6E9F9FAE4F6F9E7F7F9E0F2
        F5DCEDF0D7E8EBD8E9ECD6E8EBDFEDF0DBE8EBD5E7EAE7F5F7DAE9ECE7F5F6F0
        FEFFE0F2F5E6F6F9E5F5F8E5F5F8E2F1F4E8F7F9E4F6F8E9F7F8EBF9FAE1F2F5
        E1F3F6DFF0F3E2F3F6E1F3F5D9E7E9D7E8EAE2F3F6ECF7F9E4F2F4DDF0F3E3F5
        F8E2F4F7DCEEF1DEEFF1E0EEF0E0F0F2DDEEF0DFEFF1DEEEF1DEF0F3E2F4F7DF
        F1F4E1F2F5DDEEF1DFEDEFDFF1F4E5F7FAE4F5F8DAEBEEDDEFF2E0F2F5E2F2F5
        DDECEFE0F2F5E1F3F6DEEFF1D3E1E3D7E8EBE7F7F9E5F3F6DFF2F5DDEEF1D1E1
        E2D7E8EBE1F3F6DFF1F3E6F7FADBEBEED3E3E6E4F6F9DFF0F3E1EFF2E4F6F8DF
        F2F5DBE8EBDAE9ECE1F3F6D9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F50D8FEFF
        D8ECF1D5E6E9D7E8EBDAEBEEDBECEFCADBDEC2CDCFCEDCDEDEF0F3CFDFE2D6E7
        E9D9EAEDD8E9ECD8E9ECD9EAEDD6E7EAC9DADCDCEDF0D8E9ECD5E5E8B8C6C9C3
        D2D4E0F1F3CDDEE1CCDCDFE0F1F4DFF1F4D3E4E7D8E9ECDCECEED5E6E8D4E5E9
        D8E9EBD8E9ECD8E9ECD8E9ECD9EAEDD9EAEDD7E8EBD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD9EAEDD9EAEDD8E9ECD9EAEDD9EAEDD9EAEDD9EAEDD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD9EAEDD8E9ECD8E9ECD8E9EC
        D9EAEDD8E9ECD8E9ECD9EAEDDCEDF0D9EAEDD8E9ECD8E9ECD9EAEDD8E9ECDBEC
        EFDAEBEED7E8EBD8E9ECD8E9ECD9EAEDDAEBEED7E8EBD8E9ECD9EAEDD9EAEDD8
        E9ECD9EAEDD9EAEDD7E8EBD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D7E8EBE9FBFECADADC8E999B6D7677838D8F565E5FA5B2B4E6F8
        FBD9EAEDD8E9ECD8E9ECDDEEF1D9EAED909B9D9BA7A99FABAD585F605C63647B
        8486ACB9BB9EAAAC9DA9ACB2C0C2AFBDBF798384939EA0767F81575E5F848F91
        D8E9ECDDEEF1D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D8E9ECEAFCFF96A3A59EA9AAADB9BBA3B1B4919D9FB9C7CAE0F2
        F5D9EAEDD8E9ECD8E9ECDFF1F4CFE0E28F9A9CA1ADAFB1BFC2AAB7BAAAB7BA89
        9496AAB7BA9DAAACA3B0B2919C9E727B7D95A1A39DAAAC939FA1879395A3B0B2
        D5E6E9DCEDF0D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D8E9ECD9EAEDBECFD2D4E2E4EFF9FBE9F6F8F2FEFEE3F4F6D7E8
        ECD8E9ECD8E9ECD8E9ECD9EAEDD7E8EBC9DADCE0F0F3E9F7FAEDF8F9ECF7F9E6
        F7FAE6F8FACFDFE2D2E2E5CEE0E3CFDDDEE7F4F7E3F3F6E8F5F7EFFFFFE9F6F7
        D8E8EBD7E8EBD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9D7E8EBD8EAEDE1F1F4E3EEF1DCECEEE1F0F2DCE8EADFF1F3D8E9
        ECD5E6E9D9EAEDD8E9ECD6E7EBDBEBEEEBFEFFE4F3F6DCE9ECDCEEF0E3F1F3CA
        D8DAD3E1E3E6F7F9DDEFF2E0F1F4E1F3F6D9EAEDDAEBEED8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9D8E9ECDFF1F4B6C4C7A9B6B88893957B84869BA7A97D8688A6B3
        B6DBECEFDCEDF0D8E9ECE2F3F7C1D0D3B6C4C798A4A68994968C979976808166
        6E6F8E9A9CE6F8FBDAEBEED8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE3FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9DAEBEED6E7EAA0ACAF97A3A59DAAAC869193A4B1B3AAB8BAB3C1
        C3DAECEFDBECEFD8E9ECE6F8FBBFCDD0757F80818C8DA5B2B4A8B6B88C979987
        9293B3C1C3D4E5E8DAECEFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9D8E9ECDAECEFBAC9CCC7D7DAE9FBFEE4F4F6DBE8EBE9F6F9E0F3
        F6D7E8EBD8E9ECD8E9ECDCEDF0D3E3E6A7B5B8D1DEE0F0FFFFE8F9FCE4F1F3D3
        E1E3E8F4F6D8E9ECD7E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD9EAEDD2E3E5D6E7EAE2FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9D7E8EBD7E8EBE5F6F9E2F4F7D7E8EBDBECEFDBECEFD7E8EBD8E9
        ECD8E9ECD8E9ECD8E9ECD6E7EADCECEFEAFFFFDCF4F8D1E7ECD3EAEFD7ECF0DC
        EFF3D3E9EED4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEF
        D4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EA
        EFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4
        EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD4EAEFD3E9EDD3EAEFD3EBF1
        D2EBF2D6EBF0D9E9ECD7E7E9DBEFF2DDF2F6DAEDF1DBEEF2DBEEF2DBEEF2DBEE
        F2DBEEF2DBEEF2DBEEF2DAEEF2DAEEF2DAEEF2DAEEF2DAEEF2DAEEF2DAEEF2DA
        EEF2DAEDF1DEF3F8D9ECEFD8E9ECD2E3E5D6E7EAE2FFFFCB8F7DE07F51D8FEFF
        D8ECF1D5E6E9D7E8EBD9EAEDDDEEF1DCEDF0E2F3F6E1F2F5DCEDF0E2F4F7DCED
        F0D7E8EBD8E9ECD8E9ECD8EAEED6E3E3E1ECECE6F5FAE4F3F7E4F3F7E3EFF1E0
        E8E7E1ECECE5F7FCE4F2F5E3F1F5E5F7FDE5F6FBE5F6FBE5F6FBE5F6FBE5F6FB
        E5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6
        FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5
        F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE5F6FBE6F9FFE2EFF1DCE0DCDDE1DF
        DEE1DFDAE3E1D7E9ECDBEEF3D3E0E0C5C9C3C8CECBC8CECAC9CFCBCAD0CBD1D7
        D4D5DCD8D2D9D5CED4D1CFD5D2CDD3CFD3D9D5D4DAD6D0D5D2CDD2CFCBD0CDC8
        CDCAC6CBC8C9CCC6DAE8EAD9ECF0D2E3E5D6E7EAE2FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9D7E8EBD5E7EADCEBEED8E8EAC7D7DAD4E5E8DAEAEDD1E1E5D5E6
        E9D8E9ECD8E9ECD8E9ECD6EBEFDEF6FCE6BFA5D68857D79064D79064DC9D77EA
        C0A6DEA27DD4895AD9976DD9956AD68F63D79165D79165D79165D79165D79165
        D79165D79165D79165D79165D79165D79165D79165D79165D79165D79165D791
        65D79165D79165D79165D79165D79165D79165D79165D79165D79165D79165D7
        9165D79165D79165D79165D79165D79165D79165D0804EEAC2AAFFE9E0FFDFCA
        FFD3B3E9D0C0D2ECF3E0F9FFBFBFB4CBC1B5E5EBEDDBDDDCE7EAE9EFF2F1D6D8
        D7C5C7C6CBCDCCDFE2E1E0E2E1E1E3E2D6D8D7D8DAD9D2D4D2D0D2D1D9DBDAE1
        E3E2E5ECEFC0B5A6C9CEC7DEF4FBD2E3E5D6E7EAE3FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9DBECEFD5E6E97E888A96A2A47B8587666E6F8B9698515859A7B4
        B6EDFFFFD8E9ECD8E9ECD6EAEFE2FEFFDCA786C45E1FD28A5CCF8454DEA886DF
        AC8CE3B69AC66B32C9723CD08556B84802BD5412BD5412BD5412BD5412BD5412
        BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD54
        12BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD5412BD
        5412BD5412BD5412BD5412BD5412BD5412BD5412B13900E3AA87FFEBE6B28972
        DAA382F4DBCBD2EDF4DEF7FEC1C1B9DFD9D1FAFFFFFBFFFFD3D8D8B3B6B68083
        838E91919396967578788083839DA0A0727474626464BDC1C1F1F5F5EBF0F0F6
        FBFBFDFFFFD1CAC1C5CBC6DEF4FAD2E3E5D6E7EAE3FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9DBECEFD5E6E96A737599A5A8CCDCDFA6B3B5B6C5C7AAB8BAC5D5
        D7E0F1F5D8E9ECD8E9ECD6EAEFE0FBFFE0B193C86529C86B32C7682EC6672CC3
        5F21DA9971CB723BCA713AD28455BB4903BF5412BF5412BF5412BF5412BF5412
        BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF54
        12BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF5412BF
        5412BF5412BF5412BF5412BF5412BF5412BF5412B33700E5AD8CFCEFEECA9F8D
        E8AC95F0D9CCD2EDF2DEF7FEC0BEB9E6DED7FFFFFFFFFFFFB4BABB878C8FD3D9
        DBDDE3E6DEE3E6D5DBDDC0C5C8B2B6B8D0D6D8C6CDD0EDF2F3FFFFFFFCFFFFFB
        FFFFFFFFFFD6CFC9C4C8C5DEF4FAD2E3E5D6E7EAE3FFFFCB8F7DE07F50D8FEFF
        D8ECF1D5E6E9D7E8EBD6E7EAD8E7EAD9E9EBE4F5F6EEFDFFE6F8FCECFEFEE0F2
        F4D5E6E9D8E9ECD8E9ECD7ECF1DBEFF3E5C4AEDDA684D8A17CD79C77D79E79D5
        9A73D8A07BD9A27EDEAE90DDAB8BDAA582DBA785DBA785DBA785DBA785DBA785
        DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA7
        85DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DBA785DB
        A785DBA785DBA785DBA785DBA785DBA785DBA785D69B74E8CAB6FEF0E7FFE3D3
        FFD3BEE4D1C4D3EBF0DEF7FFC2C5BDD7C5B3F0E8E0EDE4D9D8CCC3DBD2C9FFF8
        EFFBF1E7F6EDE4FAEFE5FAF3EAF1E8DFF8EEE4FFF8EEF0E6DCE5DAD0E8DED4E8
        DED4F1E8E0CCBBA8C8D1CDDEF3F9D2E3E5D6E7EAE3FFFFCB8F7DE17F51D8FEFF
        D8ECF1D5E6E9D7E8EBD9EAEDDEF0F3DCEDF0D7E8EBD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD9EBEFD5E1E1D8E7E7DEF5FBDEF5FBDEF6FCDEF6FCDE
        F7FDDDF3F8DEF6FCDCF1F6DCF1F6DEF7FEDEF6FCDEF6FCDEF6FCDEF6FCDEF6FC
        DEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6
        FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDE
        F6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCDEF6FCE0FBFFD9E9EAD1D8D3D3DDDA
        D2DEDAD5E1DFD8E9EDDAECF0D5E7E9C3C5BCC2C1B6C0C1B7CDCEC4CECFC5C1C2
        B8C3C4BAC3C4BAC3C4BAC1C2B8C4C5BBC2C3B9C1C2B8C1C2B8C1C2B8C1C2B8C1
        C2B8BFBDB0C7CDC6D9EDF2DAEBEED2E3E5D6E7EAE3FFFFCB8F7DE17E51D8FEFF
        D8ECF1D5E6E9D7E7EAD8EEF0D8EAEDD8F0F2D8F3F5D8F2F3D8F3F7D8F2F5D8E9
        EBD8E9ECD8E9ECD8E9ECD8E8EBD9EAEED8EEF4D7EDF3D7EDF3D7EDF3D7EDF3D7
        EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3
        D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7ED
        F3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7
        EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EDF3D7EEF4D8EEF4
        D8EFF5D8EDF3D8E9EBD7E7E9DAECF0DEF6FEDDF5FEDDF5FDDDF5FDDDF5FDDDF5
        FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDDF5FDDD
        F5FDDDF6FFDEF5FCD9E9ECD8E9ECD2E3E5D6E7EAE3FFFFCB8F7DE17F51D7FEFF
        D8ECF1D4E5E8D8E9EDD8DEDDD8F1F4D8D7CFD7C6BAD8D3CCD8CCC2D7D0C7D9EB
        EED9EBEED9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9
        EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAED
        D9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EA
        EDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9
        EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAED
        D9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EA
        EDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9EAEDD9
        EAEDD9EAEDD9EAEDD9EAEDDAEBEED1E2E4D6E7EAE3FFFFCB8F7DE18051D7FDFF
        D9EDF2D3E4E6D1EFF5D7AEA8D7A58ED7A28FD69377D69D8AD79475D89A7ED4E0
        E2D1E7EBD2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2
        E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5
        D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3
        E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2
        E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5
        D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3
        E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2E3E5D2
        E3E5D2E3E5D2E3E5D2E3E5D1E2E4D3E3E6D9EAEDE2FFFFCB8F7DE17F51D7FEFF
        D8ECF0D8E9ECD6EFF5D7CFC6D8B6A3D8D4CED8E6E7D8D8D2D8DEDCD8E0DED7E4
        E5D6E8ECD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6
        E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EA
        D6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7
        EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6
        E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EA
        D6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7
        EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6E7EAD6
        E7EAD6E7EAD6E7EAD6E7EAD6E7EAD9EAEDD9EAEDE2FFFFCB8F7DE28957D6FFFF
        D6FFFFD6FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FF
        FFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5
        FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFF
        D5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FF
        FFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5
        FFFFD5FFFFD5FFFFD5FFFFD5FFFFD5FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFF
        D6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FF
        FFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFD5FFFFD5
        FFFFD5FFFFD6FFFFD6FFFFD6FFFFD6FFFFD6FFFFE0FFFFC99986DD602FD6A481
        D79A78DA9A75DD9C74DC9A74DD9A74DC9973DC9A74D89977D99976D99976D999
        76D99976D99976D99976D99976D99976D99976D99976D99976D99976D99976D9
        9976D99976D99976D99976D99976D99976D99976D99976D99976D99976D99976
        DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA98
        76DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA9876DA
        9876DA9876DA9876DA9876DA9876DA9876D99776D99776D99776D99776D99776
        D99776D99776D99776D99776D99776D99776D99776D99776D99776D99776D997
        76D99776D99776D99776D99776D99776D99776D99776D89472DB9975DEA683DD
        9E7BDEA88DD7997BE7925EFFA660FEA462FFAA61FCAC73CA6040E33C0DEF3B00
        FA4500FB4D00F84A00F94200F53C00F83D00F84600FE4B00FD4A00FD4A00FD4A
        00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD
        4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00FD4A00
        FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE49
        00FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE4900FE
        4900FE4900FE4900FE4900FE4900FE4900FD4700FD4700FD4700FD4700FD4700
        FD4700FD4700FD4700FD4700FD4700FD4700FD4700FD4700FD4700FD4700FD47
        00FD4700FD4700FD4700FD4700FD4700FD4700FD4700FF4500F45913E36223E9
        6827E75F13FD5903D55436764E7E6F3F715C3F82B45055EF3D0DEB440DEE8132
        E16B25E47634E17A3BF2A674D88F6FE29F7CE96F25FF6200FE6801FE6801FE68
        01FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE
        6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6801FE6701
        FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE66
        01FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE6601FE
        6601FE6601FE6601FE6601FE6601FE6601FF6400FF6400FF6400FF6400FF6400
        FF6400FF6400FF6400FF6400FF6400FF6400FF6400FF6400FF6400FF6400FF64
        00FF6400FF6400FF6400FF6400FF6400FF6400FF6300FF6A01F77330ED7048F5
        AC83F26000FF73048A71A92A7CFF5794FF1973FF566FE4F35B16E0380DE57229
        CFB6BCDDA086E17941EAA784E39A76E2B09DDC682CF14C00EB5600EB5600EB56
        00EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB
        5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600EB5600
        EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB55
        00EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB
        5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500
        EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB5500EB55
        00EB5500EB5500EB5500EB5500EB5500EB5500EB5300E95400F3783DFA8961FB
        AD8BFC9B61FF6F139972965F8CFFFFFFFF82ABFF445ACCE04E18C52D0DE46714
        ECA16CF07021E75F07E15F1AE44100E5631EE15C10DE4B00DF4F00DF4F00DF4F
        00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF
        4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00
        DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F
        00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF4F00DF
        4F00DF4F00DF4F00DF4F00DF4F00DF4F00DE4F00DE4F00DE4F00DE4F00DE4F00
        DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F
        00DE4F00DE4F00DE4F00DE4F00DE4F00DE4F00DE4D00DA4600EF8656FDB3A0FB
        C8BDFAAD99F25E16A587A073B8FF6795FF3981FF5D7AE2CB4016C7401EE54C00
        F76100F36701F26901F05F01ED6200ED5500EE5C02ED6303ED6103ED6103ED61
        03ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED
        6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103ED6103
        EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC61
        02EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC6102EC
        6102EC6102EC6102EC6102EC6102EC6102EB5F02EB5F02EB5F02EB5F02EB5F02
        EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F
        02EB5F02EB5F02EB5F02EB5F02EB5F02EB5F02EB5E01E85300F48D4AFFB88FFD
        B88DFCA16EF4792ADF8855B3A8C89381AF8786C1B07B83CB3110FF00FFE75A00
        F47312F98426FA8728FA8526FB8326FB8326FB8326FB8326FB8326FB8326FB83
        26FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB
        8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326FB8326
        FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC84
        26FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC8426FC
        8426FC8426FC8426FC8426FC8426FC8426FA8225FA8225FA8225FA8225FA8225
        FA8225FA8225FA8225FA8225FA8225FA8225FA8225FA8225FA8225FA8225FA82
        25FA8225FA8225FA8225FA8225FA8225FA8225FA8225FA8225F87B1DF78020F7
        7C1CF98729FA862BFB7312FF780DFF7E0DFF7E0DF65500FF00FF}
      Description.Text = 'Print the document'
    end
    object stBlue: TdxBarScreenTip
      Header.Text = 'Blue'
      Description.Text = 'Apply Blue Color Scheme'
    end
    object stBlack: TdxBarScreenTip
      Header.Text = 'Black'
      Description.Text = 'Apply Black Color Scheme'
    end
    object stSilver: TdxBarScreenTip
      Header.Text = 'Silver'
      Description.Text = 'Apply Silver Color Scheme'
    end
    object stRibbonForm: TdxBarScreenTip
      Header.Text = 'Ribbon Form'
      Description.Text = 'Toggle to display the editor either as a ribbon or normal form'
    end
    object stAppButton: TdxBarScreenTip
      Header.Text = 'Application Button'
      Description.Text = 'Toggle to show/hide Application Button'
    end
    object stQAT: TdxBarScreenTip
      Header.Text = 'Quick Access Toolbar Visibility'
      Description.Text = 'Toggle to show/hide Quick Access Toolbar'
    end
    object stQATBelow: TdxBarScreenTip
      Header.Text = 'Below the Ribbon'
      Description.Text = 'Show Quick Access Toolbar below the Ribbon'
    end
    object stQATAbove: TdxBarScreenTip
      Header.Text = 'Above the Ribbon'
      Description.Text = 'Show Quick Access Toolbar above the Ribbon'
    end
    object stFontDialog: TdxBarScreenTip
      Header.Text = 'Font Dialog'
      Description.Glyph.Data = {
        B6200000424DB62000000000000036040000280000005E0000004C0000000100
        080000000000801C0000130B0000130B00000001000000000000040204007482
        8400B4C2C400B48E7C00CCE2E400CCA28C00B4220400DCC6B400846A9400C456
        3400DCA2800094A2A400ECE2DC00C46E3400C4D3D400DCD6B400DC865C00B4B4
        B400F4D5C4008C8C8C00CCC2B900ECF3F400EC722400DCBADC00DCB29C00E456
        0400DCD6D400B4869400A4B3B400E4966C00E4EEF400C4D6DC00D4B5A400EC66
        0400DCE2DC00ECEAD8006C717100BC927C00B45A4400E47A4400648AEC00BCCC
        CF00B4B26C00CC340400F4CCB900948ECC00D4CEAC005462CC0094A6F400F486
        50008C979900F4B49400A4A5A400C47E7400B4BDC200F4FAFC00DCE4E600A46E
        6C0084909200E4CAE400FCA37C00CC7C4800D4D4B800ECD4C700ECDED400F466
        0C00C4C5BB00DCCEBC00F4761500E4BEA700FCE5DB00F4DED400DCDEDC00ECEC
        E900747D7F009C9C9C0084848400CC855400CCAE9400AC3A1C00DCAB8B00DCDA
        CC00E48E5C00FCF6F300E4B49900F45E0400ACBBBD00F4986800D4DCDC00CC96
        7000CCCCCC00C4BAA400AC6E7C00D4D4D300D4724C00D4C5B500E45E0400CCBE
        AC00CCB29C00CC4A0C00949EA100DCEAEC00F4EDE500CC8A5C00D49A7700D4EA
        EC00ECC3B0009CAAAC00F4E6F400DCD5CB00FCD5C300F4F4F200F47A2C00547A
        EC00A4AEB200BCBCBB00F46A0400FC7A1800D4CEC6007C8A8C00BCC6CB00D4E6
        E400F4E4DC00EC844800EC580400E4D9D600BC968400ACB6BA00CCDEE300849A
        EC009C3E6400AC6A94008482C400C46A34009C7E9C00E4420400A47E74005C6A
        CC00C4B29C00D49E8400A4768C00DC622400BC6E5400BC6A5400BC320C00A44C
        5C00DC9B74004C6EEC00C496AC00CC3A0400A49ACC00FC6E0400D4AECC00C46E
        5400BCBB8C00FCAE8C00C4B6A400B4769C00E46A1C00DC7E4400ECAA8C00ECCD
        BC00D4DEFC00DC3E0400F48A4400DC763C00E4641800D4866C000C0A0C00CC76
        3C008C9294006C767400C49E8C00BC2A0400C44A2400F47E2C00ECDAEC00C4BE
        BC00F46F1400E4E2D000FC824400D4AA9000FC965C00D4946800DC6E3C00848A
        8C00D4DAD400B4624400EC8E4C00FC6A0400EC6A0C007C858900D4A68A00E4C2
        B0009CA6A800CC723C00E4845400BCB6AC00EC926400C4CDD200FCCEB7009496
        9500FCB69C00FCFEFC00E4E4E400D47A4C00FC650400FCDCCF007C7B7C00E4AE
        8C00D4BDAC00D48E6400E4D5C900ACACAC00A4425C00646EC4008C6C9400CCD6
        D400CCC6C400DCB6A400CCDADC006C86EC00D4CABC00D4D2C400C4C4C400D486
        5400E4B6A400AC728C00FCD6CC00F4F6FC00F4763C005C76EC00D4E6EC00AC7A
        8C00C4BE8C00E4E3DC00D4AE9C00FC9A6C00EC7A3F00E4DED800E4DACC00EC5E
        0400D4B29C00E4EAEC00F46A1400F48A54009492940074767400EC8E5C00B4C6
        C700DCA68400ECE6E400CCC6BC00DCB69C00E45A0400DCDAD800AE8E8E99998F
        99998F99998F99998F99998F99998F99998F99998F99998F99998F99998F9999
        8F99998F99998F99998F99998F99998F99998F99998F99998F99998F99998F99
        998F99998F99998F99998F99998F99998F99998F99998F4F0000106938693869
        65E86569386965E86569386965E86569386965E86569386965E86569386965E8
        6569386965E86569386965E86569386965E86569386965E86569386965E86569
        386965E86569386965E86569386965E86569386965E8658F0000106569656965
        E86569656965E86569656965E86569656965E86569656965E86569656965E865
        69656965E86569656965E86569656965E86569656965E86569656965E8656965
        6965E86569656965E86569656965E86569656965E865698F0000106569025880
        7980DCE8D980791F78E8DCDC79E880DC5880DC79806938696569656938696569
        6569386965696569386965696569386965696569386965696569386965696569
        38696569656938696569656938696569656938696569388F00001065E8C2774A
        64B94A0432BFBFC256776BBFC2023A7F77B9016B1C386965E865E8656965E865
        E8656965E865E8656965E865E8656965E865E8656965E865E8656965E865E865
        6965E865E8656965E865E8656965E865E8656965E865698F0000106965F9C729
        F9F9C78029D91FC280DC29DC0E80DC0E291FC729656965696569656938696569
        6569386965696569386965696569386965696569386965696569386965696569
        38696569656938696569656938696569656938696569658F0000106569DCDCDC
        F95829DC2902DCDCF97229781FDC021C290279C7F90E0EE8DCDC0EF9E829F929
        29F9E80E780E0E801F29DC360E0E1F292902F9DCF9D9DC02292929DC7F1F2902
        DC6965E86569656965E86569656965E8656965693869658F000010E865561C0B
        BF2932366BAB6B1C7F644A013A7F564A0B240EBF3AB96B651C72AA3AD964324A
        4ABF29BF0B013256B9241C644A0B563232D00B7F32771C0BB93A77721C77BFC2
        6B65E8656965E865E8656965E865E8656965E8656965E88F00001065696B5665
        80698069656569291C6965E8656B8065E8E8E829E8650E69C20204E8E8693869
        65E83829E8650E69695629F96965E8656969E829E8656978698036696565E865
        69656965E86569656965E86569656965E8656965E865698F00001065E8656569
        656965656965696569386965696938696565E8656569E8656965E86569656965
        E86569386965E8656569656569656965E865656965E865696569656938696569
        65E86569656965E86569656965E8656965E865696569388F000010656979E8E8
        79E879E879E879E879E8797979E879E879E879E879E8E8E8E8E8E879E8E8FFFB
        FBCCFBCCFBCCFBFBCCFBFBCCFBFBCCFBFBCCFBFBCCFBFBFBCCFBFBCC49FBCC0C
        D4433F1AE8656965E865E8656965E8656965E865E865698F00001065E879E8E8
        E838E8E8E838E8E838E869386938E865E8E86938E86938E8E838E8E87965FB48
        FFCC5D5A5A5A5DCCCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
        C82CC8FF65E86569656965E8656965E8656965696569658F00001065E8E83865
        6965696565696569656965696569656965656965696569656569656979E8FB73
        3411D536C94BD55ACBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
        452518FF656965E865E8656965E8656965E865E865E8658F0000106938796965
        69656965696569656965E865E865693869E865E865E86569696569387969FB49
        CB49CBCB53CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
        CFE4C8FFE865E8656965E8656965E865696569656965E88F0000106569E8E8D4
        1A1A6D1A1AFBFBFB7A49FB49FB49FB497A49FB49FB0CA1A1A1BA6569E838BA48
        4848484848224822482248224822482248224822482248224822482248224848
        FF48FF586569656965E8656965E8656965E865E86569658F00001069387979B1
        00000000005D7636115AE06FCBCBCBCBCBCBCBCBCB536E452C48693879692929
        7F0B0BF958696565656565656565656565656565656565656565656565656565
        6965656965E865E8656965E8656965E8656965696569388F0000106569E879B1
        00000000A87373D5345A34CBCBCBCBCBCBCBCBCBCB5318AC6A486965E8E8021C
        1CB964BF8065E869E869E869E869E869E869E869E869E869E869E869E8693869
        386965696569656965E8656965E8656965E865E86569658F000010693879E8DF
        D0F7D04AD0CC4866CBCB66CBCBCBCBCBCBCBCBCBCB53CF6E6EBA65E87965F90E
        658065DC69656965656565656565656565656565656565656565656565656965
        6965E865E865E8656965E8656965E865E8656965E865698F0000106569E838BA
        FF5848BA485848584858FF58484848484848484848584858FF58696579E86569
        69656965E865E865E869E869E869E869E869E869E869E869E869E869E8656965
        696569656965693869656965E86569656965E8656965E88F000010693879E8BF
        C256721C80656965E8656965693869E869E869E865E86569656965E879656965
        38693869656965696569656565656565656565656565656565656565656965E8
        65E865E865E8656965E8656965E865E8656965E86569658F0000106569E83856
        F96B3A32D96965696569386965696565656569656965693869656965E8E87979
        E879E879797979797979790479790479790479790479790479790479E879E879
        79E879E8E8656965E8656965E8656965E8656965E865E88F0000106938E86936
        0E79D9696569656938696569656965E869E865E865E8656965E865E879E879E8
        69E86938E86938E8E838693869386938693869386938693869386938E8E838E8
        6938E87965E8656965E8656965E8656965E865696569658F0000106569E86569
        6569656938696569656938693869656965656965696569386965696579E8E838
        651E1E651E1E651E1E651E1E651E1E651E1E651E1E651E1E651E1E1E1E1E1E65
        1E696579E8656965E8656965E8656965E8656965E865E88F0000106938797942
        76FC0232DC1F78291F0E8029656965E865E865E865E8656965E865E8E8387969
        0E80696565696565696565696565696565696565696565696565696965696965
        1E65E8E865E865E8656965E8656965E8656965E86569658F0000106569E8586D
        6FDF7F1CC2BF324AB9ABC2AB8065E8656965696569656938696569657969E8E8
        0E1F656969656965696569656969656969656980696569656969656569656569
        1E696579E86569656965E8656965E8656965E8656965E88F00001065E8795842
        38DEF902790456DC022980803869656965E865E865E8656965E865E8E8E87965
        1F1F69656569656965690E80567F1C563604DC1CF91C561F6565696965696569
        1E65E8E865E865E8656965E8656965E8656965E86569658F0000106569E8E85A
        5AD965E865E86569656965696965E865E8656965696569386965696579E879E8
        0E1F6569656965696569C23A72777277C22902C202366B1F6965696569656965
        1E696979E8656965E8656965E8656965E8656965E865E88F0000106938796958
        DC580EC7292956290EC729DC65696569656965E865E8656965E865E8E8387969
        0ED9E865E865E86569381F02E8291CC2E878F9E8DC6479E86569656965696569
        1E69387965E8656965E8656965E8656965E865696569658F00001065697958DE
        23FC0256C20BC2721C6B6B72E865E865E865E86569656965E86569657969E838
        1F1F6569656965E86569656938696569386965E865E8E865E865E865E865E865
        1E6569E8E8656965E8656965E8656965E8656965E865E88F0000106938797976
        49DF0B363A325632726B7832656965696569656965E865E8656965E879E8E869
        0E1F65E865E8656965E865696569656965696569656965696569656965696569
        1E65E879656965E8656965E8656965E8656965E86569658F0000106569E858C5
        FC42561C293629290E2929F969386938693869386965696569386965E83879E8
        DC56020202020256020202560202560202560202560202560202560202560202
        1F696579E865E8656965E8656965E8656965E8656965E88F00001065E8796569
        656938656965696569656965656965696569656965E865E8656965E87969E869
        656969E869E86965696965696569656965696569656965696569656969656965
        E865E8E8656965E8656965E8656965E8656965E86569658F0000106569E8E865
        69656965E865696569656965E865696569656965696569656965E865E8E87938
        6965656948386965E865E8656965E8656965E8656965E8656965E86565696569
        65696579E8656965E8656965E8656965E8656965E865E88F00001065E879E818
        D25F92D2D2DBE869386938E869E865E8E865E86938E86938E8E865E804387969
        43D28B50B5200AD26569E865E8E865E8E86569E86569E865E8E865E86938E8E8
        6938E80465E8656965E8656965E8656965E865696569658F0000106569E8790A
        D2DBDE43D27638E8E8E8E8E879E8E8E8E8E8E8E8E8E8E8E8E879E8793869E8E8
        201ADE5F0776201AE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E879E8E8E87979
        E879E83869656965E8656965E8656965E8656965E865E88F00001069386565E8
        38E865E8656569656965696569386938693869386965E8656938696569656965
        386965E865693869386938693869386938693869386938693869386938696569
        3869656965E865E8656965E8656965E8656965E86569658F0000106569693869
        6569656965E8656938693869656965696569656965696569656965E8656965E8
        6569656965696569656965696569656965696569656965696569656965693869
        656965696569656965E8656965E8656965E8656965E8658F000010E865656965
        6965E8656965696569656965E865696569656965E865E865E86569656965E865
        6965E865E865E865E8656965696569656965E8656938696569656965E8656965
        6965E865E865E8656965E8656965E8656965E8656965698F0000106569E879E8
        79E879E879E87979E879E87979797979387979793879797938E879E8386938E8
        79E838E8E8E8E879E87938E879E83879E87938E879E865E838E879E838E879E8
        3879E83869656965E8656965E8656965E8656965E865E88F00001065E8406698
        B066DA0C1A7D0C76431A7D660C7D1A1A7D1AFBDAEF1A660CEF3FA13F5D65EF66
        666666666666666666666666666666666666666666EF38E81A1476666666667A
        433F3F5D65E8656965E8656965E8656965E865E86569658F0000106569663E9D
        6C6F1334D54BD5B91113136FD5721373735A73C9C93449B9D52C18126D69FBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB666579FB5A735DCBCBCB53
        C81812516965E8656965E8656965E865696569656965E88F000010E865FBEAE3
        176F34FFCCFF6F49156615FFEFCC6F66CBE0496F66E5CBE078DBC0A16D3849CB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB66E879FB737349CBCBCB53
        2005A11A656965E8656965E8656965E865E865E865E8658F0000106569662394
        6CCB73CC5DFFCC5A5D5D5DCB49FF5DFF385DCCE0485D53CBCB46CF47FF69FBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E866495AE5CBCBCBCB
        46CFCF5865E8656965E8656965E86569656965696569658F000010E865FB2E83
        B06F13D5D54BD5B911AAF64934D5F611DA5A5A4BC9D56FCBE56F37CB483849CB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6669E866DA72EFCBCBCBE5
        6F37CB486965E8656965E86569656965E865E865E865E88F0000106569492A88
        3BE511CCE549CBCBCBCBCBCC1549CBCBCB7615CBCBCBCBCBE515CBCB4869FBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E8FB5DE066CBCBCBE5
        15CB3748656965E8656965E865E86569656965696569658F00001065796673DF
        6FCCFF5A731166E05A5DB15ADA115A6F5A485A66CBCBCBCB376F3737483849CB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6669E86648E015CBCBCB37
        6FE5CB48E8656965E86569656965E865E865E865E865E88F00001065E86613CC
        9ACBF6E07313FFFF4B7311E073F63448C94B7315CBCBCBCB376F37CB4869FBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E866E03466CBCBCBE5
        15CB374865693869656965E865696569656965696569658F00001065E8664973
        DFCB49CB6F156F6F493753CBCB49CBCBF36C5D53CBCBCBCBE56F37CB483849CB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB666979FBCC5ACBCBCBCB37
        155337483869656965E8656965E865E865E865E86569388F000010656966345A
        23CC7373D513CCCC11734B5DD5341111CC11D95DCBD5E011E015CBCB4869FB11
        73E034DA5D11344B5ACBCBCBCBCBCBCBCBCBCBCBCB6638E8665DD56FCBCBCB6F
        0C7A66486965E8656965E8656965696569656965E865698F00001065E866C9EB
        9ACB345D5A34FF3473E05DE0E03473735DF6D5E0CBC9B1735A1537374865FB34
        735A34C5C711C5345ACBCBCBCBCBCBCBCBCBCBCBCB6669E8FB73F6CBCBCBCB53
        6E6E125D386965E8656965E865E865E865E865696569658F0000106569666F73
        B3CBE5CB6FE5535DCBCBCBCBCBE5CBCB53E56F5ACBFFCBCB4915CBCB4869FBFF
        CBCBE56F6FCBCB49CBCBCBCBCBCBCBCBCBCBCBCBCB6638E866E56FCBCBCBCB53
        6EC8125169656965E8656965696569656965E865E865E88F00001065697AAA51
        51CCD511C9F74811344CD5C54B4BCBCBCBCBCBCBCBCBCBCB376F37534865FB4B
        D511F673CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6669E8665A3453CBCBCB6F
        6EC8121A65E8656965E865E865E865E8656965696569658F000010656966D55A
        9ACBD5EF5D73FF11E05D5A5DCCFFCBCBCBCBCBCBCBCBCBCB371537CB4869FBC9
        5A1AD511CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E8FB7378CCCBCBCBCB
        E46E12516965E8656965696569656965E865E865E865E88F0000106938494973
        4953CB1549CC53CCE5CCF353E5CBCBCBCBCBCBCBCBCBCBCB530C7A7A4865236F
        49CCE566CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB666979666F53CBCBCBCB6F
        464646FFE858424242424242424214424242425D6569658F0000106569664C23
        3EF34B11C9D0FF131113C5C9CCCBCBCBCBCBCBCBCBCBCBCBCB6E6E125169FB34
        73F7F65DCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E8665AE0CBCBCBCB37
        1537CB486942CCCCF34838FF38483838CCF3F3B16965E88F0000C4693849E073
        9ACB7349CC5A38345DCCF35D53CBCBCBCBCBCBCBCBCBCBCB6F407A7A48384973
        48E0CC49CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB666979FBE073CBCBCBCB6F
        4047FB483842151515D573BFF672C94CF31515426569658F0000106569503539
        4D92D30A0A50D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3456A2C2CDF69FD68
        9250E25450FAFAD3D3D3D3D3D3D3D3D3D3D3D3D3D3C038E85068FAB7D3D3D3C1
        6A2C2C5D65426F6FE5D55D5DD95D3811496F6FFC6938698F0000106965598226
        91C3D168FA54C38585858585858585858585858585858585504503126D69C092
        B754B7505092D185858585858585858585858585855965E867D3B7E185850D50
        4503125165426F53373753E553536FCB6FCB6FFC6569658F00001065E8592691
        82854D85C33D0D85858585858585858585858585858585855046CFCFFFE8C0B7
        3D8585853D85858585858585858585858585858585B76938684DD3C385858554
        46CF4751697942424242424229424202424242DC6569658F0000106965074343
        4343434343434343A1434307434343434343434343434343436DD46DDF655F43
        4343434343434343434343434343434343434343435F38790743434343434343
        D46DD4DFE8FC0505C00505058B05C08BC0C005D26965E88F00001065E866CBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBEB69FBCB
        CBCB5ACBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB66697966CBCBCBCBCBCBCB
        CBCBCBEB698A4915151515025A58F3154915494E6938698F0000106569B1D5C5
        13F7CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBEB38FB11
        4B4BF64B134C11CBCBCBCBCBCBCBCBCBCBCBCBCBCB6638E866DAD5EFCBCBCBCB
        CBCBCB48658A236F15156F7313366F15151515626569658F00001065E8FB11CC
        5A11CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBEB69FB13
        5A485AFB731A48CBCBCBCBCBCBCBCBCBCBCBCBCBCB6669E8FB73D548CBCBCBCB
        CBCBCBEBE86166E56F373742C76D376F37376FD2E865698F00001069657D4966
        66666666666666666666666666666666666666666666666666666666FF697D66
        666666666666666666666666666666666666666666EF38794049666666666666
        666666FF6542D2D2D2D2D2D2D2D2D2D2D2D25F5B6569388F0000106565720ED9
        E8DCE8E838E8E83869E838E8E83869E838E8E83869E838E8E83869E865697979
        D980A28080C2DCDCE8E8E838E8E83869E838E8E8386965DCC20E0E1FE8E8E838
        E8E8E869656965696565796569696965693865696569658F0000106569321CBF
        0B72656569656965696569656965696569656965696569656965696569380B6B
        64B91C56AA324A32586569656965696569656965696569E83A6BC2ABDC656569
        65696538696569656965696569656579656969656965698F0000106569C2290E
        1F7F69696569656965E86569656965E86569656965E865696569386965696B29
        0E0E0280561F562904693869656965E86569656965E86579C229782979E86965
        6965696965E865696569656938696965693865E865E8658F0000106965E86569
        386965E865E865E86569656965E86569656965E8656965696569656938696565
        E869E8696569656965656965E865696569656938696569E869656965693865E8
        65E865386965696569657965696565E8656969656965E88F0000106569656965
        6965696569656965E865E865E8656965E865E8656965E865E86569656965E865
        69656565E865E865E865E8656965E865E86569656965E86565E865E865696569
        6569656965E865E86569656938696965693865E86569658F0000B8ECEC18EC18
        EC18EC18EC18EC18F218F218F218EC18F218F218EC18F218F218EC18EC18EC18
        F250EC18EC18EC18EC18EC18EC18EC18EC18EC18EC18EC18F2EC18EC18ECEC18
        EC18ECEC18F2EC18ECF250ECF218EC18ECF2EC18ECECEC09000087554197BDBD
        CECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECE
        CECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECE
        CE55CECECECECECECECECECECE702727EEEE5ED8D8085C2B000087AF9EBCA552
        109ECE41CE41CE41CE41CE41CE41CE41CE41CE41CE41CE41CE41CE55CECE55CE
        CE55CECE55CE55CE55CECE55CECE55CECE55CECE55CECE55CE55CE55CE55CE55
        CECECECE55CE55CE55CECE55CEB4E6EDB2278CDD93282F2B0000A3A4CD1D5254
        A08D7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
        7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
        7C7C7C7C7C7C7C7C7C7C7C7C7C31313CB67BE9E7A27189AD000095169F607C19
        A6FE191919191919191919191919191919191919191919191919191919191919
        1919191919191919191919191919191919191919191919191919191919191919
        191919191919191919191919197B3CCAA0C41B30DD81D706000063FE212121F1
        7C197C7CFE7C7CFE7C7CFE7C7CFE7C7CFE7C7CFE7C7CFE7C7CFE7CFE7C197C19
        7CFE7CFE7CFE7CFE7CFE7C197C197C197C197C197C197C197C197C197C197C19
        7C197C197C197C197C197C1919B43C57EDC410962D8486AD00003321B2447544
        4475447544754475447544754475447544754475447544754475447575754475
        447544754475447544754475447544754475447575447544B275B275B275B275
        B275B244B275B275B244B275444444447575B2B2F441BE330000}
      Description.Text = 'Show the Font dialog box'
    end
    object stHelpButton: TdxBarScreenTip
      Header.Text = 'Help Button'
      Description.Text = 
        'This button is displayed when the OnHelpButtonClick event handle' +
        'r is assigned.'
    end
  end
  object ApplicationMenu: TdxBarApplicationMenu
    BarManager = dxBarManager
    Buttons = <
      item
        Item = bbOptions
      end
      item
        Item = bbExit
      end>
    ExtraPane.Items = <>
    ItemLinks = <
      item
        Visible = True
        ItemName = 'bbNew'
      end
      item
        Visible = True
        ItemName = 'bbOpen'
      end
      item
        Visible = True
        ItemName = 'bbSave'
      end
      item
        Visible = True
        ItemName = 'bsSaveAs'
      end
      item
        Visible = True
        ItemName = 'bbPrint'
      end>
    UseOwnFont = False
    Left = 632
    Top = 40
  end
  object ppmFontColor: TdxRibbonPopupMenu
    BarManager = dxBarManager
    ItemLinks = <>
    UseOwnFont = False
    Ribbon = Ribbon
    Left = 824
    Top = 40
  end
  object ilSmallColorSchemesGlyphs: TcxImageList
    FormatVersion = 1
    DesignInfo = 2622328
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000020000000800000010000000180000001D0000001E0000
          0019000000110000000800000002000000000000000000000000000000000000
          000000000003000000102B21195569513EA29E7A5CD6C29673F4C29673F49E79
          5DD769513EA42B21195800000011000000030000000000000000000000000000
          000300000013503B2A88AD8260E7D6AB88FFE1BEA1FFEACDB6FFEBCEB7FFE2C0
          A4FFD7AD8BFFAD8461E8503B2A8B000000150000000300000000000000010000
          000E4B342285B9855BF8D3A27BFFE2B896FFE4BC9CFFE5BFA1FFE5C0A2FFE5BF
          A0FFE4BC9CFFD5A680FFBB875EF94B34228A0000001000000001000000062317
          0D4D97643BE5C78D5EFFD59E72FFD7A278FFD9A67EFFDAA982FFDAA983FFDAA8
          81FFD8A57DFFD7A177FFC88F62FF97653DE723170D53000000070000000B5031
          1898B2723FFFC98A57FFCB8E5CFFCC9060FFCD9364FFCE9465FFCE9466FFCE94
          65FFCD9263FFCC9060FFCB8D5CFFB27441FF5132189E0000000E0000000E7241
          1BCEB4723CFFC07E48FFC0804BFFC1814EFFC28350FFC28451FFC28451FFC284
          51FFC28351FFC1824EFFC1814DFFB47440FF72411BD2000000130000000F8B4F
          1FF1B5723DFFB8743FFFB97641FFBB7A46FFBD7E4CFFBF8352FFBF8453FFBE82
          50FFBC7D4AFFBA7943FFB97541FFB5723DFF8B4F1FF2000000150000000D8B4F
          1FF1AF6D37FFB2713BFFB67745FFBA7F50FFBB8253FFBC8355FFBD8457FFBD85
          57FFBD8557FFB87D4CFFB3723EFFAF6D37FF8B4F1FF2000000130000000A7040
          19CAA66330FFB27342FFB98053FFBB8459FFBD885DFFBE8A61FFBF8C63FFC08C
          64FFBF8C63FFBE8A61FFB5794AFFA6632FFF70401ACE0000000E000000064B2B
          118C9C5C28FFB58054FFBB8961FFBE8F69FFC1936FFFC39672FFC49875FFC499
          76FFC49875FFC29672FFBC8C64FF9C5C28FF4B2B119300000009000000021E11
          073E804A1EDEAD784CFFC09572FFC49C7BFFC7A081FFC9A385FFCAA588FFCAA6
          88FFCAA688FFC8A385FFB3825AFF814A1EE11E11074400000004000000000000
          00043D240F70965D2FF6B88B67FFCBA98CFFCFAE94FFD1B299FFD2B49CFFD2B5
          9DFFD2B39BFFBE9575FF986032F63D230F750000000700000001000000000000
          0001000000043F26126E88562EDDB48560FFC6A285FFD4B8A2FFD6BBA5FFC9A6
          8CFFB78A66FF895730DE3F261273000000070000000100000000000000000000
          0000000000000000000221140B3A50321B86794B28C4945D31EE945D31EE794C
          28C551321B8821140B3D00000004000000010000000000000000000000000000
          0000000000000000000000000001000000020000000300000004000000040000
          0004000000030000000100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000020000000800000010000000180000001D0000001E0000
          0019000000110000000800000002000000000000000000000000000000000000
          000000000003000000101C1C1C55464646A26B6B6BD6858585F4848484F46969
          69D7444444A41B1B1B5800000011000000030000000000000000000000000000
          000300000013303030886D6D6DE78D8D8DFF9B9B9BFFA7A7A7FFA8A8A8FF9C9C
          9CFF8C8C8CFF6A6A6AE82E2E2E8B000000150000000300000000000000010000
          000E28282885656565F8717171FF7D7D7DFF858585FF888888FF898989FF8787
          87FF818181FF737373FF626262F92626268A0000001000000001000000061111
          114D494949E5545454FF5A5A5AFF606060FF646464FF686868FF686868FF6666
          66FF616161FF5C5C5CFF565656FF474747E711111153000000070000000B2828
          2898464646FF414141FF454545FF484848FF4B4B4BFF4D4D4DFF4D4D4DFF4C4C
          4CFF494949FF464646FF434343FF474747FF2828289E0000000E0000000E3A3A
          3ACE393939FF343434FF373737FF383838FF3A3A3AFF3C3C3CFF3C3C3CFF3C3C
          3CFF3A3A3AFF383838FF373737FF3A3A3AFF3A3A3AD2000000130000000F4444
          44F12F2F2FFF2D2D2DFF2F2F2FFF343434FF3A3A3AFF404040FF414141FF3E3E
          3EFF383838FF303030FF2D2D2DFF2F2F2FFF454545F2000000150000000D4141
          41F12D2D2DFF2D2D2DFF383838FF434343FF464646FF494949FF4B4B4BFF4B4B
          4BFF4B4B4BFF3F3F3FFF303030FF2D2D2DFF424242F2000000130000000A3333
          33CA2E2E2EFF363636FF494949FF4F4F4FFF545454FF575757FF5A5A5AFF5B5B
          5BFF5A5A5AFF575757FF404040FF2F2F2FFF333333CE0000000E000000062020
          208C323232FF4B4B4BFF595959FF616161FF676767FF6B6B6BFF6E6E6EFF6F6F
          6FFF6E6E6EFF6A6A6AFF5C5C5CFF333333FF2121219300000009000000021010
          103E393939DE525252FF6C6C6CFF757575FF7C7C7CFF808080FF838383FF8484
          84FF838383FF7F7F7FFF616161FF3B3B3BE11010104400000004000000000000
          000426262670535353F6737373FF898989FF909090FF969696FF989898FF9999
          99FF979797FF818181FF585858F6262626750000000700000001000000000000
          0001000000042D2D2D6E5D5D5DDD818181FF939393FFA5A5A5FFA8A8A8FF9B9B
          9BFF888888FF5F5F5FDE2E2E2E73000000070000000100000000000000000000
          000000000000000000021C1C1C3A42424286616161C4777777EE777777EE6262
          62C5434343881C1C1C3D00000004000000010000000000000000000000000000
          0000000000000000000000000001000000020000000300000004000000040000
          0004000000030000000100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000004000000100000001F0000002E00000037000000390000
          0030000000210000001000000004000000000000000000000000000000000000
          0000000000060000001F4F48438EA19891DEC3BDB9F9CFCDCCFFCFCDCCFFC2BD
          B9F9A19891DF4E48439200000021000000060000000000000000000000000000
          00060000002581766FC8C7C2BFFDD7D7D7FFE0E0E0FFE7E7E7FFE8E8E8FFE1E1
          E1FFD8D8D8FFC6C3BFFD7F766ECB000000290000000600000000000000020000
          001C756A61C5C5C4C3FFD3D3D3FFDDDDDDFFDFDFDFFFE1E1E1FFE1E1E1FFE1E1
          E1FFDFDFDFFFD5D5D5FFC6C5C4FF746961CA0000001F000000020000000C3C34
          2D83ABA6A1FDC9C9C9FFD1D1D1FFD3D3D3FFD5D5D5FFD6D6D6FFD6D6D6FFD6D6
          D6FFD4D4D4FFD3D3D3FFCACACAFFABA6A2FD3B332D8B0000000E000000166E61
          56D6B2B2B2FFC7C7C7FFC9C9C9FFCACACAFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCBCBCBFFCACACAFFC9C9C9FFB4B4B4FF6C6056DB0000001C0000001C7D75
          6DF6B2B2B2FFC1C1C1FFC2C2C2FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC3C3C3FFC3C3C3FFB5B5B5FF7C736CF8000000250000001E8582
          7FFFB3B3B3FFB6B6B6FFB9B9B9FFBEBEBEFFC1C1C1FFC4C4C4FFC4C4C4FFC3C3
          C3FFC1C1C1FFBCBCBCFFB8B8B8FFB3B3B3FF84817EFF000000290000001A8582
          7FFFAAAAAAFFB0B0B0FFBABABAFFC2C2C2FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC0C0C0FFB2B2B2FFAAAAAAFF84817EFF00000025000000147C72
          6AF49D9D9DFFB4B4B4FFC2C2C2FFC4C4C4FFC6C6C6FFC7C7C7FFC8C8C8FFC8C8
          C8FFC8C8C8FFC7C7C7FFBDBDBDFF9D9D9DFF7B726AF60000001C0000000C6656
          4BCC919191FFC2C2C2FFC6C6C6FFC9C9C9FFCBCBCBFFCDCDCDFFCECECEFFCECE
          CEFFCECECEFFCDCDCDFFC8C8C8FF919191FF64564BD200000012000000043228
          206D857E78FBB9B9B9FFCCCCCCFFCFCFCFFFD1D1D1FFD3D3D3FFD4D4D4FFD4D4
          D4FFD4D4D4FFD3D3D3FFC3C3C3FF847E79FC3228207600000008000000000000
          00085A4C41AF979593FFC7C7C7FFD5D5D5FFD8D8D8FFDADADAFFDBDBDBFFDBDB
          DBFFDBDBDBFFCCCCCCFF9B9997FF594B40B50000000E00000002000000000000
          0002000000085F5145AD99928DFBC4C4C4FFD2D2D2FFDDDDDDFFDEDEDEFFD5D5
          D5FFC7C7C7FF9B948FFB5E5045B30000000E0000000200000000000000000000
          000000000000000000043930286775675CC692887FF29C9895FE9C9895FE9288
          7FF274665BC8392F286C00000008000000020000000000000000000000000000
          0000000000000000000000000002000000040000000600000008000000080000
          0008000000060000000200000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000004000000100000001F0000002E00000037000000390000
          0030000000210000001000000004000000000000000000000000000000000000
          0000000000060000001F3E38338E7A7069DE96918CF9A2A09FFFA2A09FFF9590
          8BF9797069DF3E37329200000021000000060000000000000000000000000000
          000600000025635951C8979390FDAFAFAFFFC1C1C1FFD0D0D0FFD1D1D1FFC3C3
          C3FFB1B1B1FF979390FD615850CB000000290000000600000000000000020000
          001C5A4F46C58F8D8CFFA7A7A7FFBCBCBCFFC0C0C0FFC3C3C3FFC3C3C3FFC2C2
          C2FFC0C0C0FFABABABFF908E8DFF584E46CA0000001F000000020000000C3028
          218378736FFD929292FFA4A4A4FFA7A7A7FFACACACFFAEAEAEFFAFAFAFFFAEAE
          AEFFAAAAAAFFA7A7A7FF959595FF78736FFD3028218B0000000E000000165548
          3ED6787878FF909090FF939393FF969696FF989898FF999999FF9A9A9AFF9999
          99FF989898FF969696FF939393FF797979FF52463DDB0000001C0000001C5D53
          4CF6787878FF848484FF868686FF878787FF898989FF898989FF898989FF8989
          89FF898989FF878787FF878787FF7A7A7AFF5A524BF8000000250000001E5D59
          56FF797979FF7C7C7CFF7D7D7DFF808080FF858585FF888888FF898989FF8787
          87FF838383FF7F7F7FFF7D7D7DFF797979FF5B5856FF000000290000001A5D59
          56FF737373FF777777FF7E7E7EFF858585FF878787FF888888FF8A8A8AFF8A8A
          8AFF8A8A8AFF828282FF787878FF737373FF5B5856FF00000025000000145C51
          4AF46B6B6BFF7A7A7AFF868686FF8A8A8AFF8D8D8DFF8F8F8FFF919191FF9292
          92FF919191FF8F8F8FFF808080FF6B6B6BFF5A5149F60000001C0000000C5042
          36CC626262FF858585FF8E8E8EFF939393FF989898FF9A9A9AFF9D9D9DFF9D9D
          9DFF9D9D9DFF9A9A9AFF909090FF626262FF4D4036D200000012000000042920
          186D5E5852FB7D7D7DFF999999FF9F9F9FFFA4A4A4FFA7A7A7FFA9A9A9FFA9A9
          A9FFA9A9A9FFA7A7A7FF878787FF5E5853FC291F187600000008000000000000
          0008483A2FAF686665FF8F8F8FFFACACACFFB1B1B1FFB5B5B5FFB7B7B7FFB7B7
          B7FFB6B6B6FF999999FF6A6867FF47392EB50000000E00000002000000000000
          0002000000084B3E32AD6D6660FB8A8A8AFFA6A6A6FFBBBBBBFFBEBEBEFFABAB
          ABFF8F8F8FFF6E6762FB4A3D32B30000000E0000000200000000000000000000
          000000000000000000042F261E675C4E42C66B6159F26D6966FE6D6966FE6B61
          59F25B4D42C82F251E6C00000008000000020000000000000000000000000000
          0000000000000000000000000002000000040000000600000008000000080000
          0008000000060000000200000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000004000000100000001F0000002E00000037000000390000
          0030000000210000001000000004000000000000000000000000000000000000
          0000000000060000001F4F48438EA19891DEC3BDB9F9CFCDCCFFCFCDCCFFC2BD
          B9F9A19891DF4E48439200000021000000060000000000000000000000000000
          00060000002581766FC8C7C2BFFDD7D7D7FFE0E0E0FFE7E7E7FFE8E8E8FFE1E1
          E1FFD8D8D8FFC6C3BFFD7F766ECB000000290000000600000000000000020000
          001C756A61C5C5C4C3FFD3D3D3FFDDDDDDFFDFDFDFFFE1E1E1FFE1E1E1FFE1E1
          E1FFDFDFDFFFD5D5D5FFC6C5C4FF746961CA0000001F000000020000000C3C34
          2D83ABA6A1FDC9C9C9FFD1D1D1FFD3D3D3FFD5D5D5FFD6D6D6FFD6D6D6FFD6D6
          D6FFD4D4D4FFD3D3D3FFCACACAFFABA6A2FD3B332D8B0000000E000000166E61
          56D6B2B2B2FFC7C7C7FFC9C9C9FFCACACAFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCBCBCBFFCACACAFFC9C9C9FFB4B4B4FF6C6056DB0000001C0000001C7D75
          6DF6B2B2B2FFC1C1C1FFC2C2C2FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC3C3C3FFC3C3C3FFB5B5B5FF7C736CF8000000250000001E8582
          7FFFB3B3B3FFB6B6B6FFB9B9B9FFBEBEBEFFC1C1C1FFC4C4C4FFC4C4C4FFC3C3
          C3FFC1C1C1FFBCBCBCFFB8B8B8FFB3B3B3FF84817EFF000000290000001A8582
          7FFFAAAAAAFFB0B0B0FFBABABAFFC2C2C2FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC0C0C0FFB2B2B2FFAAAAAAFF84817EFF00000025000000147C72
          6AF49D9D9DFFB4B4B4FFC2C2C2FFC4C4C4FFC6C6C6FFC7C7C7FFC8C8C8FFC8C8
          C8FFC8C8C8FFC7C7C7FFBDBDBDFF9D9D9DFF7B726AF60000001C0000000C6656
          4BCC919191FFC2C2C2FFC6C6C6FFC9C9C9FFCBCBCBFFCDCDCDFFCECECEFFCECE
          CEFFCECECEFFCDCDCDFFC8C8C8FF919191FF64564BD200000012000000043228
          206D857E78FBB9B9B9FFCCCCCCFFCFCFCFFFD1D1D1FFD3D3D3FFD4D4D4FFD4D4
          D4FFD4D4D4FFD3D3D3FFC3C3C3FF847E79FC3228207600000008000000000000
          00085A4C41AF979593FFC7C7C7FFD5D5D5FFD8D8D8FFDADADAFFDBDBDBFFDBDB
          DBFFDBDBDBFFCCCCCCFF9B9997FF594B40B50000000E00000002000000000000
          0002000000085F5145AD99928DFBC4C4C4FFD2D2D2FFDDDDDDFFDEDEDEFFD5D5
          D5FFC7C7C7FF9B948FFB5E5045B30000000E0000000200000000000000000000
          000000000000000000043930286775675CC692887FF29C9895FE9C9895FE9288
          7FF274665BC8392F286C00000008000000020000000000000000000000000000
          0000000000000000000000000002000000040000000600000008000000080000
          0008000000060000000200000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000080202021F0303033B0505055406060663060606660505
          05570303033E0202021F00000008000000000000000000000000000000000000
          00000101010C0303033B7F7771CDCCC4BFFBE0DDDBFFEAE9E9FFEAE9E9FFE0DD
          DAFFCBC3BEFB7F7770D10303033E0101010C0000000000000000000000000101
          010C04040445B0A69FF4E2E0DEFFF3F3F3FFFCFCFCFFFFFFFFFFFFFFFFFFFDFD
          FDFFF4F4F4FFE1E0DEFFADA49DF50404044C0101010C00000000000000040303
          0335A2978FF2E1E0E0FFEFEFEFFFF9F9F9FFFBFBFBFFFDFDFDFFFDFDFDFFFDFD
          FDFFFBFBFBFFF1F1F1FFE2E1E1FF9F958DF40303033B0000000401010118695B
          4FC3C5C2BFFFE5E5E5FFEDEDEDFFEFEFEFFFF1F1F1FFF2F2F2FFF2F2F2FFF2F2
          F2FFF0F0F0FFEFEFEFFFE6E6E6FFC6C2BFFF675A4ECB0202021C0202022B9689
          7DF9CECECEFFE3E3E3FFE5E5E5FFE6E6E6FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE7E7E7FFE6E6E6FFE5E5E5FFD0D0D0FF93857AFA03030335030303359C94
          8CFFCECECEFFDDDDDDFFDEDEDEFFDFDFDFFFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
          E0FFE0E0E0FFDFDFDFFFDFDFDFFFD1D1D1FF99918BFF0404044503030339A09E
          9CFFCFCFCFFFD2D2D2FFD5D5D5FFDADADAFFDDDDDDFFE0E0E0FFE0E0E0FFDFDF
          DFFFDDDDDDFFD8D8D8FFD4D4D4FFCFCFCFFF9F9D9BFF0404044C03030332A09E
          9CFFC6C6C6FFCCCCCCFFD6D6D6FFDEDEDEFFDFDFDFFFE0E0E0FFE0E0E0FFE0E0
          E0FFE0E0E0FFDCDCDCFFCECECEFFC6C6C6FF9F9D9BFF04040445020202279B91
          8AFFB9B9B9FFD0D0D0FFDEDEDEFFE0E0E0FFE2E2E2FFE3E3E3FFE4E4E4FFE4E4
          E4FFE4E4E4FFE3E3E3FFD9D9D9FFB9B9B9FF9A9189FF0303033501010118917E
          6FF5ADADADFFDEDEDEFFE2E2E2FFE5E5E5FFE7E7E7FFE9E9E9FFEAEAEAFFEAEA
          EAFFEAEAEAFFE9E9E9FFE4E4E4FFADADADFF8E7C6EF802020223000000085E4B
          3CACA19B96FFD5D5D5FFE8E8E8FFEBEBEBFFEDEDEDFFEFEFEFFFF0F0F0FFF0F0
          F0FFF0F0F0FFEFEFEFFFDFDFDFFFA09A96FF5C4A3CB601010110000000000101
          0110897768E6B3B1B0FFE3E3E3FFF1F1F1FFF4F4F4FFF6F6F6FFF7F7F7FFF7F7
          F7FFF7F7F7FFE8E8E8FFB6B5B4FF887565EA0202021C00000004000000000000
          0004010101108F7E6FE5B4AFACFFE0E0E0FFEEEEEEFFF9F9F9FFFAFAFAFFF1F1
          F1FFE3E3E3FFB6B1AEFF8D7B6FE90202021C0000000400000000000000000000
          0000000000000000000866584DA5A29489F3B2A9A3FFB7B4B2FFB7B4B2FFB2A9
          A3FFA09288F465574BAB01010110000000040000000000000000000000000000
          0000000000000000000000000004000000080101010C01010110010101100101
          01100101010C0000000400000000000000000000000000000000}
      end>
  end
  object ilLargeColorSchemesGlyphs: TcxImageList
    Height = 48
    Width = 48
    FormatVersion = 1
    DesignInfo = 525176
    ImageInfo = <
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0002000000040000000600000008000000090000000A0000000B0000000B0000
          000A0000000A0000000800000006000000040000000200000001000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000005000000080000
          000F000000160000001D00000022000000270000002B0000002D0000002D0000
          002B00000027000000230000001D000000160000000F00000009000000050000
          0002000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000050000000B00000015000000201410
          0C42423328786A5441A48E6F56C6AB8768DFC19675F1CFA27EFBCFA27EFBC196
          75F1AB8768DF8E6F56C66A5441A44233287A14100C4300000022000000160000
          000C000000060000000200000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000100000001000000040000000A00000015000000253C2E2371795D47B2B48D
          6EE7DAB292FFE1BFA4FFE7CAB3FFEDD4C0FFF1DCCCFFF3E0D2FFF3E1D3FFF1DD
          CDFFEDD6C3FFE8CCB6FFE2C0A6FFDBB394FFB48D6EE7785C47B43C2E23730000
          0027000000170000000B00000004000000010000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00020000000700000010000000213D2E227285664BC0D2A784FDDFBA9CFFE9CC
          B4FFF0D8C6FFF1DAC8FFF1DCCAFFF1DCCBFFF2DDCCFFF2DDCDFFF2DECEFFF2DE
          CEFFF2DECEFFF2DDCDFFF2DDCCFFF2DCCCFFEACFB9FFE0BDA0FFD2A885FD8566
          4CC23D2E22750000002400000012000000080000000200000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000030000
          0009000000161C150F486D523CA8C59975F5DCB595FFE9C9AFFFEDD0B9FFEDD2
          BCFFEED3BEFFEFD5C0FFEFD6C2FFEFD7C4FFF0D8C5FFF0D8C6FFF0D9C6FFF0D9
          C6FFF0D8C6FFF0D8C5FFF0D8C5FFEFD7C4FFEFD6C2FFEFD5C0FFEBCDB7FFDDB8
          99FFC69A78F66D523CAB1C150F4C000000190000000A00000003000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000001000000030000000A0000
          001A36281C698C684ACBD3A680FFE1BA9BFFE8C5AAFFE9C8ADFFEACAB1FFEBCC
          B3FFECCEB6FFECCFB7FFECD0B9FFEDD1BBFFEDD2BDFFEED3BEFFEED3BEFFEED3
          BEFFEED3BDFFEED3BDFFEDD2BCFFEDD1BBFFEDD1BAFFECCFB7FFEBCDB5FFEBCC
          B3FFE3C0A4FFD4A985FF8D684ACE35281C6D0000001D0000000B000000030000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000030000000A0000001A4130
          2178A47A56E1D4A57FFFE3BA99FFE4BD9DFFE5BFA0FFE6C2A4FFE7C4A8FFE8C6
          AAFFE9C8ADFFE9C9AFFFEACAB0FFEACBB2FFEBCCB4FFEBCCB4FFEBCDB5FFEBCD
          B5FFEBCDB5FFEBCCB4FFEBCCB4FFEACBB2FFEACAB0FFE9C9AFFFE9C8ADFFE8C6
          AAFFE7C4A8FFE6C2A4FFD6A985FFA67A58E34130217D0000001E0000000B0000
          0003000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000020000000800000018402E1F78A97C
          56E8D2A078FFDFB18CFFE1B591FFE2B794FFE3BA98FFE4BC9CFFE4BE9FFFE5BF
          A1FFE6C1A4FFE6C3A6FFE7C4A8FFE7C5AAFFE8C6AAFFE8C7ACFFE8C7ACFFE8C7
          ACFFE8C6ACFFE8C7ACFFE8C6ABFFE7C5AAFFE7C4A8FFE6C3A6FFE6C2A4FFE5C0
          A2FFE4BE9FFFE3BB9BFFE3B998FFD5A580FFAA7C57EA402E1F7C0000001B0000
          000A000000020000000100000000000000000000000000000000000000000000
          00000000000000000000000000010000000600000014322317679E704CE1CE99
          6EFFDCA980FFDDAC84FFDEAE88FFDFB18CFFE0B390FFE1B592FFE2B896FFE3B9
          98FFE3BB9AFFE4BC9CFFE4BD9EFFE5BEA0FFE5BFA1FFE5C0A2FFE5C0A2FFE5C0
          A2FFE5C0A2FFE5C0A2FFE5BFA1FFE5BEA0FFE4BD9EFFE4BC9CFFE3BB9AFFE3B9
          98FFE2B795FFE1B592FFE0B38FFFDFB18CFFD09E75FF9E714CE23223176C0000
          0017000000070000000100000000000000000000000000000000000000000000
          00000000000000000001000000040000000E19110B43805838C9C89064FFD9A2
          76FFDAA479FFDAA57BFFDBA880FFDCAB83FFDDAC86FFDEAF89FFDFB18CFFE0B2
          8EFFE0B390FFE1B693FFE1B794FFE2B896FFE2B897FFE2B998FFE2B998FFE2B9
          98FFE2B998FFE2B998FFE2B897FFE2B896FFE1B794FFE1B693FFE0B491FFE0B3
          8FFFDFB18CFFDEAF8AFFDDAD86FFDCAB83FFDBA87FFFCA9368FF805838CC1911
          0B48000000100000000400000001000000000000000000000000000000000000
          00000000000000000001000000080000001B5F4026A3BF8556FFD59B6DFFD69D
          70FFD79F72FFD7A074FFD8A277FFD9A479FFD9A57CFFDAA77FFFDBA981FFDCAB
          84FFDCAC86FFDDAE88FFDDAF8AFFDEB08CFFDEB18CFFDEB18DFFDEB28EFFDFB2
          8EFFDEB18DFFDEB18DFFDEB18CFFDEB08CFFDDAF8AFFDDAE88FFDCAC86FFDCAB
          85FFDBA981FFDAA87FFFD9A57BFFD9A47AFFD8A277FFD7A074FFC18759FF5F40
          27A8000000200000000A00000001000000000000000000000000000000000000
          00000000000100000004000000103321146AAB7245F5CA8E5FFFD29666FFD398
          69FFD3996BFFD49A6EFFD59C70FFD59E72FFD59E73FFD6A076FFD7A278FFD7A3
          7AFFD8A57DFFD9A67FFFD9A77FFFD9A880FFDAA982FFDAAA83FFDAAA83FFDAAA
          83FFDAAA83FFDAAA83FFDAA982FFDAA881FFD9A77FFFD9A67FFFD8A57DFFD8A3
          7BFFD7A278FFD6A075FFD69F74FFD59E72FFD59C70FFD49B6EFFCC9264FFAB73
          46F5332113700000001400000005000000010000000000000000000000000000
          000000000001000000080000001C6D4626BABD7F4DFFCE905EFFCF9261FFCF93
          62FFD09565FFD19667FFD19768FFD2996AFFD29A6CFFD39B6EFFD39C6FFFD49D
          71FFD49E72FFD5A075FFD5A076FFD5A177FFD6A278FFD6A278FFD6A278FFD6A2
          78FFD6A278FFD6A278FFD6A278FFD5A177FFD5A176FFD59F74FFD49E72FFD49D
          71FFD39C70FFD39B6EFFD29A6DFFD2996BFFD19869FFD19667FFD09565FFBE82
          52FF6D4626BE000000220000000A000000010000000000000000000000000000
          0001000000030000000F2F1E1066AB6E3DFDC78753FFCB8B58FFCB8C59FFCC8E
          5CFFCD905EFFCD905FFFCE9262FFCE9363FFCF9565FFCF9567FFD09668FFD097
          69FFD0986AFFD1996CFFD1996CFFD19A6DFFD29A6EFFD29A6EFFD29A6EFFD29B
          6EFFD29B6EFFD29B6EFFD19A6DFFD19A6DFFD1996CFFD1996CFFD0986AFFD098
          6AFFD09769FFD09667FFCF9565FFCE9363FFCE9262FFCD9160FFCD905EFFC88A
          58FFAC6E3EFD2F1D0F6D00000013000000040000000100000000000000000000
          000100000006000000165C381CA9B47441FFC78651FFC88753FFC88854FFC989
          55FFC98A57FFCA8B59FFCA8D5BFFCB8E5CFFCB8F5EFFCC905FFFCC9161FFCD91
          61FFCD9263FFCD9364FFCE9465FFCE9466FFCE9566FFCE9566FFCE9566FFCE95
          67FFCE9567FFCE9567FFCE9466FFCE9466FFCE9465FFCD9364FFCD9364FFCD92
          62FFCC9161FFCC905FFFCC8F5FFFCB8E5DFFCB8D5CFFCA8C5AFFCA8B58FFC98A
          57FFB57644FF5C381BAF0000001C000000070000000100000000000000000000
          0001000000090F090434885326E3BB7B46FFC4834DFFC4844EFFC4844FFFC585
          51FFC58651FFC58652FFC68854FFC78956FFC78956FFC78A58FFC88C5AFFC88D
          5BFFC88D5BFFC98D5CFFC98E5DFFC98F5EFFC98F5EFFC98F5EFFCA8F5FFFCA8F
          5FFFCA8F5FFFCA8F5FFFC98F5EFFC98E5EFFC98E5EFFC98E5EFFC98D5CFFC88C
          5BFFC88B59FFC88B59FFC78A58FFC78956FFC68855FFC68854FFC68753FFC586
          52FFBD7E4AFF885328E60F09043B0000000C0000000200000000000000000000
          00020000000E2F1C0C69A46430FFC17F48FFC17F49FFC1804AFFC2814BFFC281
          4CFFC2824DFFC3834EFFC3834FFFC3844FFFC38450FFC48551FFC48652FFC486
          53FFC58755FFC58855FFC68957FFC68957FFC68957FFC68957FFC68957FFC689
          57FFC68957FFC68957FFC68957FFC68957FFC68957FFC58855FFC58855FFC587
          54FFC48653FFC48652FFC48552FFC48551FFC38450FFC3844FFFC3834FFFC383
          4EFFC2824DFFA56531FF2F1C0C71000000110000000300000001000000000000
          0004000000114C2C1396AA6934FFBE7B45FFBF7C46FFBF7D47FFBF7D48FFBF7E
          49FFC07E48FFC07F4BFFC0804BFFC1804BFFC1814DFFC1814EFFC1824EFFC182
          4EFFC2824FFFC28350FFC28350FFC28351FFC28351FFC28451FFC28451FFC284
          51FFC28450FFC28451FFC28451FFC28451FFC28351FFC28351FFC28350FFC283
          50FFC2824FFFC1824EFFC1824EFFC1814DFFC1814DFFC1804CFFC0804CFFC07F
          4BFFC07E49FFAB6A36FF4C2C129C000000160000000500000001000000000000
          000400000014643A17BBAF6D38FFBC7942FFBC7942FFBC7942FFBC7A44FFBD79
          44FFBD7B45FFBD7B46FFBD7C47FFBE7C47FFBE7D47FFBE7C49FFBE7E4AFFBF7E
          4AFFBF7E4AFFBF7F4BFFBF7F4CFFBF7F4CFFBF7F4CFFBF804DFFBF804DFFBF80
          4DFFBF804DFFBF804DFFBF804DFFBF804DFFBF7F4CFFBF7E4CFFBF7F4CFFBF7E
          4BFFBF7E4AFFBF7E4AFFBE7E4AFFBE7D49FFBE7D48FFBE7C46FFBD7B47FFBD7A
          46FFBD7B45FFB06E39FF643A17BF0000001A0000000600000001000000000000
          00050000001678451BD8B2703BFFBA7741FFBA7741FFBA7741FFBA7741FFBA77
          41FFBA7842FFBB7842FFBB7842FFBB7943FFBB7944FFBB7A45FFBC7A45FFBC7A
          45FFBC7B46FFBC7B47FFBC7B47FFBC7A47FFBC7C48FFBC7C48FFBC7B48FFBC7C
          48FFBC7C48FFBC7C48FFBC7C48FFBC7C48FFBC7C48FFBC7A47FFBC7B47FFBC7B
          47FFBC7B46FFBC7A45FFBC7945FFBB7A45FFBB7844FFBB7943FFBB7842FFBB78
          42FFBA7842FFB2703BFF78451BDB0000001D0000000700000001000000000000
          000500000017884D1FEDB5723CFFB8753FFFB8753FFFB8753FFFB8753FFFB874
          3FFFB8743FFFB8753FFFB8753FFFB87640FFB87640FFB97641FFB97741FFB977
          41FFB97742FFB97742FFB97843FFB97944FFB97944FFBB7845FFBB7845FFBB79
          45FFBB7945FFBB7946FFBB7A46FFBB7945FFBA7944FFB97944FFB97843FFB977
          42FFB97642FFB97641FFB97741FFB97541FFB87640FFB87640FFB8753FFFB875
          3FFFB8743FFFB5723CFF874D1FEE0000001F0000000700000001000000000000
          000500000017915321FAB5723CFFB6733DFFB6733DFFB6733DFFB6733DFFB673
          3DFFB6723DFFB6733DFFB6733DFFB6723DFFB6723DFFB6733DFFB6743EFFB674
          3EFFB77540FFB77640FFB87641FFB87642FFB87642FFB87843FFB87843FFB878
          43FFB87843FFB97844FFB97844FFB97844FFB97644FFB87743FFB87541FFB674
          3EFFB6743EFFB6733DFFB6733DFFB6733DFFB6733DFFB6733DFFB6733DFFB673
          3DFFB6733DFFB5723CFF925321FB0000001F0000000800000001000000000000
          000500000016915321FAB26F3AFFB3703BFFB3703BFFB3713BFFB3703BFFB370
          3BFFB3703BFFB3703BFFB3703BFFB3703BFFB3713CFFB4733DFFB4723DFFB473
          3EFFB4743FFFB57440FFB57340FFB57540FFB57440FFB57541FFB57441FFB574
          41FFB67542FFB67542FFB67542FFB67542FFB67542FFB67542FFB67542FFB473
          3EFFB3713BFFB3703BFFB3703BFFB3713BFFB3703BFFB3703BFFB3703BFFB370
          3BFFB3703BFFB2703AFF925321FB0000001E0000000700000001000000000000
          000500000014884E1FECAE6D38FFB16F39FFB16F39FFB16F3AFFB16F39FFB16F
          3AFFB16F39FFB16F39FFB16F39FFB2703CFFB3723DFFB3723DFFB3723FFFB373
          3EFFB37440FFB47441FFB47440FFB47541FFB47542FFB47542FFB57642FFB576
          42FFB57642FFB57643FFB57643FFB57644FFB57643FFB57643FFB57642FFB576
          43FFB3723FFFB16F39FFB16F39FFB16F39FFB16F3AFFB16F3AFFB16F39FFB16F
          3AFFB16F3AFFAE6D37FF874D1FEE0000001C0000000700000001000000000000
          00040000001178451CD6AA6834FFAF6D37FFAF6D38FFAF6D38FFAF6D37FFAF6D
          38FFAF6D37FFAF6D38FFB06E39FFB1703CFFB2723DFFB2723FFFB2733FFFB273
          40FFB27341FFB37440FFB37441FFB37542FFB37543FFB47644FFB47643FFB476
          44FFB47644FFB47644FFB47644FFB47644FFB47644FFB47644FFB47644FFB476
          44FFB37542FFB1703BFFAF6D38FFAF6D37FFAF6D38FFAF6D38FFAF6D37FFAF6D
          37FFAF6D38FFAA6833FF78451BD9000000190000000600000001000000000000
          00030000000F643917B7A5632FFFAD6B36FFAD6B36FFAD6B35FFAD6B36FFAD6B
          36FFAD6B36FFAD6C37FFAF6E3BFFB0713EFFB1713FFFB1723FFFB17340FFB273
          41FFB27441FFB27443FFB27543FFB27543FFB37544FFB37645FFB37645FFB377
          46FFB37746FFB37746FFB37746FFB37746FFB37746FFB37746FFB37746FFB377
          46FFB37645FFB27341FFAD6C37FFAD6B36FFAD6B36FFAD6B36FFAD6B36FFAD6B
          36FFAD6B36FFA5632FFF643917BC000000150000000500000000000000000000
          00030000000C4B2B118FA05F2BFFAC6934FFAC6A35FFAC6A35FFAC6934FFAC6A
          34FFAC6935FFAD6B38FFB0703FFFB0713EFFB1713FFFB17241FFB27342FFB275
          43FFB27443FFB37645FFB37545FFB37545FFB37746FFB37746FFB37747FFB477
          47FFB47747FFB47748FFB47949FFB47849FFB47849FFB47848FFB47748FFB477
          48FFB37746FFB37746FFAF6F3BFFAC6935FFAC6934FFAC6935FFAC6935FFAC69
          34FFAC6A34FFA05F2BFF4B2B1195000000110000000400000000000000000000
          0001000000082E1A0B609B5A27FFAA6833FFAA6833FFAA6832FFAA6733FFAA67
          33FFAA6833FFAD6D3AFFAF713EFFB07241FFB07340FFB07341FFB17443FFB175
          44FFB27544FFB27646FFB27746FFB37747FFB37848FFB37848FFB37849FFB379
          49FFB47849FFB47949FFB4794AFFB47949FFB4794AFFB47949FFB47949FFB379
          49FFB37949FFB37848FFAF713FFFAA6833FFAA6832FFAA6832FFAA6833FFAA68
          32FFAA6832FF9B5A27FF2E1A0B670000000D0000000200000000000000000000
          0001000000050E08032781491EDFA4632EFFA86732FFA86631FFA86632FFA866
          32FFA86632FFAD6E3CFFAE7141FFAF7242FFB07343FFB07544FFB17545FFB176
          47FFB17648FFB27748FFB27848FFB27849FFB3794AFFB3794BFFB3794BFFB37A
          4DFFB37A4DFFB47A4DFFB47A4DFFB47A4DFFB47A4DFFB47A4DFFB37A4DFFB37A
          4DFFB3794CFFB37A4BFFB17645FFA86631FFA86631FFA86631FFA86632FFA866
          31FFA4632FFF814A1EE20E080330000000080000000100000000000000000000
          0000000000030000000C5631149E9E5D29FFA6642FFFA66530FFA66430FFA665
          30FFA66530FFAD7140FFAE7243FFAE7343FFAF7445FFAF7546FFB07648FFB076
          47FFB1774AFFB2784BFFB2794CFFB2794CFFB37B4DFFB37A4EFFB37A4EFFB37B
          4FFFB37B4EFFB47C50FFB47D50FFB47C50FFB47C50FFB47D50FFB37C4FFFB37B
          4FFFB37A4EFFB37B4EFFB27A4CFFA6652FFFA66430FFA66430FFA66430FFA665
          30FF9E5D29FF563114A400000012000000050000000000000000000000000000
          000000000002000000072B180A57975725FDA3622DFFA4642EFFA4632FFFA464
          2EFFA4632EFFAD7243FFAE7444FFAE7545FFAF7547FFAF7748FFB0774AFFB078
          4CFFB1794CFFB17A4DFFB27B4EFFB27C50FFB37C50FFB37D50FFB37D51FFB37D
          51FFB37E52FFB47F52FFB47E53FFB47F52FFB47F53FFB47E53FFB37E51FFB37D
          52FFB37D51FFB37D51FFB27B4EFFA4632FFFA4632FFFA4642FFFA4642EFFA362
          2DFF975725FD2B180A5E0000000B000000020000000000000000000000000000
          000000000000000000040000000C603716AE9D5C28FFA3622DFFA3612DFFA362
          2DFFA3622DFFAC7141FFAE7547FFAF7648FFB0784AFFB0784BFFB1794CFFB17B
          4EFFB27C50FFB37C50FFB47E53FFB47F54FFB48055FFB58055FFB58055FFB581
          56FFB58157FFB58157FFB58157FFB58157FFB58157FFB58156FFB58157FFB57F
          55FFB48055FFB47F54FFB0794BFFA3622DFFA3612DFFA3622DFFA3622DFF9D5C
          28FF603716B30000001300000006000000010000000000000000000000000000
          00000000000000000002000000062C190A578F5322F29F5E29FFA1612CFFA160
          2BFFA1602CFFA86C3DFFAE7749FFAF774BFFB07A4DFFB17C50FFB27D51FFB27D
          52FFB37F55FFB37F55FFB58158FFB58259FFB6835AFFB6845BFFB6845CFFB685
          5CFFB7855DFFB7855CFFB7865DFFB7865DFFB7865DFFB6855CFFB6845CFFB683
          5AFFB6845AFFB58259FFAD7446FFA1612CFFA1602CFFA1602CFF9F5E2AFF8F53
          22F32C190A5E0000000A00000003000000000000000000000000000000000000
          00000000000000000000000000030000000A502E12939A5926FFA05F2BFFA05F
          2BFFA0602BFFA56837FFB0794EFFB17B50FFB27D52FFB37F55FFB48057FFB482
          59FFB5835AFFB6845CFFB7855EFFB7865EFFB7875FFFB88861FFB98862FFB98A
          63FFB98A63FFB98A64FFB98A63FFB98A64FFB98963FFB98963FFB98862FFB888
          61FFB7875FFFB7875FFFA86D3DFFA05F2BFFA05F2BFFA05F2BFF9A5926FF502E
          12980000000F0000000500000001000000000000000000000000000000000000
          000000000000000000000000000100000005140C052D6B3D1ABC9B5A27FF9F5E
          29FF9F5E29FFA0602CFFAC7446FFB37F55FFB48158FFB48259FFB6845BFFB786
          5EFFB78760FFB88862FFB98962FFBA8B65FFBA8B65FFBB8D68FFBB8D68FFBB8D
          69FFBB8D69FFBC8E69FFBC8D69FFBC8E69FFBC8E69FFBC8E69FFBB8D67FFBB8D
          67FFBA8B66FFB27E54FFA1612DFF9F5E2AFF9F5E29FF9B5A27FF6A3D19BF150C
          0533000000070000000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000629180A4F7E4A1FD89B5B
          28FF9E5D29FF9E5D29FFA56938FFB38157FFB6855EFFB78660FFB88862FFB98A
          65FFBA8B66FFBB8D68FFBC8F6AFFBC8F6BFFBC906CFFBD916EFFBD906DFFBE92
          6FFFBE9370FFBE926FFFBE9370FFBE9370FFBE9370FFBE926EFFBE926FFFBD91
          6EFFBB8D67FFA86D40FF9E5D28FF9E5D29FF9B5B28FF7F4A20DA29180A550000
          000A000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000006331F0D5F844F
          22E19B5B28FF9D5C28FF9D5C28FFA97043FFB88964FFB98B65FFBA8D67FFBB8E
          6AFFBC906CFFBD926FFFBE9270FFBF9472FFBF9573FFC09673FFC09674FFC097
          76FFC19776FFC19776FFC19776FFC19877FFC09776FFC09776FFC09776FFC096
          74FFAD774BFF9D5C28FF9D5C28FF9B5B28FF844F23E2331E0D650000000A0000
          0004000000010000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000010000000200000006341F
          0E5F814C23D89B5B28FF9C5B27FF9C5C28FFAB7347FFBB8E6AFFBD926EFFBE94
          72FFBF9673FFC09775FFC09877FFC29A79FFC29B7AFFC29B7BFFC39B7CFFC39C
          7DFFC49D7DFFC49D7DFFC49D7EFFC49D7EFFC49D7DFFC39D7DFFC29979FFAF7B
          51FF9D5C29FF9C5B27FF9B5C28FF804C23D9341F0E640000000B000000040000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000020000
          00062A190C4D6E421FBA9B5C2AFF9B5B27FF9B5B26FFA97243FFB88A65FFC198
          78FFC19A79FFC39C7CFFC39D7EFFC49E7FFFC59F80FFC5A082FFC6A183FFC6A1
          84FFC6A184FFC6A184FFC7A284FFC7A284FFC7A284FFBD9270FFAB754AFF9B5A
          26FF9B5B27FF9B5C2AFF6E421FBD2A190C520000000900000004000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000200000005160D062B5434198F935A2BF19B5C2AFF9A5B27FFA16534FFAF7C
          53FFBD9371FFC5A183FFC6A285FFC7A386FFC8A488FFC8A589FFC9A68AFFC9A6
          8BFFC9A78BFFC9A78BFFCAA78CFFC1997AFFB2815AFFA26737FF9A5A26FF9B5C
          2AFF94592BF255341993160D062F000000070000000300000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000100000003000000062E1D0F52673F21AA9B5F2EFC9B5D2BFF9A5B
          28FF9E6130FFA97447FFB4855FFFBD9472FFC5A082FFC9A88CFFCAA98EFFC6A2
          85FFBF9776FFB68863FFAB764BFF9F6131FF9A5B28FF9B5D2BFF9B5F2EFC673F
          20AC2F1D0F560000000900000005000000020000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000010000000200000004000000062E1D0F505C3A1E998955
          2BDD9E6130FF9C5E2DFF9B5C2AFF9A5A28FF995926FF985924FF985824FF9959
          26FF9A5A27FF9B5D2AFF9C5E2CFF9E6130FF89552BDD5C3A1E9B2E1D0F530000
          0009000000050000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000003000000050F0A
          051E3220115651341C866D4525B082532DD1935E33E99E6537F99E6537F9945E
          33EA82532DD16D4525B052341C87322011570F0A052100000007000000050000
          0003000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0002000000030000000400000005000000060000000700000007000000070000
          0007000000070000000600000005000000040000000300000002000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000002000000020000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000100000001000000010000000100000001000000010000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0002000000040000000600000008000000090000000A0000000B0000000B0000
          000A0000000A0000000800000006000000040000000200000001000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000005000000080000
          000F000000160000001D00000022000000270000002B0000002D0000002D0000
          002B00000027000000230000001D000000160000000F00000009000000050000
          0002000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000050000000B00000015000000200E0E
          0E422E2E2E784B4B4BA4646464C67A7A7ADF888888F1939393FB939393FB8888
          88F1797979DF646464C64A4A4AA42D2D2D7A0E0E0E4300000022000000160000
          000C000000060000000200000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000100000001000000040000000A000000150000002528282871525252B27D7D
          7DE79F9F9FFFABABABFFB6B6B6FFBEBEBEFFC7C7C7FFCCCCCCFFCDCDCDFFC8C8
          C8FFC2C2C2FFB9B9B9FFADADADFFA0A0A0FF7C7C7CE7515151B4282828730000
          0027000000170000000B00000004000000010000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000200000007000000100000002128282872575757C0919191FDA1A1A1FFB0B0
          B0FFBCBCBCFFBEBEBEFFC1C1C1FFC2C2C2FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5
          C5FFC5C5C5FFC4C4C4FFC4C4C4FFC3C3C3FFB5B5B5FFA5A5A5FF919191FD5757
          57C2272727750000002400000012000000080000000200000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000030000
          00090000001612121248454545A8818181F5969696FFA6A6A6FFACACACFFB0B0
          B0FFB3B3B3FFB6B6B6FFB8B8B8FFB9B9B9FFBBBBBBFFBCBCBCFFBDBDBDFFBDBD
          BDFFBCBCBCFFBBBBBBFFBBBBBBFFB9B9B9FFB8B8B8FFB6B6B6FFAFAFAFFF9B9B
          9BFF828282F6444444AB1111114C000000190000000A00000003000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000001000000030000000A0000
          001A21212169575757CB858585FF929292FF9B9B9BFF9F9F9FFFA4A4A4FFA6A6
          A6FFAAAAAAFFACACACFFAEAEAEFFAFAFAFFFB2B2B2FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFB1B1B1FFB0B0B0FFAFAFAFFFACACACFFA9A9A9FFA7A7
          A7FF9D9D9DFF898989FF555555CE2020206D0000001D0000000B000000030000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000030000000A0000001A2727
          2778616161E17E7E7EFF898989FF8D8D8DFF919191FF969696FF9A9A9AFF9D9D
          9DFFA0A0A0FFA2A2A2FFA4A4A4FFA6A6A6FFA8A8A8FFA8A8A8FFA9A9A9FFA9A9
          A9FFA9A9A9FFA8A8A8FFA8A8A8FFA6A6A6FFA4A4A4FFA2A2A2FFA0A0A0FF9D9D
          9DFF9A9A9AFF969696FF858585FF626262E32626267D0000001E0000000B0000
          0003000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000001000000020000000800000018252525786060
          60E8747474FF797979FF7F7F7FFF838383FF878787FF8B8B8BFF8F8F8FFF9292
          92FF959595FF989898FF999999FF9C9C9CFF9C9C9CFF9F9F9FFF9F9F9FFF9F9F
          9FFF9E9E9EFF9E9E9EFF9D9D9DFF9C9C9CFF9A9A9AFF989898FF959595FF9292
          92FF8F8F8FFF8B8B8BFF878787FF7C7C7CFF606060EA2424247C0000001B0000
          000A000000020000000100000000000000000000000000000000000000000000
          000000000000000000000000000100000006000000141B1B1B67565656E16969
          69FF6C6C6CFF717171FF767676FF7A7A7AFF7E7E7EFF808080FF858585FF8888
          88FF8B8B8BFF8D8D8DFF8F8F8FFF919191FF929292FF939393FF939393FF9393
          93FF939393FF939393FF929292FF919191FF8F8F8FFF8D8D8DFF8B8B8BFF8787
          87FF848484FF818181FF7D7D7DFF797979FF717171FF565656E21B1B1B6C0000
          0017000000070000000100000000000000000000000000000000000000000000
          00000000000000000001000000040000000E0D0D0D43454545C9606060FF6161
          61FF646464FF666666FF6C6C6CFF6F6F6FFF737373FF767676FF7A7A7AFF7D7D
          7DFF7E7E7EFF828282FF848484FF868686FF878787FF888888FF888888FF8888
          88FF888888FF888888FF878787FF868686FF848484FF828282FF808080FF7D7D
          7DFF7A7A7AFF777777FF737373FF6F6F6FFF6B6B6BFF656565FF444444CC0D0D
          0D48000000100000000400000001000000000000000000000000000000000000
          00000000000000000001000000080000001B323232A35A5A5AFF585858FF5B5B
          5BFF5E5E5EFF616161FF636363FF666666FF696969FF6C6C6CFF6F6F6FFF7373
          73FF757575FF777777FF797979FF7B7B7BFF7C7C7CFF7D7D7DFF7D7D7DFF7E7E
          7EFF7D7D7DFF7D7D7DFF7C7C7CFF7B7B7BFF7A7A7AFF777777FF757575FF7373
          73FF6F6F6FFF6D6D6DFF686868FF676767FF636363FF616161FF5D5D5DFF3131
          31A8000000200000000A00000001000000000000000000000000000000000000
          00000000000100000004000000101919196A525252F5515151FF525252FF5555
          55FF585858FF5A5A5AFF5D5D5DFF5F5F5FFF606060FF636363FF666666FF6868
          68FF6B6B6BFF6D6D6DFF6F6F6FFF6F6F6FFF717171FF737373FF737373FF7373
          73FF737373FF737373FF717171FF707070FF6F6F6FFF6D6D6DFF6B6B6BFF6868
          68FF666666FF626262FF616161FF5F5F5FFF5D5D5DFF5A5A5AFF585858FF5252
          52F5191919700000001400000005000000010000000000000000000000000000
          000000000001000000080000001C373737BA4D4D4DFF494949FF4C4C4CFF4E4E
          4EFF515151FF535353FF555555FF575757FF595959FF5B5B5BFF5D5D5DFF5E5E
          5EFF606060FF636363FF646464FF656565FF666666FF676767FF676767FF6767
          67FF676767FF676767FF666666FF656565FF646464FF626262FF606060FF5F5F
          5FFF5D5D5DFF5B5B5BFF5A5A5AFF585858FF565656FF535353FF515151FF5151
          51FF363636BE000000220000000A000000010000000000000000000000000000
          0001000000030000000F181818664D4D4DFD434343FF434343FF454545FF4848
          48FF4A4A4AFF4B4B4BFF4E4E4EFF505050FF525252FF545454FF565656FF5757
          57FF585858FF595959FF595959FF5B5B5BFF5C5C5CFF5C5C5CFF5C5C5CFF5D5D
          5DFF5D5D5DFF5D5D5DFF5B5B5BFF5B5B5BFF5A5A5AFF595959FF585858FF5858
          58FF565656FF555555FF525252FF505050FF4E4E4EFF4D4D4DFF4A4A4AFF4949
          49FF4E4E4EFD1717176D00000013000000040000000100000000000000000000
          000100000006000000162F2F2FA9454545FF3C3C3CFF3E3E3EFF3F3F3FFF4141
          41FF434343FF454545FF474747FF494949FF4A4A4AFF4C4C4CFF4D4D4DFF4E4E
          4EFF505050FF515151FF525252FF535353FF545454FF545454FF545454FF5555
          55FF555555FF555555FF535353FF535353FF525252FF515151FF515151FF4F4F
          4FFF4D4D4DFF4C4C4CFF4B4B4BFF494949FF484848FF464646FF444444FF4242
          42FF494949FF2E2E2EAF0000001C000000070000000100000000000000000000
          00010000000908080834444444E33D3D3DFF3A3A3AFF3B3B3BFF3C3C3CFF3E3E
          3EFF3E3E3EFF3F3F3FFF424242FF434343FF444444FF464646FF484848FF4949
          49FF494949FF4A4A4AFF4B4B4BFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
          4DFF4D4D4DFF4D4D4DFF4D4D4DFF4C4C4CFF4C4C4CFF4C4C4CFF4A4A4AFF4949
          49FF474747FF474747FF464646FF434343FF424242FF424242FF414141FF3F3F
          3FFF414141FF434343E60808083B0000000C0000000200000000000000000000
          00020000000E19191969484848FF353535FF363636FF383838FF393939FF3939
          39FF3B3B3BFF3C3C3CFF3D3D3DFF3D3D3DFF3E3E3EFF3F3F3FFF414141FF4141
          41FF434343FF444444FF454545FF454545FF464646FF464646FF464646FF4646
          46FF464646FF464646FF464646FF454545FF454545FF444444FF444444FF4242
          42FF414141FF414141FF404040FF3F3F3FFF3E3E3EFF3D3D3DFF3D3D3DFF3C3C
          3CFF3B3B3BFF484848FF18181871000000110000000300000000000000000000
          00040000001128282896404040FF313131FF333333FF333333FF343434FF3535
          35FF363636FF373737FF383838FF393939FF3A3A3AFF3B3B3BFF3C3C3CFF3C3C
          3CFF3C3C3CFF3D3D3DFF3D3D3DFF3E3E3EFF3E3E3EFF3F3F3FFF3F3F3FFF3F3F
          3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3E3E3EFF3E3E3EFF3D3D3DFF3D3D
          3DFF3C3C3CFF3C3C3CFF3C3C3CFF3B3B3BFF3A3A3AFF393939FF383838FF3737
          37FF363636FF414141FF2727279C000000160000000500000000000000000000
          000400000014343434BB3B3B3BFF313131FF313131FF313131FF323232FF3333
          33FF333333FF343434FF353535FF363636FF373737FF373737FF383838FF3939
          39FF393939FF3A3A3AFF3B3B3BFF3B3B3BFF3B3B3BFF3C3C3CFF3C3C3CFF3C3C
          3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3B3B3BFF3B3B3BFF3B3B3BFF3A3A
          3AFF393939FF393939FF383838FF373737FF373737FF363636FF353535FF3434
          34FF333333FF3C3C3CFF343434BF0000001A0000000600000000000000000000
          0005000000163E3E3ED8363636FF303030FF303030FF303030FF303030FF3030
          30FF313131FF323232FF323232FF323232FF333333FF343434FF353535FF3535
          35FF363636FF363636FF363636FF363636FF373737FF373737FF373737FF3737
          37FF373737FF373737FF373737FF373737FF373737FF363636FF363636FF3636
          36FF363636FF353535FF353535FF343434FF333333FF323232FF323232FF3232
          32FF313131FF363636FF3E3E3EDB0000001D0000000700000000000000000000
          000500000017464646ED323232FF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F
          2FFF2F2F2FFF2F2F2FFF2F2F2FFF303030FF303030FF313131FF313131FF3131
          31FF323232FF323232FF333333FF343434FF343434FF363636FF363636FF3636
          36FF363636FF363636FF363636FF363636FF353535FF343434FF333333FF3232
          32FF323232FF313131FF313131FF313131FF303030FF303030FF2F2F2FFF2F2F
          2FFF2F2F2FFF323232FF444444EE0000001F0000000700000000000000000000
          0005000000174A4A4AFA2E2E2EFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D
          2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2E2E2EFF2E2E
          2EFF303030FF303030FF313131FF323232FF323232FF333333FF333333FF3333
          33FF333333FF343434FF343434FF343434FF343434FF333333FF313131FF2E2E
          2EFF2E2E2EFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D2DFF2D2D
          2DFF2D2D2DFF2E2E2EFF484848FB0000001F0000000800000000000000000000
          000500000016494949FA2D2D2DFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
          2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2D2D2DFF2E2E2EFF2E2E2EFF2F2F
          2FFF303030FF313131FF313131FF323232FF323232FF333333FF333333FF3333
          33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF2F2F
          2FFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
          2CFF2C2C2CFF2D2D2DFF474747FB0000001E0000000700000000000000000000
          000500000014434343EC2F2F2FFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
          2CFF2C2C2CFF2C2C2CFF2C2C2CFF2E2E2EFF303030FF303030FF313131FF3232
          32FF333333FF333333FF333333FF343434FF353535FF353535FF363636FF3636
          36FF363636FF363636FF363636FF373737FF363636FF363636FF363636FF3636
          36FF313131FF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C2CFF2C2C
          2CFF2C2C2CFF2F2F2FFF414141EE0000001C0000000700000000000000000000
          0004000000113A3A3AD6313131FF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
          2BFF2B2B2BFF2B2B2BFF2D2D2DFF303030FF323232FF323232FF333333FF3333
          33FF343434FF353535FF363636FF373737FF373737FF373737FF373737FF3838
          38FF383838FF383838FF383838FF383838FF383838FF383838FF383838FF3838
          38FF373737FF2F2F2FFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
          2BFF2B2B2BFF313131FF393939D9000000190000000600000000000000000000
          00030000000F2F2F2FB7333333FF292929FF292929FF292929FF292929FF2929
          29FF292929FF2A2A2AFF2E2E2EFF313131FF323232FF333333FF343434FF3535
          35FF363636FF363636FF373737FF373737FF383838FF393939FF393939FF3A3A
          3AFF3A3A3AFF3A3A3AFF3A3A3AFF3A3A3AFF3A3A3AFF3A3A3AFF3A3A3AFF3A3A
          3AFF393939FF353535FF2A2A2AFF292929FF292929FF292929FF292929FF2929
          29FF292929FF333333FF2F2F2FBC000000150000000500000000000000000000
          00030000000C2323238F373737FF292929FF292929FF292929FF292929FF2929
          29FF292929FF2C2C2CFF333333FF343434FF353535FF363636FF373737FF3838
          38FF393939FF3A3A3AFF3B3B3BFF3B3B3BFF3B3B3BFF3C3C3CFF3C3C3CFF3D3D
          3DFF3D3D3DFF3D3D3DFF3E3E3EFF3E3E3EFF3E3E3EFF3D3D3DFF3D3D3DFF3D3D
          3DFF3C3C3CFF3C3C3CFF303030FF292929FF292929FF292929FF292929FF2929
          29FF292929FF373737FF22222295000000110000000400000000000000000000
          000100000008161616603C3C3CFF282828FF282828FF282828FF282828FF2828
          28FF282828FF303030FF353535FF363636FF373737FF383838FF3A3A3AFF3B3B
          3BFF3B3B3BFF3C3C3CFF3D3D3DFF3E3E3EFF3F3F3FFF3F3F3FFF404040FF4040
          40FF404040FF404040FF404040FF404040FF404040FF404040FF404040FF4040
          40FF404040FF3F3F3FFF353535FF282828FF282828FF282828FF282828FF2828
          28FF282828FF3B3B3BFF151515670000000D0000000200000000000000000000
          00010000000506060627373737DF2C2C2CFF272727FF272727FF272727FF2727
          27FF272727FF333333FF373737FF383838FF3A3A3AFF3A3A3AFF3C3C3CFF3D3D
          3DFF3E3E3EFF3F3F3FFF404040FF404040FF414141FF424242FF424242FF4343
          43FF434343FF444444FF444444FF444444FF444444FF444444FF434343FF4343
          43FF424242FF424242FF3C3C3CFF272727FF272727FF272727FF272727FF2727
          27FF2C2C2CFF373737E206060630000000080000000100000000000000000000
          0000000000030000000C2626269E333333FF262626FF262626FF262626FF2626
          26FF262626FF373737FF3A3A3AFF3A3A3AFF3C3C3CFF3D3D3DFF3F3F3FFF4040
          40FF414141FF424242FF434343FF444444FF454545FF454545FF454545FF4646
          46FF464646FF474747FF474747FF474747FF474747FF474747FF464646FF4646
          46FF454545FF454545FF434343FF262626FF262626FF262626FF262626FF2626
          26FF323232FF252525A400000012000000050000000000000000000000000000
          00000000000200000007131313573A3A3AFD272727FF252525FF252525FF2525
          25FF252525FF3A3A3AFF3C3C3CFF3D3D3DFF3F3F3FFF404040FF414141FF4343
          43FF444444FF454545FF464646FF474747FF484848FF494949FF494949FF4A4A
          4AFF4A4A4AFF4B4B4BFF4B4B4BFF4B4B4BFF4B4B4BFF4B4B4BFF4A4A4AFF4A4A
          4AFF494949FF494949FF464646FF252525FF252525FF252525FF252525FF2727
          27FF383838FD1212125E0000000B000000020000000000000000000000000000
          000000000000000000040000000C2C2C2CAE323232FF252525FF252525FF2525
          25FF252525FF3A3A3AFF404040FF414141FF434343FF444444FF454545FF4747
          47FF494949FF4A4A4AFF4C4C4CFF4D4D4DFF4E4E4EFF4F4F4FFF4F4F4FFF5050
          50FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF4F4F
          4FFF4E4E4EFF4D4D4DFF454545FF252525FF252525FF252525FF252525FF3131
          31FF2B2B2BB30000001300000006000000010000000000000000000000000000
          0000000000000000000200000006151515573B3B3BF22A2A2AFF242424FF2424
          24FF242424FF353535FF424242FF444444FF464646FF494949FF4B4B4BFF4C4C
          4CFF4E4E4EFF4F4F4FFF525252FF525252FF545454FF555555FF565656FF5656
          56FF575757FF575757FF575757FF585858FF575757FF565656FF565656FF5454
          54FF545454FF525252FF3F3F3FFF242424FF242424FF242424FF2A2A2AFF3A3A
          3AF31515155E0000000A00000003000000000000000000000000000000000000
          00000000000000000000000000030000000A292929933A3A3AFF232323FF2323
          23FF232323FF2F2F2FFF474747FF4A4A4AFF4C4C4CFF4E4E4EFF515151FF5252
          52FF545454FF565656FF585858FF585858FF595959FF5B5B5BFF5C5C5CFF5D5D
          5DFF5D5D5DFF5E5E5EFF5E5E5EFF5E5E5EFF5D5D5DFF5D5D5DFF5C5C5CFF5B5B
          5BFF595959FF585858FF363636FF232323FF232323FF232323FF393939FF2828
          28980000000F0000000500000001000000000000000000000000000000000000
          0000000000000000000000000001000000050B0B0B2D383838BC363636FF2323
          23FF232323FF262626FF414141FF505050FF525252FF545454FF575757FF5959
          59FF5B5B5BFF5D5D5DFF5E5E5EFF606060FF616161FF636363FF636363FF6464
          64FF646464FF656565FF656565FF656565FF656565FF656565FF636363FF6363
          63FF616161FF4F4F4FFF272727FF232323FF232323FF363636FF373737BF0B0B
          0B33000000070000000200000000000000000000000000000000000000000000
          000000000000000000000000000000000002000000061818184F424242D83535
          35FF222222FF222222FF323232FF535353FF595959FF5A5A5AFF5D5D5DFF6060
          60FF616161FF636363FF666666FF666666FF676767FF696969FF696969FF6A6A
          6AFF6C6C6CFF6B6B6BFF6C6C6CFF6C6C6CFF6C6C6CFF6A6A6AFF6A6A6AFF6969
          69FF636363FF393939FF222222FF222222FF343434FF404040DA171717550000
          000A000000030000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000002000000061F1F1F5F4747
          47E1363636FF212121FF212121FF3D3D3DFF5F5F5FFF616161FF636363FF6565
          65FF686868FF6A6A6AFF6B6B6BFF6E6E6EFF6E6E6EFF6F6F6FFF707070FF7171
          71FF727272FF727272FF727272FF737373FF717171FF717171FF717171FF6F6F
          6FFF464646FF212121FF212121FF353535FF464646E21E1E1E650000000A0000
          0004000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000100000002000000062222
          225F4A4A4AD83C3C3CFF212121FF222222FF424242FF666666FF6A6A6AFF6E6E
          6EFF6F6F6FFF717171FF737373FF757575FF767676FF777777FF787878FF7979
          79FF7A7A7AFF7A7A7AFF7B7B7BFF7B7B7BFF7A7A7AFF797979FF757575FF4C4C
          4CFF232323FF212121FF3C3C3CFF484848D9212121640000000B000000040000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000020000
          00061C1C1C4D494949BA4A4A4AFF2D2D2DFF212121FF3F3F3FFF616161FF7575
          75FF767676FF797979FF7B7B7BFF7C7C7CFF7D7D7DFF7F7F7FFF808080FF8181
          81FF818181FF818181FF828282FF828282FF828282FF6D6D6DFF464646FF2121
          21FF2D2D2DFF484848FF494949BD1C1C1C520000000900000004000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0002000000050F0F0F2B3B3B3B8F585858F1424242FF282828FF303030FF4F4F
          4FFF6E6E6EFF808080FF838383FF838383FF858585FF868686FF888888FF8989
          89FF898989FF898989FF898989FF777777FF565656FF323232FF282828FF4141
          41FF565656F23B3B3B930F0F0F2F000000070000000300000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000300000006222222524B4B4BAA5E5E5EFC474747FF3030
          30FF2B2B2BFF444444FF5B5B5BFF6F6F6FFF7F7F7FFF8A8A8AFF8C8C8CFF8282
          82FF737373FF5F5F5FFF474747FF2C2C2CFF2F2F2FFF464646FF5E5E5EFC4A4A
          4AAC222222560000000900000005000000020000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000002000000040000000623232350474747996464
          64DD606060FF4E4E4EFF3E3E3EFF323232FF282828FF222222FF222222FF2828
          28FF323232FF3E3E3EFF4D4D4DFF5F5F5FFF636363DD4747479B232323530000
          0009000000050000000300000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000003000000050C0C
          0C1E2828285640404086565656B0666666D1737373E97B7B7BF97B7B7BF97373
          73EA666666D1565656B040404087282828570C0C0C2100000007000000050000
          0003000000010000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000010000
          0002000000030000000400000005000000060000000700000007000000070000
          0007000000070000000600000005000000040000000300000002000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000002000000020000
          0001000000010000000100000001000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0004000000040000000400000004000000040000000400000004000000040000
          0004000000040000000400000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000400000004000000080000
          0010000000180000001F00000023000000270000002B0000002B000000270000
          00270000001F0000001800000010000000080000000400000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000400000008000000140000001F000000390000
          004F00000063000000700000007E000000860000008B0000008B000000860000
          007E00000073000000630000004F000000390000002300000014000000080000
          0004000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000400000004000000140000002B0000004C0000006A3A3837B3908F
          8DECB8B7B6FBC6C6C6FFCDCDCDFFD1D1D1FFD3D3D3FFD3D3D3FFD1D1D1FFCDCD
          CDFFC6C6C6FFB8B7B6FB8F8C8BED393837B5000000700000004F0000002E0000
          0018000000080000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          000400000010000000270000004C00000078868482E7BEBDBDFDCECECEFFDADA
          DAFFE0E0E0FFE6E6E6FFEAEAEAFFEEEEEEFFF0F0F0FFF1F1F1FFEFEFEFFFEBEB
          EBFFE7E7E7FFE1E1E1FFDBDBDBFFCECECEFFBDBCBCFE858381E90000007E0000
          00510000002B0000001000000004000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000080000
          001C0000003B0000006D878482E8C1C1C1FFD5D5D5FFDEDEDEFFE6E6E6FFEDED
          EDFFEDEDEDFFEEEEEEFFEEEEEEFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
          EFFFEFEFEFFFEFEFEFFFEFEFEFFFE8E8E8FFDFDFDFFFD5D5D5FFC1C0C0FF8381
          80EA00000075000000420000001F000000080000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000C000000230000
          004F4C4947BCB5B4B3FCD1D1D1FFDBDBDBFFE5E5E5FFE9E9E9FFE9E9E9FFEAEA
          EAFFEBEBEBFFEBEBEBFFECECECFFECECECFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFECECECFFECECECFFECECECFFEBEBEBFFEBEBEBFFE7E7E7FFDDDDDDFFD1D1
          D1FFB3B2B2FD4B4846C200000057000000270000000C00000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000040000000C000000270000005B7976
          74E1C0C0C0FFD4D4D4FFDEDEDEFFE3E3E3FFE5E5E5FFE6E6E6FFE7E7E7FFE8E8
          E8FFE8E8E8FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE8E8E8FFE7E7E7FFE7E7E7FFE1E1
          E1FFD6D6D6FFC0BFBFFF767371E4000000630000002B0000000C000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000040000000C000000270000005B878482ECC5C5
          C5FFD4D4D4FFDEDEDEFFDFDFDFFFE0E0E0FFE2E2E2FFE3E3E3FFE4E4E4FFE5E5
          E5FFE5E5E5FFE6E6E6FFE6E6E6FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
          E7FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6E6FFE5E5E5FFE5E5E5FFE4E4E4FFE3E3
          E3FFE2E2E2FFD6D6D6FFC5C5C5FF83817FEE000000660000002B0000000C0000
          0004000000000000000000000000000000000000000000000000000000000000
          00000000000000000004000000080000001F0000005482807EECC4C4C4FFD2D2
          D2FFDADADAFFDBDBDBFFDCDCDCFFDEDEDEFFDFDFDFFFE0E0E0FFE0E0E0FFE1E1
          E1FFE2E2E2FFE3E3E3FFE3E3E3FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
          E4FFE4E4E4FFE4E4E4FFE3E3E3FFE3E3E3FFE2E2E2FFE2E2E2FFE1E1E1FFE0E0
          E0FFDEDEDEFFDEDEDEFFD4D4D4FFC4C4C4FF807D7BEE0000005E000000270000
          0008000000040000000000000000000000000000000000000000000000000000
          0000000000000000000400000018000000496E6A69E0C0C0C0FFCECECEFFD6D6
          D6FFD8D8D8FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFFDDDDDDFFDEDEDEFFDEDE
          DEFFDFDFDFFFDFDFDFFFE0E0E0FFE0E0E0FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFE0E0E0FFE0E0E0FFDFDFDFFFDFDFDFFFDEDEDEFFDEDEDEFFDDDD
          DDFFDCDCDCFFDBDBDBFFDADADAFFD1D1D1FFC0C0C0FF6B6966E4000000510000
          001C000000040000000000000000000000000000000000000000000000000000
          0000000000040000001000000035413E3BB5AAAAAAFFCACACAFFD3D3D3FFD4D4
          D4FFD4D4D4FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFFDADADAFFDBDB
          DBFFDCDCDCFFDCDCDCFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDDDDDDFFDCDCDCFFDCDCDCFFDBDBDBFFDBDBDBFFDADA
          DAFFD9D9D9FFD8D8D8FFD7D7D7FFD6D6D6FFCCCCCCFFA7A6A6FF3F3C3ABC0000
          003B000000100000000400000000000000000000000000000000000000000000
          0000000000040000001F0000005E949291FBC4C4C4FFD0D0D0FFD1D1D1FFD1D1
          D1FFD2D2D2FFD3D3D3FFD4D4D4FFD4D4D4FFD5D5D5FFD6D6D6FFD7D7D7FFD8D8
          D8FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFDADADAFFDADADAFFDADADAFFDADA
          DAFFDADADAFFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD8D8D8FFD7D7D7FFD6D6
          D6FFD6D6D6FFD4D4D4FFD4D4D4FFD3D3D3FFD2D2D2FFC6C6C6FF8F8E8DFC0000
          006A000000270000000400000000000000000000000000000000000000000000
          0004000000100000003B686461E2B9B9B9FFC9C9C9FFCDCDCDFFCECECEFFCFCF
          CFFFCFCFCFFFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4
          D4FFD5D5D5FFD5D5D5FFD6D6D6FFD6D6D6FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
          D7FFD7D7D7FFD6D6D6FFD6D6D6FFD5D5D5FFD5D5D5FFD4D4D4FFD4D4D4FFD3D3
          D3FFD2D2D2FFD2D2D2FFD1D1D1FFD0D0D0FFD0D0D0FFCBCBCBFFB9B9B9FF6361
          5EE6000000490000001400000004000000000000000000000000000000000000
          00040000001F0000005F908F8EFEC2C2C2FFCACACAFFCBCBCBFFCBCBCBFFCCCC
          CCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFD0D0D0FFD0D0D0FFD1D1
          D1FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD2D2D2FFD2D2D2FFD1D1D1FFD1D1D1FFD0D0D0FFD0D0
          D0FFCFCFCFFFCFCFCFFFCECECEFFCECECEFFCDCDCDFFCCCCCCFFC3C3C3FF8D8C
          8CFE000000700000002700000004000000000000000000000000000000040000
          000C000000395E5B57DFABABABFFC6C6C6FFC8C8C8FFC8C8C8FFC9C9C9FFCACA
          CAFFCACACAFFCBCBCBFFCBCBCBFFCCCCCCFFCDCDCDFFCDCDCDFFCDCDCDFFCECE
          CEFFCECECEFFCECECEFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
          CFFFCFCFCFFFCFCFCFFFCFCFCFFFCECECEFFCECECEFFCECECEFFCECECEFFCDCD
          CDFFCDCDCDFFCCCCCCFFCBCBCBFFCBCBCBFFCACACAFFCACACAFFC7C7C7FFACAC
          ACFF5B5855E40000004500000010000000040000000000000000000000040000
          00180000004F7F7E7DFCB5B5B5FFC5C5C5FFC6C6C6FFC6C6C6FFC7C7C7FFC7C7
          C7FFC8C8C8FFC8C8C8FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFCBCBCBFFCBCB
          CBFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCBCBFFCACA
          CAFFCACACAFFCACACAFFC9C9C9FFC9C9C9FFC8C8C8FFC8C8C8FFC7C7C7FFB8B8
          B8FF7B7A79FD0000005F0000001C000000040000000000000000000000040000
          00232523209A8F8F8FFFBEBEBEFFC3C3C3FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5
          C5FFC5C5C5FFC6C6C6FFC6C6C6FFC6C6C6FFC7C7C7FFC8C8C8FFC8C8C8FFC8C8
          C8FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9
          C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8C8FFC8C8C8FFC7C7
          C7FFC7C7C7FFC7C7C7FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5C5FFC5C5C5FFC1C1
          C1FF8E8E8EFF25221FA70000002E000000080000000000000000000000090000
          0035585450E19D9D9DFFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3
          C3FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5C5FFC6C6
          C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
          C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5C5FFC5C5
          C5FFC5C5C5FFC5C5C5FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3C3FFC3C3
          C3FF9E9E9EFF54514EE70000003E0000000C0000000000000000000000110000
          003E706D6BF8A4A4A4FFBFBFBFFFC0C0C0FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
          C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3
          C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC2C2C2FFC2C2C2FFC2C2C2FFC1C1
          C1FFA6A6A6FF6B6968FA0000004F000000140000000000000000000000110000
          0049787877FEAAAAAAFFBCBCBCFFBCBCBCFFBCBCBCFFBEBEBEFFBEBEBEFFBFBF
          BFFFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC0C0C0FFBFBFBFFFBFBFBFFFBFBF
          BFFFACACACFF777675FE0000005B000000180000000000000000000000150000
          004F7E7E7EFFAFAFAFFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFBBBB
          BBFFBBBBBBFFBBBBBBFFBCBCBCFFBCBCBCFFBEBEBEFFBEBEBEFFBEBEBEFFBFBF
          BFFFBFBFBFFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFBFBFBFFFC0C0C0FFC0C0
          C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFFBFBFBFFFBFBFBFFFBFBF
          BFFFBEBEBEFFBEBEBEFFBEBEBEFFBCBCBCFFBCBCBCFFBBBBBBFFBBBBBBFFBBBB
          BBFFAFAFAFFF7D7D7DFF000000630000001C0000000000000000000000150000
          0051828282FFB2B2B2FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9
          B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBBBBFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
          BCFFBEBEBEFFBEBEBEFFBCBCBCFFBCBCBCFFBBBBBBFFBBBBBBFFB9B9B9FFB9B9
          B9FFB8B8B8FFB9B9B9FFB8B8B8FFB8B8B8FFB8B8B8FFB6B6B6FFB6B6B6FFB6B6
          B6FFB2B2B2FF818181FF000000690000001C0000000000000000000000150000
          0051858585FFB2B2B2FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB5B5B5FFB5B5B5FFB6B6
          B6FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
          B9FFBBBBBBFFBBBBBBFFBBBBBBFFB9B9B9FFB9B9B9FFB8B8B8FFB5B5B5FFB5B5
          B5FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB2B2B2FF848484FF000000690000001F0000000000000000000000150000
          004F858585FFADADADFFAFAFAFFFAFAFAFFFB0B0B0FFAFAFAFFFAFAFAFFFAFAF
          AFFFAFAFAFFFAFAFAFFFAFAFAFFFB0B0B0FFB2B2B2FFB2B2B2FFB3B3B3FFB3B3
          B3FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB5B5B5FFB5B5B5FFB6B6
          B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB3B3B3FFB0B0
          B0FFAFAFAFFFAFAFAFFFB0B0B0FFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
          AFFFAFAFAFFF848484FF000000660000001C0000000000000000000000150000
          0049838383FFAAAAAAFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFAFAFAFFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB3B3
          B3FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB6B6B6FFB8B8B8FFB2B2
          B2FFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFA9A9A9FF818181FF0000005F0000001C0000000000000000000000110000
          003E807F7FFFA3A3A3FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFAAAAAAFFACACACFFAFAFAFFFB0B0B0FFB2B2B2FFB2B2B2FFB3B3B3FFB3B3
          B3FFB3B3B3FFB5B5B5FFB5B5B5FFB6B6B6FFB8B8B8FFB6B6B6FFB8B8B8FFB8B8
          B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB5B5
          B5FFAFAFAFFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFA3A3A3FF7D7D7DFF000000570000001800000000000000000000000C0000
          00397A7978FE9B9B9BFFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FFA9A9A9FFACACACFFB0B0B0FFB0B0B0FFB2B2B2FFB2B2B2FFB3B3B3FFB3B3
          B3FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB3B3B3FFA9A9A9FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FF9B9B9BFF787776FE0000004C0000001400000000000000000000000C0000
          002E6F6C69F6959595FFA4A4A4FFA6A6A6FFA6A6A6FFA4A4A4FFA6A6A6FFA6A6
          A6FFA9A9A9FFB0B0B0FFB0B0B0FFB0B0B0FFB2B2B2FFB3B3B3FFB5B5B5FFB5B5
          B5FFB8B8B8FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9
          B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFB9B9B9FFB9B9B9FFB8B8
          B8FFB8B8B8FFADADADFFA6A6A6FFA4A4A4FFA6A6A6FFA6A6A6FFA4A4A4FFA6A6
          A6FF959595FF6C6A68F80000003E000000100000000000000000000000040000
          001F595350D98E8E8EFFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
          A3FFAAAAAAFFAFAFAFFFB2B2B2FFB2B2B2FFB2B2B2FFB5B5B5FFB5B5B5FFB6B6
          B6FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBCBCBCFFBBBBBBFFBCBCBCFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFB9B9B9FFB0B0B0FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
          A3FF8E8E8EFF55514DE000000032000000080000000000000000000000040000
          001426221F7E838383FF9B9B9BFFA1A1A1FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FFACACACFFB0B0B0FFB2B2B2FFB3B3B3FFB5B5B5FFB6B6B6FFB8B8B8FFB8B8
          B8FFB9B9B9FFB9B9B9FFB9B9B9FFBBBBBBFFBCBCBCFFBCBCBCFFBEBEBEFFBEBE
          BEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBCBC
          BCFFBCBCBCFFB6B6B6FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF9B9B
          9BFF828282FF24201E910000001F000000040000000000000000000000000000
          000C0000002E767472FA929292FF9D9D9DFF9E9E9EFF9D9D9DFF9E9E9EFF9E9E
          9EFFAFAFAFFFB2B2B2FFB2B2B2FFB5B5B5FFB5B5B5FFB8B8B8FFB6B6B6FFB9B9
          B9FFBBBBBBFFBCBCBCFFBCBCBCFFBEBEBEFFBEBEBEFFBEBEBEFFBFBFBFFFBEBE
          BEFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFFBFBFBFFFBEBE
          BEFFBEBEBEFFBCBCBCFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9E9E9EFF9292
          92FF73716FFB0000004200000014000000000000000000000000000000000000
          00080000001C56524DD08A8A8AFF9A9A9AFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B
          9BFFB2B2B2FFB3B3B3FFB5B5B5FFB6B6B6FFB8B8B8FFB9B9B9FFBBBBBBFFBBBB
          BBFFBCBCBCFFBEBEBEFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC0C0C0FFC0C0C0FFC0C0
          C0FFC0C0C0FFBEBEBEFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9A9A9AFF8A8A
          8AFF534E4BD70000002B00000008000000000000000000000000000000000000
          0000000000100000002E7A7877FD919191FF9A9A9AFF989898FF9A9A9AFF9A9A
          9AFFAFAFAFFFB5B5B5FFB6B6B6FFB9B9B9FFB9B9B9FFBBBBBBFFBEBEBEFFBFBF
          BFFFBFBFBFFFC1C1C1FFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC1C1C1FFBBBBBBFF9A9A9AFF989898FF9A9A9AFF9A9A9AFF919191FF7877
          76FE000000450000001800000004000000000000000000000000000000000000
          0000000000080000001859534FD0898989FF949494FF979797FF979797FF9797
          97FFA9A9A9FFB8B8B8FFB9B9B9FFBCBCBCFFBFBFBFFFC0C0C0FFC0C0C0FFC1C1
          C1FFC1C1C1FFC2C2C2FFC3C3C3FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3C3FFC3C3
          C3FFC3C3C3FFB3B3B3FF979797FF979797FF979797FF949494FF888888FF5550
          4CD7000000270000000C00000000000000000000000000000000000000000000
          0000000000000000000C00000027757270F88C8C8CFF959595FF959595FF9595
          95FFA3A3A3FFBCBCBCFFBEBEBEFFC0C0C0FFC1C1C1FFC2C2C2FFC3C3C3FFC3C3
          C3FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5C5FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
          C6FFC7C7C7FFC6C6C6FFC7C7C7FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5
          C5FFC5C5C5FFA9A9A9FF959595FF959595FF959595FF8C8C8CFF716F6DF90000
          0039000000140000000400000000000000000000000000000000000000000000
          000000000000000000040000001435312D8B7F7F7FFE8E8E8EFF949494FF9494
          94FF979797FFB3B3B3FFC1C1C1FFC2C2C2FFC3C3C3FFC4C4C4FFC5C5C5FFC5C5
          C5FFC6C6C6FFC6C6C6FFC7C7C7FFC7C7C7FFC8C8C8FFC8C8C8FFC8C8C8FFC8C8
          C8FFC9C9C9FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8C8FFC8C8C8FFC7C7
          C7FFC1C1C1FF989898FF949494FF949494FF8E8E8EFF7E7E7DFE342F2C970000
          001C000000080000000000000000000000000000000000000000000000000000
          00000000000000000000000000080000001858524EC6878786FF8F8F8FFF9292
          92FF929292FFA3A3A3FFC2C2C2FFC4C4C4FFC5C5C5FFC6C6C6FFC7C7C7FFC7C7
          C7FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFCBCBCBFFCACACAFFC8C8
          C8FFAAAAAAFF929292FF929292FF8F8F8FFF868685FF544F4BCD000000270000
          000C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000004000000080000001866615CD8898989FF8F8F
          8FFF919191FF919191FFAFAFAFFFC6C6C6FFC7C7C7FFC8C8C8FFC9C9C9FFC9C9
          C9FFCACACAFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCCCCCCFFB8B8
          B8FF919191FF919191FF8F8F8FFF898989FF635E5BDE00000027000000100000
          0004000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000004000000080000001868635ED88C8C
          8BFF8F8F8FFF8F8F8FFF919191FFB3B3B3FFC9C9C9FFCACACAFFCBCBCBFFCCCC
          CCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFD0D0
          D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFCECECEFFBEBEBEFF9191
          91FF8F8F8FFF8F8F8FFF8B8B8AFF65605DDD0000002B00000010000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000400000008000000185E58
          53C38A8988FE919191FF8F8F8FFF8E8E8EFFAFAFAFFFC7C7C7FFCECECEFFCECE
          CEFFCFCFCFFFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFCBCBCBFFB5B5B5FF8E8E8EFF8F8F
          8FFF919191FF888787FE5C5652CA000000230000001000000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000080000
          00143B37328684817FF6939393FF919191FF8E8E8EFF9D9D9DFFBFBFBFFFCBCB
          CBFFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD4D4D4FFD4D4D4FFD5D5
          D5FFD5D5D5FFD5D5D5FFCECECEFFC2C2C2FFA0A0A0FF8E8E8EFF919191FF9393
          93FF83807EF83A36328F0000001C0000000C0000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000000C0000001867615DCA8F8D8CFC969696FF929292FF8F8F8FFF9898
          98FFB2B2B2FFC4C4C4FFCBCBCBFFD1D1D1FFD5D5D5FFD6D6D6FFD2D2D2FFCDCD
          CDFFC6C6C6FFB6B6B6FF989898FF8F8F8FFF929292FF969696FF8E8D8BFD6660
          5CCE000000230000001400000008000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000400000008000000100000001868625EC78E8B8AF9989898FF9898
          98FF949494FF919191FF8E8E8EFF8C8C8CFF8B8B8BFF8B8B8BFF8C8C8CFF8E8E
          8EFF919191FF949494FF989898FF989898FF8B8987FA66605CCB000000230000
          00140000000C0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000004000000080000000C000000142F2B28666F6A
          66CE8C8986F3979695FD9C9C9CFF9E9E9EFFA0A0A0FFA0A0A0FF9E9E9EFF9C9C
          9CFF979695FD8A8784F36F6965D02E2A276D0000001C000000140000000C0000
          0004000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000400000004000000080000
          000C0000001000000014000000180000001C0000001C0000001C0000001C0000
          001C0000001800000014000000100000000C0000000800000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000040000000400000004000000040000000800000008000000040000
          0004000000040000000400000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000080000000800000008000000080000000800000008000000080000
          0008000000080000000800000008000000080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000008000000080000
          00100000001F0000002E0000003B00000042000000490000004F0000004F0000
          0049000000490000003B0000002E0000001F0000001000000008000000080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000800000010000000270000003B0000
          006600000086000000A0000000AF000000BE000000C6000000CB000000CB0000
          00C6000000BE000000B3000000A0000000860000006600000042000000270000
          0010000000080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000800000008000000270000004F00000082000000A83130
          2FE97B7876FE989695FFA2A2A2FFA9A9A9FFADADADFFAFAFAFFFAFAFAFFFADAD
          ADFFA9A9A9FFA2A2A2FF989695FF797574FE302F2DEA000000AF000000860000
          00540000002E0000001000000008000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0008000000080000001F0000004900000082000000B872706DFD9C9A9AFFAAAA
          AAFFB6B6B6FFBCBCBCFFC2C2C2FFC6C6C6FFCACACAFFCCCCCCFFCDCDCDFFCBCB
          CBFFC7C7C7FFC3C3C3FFBDBDBDFFB7B7B7FFAAAAAAFF9B9999FF706D6BFE0000
          00BE000000890000004F0000001F000000080000000800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000080000
          00100000003500000069000000AC726F6DFD9D9D9DFFB1B1B1FFBABABAFFC2C2
          C2FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFC4C4C4FFBBBBBBFFB1B1B1FF9E9C
          9CFF6D6B69FE000000B5000000730000003B0000001000000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000008000000180000
          004200000086444140EE949291FFADADADFFB7B7B7FFC1C1C1FFC5C5C5FFC5C5
          C5FFC6C6C6FFC7C7C7FFC7C7C7FFC8C8C8FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9
          C9FFC9C9C9FFC8C8C8FFC8C8C8FFC8C8C8FFC7C7C7FFC7C7C7FFC3C3C3FFB9B9
          B9FFADADADFF918F8FFF403D3CF1000000910000004900000018000000080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000800000018000000490000
          0096676462FC9C9C9CFFB0B0B0FFBABABAFFBFBFBFFFC1C1C1FFC2C2C2FFC3C3
          C3FFC4C4C4FFC4C4C4FFC4C4C4FFC5C5C5FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
          C6FFC6C6C6FFC6C6C6FFC5C5C5FFC5C5C5FFC5C5C5FFC4C4C4FFC3C3C3FFC3C3
          C3FFBDBDBDFFB2B2B2FF9D9B9BFF625F5DFD000000A00000004F000000180000
          0008000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000008000000180000004900000096706D
          6AFEA1A1A1FFB0B0B0FFBABABAFFBBBBBBFFBCBCBCFFBEBEBEFFBFBFBFFFC0C0
          C0FFC1C1C1FFC1C1C1FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
          C3FFC3C3C3FFC3C3C3FFC3C3C3FFC2C2C2FFC2C2C2FFC1C1C1FFC1C1C1FFC0C0
          C0FFBFBFBFFFBEBEBEFFB2B2B2FFA1A1A1FF6A6867FE000000A40000004F0000
          0018000000080000000000000000000000000000000000000000000000000000
          0000000000000000000000000008000000100000003B0000008D6B6867FEA0A0
          A0FFAEAEAEFFB6B6B6FFB7B7B7FFB8B8B8FFBABABAFFBBBBBBFFBCBCBCFFBCBC
          BCFFBDBDBDFFBEBEBEFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
          C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFFBFBFBFFFBEBEBEFFBEBEBEFFBDBD
          BDFFBCBCBCFFBABABAFFBABABAFFB0B0B0FFA0A0A0FF676463FE0000009A0000
          0049000000100000000800000000000000000000000000000000000000000000
          00000000000000000000000000080000002E0000007E5B5856FC9C9C9CFFAAAA
          AAFFB2B2B2FFB4B4B4FFB5B5B5FFB6B6B6FFB7B7B7FFB8B8B8FFB9B9B9FFBABA
          BAFFBABABAFFBBBBBBFFBBBBBBFFBCBCBCFFBCBCBCFFBDBDBDFFBDBDBDFFBDBD
          BDFFBDBDBDFFBDBDBDFFBCBCBCFFBCBCBCFFBBBBBBFFBBBBBBFFBABABAFFBABA
          BAFFB9B9B9FFB8B8B8FFB7B7B7FFB6B6B6FFADADADFF9C9C9CFF555351FD0000
          0089000000350000000800000000000000000000000000000000000000000000
          000000000000000000080000001F0000005F393633EA868686FFA6A6A6FFAFAF
          AFFFB0B0B0FFB0B0B0FFB2B2B2FFB3B3B3FFB4B4B4FFB5B5B5FFB6B6B6FFB6B6
          B6FFB7B7B7FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
          B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB8B8B8FFB8B8B8FFB7B7B7FFB7B7
          B7FFB6B6B6FFB5B5B5FFB4B4B4FFB3B3B3FFB2B2B2FFA8A8A8FF848282FF3331
          30EE000000690000001F00000008000000000000000000000000000000000000
          000000000000000000080000003B0000009A72706FFFA0A0A0FFACACACFFADAD
          ADFFADADADFFAEAEAEFFAFAFAFFFB0B0B0FFB0B0B0FFB1B1B1FFB2B2B2FFB3B3
          B3FFB4B4B4FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFB4B4B4FFB3B3
          B3FFB2B2B2FFB2B2B2FFB0B0B0FFB0B0B0FFAFAFAFFFAEAEAEFFA2A2A2FF6D6C
          6BFF000000A80000004900000008000000000000000000000000000000000000
          0000000000080000001F00000069524F4DFC959595FFA5A5A5FFA9A9A9FFAAAA
          AAFFABABABFFABABABFFACACACFFADADADFFADADADFFAEAEAEFFAFAFAFFFAFAF
          AFFFB0B0B0FFB1B1B1FFB1B1B1FFB2B2B2FFB2B2B2FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFB2B2B2FFB2B2B2FFB1B1B1FFB1B1B1FFB0B0B0FFB0B0
          B0FFAFAFAFFFAEAEAEFFAEAEAEFFADADADFFACACACFFACACACFFA7A7A7FF9595
          95FF4B4947FD0000007E00000027000000080000000000000000000000000000
          0000000000080000003B0000009B6D6C6BFF9E9E9EFFA6A6A6FFA7A7A7FFA7A7
          A7FFA8A8A8FFA9A9A9FFA9A9A9FFAAAAAAFFABABABFFABABABFFACACACFFACAC
          ACFFADADADFFAEAEAEFFAEAEAEFFAEAEAEFFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
          AFFFAFAFAFFFAFAFAFFFAFAFAFFFAEAEAEFFAEAEAEFFADADADFFADADADFFACAC
          ACFFACACACFFABABABFFABABABFFAAAAAAFFAAAAAAFFA9A9A9FFA8A8A8FF9F9F
          9FFF6A6969FF000000AF00000049000000080000000000000000000000000000
          000800000018000000664A4744FB878787FFA2A2A2FFA4A4A4FFA4A4A4FFA5A5
          A5FFA6A6A6FFA6A6A6FFA7A7A7FFA7A7A7FFA8A8A8FFA9A9A9FFA9A9A9FFA9A9
          A9FFAAAAAAFFAAAAAAFFAAAAAAFFABABABFFABABABFFABABABFFABABABFFABAB
          ABFFABABABFFABABABFFABABABFFABABABFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFA9A9A9FFA9A9A9FFA8A8A8FFA7A7A7FFA7A7A7FFA6A6A6FFA6A6A6FFA3A3
          A3FF888888FF43403FFD000000780000001F0000000800000000000000000000
          00080000002E000000865D5C5BFF919191FFA1A1A1FFA2A2A2FFA2A2A2FFA3A3
          A3FFA3A3A3FFA4A4A4FFA4A4A4FFA5A5A5FFA5A5A5FFA6A6A6FFA6A6A6FFA7A7
          A7FFA7A7A7FFA7A7A7FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8
          A8FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8A8FFA7A7A7FFA7A7A7FFA7A7
          A7FFA6A6A6FFA6A6A6FFA6A6A6FFA5A5A5FFA5A5A5FFA4A4A4FFA4A4A4FFA3A3
          A3FF949494FF585757FF0000009B000000350000000800000000000000000000
          0008000000421D1B18D76B6B6BFF9A9A9AFF9F9F9FFFA0A0A0FFA0A0A0FFA1A1
          A1FFA1A1A1FFA1A1A1FFA2A2A2FFA2A2A2FFA2A2A2FFA3A3A3FFA4A4A4FFA4A4
          A4FFA4A4A4FFA4A4A4FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
          A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FFA4A4
          A4FFA3A3A3FFA3A3A3FFA3A3A3FFA2A2A2FFA2A2A2FFA2A2A2FFA1A1A1FFA1A1
          A1FF9D9D9DFF6A6A6AFF181614E1000000540000001000000000000000000000
          00120000005F413D3BFC797979FF9D9D9DFF9E9E9EFF9E9E9EFF9E9E9EFF9F9F
          9FFF9F9F9FFF9F9F9FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA1A1A1FFA1A1
          A1FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2
          A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2A2FFA1A1
          A1FFA1A1A1FFA1A1A1FFA1A1A1FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF9F9F
          9FFF9F9F9FFF7A7A7AFF3B3837FD0000006D0000001800000000000000000000
          00210000006D4F4C4BFF808080FF9B9B9BFF9C9C9CFF9D9D9DFF9D9D9DFF9D9D
          9DFF9D9D9DFF9E9E9EFF9E9E9EFF9E9E9EFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
          9FFF9F9F9FFFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9E9E9EFF9E9E9EFF9E9E
          9EFF9D9D9DFF828282FF494747FF000000860000002700000000000000000000
          00210000007E545453FF868686FF989898FF989898FF989898FF9A9A9AFF9A9A
          9AFF9B9B9BFF9B9B9BFF9C9C9CFF9C9C9CFF9C9C9CFF9D9D9DFF9D9D9DFF9D9D
          9DFF9D9D9DFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
          9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9D9D
          9DFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9C9C9CFF9B9B9BFF9B9B
          9BFF9B9B9BFF888888FF535252FF000000960000002E00000000000000000000
          0029000000865A5A5AFF8B8B8BFF959595FF959595FF959595FF959595FF9595
          95FF979797FF979797FF979797FF989898FF989898FF9A9A9AFF9A9A9AFF9A9A
          9AFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9C9C9CFF9C9C9CFF9B9B9BFF9C9C
          9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9B9B9BFF9B9B9BFF9B9B
          9BFF9B9B9BFF9A9A9AFF9A9A9AFF9A9A9AFF989898FF989898FF979797FF9797
          97FF979797FF8B8B8BFF595959FF000000A00000003500000000000000000000
          0029000000895E5E5EFF8E8E8EFF929292FF929292FF929292FF929292FF9292
          92FF929292FF929292FF929292FF949494FF949494FF949494FF959595FF9595
          95FF959595FF959595FF979797FF979797FF979797FF989898FF989898FF9898
          98FF989898FF9A9A9AFF9A9A9AFF989898FF989898FF979797FF979797FF9595
          95FF959595FF949494FF959595FF949494FF949494FF949494FF929292FF9292
          92FF929292FF8E8E8EFF5D5D5DFF000000A70000003500000000000000000000
          002900000089616161FF8E8E8EFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F
          8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF919191FF9191
          91FF929292FF929292FF949494FF949494FF949494FF959595FF959595FF9595
          95FF959595FF979797FF979797FF979797FF959595FF959595FF949494FF9191
          91FF919191FF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F
          8FFF8F8F8FFF8E8E8EFF606060FF000000A70000003B00000000000000000000
          002900000086616161FF898989FF8B8B8BFF8B8B8BFF8C8C8CFF8B8B8BFF8B8B
          8BFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B8BFF8C8C8CFF8E8E8EFF8E8E8EFF8F8F
          8FFF8F8F8FFF919191FF919191FF919191FF919191FF929292FF919191FF9191
          91FF929292FF929292FF929292FF929292FF929292FF929292FF929292FF8F8F
          8FFF8C8C8CFF8B8B8BFF8B8B8BFF8C8C8CFF8B8B8BFF8B8B8BFF8B8B8BFF8B8B
          8BFF8B8B8BFF8B8B8BFF606060FF000000A40000003500000000000000000000
          00290000007E5F5F5FFF868686FF898989FF898989FF898989FF898989FF8989
          89FF898989FF898989FF898989FF8B8B8BFF8E8E8EFF8E8E8EFF8E8E8EFF8E8E
          8EFF8F8F8FFF919191FF919191FF919191FF929292FF929292FF929292FF9292
          92FF929292FF949494FF949494FF949494FF949494FF949494FF929292FF9494
          94FF8E8E8EFF898989FF898989FF898989FF898989FF898989FF898989FF8989
          89FF898989FF858585FF5D5D5DFF0000009B0000003500000000000000000000
          00210000006D5C5B5BFF7F7F7FFF868686FF868686FF868686FF868686FF8686
          86FF868686FF868686FF888888FF8B8B8BFF8C8C8CFF8E8E8EFF8E8E8EFF8F8F
          8FFF8F8F8FFF8F8F8FFF919191FF919191FF929292FF949494FF929292FF9494
          94FF949494FF949494FF949494FF949494FF949494FF949494FF949494FF9494
          94FF919191FF8B8B8BFF868686FF868686FF868686FF868686FF868686FF8686
          86FF868686FF7F7F7FFF595959FF000000910000002E00000000000000000000
          001800000066565555FF777777FF838383FF838383FF838383FF838383FF8383
          83FF838383FF858585FF888888FF8C8C8CFF8C8C8CFF8E8E8EFF8E8E8EFF8F8F
          8FFF8F8F8FFF919191FF919191FF919191FF929292FF949494FF949494FF9494
          94FF949494FF949494FF949494FF949494FF949494FF949494FF949494FF9494
          94FF949494FF8F8F8FFF858585FF838383FF838383FF838383FF838383FF8383
          83FF838383FF777777FF545353FF000000820000002700000000000000000000
          0018000000544F4D4BFF717171FF808080FF828282FF828282FF808080FF8282
          82FF828282FF858585FF8C8C8CFF8C8C8CFF8C8C8CFF8E8E8EFF8F8F8FFF9191
          91FF919191FF949494FF929292FF929292FF949494FF949494FF959595FF9595
          95FF959595FF959595FF979797FF979797FF979797FF979797FF959595FF9595
          95FF949494FF949494FF898989FF828282FF808080FF828282FF828282FF8080
          80FF828282FF717171FF4B4948FF0000006D0000001F00000000000000000000
          00080000003B45423FFA6A6A6AFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF868686FF8B8B8BFF8E8E8EFF8E8E8EFF8E8E8EFF919191FF9191
          91FF929292FF949494FF949494FF959595FF959595FF959595FF979797FF9797
          97FF979797FF979797FF989898FF979797FF989898FF979797FF979797FF9797
          97FF979797FF959595FF8C8C8CFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF6A6A6AFF3F3A38FC0000005B0000001000000000000000000000
          00080000002726221FBE5F5F5FFF777777FF7D7D7DFF7C7C7CFF7C7C7CFF7C7C
          7CFF7C7C7CFF888888FF8C8C8CFF8E8E8EFF8F8F8FFF919191FF929292FF9494
          94FF949494FF959595FF959595FF959595FF979797FF989898FF989898FF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF989898FF989898FF929292FF7C7C7CFF7C7C7CFF7C7C7CFF7C7C7CFF7C7C
          7CFF777777FF5E5E5EFF1D1A18D00000003B0000000800000000000000000000
          00000000001800000054545251FF6E6E6EFF797979FF7A7A7AFF797979FF7A7A
          7AFF7A7A7AFF8B8B8BFF8E8E8EFF8E8E8EFF919191FF919191FF949494FF9292
          92FF959595FF979797FF989898FF989898FF9A9A9AFF9A9A9AFF9A9A9AFF9B9B
          9BFF9A9A9AFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9C9C9CFF9B9B9BFF9B9B
          9BFF9A9A9AFF9A9A9AFF989898FF797979FF797979FF797979FF797979FF7A7A
          7AFF6E6E6EFF514F4EFF00000073000000270000000000000000000000000000
          0000000000100000003547433FF7666666FF767676FF777777FF777777FF7777
          77FF777777FF8E8E8EFF8F8F8FFF919191FF929292FF949494FF959595FF9797
          97FF979797FF989898FF9A9A9AFF9B9B9BFF9B9B9BFF9C9C9CFF9C9C9CFF9C9C
          9CFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9C9C9CFF9C9C
          9CFF9C9C9CFF9C9C9CFF9A9A9AFF777777FF777777FF777777FF777777FF7676
          76FF666666FF403D3AF90000004F000000100000000000000000000000000000
          0000000000000000001F00000054575555FF6D6D6DFF767676FF747474FF7676
          76FF767676FF8B8B8BFF919191FF929292FF959595FF959595FF979797FF9A9A
          9AFF9B9B9BFF9B9B9BFF9D9D9DFF9D9D9DFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
          9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
          9EFF9E9E9EFF9D9D9DFF979797FF767676FF747474FF767676FF767676FF6D6D
          6DFF545353FF000000780000002E000000080000000000000000000000000000
          000000000000000000100000002E4A4642F7656565FF707070FF737373FF7373
          73FF737373FF858585FF949494FF959595FF989898FF9B9B9BFF9C9C9CFF9C9C
          9CFF9D9D9DFF9D9D9DFF9E9E9EFF9F9F9FFF9F9F9FFFA0A0A0FFA0A0A0FFA0A0
          A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FF9F9F
          9FFF9F9F9FFF9F9F9FFF8F8F8FFF737373FF737373FF737373FF707070FF6464
          64FF423E3BF90000004900000018000000000000000000000000000000000000
          000000000000000000000000001800000049545150FF686868FF717171FF7171
          71FF717171FF7F7F7FFF989898FF9A9A9AFF9C9C9CFF9D9D9DFF9E9E9EFF9F9F
          9FFF9F9F9FFFA0A0A0FFA0A0A0FFA1A1A1FFA1A1A1FFA2A2A2FFA2A2A2FFA2A2
          A2FFA2A2A2FFA3A3A3FFA2A2A2FFA3A3A3FFA2A2A2FFA2A2A2FFA2A2A2FFA2A2
          A2FFA1A1A1FFA1A1A1FF858585FF717171FF717171FF717171FF686868FF504E
          4DFF000000660000002700000008000000000000000000000000000000000000
          00000000000000000000000000080000002739342FCB5C5C5BFF6A6A6AFF7070
          70FF707070FF737373FF8F8F8FFF9D9D9DFF9E9E9EFF9F9F9FFFA0A0A0FFA1A1
          A1FFA1A1A1FFA2A2A2FFA2A2A2FFA3A3A3FFA3A3A3FFA4A4A4FFA4A4A4FFA4A4
          A4FFA4A4A4FFA5A5A5FFA4A4A4FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FFA4A4
          A4FFA3A3A3FF9D9D9DFF747474FF707070FF707070FF6A6A6AFF5A5A59FF312E
          2AD5000000350000001000000000000000000000000000000000000000000000
          0000000000000000000000000000000000100000002E4E4845F3636362FF6B6B
          6BFF6E6E6EFF6E6E6EFF7F7F7FFF9E9E9EFFA0A0A0FFA1A1A1FFA2A2A2FFA3A3
          A3FFA3A3A3FFA4A4A4FFA5A5A5FFA5A5A5FFA5A5A5FFA6A6A6FFA6A6A6FFA7A7
          A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA6A6A6FFA7A7A7FFA6A6
          A6FFA4A4A4FF868686FF6E6E6EFF6E6E6EFF6B6B6BFF626261FF46423EF60000
          0049000000180000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000008000000100000002E55504DFA6565
          65FF6B6B6BFF6D6D6DFF6D6D6DFF8B8B8BFFA2A2A2FFA3A3A3FFA4A4A4FFA5A5
          A5FFA5A5A5FFA6A6A6FFA7A7A7FFA8A8A8FFA8A8A8FFA8A8A8FFA8A8A8FFA9A9
          A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA8A8
          A8FF949494FF6D6D6DFF6D6D6DFF6B6B6BFF656565FF504C49FB000000490000
          001F000000080000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000008000000100000002E5853
          4FFA686867FF6B6B6BFF6B6B6BFF6D6D6DFF8F8F8FFFA5A5A5FFA6A6A6FFA7A7
          A7FFA8A8A8FFA9A9A9FFA9A9A9FFAAAAAAFFABABABFFABABABFFABABABFFABAB
          ABFFACACACFFACACACFFACACACFFACACACFFACACACFFACACACFFAAAAAAFF9A9A
          9AFF6D6D6DFF6B6B6BFF6B6B6BFF676766FF534F4CFB0000004F0000001F0000
          0008000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000008000000100000
          002E57514DF1676665FF6D6D6DFF6B6B6BFF6A6A6AFF8B8B8BFFA3A3A3FFAAAA
          AAFFAAAAAAFFABABABFFACACACFFACACACFFADADADFFADADADFFAEAEAEFFAEAE
          AEFFAEAEAEFFAEAEAEFFAEAEAEFFAEAEAEFFAEAEAEFFA7A7A7FF919191FF6A6A
          6AFF6B6B6BFF6D6D6DFF656464FF504D48F4000000420000001F000000080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000080000
          001000000027433D39C6666362FF6F6F6FFF6D6D6DFF6A6A6AFF797979FF9B9B
          9BFFA7A7A7FFAEAEAEFFAEAEAEFFAFAFAFFFAFAFAFFFB0B0B0FFB0B0B0FFB0B0
          B0FFB1B1B1FFB1B1B1FFB1B1B1FFAAAAAAFF9E9E9EFF7C7C7CFF6A6A6AFF6D6D
          6DFF6F6F6FFF63605FFF3E3935CE000000350000001800000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000008000000180000002E5F5A55F46D6B6AFF727272FF6E6E6EFF6B6B
          6BFF747474FF8E8E8EFFA0A0A0FFA7A7A7FFADADADFFB1B1B1FFB2B2B2FFAEAE
          AEFFA9A9A9FFA2A2A2FF929292FF747474FF6B6B6BFF6E6E6EFF727272FF6B6A
          68FF5C5652F60000004200000027000000100000000800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000008000000100000001F0000002E615B58F36D6A69FF7474
          74FF747474FF707070FF6D6D6DFF6A6A6AFF686868FF676767FF676767FF6868
          68FF6A6A6AFF6D6D6DFF707070FF747474FF747474FF6A6866FF5D5754F50000
          0042000000270000001800000008000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000080000001000000018000000273C37
          33A467615EF6706D6AFF747372FF787878FF7A7A7AFF7C7C7CFF7C7C7CFF7A7A
          7AFF787878FF747372FF6E6B68FF65605CF7373330AC00000035000000270000
          0018000000080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000008000000080000
          0010000000180000001F000000270000002E0000003500000035000000350000
          0035000000350000002E000000270000001F0000001800000010000000080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000800000008000000080000000800000010000000100000
          0008000000080000000800000008000000080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000040000000400000004000000040000000400000004000000040000
          0004000000040000000400000004000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000040000
          000800000010000000180000001F00000023000000270000002B0000002B0000
          0027000000270000001F00000018000000100000000800000004000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000400000008000000140000001F0000
          00390000004F00000063000000700000007E000000860000008B0000008B0000
          00860000007E00000073000000630000004F0000003900000023000000140000
          0008000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000400000004000000140000002B0000004C0000006A3A38
          37B3908F8DECB8B7B6FBC6C6C6FFCDCDCDFFD1D1D1FFD3D3D3FFD3D3D3FFD1D1
          D1FFCDCDCDFFC6C6C6FFB8B7B6FB8F8C8BED393837B5000000700000004F0000
          002E000000180000000800000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000000400000010000000270000004C00000078868482E7BEBDBDFDCECE
          CEFFDADADAFFE0E0E0FFE6E6E6FFEAEAEAFFEEEEEEFFF0F0F0FFF1F1F1FFEFEF
          EFFFEBEBEBFFE7E7E7FFE1E1E1FFDBDBDBFFCECECEFFBDBCBCFE858381E90000
          007E000000510000002B00000010000000040000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          00080000001C0000003B0000006D878482E8C1C1C1FFD5D5D5FFDEDEDEFFE6E6
          E6FFEDEDEDFFEDEDEDFFEEEEEEFFEEEEEEFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
          EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFE8E8E8FFDFDFDFFFD5D5D5FFC1C0
          C0FF838180EA00000075000000420000001F0000000800000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000040000000C0000
          00230000004F4C4947BCB5B4B3FCD1D1D1FFDBDBDBFFE5E5E5FFE9E9E9FFE9E9
          E9FFEAEAEAFFEBEBEBFFEBEBEBFFECECECFFECECECFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFECECECFFECECECFFECECECFFEBEBEBFFEBEBEBFFE7E7E7FFDDDD
          DDFFD1D1D1FFB3B2B2FD4B4846C200000057000000270000000C000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000C000000270000
          005B797674E1C0C0C0FFD4D4D4FFDEDEDEFFE3E3E3FFE5E5E5FFE6E6E6FFE7E7
          E7FFE8E8E8FFE8E8E8FFE8E8E8FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFE8E8E8FFE7E7E7FFE7E7
          E7FFE1E1E1FFD6D6D6FFC0BFBFFF767371E4000000630000002B0000000C0000
          0004000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000040000000C000000270000005B8784
          82ECC5C5C5FFD4D4D4FFDEDEDEFFDFDFDFFFE0E0E0FFE2E2E2FFE3E3E3FFE4E4
          E4FFE5E5E5FFE5E5E5FFE6E6E6FFE6E6E6FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
          E7FFE7E7E7FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6E6FFE5E5E5FFE5E5E5FFE4E4
          E4FFE3E3E3FFE2E2E2FFD6D6D6FFC5C5C5FF83817FEE000000660000002B0000
          000C000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000004000000080000001F0000005482807EECC4C4
          C4FFD2D2D2FFDADADAFFDBDBDBFFDCDCDCFFDEDEDEFFDFDFDFFFE0E0E0FFE0E0
          E0FFE1E1E1FFE2E2E2FFE3E3E3FFE3E3E3FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
          E4FFE4E4E4FFE4E4E4FFE4E4E4FFE3E3E3FFE3E3E3FFE2E2E2FFE2E2E2FFE1E1
          E1FFE0E0E0FFDEDEDEFFDEDEDEFFD4D4D4FFC4C4C4FF807D7BEE0000005E0000
          0027000000080000000400000000000000000000000000000000000000000000
          000000000000000000000000000400000018000000496E6A69E0C0C0C0FFCECE
          CEFFD6D6D6FFD8D8D8FFD9D9D9FFDADADAFFDBDBDBFFDCDCDCFFDDDDDDFFDEDE
          DEFFDEDEDEFFDFDFDFFFDFDFDFFFE0E0E0FFE0E0E0FFE1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFE1E1E1FFE0E0E0FFE0E0E0FFDFDFDFFFDFDFDFFFDEDEDEFFDEDE
          DEFFDDDDDDFFDCDCDCFFDBDBDBFFDADADAFFD1D1D1FFC0C0C0FF6B6966E40000
          00510000001C0000000400000000000000000000000000000000000000000000
          000000000000000000040000001000000035413E3BB5AAAAAAFFCACACAFFD3D3
          D3FFD4D4D4FFD4D4D4FFD6D6D6FFD7D7D7FFD8D8D8FFD9D9D9FFDADADAFFDADA
          DAFFDBDBDBFFDCDCDCFFDCDCDCFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDCDCDCFFDCDCDCFFDBDBDBFFDBDB
          DBFFDADADAFFD9D9D9FFD8D8D8FFD7D7D7FFD6D6D6FFCCCCCCFFA7A6A6FF3F3C
          3ABC0000003B0000001000000004000000000000000000000000000000000000
          000000000000000000040000001F0000005E949291FBC4C4C4FFD0D0D0FFD1D1
          D1FFD1D1D1FFD2D2D2FFD3D3D3FFD4D4D4FFD4D4D4FFD5D5D5FFD6D6D6FFD7D7
          D7FFD8D8D8FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFDADADAFFDADADAFFDADA
          DAFFDADADAFFDADADAFFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFD8D8D8FFD7D7
          D7FFD6D6D6FFD6D6D6FFD4D4D4FFD4D4D4FFD3D3D3FFD2D2D2FFC6C6C6FF8F8E
          8DFC0000006A0000002700000004000000000000000000000000000000000000
          000000000004000000100000003B686461E2B9B9B9FFC9C9C9FFCDCDCDFFCECE
          CEFFCFCFCFFFCFCFCFFFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD3D3D3FFD3D3
          D3FFD4D4D4FFD5D5D5FFD5D5D5FFD6D6D6FFD6D6D6FFD7D7D7FFD7D7D7FFD7D7
          D7FFD7D7D7FFD7D7D7FFD6D6D6FFD6D6D6FFD5D5D5FFD5D5D5FFD4D4D4FFD4D4
          D4FFD3D3D3FFD2D2D2FFD2D2D2FFD1D1D1FFD0D0D0FFD0D0D0FFCBCBCBFFB9B9
          B9FF63615EE60000004900000014000000040000000000000000000000000000
          0000000000040000001F0000005F908F8EFEC2C2C2FFCACACAFFCBCBCBFFCBCB
          CBFFCCCCCCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFD0D0D0FFD0D0
          D0FFD1D1D1FFD2D2D2FFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD2D2D2FFD2D2D2FFD1D1D1FFD1D1D1FFD0D0
          D0FFD0D0D0FFCFCFCFFFCFCFCFFFCECECEFFCECECEFFCDCDCDFFCCCCCCFFC3C3
          C3FF8D8C8CFE0000007000000027000000040000000000000000000000000000
          00040000000C000000395E5B57DFABABABFFC6C6C6FFC8C8C8FFC8C8C8FFC9C9
          C9FFCACACAFFCACACAFFCBCBCBFFCBCBCBFFCCCCCCFFCDCDCDFFCDCDCDFFCDCD
          CDFFCECECEFFCECECEFFCECECEFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
          CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCECECEFFCECECEFFCECECEFFCECE
          CEFFCDCDCDFFCDCDCDFFCCCCCCFFCBCBCBFFCBCBCBFFCACACAFFCACACAFFC7C7
          C7FFACACACFF5B5855E400000045000000100000000400000000000000000000
          0004000000180000004F7F7E7DFCB5B5B5FFC5C5C5FFC6C6C6FFC6C6C6FFC7C7
          C7FFC7C7C7FFC8C8C8FFC8C8C8FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFCBCB
          CBFFCBCBCBFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFFCBCBCBFFCBCB
          CBFFCACACAFFCACACAFFCACACAFFC9C9C9FFC9C9C9FFC8C8C8FFC8C8C8FFC7C7
          C7FFB8B8B8FF7B7A79FD0000005F0000001C0000000400000000000000000000
          0004000000232523209A8F8F8FFFBEBEBEFFC3C3C3FFC4C4C4FFC4C4C4FFC5C5
          C5FFC5C5C5FFC5C5C5FFC6C6C6FFC6C6C6FFC6C6C6FFC7C7C7FFC8C8C8FFC8C8
          C8FFC8C8C8FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9
          C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8C8FFC8C8
          C8FFC7C7C7FFC7C7C7FFC7C7C7FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5C5FFC5C5
          C5FFC1C1C1FF8E8E8EFF25221FA70000002E0000000800000000000000000000
          000900000035585450E19D9D9DFFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3
          C3FFC3C3C3FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5
          C5FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
          C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC5C5
          C5FFC5C5C5FFC5C5C5FFC5C5C5FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3
          C3FFC3C3C3FF9E9E9EFF54514EE70000003E0000000C00000000000000000000
          00110000003E706D6BF8A4A4A4FFBFBFBFFFC0C0C0FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
          C3FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC2C2C2FFC2C2C2FFC2C2
          C2FFC1C1C1FFA6A6A6FF6B6968FA0000004F0000001400000000000000000000
          001100000049787877FEAAAAAAFFBCBCBCFFBCBCBCFFBCBCBCFFBEBEBEFFBEBE
          BEFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFC0C0C0FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC0C0C0FFBFBFBFFFBFBF
          BFFFBFBFBFFFACACACFF777675FE0000005B0000001800000000000000000000
          00150000004F7E7E7EFFAFAFAFFFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
          B9FFBBBBBBFFBBBBBBFFBBBBBBFFBCBCBCFFBCBCBCFFBEBEBEFFBEBEBEFFBEBE
          BEFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFBFBFBFFFC0C0
          C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFFBFBFBFFFBFBF
          BFFFBFBFBFFFBEBEBEFFBEBEBEFFBEBEBEFFBCBCBCFFBCBCBCFFBBBBBBFFBBBB
          BBFFBBBBBBFFAFAFAFFF7D7D7DFF000000630000001C00000000000000000000
          001500000051828282FFB2B2B2FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9
          B9FFB9B9B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBBBBFFBCBCBCFFBCBCBCFFBCBC
          BCFFBCBCBCFFBEBEBEFFBEBEBEFFBCBCBCFFBCBCBCFFBBBBBBFFBBBBBBFFB9B9
          B9FFB9B9B9FFB8B8B8FFB9B9B9FFB8B8B8FFB8B8B8FFB8B8B8FFB6B6B6FFB6B6
          B6FFB6B6B6FFB2B2B2FF818181FF000000690000001C00000000000000000000
          001500000051858585FFB2B2B2FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB5B5B5FFB5B5
          B5FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9
          B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBBBBFFB9B9B9FFB9B9B9FFB8B8B8FFB5B5
          B5FFB5B5B5FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB2B2B2FF848484FF000000690000001F00000000000000000000
          00150000004F858585FFADADADFFAFAFAFFFAFAFAFFFB0B0B0FFAFAFAFFFAFAF
          AFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFB0B0B0FFB2B2B2FFB2B2B2FFB3B3
          B3FFB3B3B3FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB5B5B5FFB5B5
          B5FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB3B3
          B3FFB0B0B0FFAFAFAFFFAFAFAFFFB0B0B0FFAFAFAFFFAFAFAFFFAFAFAFFFAFAF
          AFFFAFAFAFFFAFAFAFFF848484FF000000660000001C00000000000000000000
          001500000049838383FFAAAAAAFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFADADADFFAFAFAFFFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
          B2FFB3B3B3FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB6B6B6FFB8B8
          B8FFB2B2B2FFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFA9A9A9FF818181FF0000005F0000001C00000000000000000000
          00110000003E807F7FFFA3A3A3FFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFAAAAAAFFAAAAAAFFACACACFFAFAFAFFFB0B0B0FFB2B2B2FFB2B2B2FFB3B3
          B3FFB3B3B3FFB3B3B3FFB5B5B5FFB5B5B5FFB6B6B6FFB8B8B8FFB6B6B6FFB8B8
          B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB5B5B5FFAFAFAFFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAAAAFFAAAA
          AAFFAAAAAAFFA3A3A3FF7D7D7DFF000000570000001800000000000000000000
          000C000000397A7978FE9B9B9BFFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FFA7A7A7FFA9A9A9FFACACACFFB0B0B0FFB0B0B0FFB2B2B2FFB2B2B2FFB3B3
          B3FFB3B3B3FFB5B5B5FFB5B5B5FFB5B5B5FFB6B6B6FFB8B8B8FFB8B8B8FFB8B8
          B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB8B8B8FFB3B3B3FFA9A9A9FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7
          A7FFA7A7A7FF9B9B9BFF787776FE0000004C0000001400000000000000000000
          000C0000002E6F6C69F6959595FFA4A4A4FFA6A6A6FFA6A6A6FFA4A4A4FFA6A6
          A6FFA6A6A6FFA9A9A9FFB0B0B0FFB0B0B0FFB0B0B0FFB2B2B2FFB3B3B3FFB5B5
          B5FFB5B5B5FFB8B8B8FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9
          B9FFB9B9B9FFB9B9B9FFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFB9B9B9FFB9B9
          B9FFB8B8B8FFB8B8B8FFADADADFFA6A6A6FFA4A4A4FFA6A6A6FFA6A6A6FFA4A4
          A4FFA6A6A6FF959595FF6C6A68F80000003E0000001000000000000000000000
          00040000001F595350D98E8E8EFFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
          A3FFA3A3A3FFAAAAAAFFAFAFAFFFB2B2B2FFB2B2B2FFB2B2B2FFB5B5B5FFB5B5
          B5FFB6B6B6FFB8B8B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9B9FFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBCBCBCFFBBBBBBFFBCBCBCFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFB9B9B9FFB0B0B0FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3A3FFA3A3
          A3FFA3A3A3FF8E8E8EFF55514DE0000000320000000800000000000000000000
          00040000001426221F7E838383FF9B9B9BFFA1A1A1FFA0A0A0FFA0A0A0FFA0A0
          A0FFA0A0A0FFACACACFFB0B0B0FFB2B2B2FFB3B3B3FFB5B5B5FFB6B6B6FFB8B8
          B8FFB8B8B8FFB9B9B9FFB9B9B9FFB9B9B9FFBBBBBBFFBCBCBCFFBCBCBCFFBEBE
          BEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
          BEFFBCBCBCFFBCBCBCFFB6B6B6FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FF9B9B9BFF828282FF24201E910000001F0000000400000000000000000000
          00000000000C0000002E767472FA929292FF9D9D9DFF9E9E9EFF9D9D9DFF9E9E
          9EFF9E9E9EFFAFAFAFFFB2B2B2FFB2B2B2FFB5B5B5FFB5B5B5FFB8B8B8FFB6B6
          B6FFB9B9B9FFBBBBBBFFBCBCBCFFBCBCBCFFBEBEBEFFBEBEBEFFBEBEBEFFBFBF
          BFFFBEBEBEFFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFBFBFBFFFBFBF
          BFFFBEBEBEFFBEBEBEFFBCBCBCFF9D9D9DFF9D9D9DFF9D9D9DFF9D9D9DFF9E9E
          9EFF929292FF73716FFB00000042000000140000000000000000000000000000
          0000000000080000001C56524DD08A8A8AFF9A9A9AFF9B9B9BFF9B9B9BFF9B9B
          9BFF9B9B9BFFB2B2B2FFB3B3B3FFB5B5B5FFB6B6B6FFB8B8B8FFB9B9B9FFBBBB
          BBFFBBBBBBFFBCBCBCFFBEBEBEFFBFBFBFFFBFBFBFFFC0C0C0FFC0C0C0FFC0C0
          C0FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC0C0C0FFC0C0
          C0FFC0C0C0FFC0C0C0FFBEBEBEFF9B9B9BFF9B9B9BFF9B9B9BFF9B9B9BFF9A9A
          9AFF8A8A8AFF534E4BD70000002B000000080000000000000000000000000000
          000000000000000000100000002E7A7877FD919191FF9A9A9AFF989898FF9A9A
          9AFF9A9A9AFFAFAFAFFFB5B5B5FFB6B6B6FFB9B9B9FFB9B9B9FFBBBBBBFFBEBE
          BEFFBFBFBFFFBFBFBFFFC1C1C1FFC1C1C1FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC1C1C1FFBBBBBBFF9A9A9AFF989898FF9A9A9AFF9A9A9AFF9191
          91FF787776FE0000004500000018000000040000000000000000000000000000
          000000000000000000080000001859534FD0898989FF949494FF979797FF9797
          97FF979797FFA9A9A9FFB8B8B8FFB9B9B9FFBCBCBCFFBFBFBFFFC0C0C0FFC0C0
          C0FFC1C1C1FFC1C1C1FFC2C2C2FFC3C3C3FFC3C3C3FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3
          C3FFC3C3C3FFC3C3C3FFB3B3B3FF979797FF979797FF979797FF949494FF8888
          88FF55504CD7000000270000000C000000000000000000000000000000000000
          000000000000000000000000000C00000027757270F88C8C8CFF959595FF9595
          95FF959595FFA3A3A3FFBCBCBCFFBEBEBEFFC0C0C0FFC1C1C1FFC2C2C2FFC3C3
          C3FFC3C3C3FFC4C4C4FFC4C4C4FFC5C5C5FFC5C5C5FFC6C6C6FFC6C6C6FFC6C6
          C6FFC6C6C6FFC7C7C7FFC6C6C6FFC7C7C7FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
          C6FFC5C5C5FFC5C5C5FFA9A9A9FF959595FF959595FF959595FF8C8C8CFF716F
          6DF9000000390000001400000004000000000000000000000000000000000000
          00000000000000000000000000040000001435312D8B7F7F7FFE8E8E8EFF9494
          94FF949494FF979797FFB3B3B3FFC1C1C1FFC2C2C2FFC3C3C3FFC4C4C4FFC5C5
          C5FFC5C5C5FFC6C6C6FFC6C6C6FFC7C7C7FFC7C7C7FFC8C8C8FFC8C8C8FFC8C8
          C8FFC8C8C8FFC9C9C9FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8C8FFC8C8
          C8FFC7C7C7FFC1C1C1FF989898FF949494FF949494FF8E8E8EFF7E7E7DFE342F
          2C970000001C0000000800000000000000000000000000000000000000000000
          0000000000000000000000000000000000080000001858524EC6878786FF8F8F
          8FFF929292FF929292FFA3A3A3FFC2C2C2FFC4C4C4FFC5C5C5FFC6C6C6FFC7C7
          C7FFC7C7C7FFC8C8C8FFC9C9C9FFC9C9C9FFC9C9C9FFCACACAFFCACACAFFCBCB
          CBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCACACAFFCBCBCBFFCACA
          CAFFC8C8C8FFAAAAAAFF929292FF929292FF8F8F8FFF868685FF544F4BCD0000
          00270000000C0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000004000000080000001866615CD88989
          89FF8F8F8FFF919191FF919191FFAFAFAFFFC6C6C6FFC7C7C7FFC8C8C8FFC9C9
          C9FFC9C9C9FFCACACAFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCCCC
          CCFFB8B8B8FF919191FF919191FF8F8F8FFF898989FF635E5BDE000000270000
          0010000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000400000008000000186863
          5ED88C8C8BFF8F8F8FFF8F8F8FFF919191FFB3B3B3FFC9C9C9FFCACACAFFCBCB
          CBFFCCCCCCFFCDCDCDFFCDCDCDFFCECECEFFCFCFCFFFCFCFCFFFCFCFCFFFCFCF
          CFFFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFCECECEFFBEBE
          BEFF919191FF8F8F8FFF8F8F8FFF8B8B8AFF65605DDD0000002B000000100000
          0004000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000080000
          00185E5853C38A8988FE919191FF8F8F8FFF8E8E8EFFAFAFAFFFC7C7C7FFCECE
          CEFFCECECEFFCFCFCFFFD0D0D0FFD0D0D0FFD1D1D1FFD1D1D1FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFCBCBCBFFB5B5B5FF8E8E
          8EFF8F8F8FFF919191FF888787FE5C5652CA0000002300000010000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000040000
          0008000000143B37328684817FF6939393FF919191FF8E8E8EFF9D9D9DFFBFBF
          BFFFCBCBCBFFD2D2D2FFD2D2D2FFD3D3D3FFD3D3D3FFD4D4D4FFD4D4D4FFD4D4
          D4FFD5D5D5FFD5D5D5FFD5D5D5FFCECECEFFC2C2C2FFA0A0A0FF8E8E8EFF9191
          91FF939393FF83807EF83A36328F0000001C0000000C00000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000040000000C0000001867615DCA8F8D8CFC969696FF929292FF8F8F
          8FFF989898FFB2B2B2FFC4C4C4FFCBCBCBFFD1D1D1FFD5D5D5FFD6D6D6FFD2D2
          D2FFCDCDCDFFC6C6C6FFB6B6B6FF989898FF8F8F8FFF929292FF969696FF8E8D
          8BFD66605CCE0000002300000014000000080000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000400000008000000100000001868625EC78E8B8AF99898
          98FF989898FF949494FF919191FF8E8E8EFF8C8C8CFF8B8B8BFF8B8B8BFF8C8C
          8CFF8E8E8EFF919191FF949494FF989898FF989898FF8B8987FA66605CCB0000
          0023000000140000000C00000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000004000000080000000C000000142F2B
          28666F6A66CE8C8986F3979695FD9C9C9CFF9E9E9EFFA0A0A0FFA0A0A0FF9E9E
          9EFF9C9C9CFF979695FD8A8784F36F6965D02E2A276D0000001C000000140000
          000C000000040000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004000000040000
          00080000000C0000001000000014000000180000001C0000001C0000001C0000
          001C0000001C0000001800000014000000100000000C00000008000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000400000004000000040000000400000008000000080000
          0004000000040000000400000004000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36240000424D3624000000000000360000002800000030000000300000000100
          2000000000000024000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101080101010801010108010101080101010801010108010101080101
          0108010101080101010801010108010101080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010108010101080101
          01100202021F0303032E0404043B05050542050505490606064F0606064F0505
          0549050505490404043B0303032E0202021F0101011001010108010101080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000101010801010110030303270404043B0808
          08660B0B0B860E0E0EA0101010AF111111BE131313C6131313CB131313CB1313
          13C6111111BE101010B30E0E0EA00B0B0B860808086605050542030303270101
          0110010101080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000101010801010108030303270606064F0B0B0B820E0E0EA86561
          5FE9BBBAB8FEDDDDDCFFEAEAEAFFF1F1F1FFF5F5F5FFF7F7F7FFF7F7F7FFF5F5
          F5FFF1F1F1FFEAEAEAFFDDDDDCFFB9B7B6FE64615FEA101010AF0B0B0B860606
          06540303032E0101011001010108000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          0108010101080202021F050505490B0B0B82111111B8B2B1AFFDE1E1E1FFF2F2
          F2FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFE0E0E0FFB1AFADFE1111
          11BE0B0B0B890606064F0202021F010101080101010800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101080101
          011004040435080808690F0F0FACB2B0AFFDE5E5E5FFF9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFE4E4
          E4FFAEADABFE101010B5090909730404043B0101011001010108000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010108020202180505
          05420B0B0B867A7773EED9D9D8FFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5F5F5FFD6D6D6FF787371F10C0C0C910505054902020218010101080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010802020218050505490C0C
          0C96A6A4A2FCE4E4E4FFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFAFAFAFFE3E3E3FFA2A09EFD0E0E0EA00606064F020202180101
          0108000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000101010802020218050505490C0C0C96B1AF
          ADFEE9E9E9FFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFAFAFAFFE9E9E9FFABAAA8FE0E0E0EA40606064F0202
          0218010101080000000000000000000000000000000000000000000000000000
          0000000000000000000001010108010101100404043B0C0C0C8DACAAA8FEE8E8
          E8FFF6F6F6FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FFE8E8E8FFA8A6A4FE0D0D0D9A0505
          0549010101100101010800000000000000000000000000000000000000000000
          00000000000000000000010101080303032E0A0A0A7E9A9795FCE4E4E4FFF2F2
          F2FFFAFAFAFFFCFCFCFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF5F5F5FFE4E4E4FF969491FD0B0B
          0B89040404350101010800000000000000000000000000000000000000000000
          000000000000010101080202021F0707075F6D6964EACECECEFFEEEEEEFFF7F7
          F7FFF8F8F8FFF8F8F8FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF0F0F0FFCACACAFF6A65
          61EE080808690202021F01010108000000000000000000000000000000000000
          000000000000010101080404043B0D0D0D9AB8B7B6FFE8E8E8FFF4F4F4FFF5F5
          F5FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF8F8F8FFF9F9F9FFFAFAFAFFFBFB
          FBFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFEFFFEFEFEFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFB
          FBFFFAFAFAFFFAFAFAFFF8F8F8FFF8F8F8FFF7F7F7FFF6F6F6FFEAEAEAFFB3B3
          B2FF0E0E0EA80505054901010108000000000000000000000000000000000000
          0000010101080202021F08080869928F8BFCDDDDDDFFEDEDEDFFF1F1F1FFF2F2
          F2FFF3F3F3FFF3F3F3FFF4F4F4FFF5F5F5FFF5F5F5FFF6F6F6FFF7F7F7FFF7F7
          F7FFF8F8F8FFF9F9F9FFF9F9F9FFFAFAFAFFFAFAFAFFFBFBFBFFFBFBFBFFFBFB
          FBFFFBFBFBFFFBFBFBFFFAFAFAFFFAFAFAFFF9F9F9FFF9F9F9FFF8F8F8FFF8F8
          F8FFF7F7F7FFF6F6F6FFF6F6F6FFF5F5F5FFF4F4F4FFF4F4F4FFEFEFEFFFDDDD
          DDFF8D8A87FD0A0A0A7E03030327010101080000000000000000000000000000
          0000010101080404043B0D0D0D9BB3B3B2FFE6E6E6FFEEEEEEFFEFEFEFFFEFEF
          EFFFF0F0F0FFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF3F3F3FFF4F4F4FFF4F4
          F4FFF5F5F5FFF6F6F6FFF6F6F6FFF6F6F6FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7
          F7FFF7F7F7FFF7F7F7FFF7F7F7FFF6F6F6FFF6F6F6FFF5F5F5FFF5F5F5FFF4F4
          F4FFF4F4F4FFF3F3F3FFF3F3F3FFF2F2F2FFF2F2F2FFF1F1F1FFF0F0F0FFE7E7
          E7FFB1B0B0FF101010AF05050549010101080000000000000000000000000101
          01080202021808080866898581FBCFCFCFFFEAEAEAFFECECECFFECECECFFEDED
          EDFFEEEEEEFFEEEEEEFFEFEFEFFFEFEFEFFFF0F0F0FFF1F1F1FFF1F1F1FFF1F1
          F1FFF2F2F2FFF2F2F2FFF2F2F2FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
          F2FFF1F1F1FFF1F1F1FFF0F0F0FFEFEFEFFFEFEFEFFFEEEEEEFFEEEEEEFFEBEB
          EBFFD0D0D0FF85817DFD090909780202021F0101010800000000000000000101
          01080303032E0B0B0B86A3A3A1FFD9D9D9FFE9E9E9FFEAEAEAFFEAEAEAFFEBEB
          EBFFEBEBEBFFECECECFFECECECFFEDEDEDFFEDEDEDFFEEEEEEFFEEEEEEFFEFEF
          EFFFEFEFEFFFEFEFEFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFEFEFEFFFEFEFEFFFEFEF
          EFFFEEEEEEFFEEEEEEFFEEEEEEFFEDEDEDFFEDEDEDFFECECECFFECECECFFEBEB
          EBFFDCDCDCFF9E9E9DFF0D0D0D9B040404350101010800000000000000000101
          0108050505424B4640D7B3B3B3FFE2E2E2FFE7E7E7FFE8E8E8FFE8E8E8FFE9E9
          E9FFE9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFECECECFFECEC
          ECFFECECECFFECECECFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFECECECFFECEC
          ECFFEBEBEBFFEBEBEBFFEBEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9
          E9FFE5E5E5FFB2B2B2FF4A4540E1060606540101011000000000000000000101
          01120707075F837E78FCC1C1C1FFE5E5E5FFE6E6E6FFE6E6E6FFE6E6E6FFE7E7
          E7FFE7E7E7FFE7E7E7FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE9E9E9FFE9E9
          E9FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFE9E9
          E9FFE9E9E9FFE9E9E9FFE9E9E9FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE7E7
          E7FFE7E7E7FFC2C2C2FF7D7873FD0909096D0202021800000000000000000202
          02210909096D969391FFC8C8C8FFE3E3E3FFE4E4E4FFE5E5E5FFE5E5E5FFE5E5
          E5FFE5E5E5FFE6E6E6FFE6E6E6FFE6E6E6FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7
          E7FFE7E7E7FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6E6FFE6E6
          E6FFE5E5E5FFCACACAFF908E8DFF0B0B0B860303032700000000000000000202
          02210A0A0A7E9B9B9AFFCECECEFFE0E0E0FFE0E0E0FFE0E0E0FFE2E2E2FFE2E2
          E2FFE3E3E3FFE3E3E3FFE4E4E4FFE4E4E4FFE4E4E4FFE5E5E5FFE5E5E5FFE5E5
          E5FFE5E5E5FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE5E5
          E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE4E4E4FFE3E3E3FFE3E3
          E3FFE3E3E3FFD0D0D0FF9A9998FF0C0C0C960303032E00000000000000000303
          03290B0B0B86A2A2A2FFD3D3D3FFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDD
          DDFFDFDFDFFFDFDFDFFFDFDFDFFFE0E0E0FFE0E0E0FFE2E2E2FFE2E2E2FFE2E2
          E2FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE4E4E4FFE4E4E4FFE3E3E3FFE4E4
          E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE3E3E3FFE3E3E3FFE3E3
          E3FFE3E3E3FFE2E2E2FFE2E2E2FFE2E2E2FFE0E0E0FFE0E0E0FFDFDFDFFFDFDF
          DFFFDFDFDFFFD3D3D3FFA1A1A1FF0E0E0EA00404043500000000000000000303
          03290B0B0B89A6A6A6FFD6D6D6FFDADADAFFDADADAFFDADADAFFDADADAFFDADA
          DAFFDADADAFFDADADAFFDADADAFFDCDCDCFFDCDCDCFFDCDCDCFFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDFDFDFFFDFDFDFFFDFDFDFFFE0E0E0FFE0E0E0FFE0E0
          E0FFE0E0E0FFE2E2E2FFE2E2E2FFE0E0E0FFE0E0E0FFDFDFDFFFDFDFDFFFDDDD
          DDFFDDDDDDFFDCDCDCFFDDDDDDFFDCDCDCFFDCDCDCFFDCDCDCFFDADADAFFDADA
          DAFFDADADAFFD6D6D6FFA5A5A5FF0E0E0EA70404043500000000000000000303
          03290B0B0B89A9A9A9FFD6D6D6FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
          D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD9D9D9FFD9D9
          D9FFDADADAFFDADADAFFDCDCDCFFDCDCDCFFDCDCDCFFDDDDDDFFDDDDDDFFDDDD
          DDFFDDDDDDFFDFDFDFFFDFDFDFFFDFDFDFFFDDDDDDFFDDDDDDFFDCDCDCFFD9D9
          D9FFD9D9D9FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
          D7FFD7D7D7FFD6D6D6FFA8A8A8FF0E0E0EA70404043B00000000000000000303
          03290B0B0B86A9A9A9FFD1D1D1FFD3D3D3FFD3D3D3FFD4D4D4FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD4D4D4FFD6D6D6FFD6D6D6FFD7D7
          D7FFD7D7D7FFD9D9D9FFD9D9D9FFD9D9D9FFD9D9D9FFDADADAFFD9D9D9FFD9D9
          D9FFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFDADADAFFD7D7
          D7FFD4D4D4FFD3D3D3FFD3D3D3FFD4D4D4FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFD3D3D3FFA8A8A8FF0E0E0EA40404043500000000000000000303
          03290A0A0A7EA7A7A7FFCECECEFFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
          D1FFD1D1D1FFD1D1D1FFD1D1D1FFD3D3D3FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
          D6FFD7D7D7FFD9D9D9FFD9D9D9FFD9D9D9FFDADADAFFDADADAFFDADADAFFDADA
          DAFFDADADAFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDADADAFFDCDC
          DCFFD6D6D6FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1D1FFD1D1
          D1FFD1D1D1FFCDCDCDFFA5A5A5FF0D0D0D9B0404043500000000000000000202
          02210909096DA4A3A3FFC7C7C7FFCECECEFFCECECEFFCECECEFFCECECEFFCECE
          CEFFCECECEFFCECECEFFD0D0D0FFD3D3D3FFD4D4D4FFD6D6D6FFD6D6D6FFD7D7
          D7FFD7D7D7FFD7D7D7FFD9D9D9FFD9D9D9FFDADADAFFDCDCDCFFDADADAFFDCDC
          DCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDC
          DCFFD9D9D9FFD3D3D3FFCECECEFFCECECEFFCECECEFFCECECEFFCECECEFFCECE
          CEFFCECECEFFC7C7C7FFA1A1A1FF0C0C0C910303032E00000000000000000202
          0218080808669D9C9BFFBFBFBFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFCDCDCDFFD0D0D0FFD4D4D4FFD4D4D4FFD6D6D6FFD6D6D6FFD7D7
          D7FFD7D7D7FFD9D9D9FFD9D9D9FFD9D9D9FFDADADAFFDCDCDCFFDCDCDCFFDCDC
          DCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDC
          DCFFDCDCDCFFD7D7D7FFCDCDCDFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
          CBFFCBCBCBFFBFBFBFFF9B9A99FF0B0B0B820303032700000000000000000202
          02180606065495928FFFB9B9B9FFC8C8C8FFCACACAFFCACACAFFC8C8C8FFCACA
          CAFFCACACAFFCDCDCDFFD4D4D4FFD4D4D4FFD4D4D4FFD6D6D6FFD7D7D7FFD9D9
          D9FFD9D9D9FFDCDCDCFFDADADAFFDADADAFFDCDCDCFFDCDCDCFFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDDDDDDFFDDDD
          DDFFDCDCDCFFDCDCDCFFD1D1D1FFCACACAFFC8C8C8FFCACACAFFCACACAFFC8C8
          C8FFCACACAFFB9B9B9FF92908EFF0909096D0202021F00000000000000000101
          01080404043B857D7AFAB2B2B2FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFCECECEFFD3D3D3FFD6D6D6FFD6D6D6FFD6D6D6FFD9D9D9FFD9D9
          D9FFDADADAFFDCDCDCFFDCDCDCFFDDDDDDFFDDDDDDFFDDDDDDFFDFDFDFFFDFDF
          DFFFDFDFDFFFDFDFDFFFE0E0E0FFDFDFDFFFE0E0E0FFDFDFDFFFDFDFDFFFDFDF
          DFFFDFDFDFFFDDDDDDFFD4D4D4FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFB2B2B2FF7F7B75FC0707075B0101011000000000000000000101
          0108030303274C453FBEA7A7A7FFBFBFBFFFC5C5C5FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFD0D0D0FFD4D4D4FFD6D6D6FFD7D7D7FFD9D9D9FFDADADAFFDCDC
          DCFFDCDCDCFFDDDDDDFFDDDDDDFFDDDDDDFFDFDFDFFFE0E0E0FFE0E0E0FFE2E2
          E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2E2FFE2E2
          E2FFE0E0E0FFE0E0E0FFDADADAFFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFBFBFBFFFA6A6A6FF49423DD00404043B0101010800000000000000000000
          000002020218060606549A9997FFB6B6B6FFC1C1C1FFC2C2C2FFC1C1C1FFC2C2
          C2FFC2C2C2FFD3D3D3FFD6D6D6FFD6D6D6FFD9D9D9FFD9D9D9FFDCDCDCFFDADA
          DAFFDDDDDDFFDFDFDFFFE0E0E0FFE0E0E0FFE2E2E2FFE2E2E2FFE2E2E2FFE3E3
          E3FFE2E2E2FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE3E3E3FFE3E3
          E3FFE2E2E2FFE2E2E2FFE0E0E0FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC2C2
          C2FFB6B6B6FF989694FF09090973030303270000000000000000000000000000
          00000101011004040435857E77F7AEAEAEFFBEBEBEFFBFBFBFFFBFBFBFFFBFBF
          BFFFBFBFBFFFD6D6D6FFD7D7D7FFD9D9D9FFDADADAFFDCDCDCFFDDDDDDFFDFDF
          DFFFDFDFDFFFE0E0E0FFE2E2E2FFE3E3E3FFE3E3E3FFE4E4E4FFE4E4E4FFE4E4
          E4FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE4E4E4FFE4E4
          E4FFE4E4E4FFE4E4E4FFE2E2E2FFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBEBE
          BEFFAEAEAEFF7F7873F90606064F010101100000000000000000000000000000
          0000000000000202021F060606549D9C9BFFB5B5B5FFBEBEBEFFBCBCBCFFBEBE
          BEFFBEBEBEFFD3D3D3FFD9D9D9FFDADADAFFDDDDDDFFDDDDDDFFDFDFDFFFE2E2
          E2FFE3E3E3FFE3E3E3FFE5E5E5FFE5E5E5FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE5E5E5FFDFDFDFFFBEBEBEFFBCBCBCFFBEBEBEFFBEBEBEFFB5B5
          B5FF9B9A99FF090909780303032E010101080000000000000000000000000000
          000000000000010101100303032E87807AF7ADADADFFB8B8B8FFBBBBBBFFBBBB
          BBFFBBBBBBFFCDCDCDFFDCDCDCFFDDDDDDFFE0E0E0FFE3E3E3FFE4E4E4FFE4E4
          E4FFE5E5E5FFE5E5E5FFE6E6E6FFE7E7E7FFE7E7E7FFE8E8E8FFE8E8E8FFE8E8
          E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE7E7
          E7FFE7E7E7FFE7E7E7FFD7D7D7FFBBBBBBFFBBBBBBFFBBBBBBFFB8B8B8FFACAC
          ACFF817B74F90505054902020218000000000000000000000000000000000000
          0000000000000000000002020218050505499A9896FFB0B0B0FFB9B9B9FFB9B9
          B9FFB9B9B9FFC7C7C7FFE0E0E0FFE2E2E2FFE4E4E4FFE5E5E5FFE6E6E6FFE7E7
          E7FFE7E7E7FFE8E8E8FFE8E8E8FFE9E9E9FFE9E9E9FFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEBEBEBFFEAEAEAFFEBEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFE9E9E9FFE9E9E9FFCDCDCDFFB9B9B9FFB9B9B9FFB9B9B9FFB0B0B0FF9795
          93FF080808660303032701010108000000000000000000000000000000000000
          000000000000000000000101010803030327635B53CBA3A3A2FFB2B2B2FFB8B8
          B8FFB8B8B8FFBBBBBBFFD7D7D7FFE5E5E5FFE6E6E6FFE7E7E7FFE8E8E8FFE9E9
          E9FFE9E9E9FFEAEAEAFFEAEAEAFFEBEBEBFFEBEBEBFFECECECFFECECECFFECEC
          ECFFECECECFFEDEDEDFFECECECFFEDEDEDFFEDEDEDFFEDEDEDFFECECECFFECEC
          ECFFEBEBEBFFE5E5E5FFBCBCBCFFB8B8B8FFB8B8B8FFB2B2B2FFA1A1A0FF5F57
          51D5040404350101011000000000000000000000000000000000000000000000
          0000000000000000000000000000010101100303032E87817AF3ABABAAFFB3B3
          B3FFB6B6B6FFB6B6B6FFC7C7C7FFE6E6E6FFE8E8E8FFE9E9E9FFEAEAEAFFEBEB
          EBFFEBEBEBFFECECECFFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFEEEEEEFFEFEF
          EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEEEEEEFFEFEFEFFFEEEE
          EEFFECECECFFCECECEFFB6B6B6FFB6B6B6FFB3B3B3FFAAAAA9FF827B75F60505
          0549020202180000000000000000000000000000000000000000000000000000
          000000000000000000000000000001010108010101100303032E938E89FAADAD
          ADFFB3B3B3FFB5B5B5FFB5B5B5FFD3D3D3FFEAEAEAFFEBEBEBFFECECECFFEDED
          EDFFEDEDEDFFEEEEEEFFEFEFEFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1
          F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF1F1F1FFF0F0
          F0FFDCDCDCFFB5B5B5FFB5B5B5FFB3B3B3FFADADADFF8F8985FB050505490202
          021F010101080000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000001010108010101100303032E9691
          8BFAB0B0AFFFB3B3B3FFB3B3B3FFB5B5B5FFD7D7D7FFEDEDEDFFEEEEEEFFEFEF
          EFFFF0F0F0FFF1F1F1FFF1F1F1FFF2F2F2FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
          F3FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF2F2F2FFE2E2
          E2FFB5B5B5FFB3B3B3FFB3B3B3FFAFAFAEFF918C88FB0606064F0202021F0101
          0108000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010108010101100303
          032E8F8882F1ADADACFFB5B5B5FFB3B3B3FFB2B2B2FFD3D3D3FFEBEBEBFFF2F2
          F2FFF2F2F2FFF3F3F3FFF4F4F4FFF4F4F4FFF5F5F5FFF5F5F5FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFEFEFEFFFD9D9D9FFB2B2
          B2FFB3B3B3FFB5B5B5FFACABABFF8B847FF4050505420202021F010101080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101080101
          0110030303276A635CC6AAA8A6FFB7B7B7FFB5B5B5FFB2B2B2FFC1C1C1FFE3E3
          E3FFEFEFEFFFF6F6F6FFF6F6F6FFF7F7F7FFF7F7F7FFF8F8F8FFF8F8F8FFF8F8
          F8FFF9F9F9FFF9F9F9FFF9F9F9FFF2F2F2FFE6E6E6FFC4C4C4FFB2B2B2FFB5B5
          B5FFB7B7B7FFA9A7A5FF69615ACE040404350202021801010108000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001010108020202180303032E97918EF4B3B2B1FFBABABAFFB6B6B6FFB3B3
          B3FFBCBCBCFFD6D6D6FFE8E8E8FFEFEFEFFFF5F5F5FFF9F9F9FFFAFAFAFFF6F6
          F6FFF1F1F1FFEAEAEAFFDADADAFFBCBCBCFFB3B3B3FFB6B6B6FFBABABAFFB1B1
          AFFF96908BF60505054203030327010101100101010800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001010108010101100202021F0303032E98948FF3B3B1B0FFBCBC
          BCFFBCBCBCFFB8B8B8FFB5B5B5FFB2B2B2FFB0B0B0FFAFAFAFFFAFAFAFFFB0B0
          B0FFB2B2B2FFB5B5B5FFB8B8B8FFBCBCBCFFBCBCBCFFB0AFADFF96908CF50505
          0542030303270202021801010108000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000010101080101011002020218030303275A54
          4EA4A09B96F6B4B2B0FFBABAB9FFC0C0C0FFC2C2C2FFC4C4C4FFC4C4C4FFC2C2
          C2FFC0C0C0FFBABAB9FFB2B0AEFF9F9A96F758524CAC04040435030303270202
          0218010101080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000001010108010101080101
          0110020202180202021F030303270303032E0404043504040435040404350404
          0435040404350303032E030303270202021F0202021801010110010101080000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000101010801010108010101080101010801010110010101100101
          0108010101080101010801010108010101080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object dxBarPopupMenu: TdxRibbonPopupMenu
    BarManager = dxBarManager
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        BeginGroup = True
        Visible = True
      end
      item
        Visible = True
      end
      item
        ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
        Visible = True
        ItemName = 'bbCut'
      end
      item
        ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
        Visible = True
        ItemName = 'bbCopy'
      end
      item
        Visible = True
        ItemName = 'bbPaste'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'bbFont'
      end
      item
        ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
        Visible = True
        ItemName = 'bbBullets'
      end>
    UseOwnFont = False
    Ribbon = Ribbon
    Left = 856
    Top = 40
  end
  object MiniToolbar: TdxRibbonMiniToolbar
    ItemLinks = <
      item
        Visible = True
        ItemName = 'beFontName'
      end
      item
        ViewLevels = [ivlSmallIcon]
        Visible = True
        ItemName = 'beFontSize'
      end
      item
        Visible = True
        ItemName = 'bbBold'
      end
      item
        Visible = True
        ItemName = 'bbItalic'
      end
      item
        Visible = True
        ItemName = 'bbAlignCenter'
      end
      item
        Visible = True
        ItemName = 'bbFontColor'
      end
      item
        Visible = True
        ItemName = 'bbBullets'
      end>
    Ribbon = Ribbon
    Left = 600
    Top = 8
  end
  object UndoDropDownGallery: TdxRibbonDropDownGallery
    BarManager = dxBarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'bsSelectionInfo'
      end>
    ItemOptions.ShowShortCuts = True
    ItemOptions.Size = misLarge
    UseOwnFont = False
    OnPopup = UndoDropDownGalleryPopup
    Ribbon = Ribbon
    GalleryItem = rgiUndo
    Left = 568
    Top = 8
  end
end
