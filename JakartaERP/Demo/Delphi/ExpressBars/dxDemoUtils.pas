unit dxDemoUtils;
{$I cxVer.inc}

interface

uses
  Windows, Classes, SysUtils, ShellAPI, Graphics, dxCore, cxClasses, dxBar,
  cxLookAndFeels, cxLookAndFeelPainters, dxNavBar, dxNavBarConsts, dxRibbon,
  dxSkinsForm, dxSkinsDefaultPainters, dxSkinsLookAndFeelPainter, dxSkinsStrs;

const
  sdxFirstSelectedSkinName = 'Office2013White';

  dxStartURL = 'http://www.devexpress.com/';
  dxDownloadURL = 'Downloads';
  dxSupportURL = 'Support/Center';
  dxProductsURL = 'Products/VCL/';
  dxMyDXURL = 'ClientCenter';
  dxMegaDemoProductIndex: Integer = -1;

  // Products features relative paths
  dxBarsPath = 'ExBars/Features.xml';
  dxRibbonPath = 'ExBars/Ribbon.xml';
  dxDockingPath = 'ExBars/DockingLib.xml';
  dxDBTreeViewPath = 'ExDBTree/Features.xml';
  dxFlowChartPath = 'ExFlowChart';
  dxGridPath = 'ExQuantumGrid/index.xml';
  dxLayoutControlPath = 'ExLayoutControl/whatsnewv2.xml';
  dxLocalizerPath = 'Subscription/WhatsNewBuild40/index.xml#autolist1';
  dxMasterViewPath = 'ExMasterView';
  dxNavBarPath = 'ExNavBar/WhatsNewV2.xml';
  dxOrgChartPath = 'ExOrgChart';
  dxPivotGridPath = 'ExPivotGrid/Features.xml';
  dxPrintingSystemPath = 'ExPrintingSystem/whatsnewv4.xml';
  dxSchedulerPath = 'ExScheduler/WhatsNewV3.xml';
  dxSkinsPath = 'ExSkins';
  dxSpellCheckerPath = 'ExSpellChecker/whatsnewv2.xml';
  dxSpreadSheetPath = 'ExSpreadSheet';
  dxTreeListPath = 'ExQuantumTreeList';
  dxVerticalGridPath = 'ExVerticalGrid';
  dxTileControlPath = 'ExTileControl';

  // Products names
  dxBarsProductName = 'ExpressBars';
  dxRibbonProductName = 'ExpressRibbon';
  dxDockingProductName = 'ExpressDocking';
  dxDBTreeViewProductName = 'ExpressDBTreeView';
  dxFlowChartProductName = 'ExpressFlowChart';
  dxGridProductName = 'ExpressQuantumGrid';
  dxLayoutControlProductName = 'ExpressLayoutControl';
  dxLocalizerProductName = 'ExpressLocalizer';
  dxMasterViewProductName = 'ExpressMasterView';
  dxNavBarProductName = 'ExpressNavBar';
  dxOrgChartProductName = 'ExpressOrgChart';
  dxPivotGridProductName = 'ExpressPivotGrid';
  dxPrintingSystemProductName = 'ExpressPrintingSystem';
  dxSchedulerProductName = 'ExpressScheduler';
  dxSkinsProductName = 'ExpressSkinsLibrary';
  dxSpellCheckerProductName = 'ExpressSpellChecker';
  dxSpreadSheetProductName = 'ExpressSpreadSheet';
  dxTreeListProductName = 'ExpressQuantumTreeList';
  dxVerticalGridProductName = 'ExpressVerticalGrid';
  dxTileControlProductName = 'ExpressTileControl';

  // Product indices
  dxBarsIndex =            0;
  dxRibbonIndex =          1;
  dxDockingIndex =         2;
  dxDBTreeViewIndex =      3;
  dxFlowChartIndex =       4;
  dxGridIndex =            5;
  dxLayoutControlIndex =   6;
  dxLocalizerIndex =       7;
  dxMasterViewIndex =      8;
  dxNavBarIndex =          9;
  dxOrgChartIndex =       10;
  dxPivotGridIndex =      11;
  dxPrintingSystemIndex = 12;
  dxSchedulerIndex =      13;
  dxSkinsIndex =          14;
  dxSpellCheckerIndex =   15;
  dxSpreadSheetIndex =    16;
  dxTreeListIndex =       17;
  dxVerticalGridIndex =   18;
  dxTileControlIndex =    19;
  dxLastProductIndex = dxTileControlIndex;

  dxProductNames: array [0..dxLastProductIndex] of string = (
    dxBarsProductName, dxRibbonProductName, dxDockingProductName, dxDBTreeViewProductName,
    dxFlowChartProductName, dxGridProductName, dxLayoutControlProductName,
    dxLocalizerProductName, dxMasterViewProductName, dxNavBarProductName,
    dxOrgChartProductName, dxPivotGridProductName, dxPrintingSystemProductName,
    dxSchedulerProductName, dxSkinsProductName, dxSpellCheckerProductName,
    dxSpreadSheetProductName, dxTreeListProductName, dxVerticalGridProductName,
    dxTileControlProductName);

  dxProductRelativeURLs: array [0..dxLastProductIndex] of string = (
    dxBarsPath, dxRibbonPath, dxDockingPath, dxDBTreeViewPath, dxFlowChartPath,
    dxGridPath, dxLayoutControlPath, dxLocalizerPath, dxMasterViewPath, dxNavBarPath,
    dxOrgChartPath, dxPivotGridPath, dxPrintingSystemPath, dxSchedulerPath, dxSkinsPath,
    dxSpellCheckerPath, dxSpreadSheetPath, dxTreeListPath, dxVerticalGridPath,
    dxTileControlPath);

const
  ThereIsNoMDACMessage =
    'Unable to execute this application. You do not have ' +
    'the most recent version of MDAC and Jet 4 installed. ' +
    'Please visit microsoft.com to obtain the most recent libraries.';

type
  dxSitePage = (spFeatures, spDownloads, spSupport, spStart, spProducts,
    spMyDX);
  TSupportedExportType = (exHTML, exXML, exExcel97, exExcel, exPDF, exText);
  TSupportedExportTypes = set of TSupportedExportType;
  TExportEvent = procedure(AExportType: TSupportedExportType) of object;

const
  SupportedExportNames: array [TSupportedExportType] of string = ('&HTML',
    '&XML', 'X&LS', 'XL&SX', '&PDF', '&Text');
  SupportedExportDescriptions: array [TSupportedExportType] of string =
    ('Web Page', 'XML File', 'Microsoft Excel 97-2003',
    'Microsoft Excel 2007 or later', 'Adobe Portable Document Format', 'Plain Text');
  SupportedExportImageNames: array [TSupportedExportType] of string =
    ('ExportToHTML', 'ExportToXML', 'ExportToXLS', 'ExportToXLSX',
    'ExportToPDF', 'ExportToText');
  SupportedExportHints: array [TSupportedExportType] of string =
    ('Export to HTML', 'Export to XML', 'Export to Excel 97-2003', 'Export to Excel 2007 or later',
    'Export to PDF', 'Export to Text');
  SupportedExportExtensions: array [TSupportedExportType] of string =
    ('.html', '.xml', '.xls', '.xlsx', '.pdf', '.txt');
  SupportedExportSaveDialogFilters: array [TSupportedExportType] of string =
   ('HTML Files (*.html)|*.html',
    'XML Files (*.xml)|*.xml',
    'Microsoft Excel 97-2003 Files (*.xls)|*.xls',
    'Microsoft Excel 2007 (or later) Files (*.xlsx)|*.xlsx',
    'PDF Documents (*.pdf)|*.pdf;',
    'Plain Text Files (*.txt)|*.txt');

function HasJet: Boolean;

procedure Browse(ASitePage: dxSitePage);
procedure CreateExportMenuItems(ABarManager: TdxBarManager; ABar: TdxBar;
  ASubItem: TdxBarSubItem; AExportMethod: TExportEvent;
  ASupportedExport: TSupportedExportTypes = [exHTML..exText]);
procedure CreateHelpMenuItems(ABarManager: TdxBarManager; ARibbon: TdxRibbon;
  ABar: TdxBar); overload;
procedure CreateHelpMenuItems(ABarManager: TdxBarManager;
  AHelpSubItem: TdxBarSubItem); overload;
procedure CreateSkinsMenuItems(ABarManager: TdxBarManager;
  AViewSubItem: TdxBarSubItem; ASkinController: TdxSkinController;
  ANavBar: TdxNavBar = nil); overload;
procedure CreateSkinsMenuItems(ABarManager: TdxBarManager; ABar: TdxBar;
  ASkinController: TdxSkinController; ARibbon: TdxRibbon); overload;
procedure CreateStylesEditorMenuItem(ASubItem: TdxBarSubItem);
procedure SetOnlyStandardStylesEditor(AValue: Boolean);
procedure SetNavBarStyle(ANavBar: TdxNavBar;
  ASkinController: TdxSkinController);

implementation

{$R *.res}

uses
  Registry, dxAboutDemo, dxSkinChooserGallery, dxGdiPlusClasses,
  cxSchedulerEditorFormManager;

const
  dxSkinMenuCategory = 3;

type

  { TdxBarMenuItemClickController }

  TdxBarMenuItemClickController = class
  protected
    procedure MenuItemClickHandler(Sender: TObject); virtual; abstract;
  end;

  { TdxHelpMenuClickController }

  TdxHelpMenuClickController = class(TdxBarMenuItemClickController)
  protected
    procedure MenuItemClickHandler(Sender: TObject); override;
  end;

  { TdxRibbonHelpMenuClickController }

  TdxRibbonHelpMenuClickController = class(TdxHelpMenuClickController)
  protected
    procedure RibbonHelpButtonHandler(ASender: TdxCustomRibbon);
  end;

  { TdxExportMenuItemClickController }

  TdxExportMenuItemClickController = class(TdxBarMenuItemClickController)
  private
    FOnExport: TExportEvent;
  protected
    procedure MenuItemClickHandler(Sender: TObject); override;
  end;

  { TdxSkinMenuController }

  TdxSkinMenuController = class(TdxBarMenuItemClickController)
  private
    FBarManager: TdxBarManager;
    FNavBar: TdxNavBar;
    FSkinChooser: TdxSkinChooserGalleryItem;
    FSkinController: TdxSkinController;
    procedure InternalBuildMenu(ALinks: TdxBarItemLinks);
  protected
    procedure MenuItemClickHandler(Sender: TObject); override;
    procedure SkinChooserClickHandler(Sender: TObject; const ASkinName: string);
    procedure UpdateStyle; virtual;
  public
    procedure BuildMenu(AViewSubItem: TdxBarSubItem);
  end;

  { TcxStyleEditorMenuController }

  TcxStyleEditorMenuController = class(TdxBarMenuItemClickController)
  private
    FItemLinks: TdxBarItemLinks;
    FOnlyStandardStyle: Boolean;
    FSubItem: TdxBarSubItem;
  protected
    procedure DownItem(AIndex: Integer);
    function GetItem(AIndex: Integer): TdxBarButton;
    procedure MenuItemClickHandler(Sender: TObject); override;
    procedure SetEnableForNonStandardStyles(AValue: Boolean);
    procedure SetOnlyStandardStyle(AValue: Boolean);
  public
    procedure BuildMenuEx;

    property Items[AIndex: Integer]: TdxBarButton read GetItem;
    property OnlyStandartStyle: Boolean read FOnlyStandardStyle write SetOnlyStandardStyle;
  end;

  { TdxRibbonSkinMenuController }

  TdxRibbonSkinMenuController = class(TdxSkinMenuController)
  private
    FRibbon: TdxRibbon;
  protected
    procedure UpdateStyle; override;
  public
    procedure BuildMenuEx(ABar: TdxBar);
  end;

var
  FExportMenuItemClickController: TdxExportMenuItemClickController;
  FSkinMenuController: TdxSkinMenuController;
  FStylesEditorMenuController: TcxStyleEditorMenuController;
  FRibbonSkinMenuController: TdxRibbonSkinMenuController;
  FHelpClickController: TdxHelpMenuClickController;
  FRibbonHelpClickController: TdxRibbonHelpMenuClickController;
  dxMegaDemoFeaturesItemCaption: string = '&Features';
  FSmartImage: TdxSmartImage;

function HasJet: Boolean;

  function GetMajorVersion(const ASt: string): Integer;
  var
    ANumbers: string;
    I: Integer;
  begin
    Result := 0;
    if ASt <> '' then
    begin
      ANumbers := '';
      I := 1;
      while (I <= Length(ASt)) and dxCharInSet(ASt[I], ['0' .. '9']) do
      begin
        ANumbers := ANumbers + ASt[I];
        Inc(I);
      end;
      if ANumbers <> '' then
        Result := StrToInt(ANumbers);
    end;
  end;

var
  ARegistry: TRegistry;
  AKeys: TStrings;
  I: Integer;
  AMajorVersion: Integer;
begin
  Result := False;
  ARegistry := TRegistry.Create;
  AKeys := TStringList.Create;
  try
    ARegistry.RootKey := HKEY_LOCAL_MACHINE;
    if ARegistry.OpenKeyReadOnly('\SOFTWARE\Microsoft\Jet') then
    begin
      ARegistry.GetKeyNames(AKeys);
      for I := 0 to AKeys.Count - 1 do
      begin
        AMajorVersion := GetMajorVersion(AKeys[I]);
        if (AMajorVersion >= 4) then
        begin
          Result := True;
          break;
        end;
      end;
    end;
  finally
    AKeys.Free;
    ARegistry.Free;
  end;
end;

procedure Browse(ASitePage: dxSitePage);
var
  AURL: string;
begin
  case ASitePage of
    spFeatures:
      AURL := dxStartURL + dxProductsURL + dxProductRelativeURLs[dxMegaDemoProductIndex];
    spDownloads:
      AURL := dxStartURL + dxDownloadURL;
    spSupport:
      AURL := dxStartURL + dxSupportURL;
    spStart:
      AURL := dxStartURL;
    spProducts:
      AURL := dxStartURL + dxProductsURL;
    spMyDX:
      AURL := dxStartURL + dxMyDXURL;
  end;
  ShellExecute(0, 'OPEN', PChar(AURL), nil, nil, SW_SHOW);
end;

function GetGlyphFromResource(const AGlyphName: string): TBitmap;
begin
  if FSmartImage = nil then
    FSmartImage := TdxSmartImage.Create;
  FSmartImage.LoadFromResource(HInstance, AGlyphName, 'PNG');
  Result := FSmartImage.GetAsBitmap;
end;

function AddButton(ABarManager: TdxBarManager; ASubItem: TdxBarSubItem;
  AController: TdxBarMenuItemClickController; ACaption: string; ATag: Integer;
  AHasSeparator: Boolean = False): TdxBarButton;
begin
  Result := ABarManager.AddButton;
  with Result do
  begin
    Caption := ACaption;
    OnClick := AController.MenuItemClickHandler;
    Tag := ATag;
  end;
  ASubItem.ItemLinks.Add(Result).BeginGroup := AHasSeparator;
end;

function AddLargeButton(AIemLinks: TdxBarItemLinks; ACaption: string;
  ATag: Integer; AGlyphName: string = ''; const ALargeGlyphName: string = '';
  const ADescripiton: string = ''; AHasSeparator: Boolean = False): TdxBarLargeButton;
begin
  Result := AIemLinks.BarManager.AddItem(TdxBarLargeButton) as TdxBarLargeButton;
  with Result do
  begin
    Caption := ACaption;
    Description := ADescripiton;
    if AGlyphName <> '' then
      Glyph := GetGlyphFromResource(AGlyphName);
    if ALargeGlyphName <> '' then
      LargeGlyph := GetGlyphFromResource(ALargeGlyphName);
    Tag := ATag;
  end;
  AIemLinks.Add(Result).BeginGroup := AHasSeparator;
end;

procedure CreateExportMenuItems(ABarManager: TdxBarManager; ABar: TdxBar;
  ASubItem: TdxBarSubItem; AExportMethod: TExportEvent; ASupportedExport: TSupportedExportTypes);
var
  I: TSupportedExportType;
  AButton: TdxBarLargeButton;
begin
  FExportMenuItemClickController := TdxExportMenuItemClickController.Create;
  FExportMenuItemClickController.FOnExport := AExportMethod;
  for I := Low(TSupportedExportType) to High(TSupportedExportType) do
    if I in ASupportedExport then
    begin
      AButton := AddLargeButton(ABar.ItemLinks, SupportedExportNames[I], Ord(I), SupportedExportImageNames[I] + '_16x16',
        SupportedExportImageNames[I] + '_32x32', SupportedExportDescriptions[I]);
      if ASubItem <> nil then
         ASubItem.ItemLinks.Add(AButton);
      AButton.OnClick := FExportMenuItemClickController.MenuItemClickHandler;
      AButton.Hint := SupportedExportHints[I];
    end;
end;

procedure CreateHelpMenuItems(ABarManager: TdxBarManager; ARibbon: TdxRibbon; ABar: TdxBar);
var
  AButton: TdxBarLargeButton;
begin
  FRibbonHelpClickController := TdxRibbonHelpMenuClickController.Create;
  ARibbon.OnHelpButtonClick := FRibbonHelpClickController.RibbonHelpButtonHandler;
  AButton := AddLargeButton(ABar.ItemLinks, dxProductNames[dxMegaDemoProductIndex] + ' ' +
    dxMegaDemoFeaturesItemCaption, 0, 'Feature_16x16', 'Feature_32x32');
  AButton.OnClick := FRibbonHelpClickController.MenuItemClickHandler;
  AButton := AddLargeButton(ABar.ItemLinks, '&About', 6, 'Index_16x16', 'Index_32x32');
  AButton.OnClick := FRibbonHelpClickController.MenuItemClickHandler;
end;

procedure CreateHelpMenuItems(ABarManager: TdxBarManager; AHelpSubItem: TdxBarSubItem);
begin
  FHelpClickController := TdxHelpMenuClickController.Create;
  AddButton(ABarManager, AHelpSubItem, FHelpClickController,
    dxProductNames[dxMegaDemoProductIndex] + ' ' + dxMegaDemoFeaturesItemCaption, 0);
  AddButton(ABarManager, AHelpSubItem, FHelpClickController,'&About', 6, True);
end;

procedure CreateSkinsMenuItems(ABarManager: TdxBarManager;
  AViewSubItem: TdxBarSubItem; ASkinController: TdxSkinController;
  ANavBar: TdxNavBar);
begin
  FSkinMenuController := TdxSkinMenuController.Create;
  FSkinMenuController.FSkinController := ASkinController;
  FSkinMenuController.FBarManager := ABarManager;
  FSkinMenuController.FNavBar := ANavBar;
  FSkinMenuController.BuildMenu(AViewSubItem);
end;

procedure CreateSkinsMenuItems(ABarManager: TdxBarManager; ABar: TdxBar;
  ASkinController: TdxSkinController; ARibbon: TdxRibbon);
begin
  FRibbonSkinMenuController := TdxRibbonSkinMenuController.Create;
  FRibbonSkinMenuController.FSkinController := ASkinController;
  FRibbonSkinMenuController.FBarManager := ABarManager;
  FRibbonSkinMenuController.FRibbon := ARibbon;
  FRibbonSkinMenuController.FNavBar := nil;
  FRibbonSkinMenuController.BuildMenuEx(ABar);
end;

procedure CreateStylesEditorMenuItem(ASubItem: TdxBarSubItem);
begin
  FStylesEditorMenuController := TcxStyleEditorMenuController.Create;
  FStylesEditorMenuController.FSubItem := ASubItem;
  FStylesEditorMenuController.FItemLinks := ASubItem.ItemLinks;
  FStylesEditorMenuController.BuildMenuEx;
end;

procedure SetOnlyStandardStylesEditor(AValue: Boolean);
begin
  FStylesEditorMenuController.OnlyStandartStyle := AValue;
end;

procedure SetNavBarStyle(ANavBar: TdxNavBar; ASkinController: TdxSkinController);
begin
  if ASkinController.NativeStyle then
    if IsWinVista then
      ANavBar.View := dxNavBarVistaExplorerBarView
    else
      ANavBar.View := dxNavBarXPExplorerBarView
    else if ASkinController.UseSkins then
      ANavBar.View := dxNavBarSkinExplorerBarView
    else
      case ASkinController.Kind of
        lfStandard, lfFlat:
          ANavBar.View := dxNavBarExplorerBarView;
        lfUltraFlat:
          ANavBar.View := dxNavBarUltraFlatExplorerView;
        lfOffice11:
          ANavBar.View := dxNavBarOffice11ExplorerBarView;
      end;
end;

procedure DestroyMenuItems;
begin
  FreeAndNil(FSkinMenuController);
  FreeAndNil(FRibbonSkinMenuController);
  FreeAndNil(FHelpClickController);
  FreeAndNil(FRibbonHelpClickController);
  FreeAndNil(FExportMenuItemClickController);
  FreeAndNil(FStylesEditorMenuController);
end;

{ TdxHelpMenuClickController }

procedure TdxHelpMenuClickController.MenuItemClickHandler(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0 .. 5:
      Browse(dxSitePage(TComponent(Sender).Tag));
    6:
      dxShowAboutForm;
  end;
end;

{ TdxRibbonHelpMenuClickController }

procedure TdxRibbonHelpMenuClickController.RibbonHelpButtonHandler
  (ASender: TdxCustomRibbon);
begin
  dxShowAboutForm;
end;

{ TdxExportMenuItemClickController }

procedure TdxExportMenuItemClickController.MenuItemClickHandler
  (Sender: TObject);
begin
  FOnExport(TSupportedExportType(TComponent(Sender).Tag));
end;

{ TdxSkinMenuController }

procedure TdxSkinMenuController.BuildMenu(AViewSubItem: TdxBarSubItem);
begin
  InternalBuildMenu(AViewSubItem.ItemLinks);
end;

procedure TdxSkinMenuController.MenuItemClickHandler(Sender: TObject);
begin
  // do nothing
end;

procedure TdxSkinMenuController.SkinChooserClickHandler(Sender: TObject; const ASkinName: string);
begin
  FSkinChooser.SelectedGroupItem.ApplyToRootLookAndFeel;
  UpdateStyle;
end;

procedure TdxSkinMenuController.UpdateStyle;
begin
  FSkinChooser.SelectedSkinName := RootLookAndFeel.Painter.LookAndFeelName;
  if FNavBar <> nil then
    SetNavBarStyle(FNavBar, FSkinController);
end;

procedure TdxSkinMenuController.InternalBuildMenu(ALinks: TdxBarItemLinks);
begin
  FSkinChooser := TdxSkinChooserGalleryItem(FBarManager.AddItem(TdxSkinChooserGalleryItem));
//  FSkinChooser.GalleryInMenuOptions.CollapsedInSubmenu := False;
  FSkinChooser.OnSkinChanged := SkinChooserClickHandler;
  FSkinChooser.Caption := 'Look And Feel';
  FSkinChooser.VisibleLookAndFeelStyles := [lfsFlat..lfsSkin];
  FSkinChooser.SelectedSkinName := sdxFirstSelectedSkinName;
  ALinks.Add(FSkinChooser);
end;

{ TcxStyleEditorMenuController }

procedure TcxStyleEditorMenuController.BuildMenuEx;
var
  I: Integer;
  AItem: TdxBarButton;
begin
  for I := 0 to (cxSchedulerEditorManager.Count - 1) do
  begin
    AItem := AddButton(FItemLinks.BarManager, FSubItem, Self,
      cxSchedulerEditorManager.Names[I], I, True);
    AItem.ButtonStyle := bsChecked;
  end;
  Items[0].Click;
  DownItem(0);
end;

procedure TcxStyleEditorMenuController.DownItem(AIndex: Integer);
var
  I: Integer;
begin
  if AIndex > (FItemLinks.Count - 1) then
    AIndex := 0;
  for I := 0 to (FItemLinks.Count - 1) do
    Items[I].Down := Items[I].Tag = AIndex;
end;

function TcxStyleEditorMenuController.GetItem(AIndex: Integer): TdxBarButton;
begin
  Result := TdxBarButton(FItemLinks.Items[AIndex].Item);
end;

procedure TcxStyleEditorMenuController.MenuItemClickHandler(Sender: TObject);
begin
  cxSchedulerEditorManager.ItemIndex := TdxBarButton(Sender).Tag;
  DownItem(TdxBarButton(Sender).Tag);
end;

procedure TcxStyleEditorMenuController.SetEnableForNonStandardStyles(AValue: Boolean);
var
  I: Integer;
begin
  if not AValue then
  begin
    DownItem(0);
    Items[0].Click;
  end;
  for I := 0 to (FItemLinks.Count - 1) do
    Items[I].Enabled := AValue or (Items[I].Tag = 0);
end;

procedure TcxStyleEditorMenuController.SetOnlyStandardStyle(AValue: Boolean);
begin
  if FOnlyStandardStyle <> AValue then
  begin
    FOnlyStandardStyle := AValue;
    SetEnableForNonStandardStyles(not AValue);
  end;
end;

{ TdxRibbonSkinMenuController }

procedure TdxRibbonSkinMenuController.BuildMenuEx(ABar: TdxBar);
begin
  InternalBuildMenu(ABar.ItemLinks);
end;

procedure TdxRibbonSkinMenuController.UpdateStyle;
begin
  inherited UpdateStyle;
  if RootLookAndFeel.Painter.LookAndFeelStyle = lfsSkin then
    FRibbon.ColorSchemeName := FSkinController.SkinName
  else
    FRibbon.ColorSchemeName := 'Blue';
end;

initialization

finalization
  DestroyMenuItems;
  FreeAndNil(FSmartImage);
end.
