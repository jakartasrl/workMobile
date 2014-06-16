unit jktFNMet0000;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxRibbonForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxStatusBar,
  dxRibbonStatusBar, cxClasses, dxRibbon, dxSkinsdxBarPainter, dxBar,
  dxBarApplicationMenu, dxRibbonBackstageView, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxRibbonMiniToolbar, Vcl.ImgList, cxFontNameComboBox,
  cxDropDownEdit, dxBarExtItems, dxRibbonGallery, dxSkinChooserGallery,
  cxBarEditItem, dxScreenTip, Vcl.ActnList, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxScrollBox, dxBevel, cxLabel, cxGroupBox, Vcl.ExtCtrls, dxSkinsForm,
  cxPC, dxSkinscxPCPainter, cxPCdxBarPopupMenu, dxTabbedMDI, jktFChild;

type
  TfrmRibbonMain = class(TdxRibbonForm) //
    Ribbon: TdxRibbon;
    RibbonStatusBar: TdxRibbonStatusBar;
    dxRibbonStatusBar1Container1: TdxStatusBarContainerControl;
    RibbonTab3: TdxRibbonTab;
    cxSmallImages: TcxImageList;
    cxLargeImages: TcxImageList;
    dxBarScreenTipRepository: TdxBarScreenTipRepository;
    stBold: TdxBarScreenTip;
    stItalic: TdxBarScreenTip;
    stNew: TdxBarScreenTip;
    stUnderline: TdxBarScreenTip;
    stBullets: TdxBarScreenTip;
    stFind: TdxBarScreenTip;
    stPaste: TdxBarScreenTip;
    stCut: TdxBarScreenTip;
    stReplace: TdxBarScreenTip;
    stCopy: TdxBarScreenTip;
    stAlignLeft: TdxBarScreenTip;
    stAlignRight: TdxBarScreenTip;
    stAlignCenter: TdxBarScreenTip;
    stAppMenu: TdxBarScreenTip;
    stOpen: TdxBarScreenTip;
    stPrint: TdxBarScreenTip;
    stBlue: TdxBarScreenTip;
    stBlack: TdxBarScreenTip;
    stSilver: TdxBarScreenTip;
    stRibbonForm: TdxBarScreenTip;
    stAppButton: TdxBarScreenTip;
    stQAT: TdxBarScreenTip;
    stQATBelow: TdxBarScreenTip;
    stQATAbove: TdxBarScreenTip;
    stFontDialog: TdxBarScreenTip;
    stHelpButton: TdxBarScreenTip;
    alActions: TActionList;
    acNew: TAction;
    acExit: TAction;
    acOpen: TAction;
    acSave: TAction;
    acSaveAs: TAction;
    acCut: TAction;
    acCopy: TAction;
    acPaste: TAction;
    acClear: TAction;
    acSelectAll: TAction;
    acPrint: TAction;
    acFont: TAction;
    acBold: TAction;
    acItalic: TAction;
    acUnderline: TAction;
    acAlignLeft: TAction;
    acAlignRight: TAction;
    acAlignCenter: TAction;
    acBullets: TAction;
    acFontColor: TAction;
    acFind: TAction;
    acReplace: TAction;
    acUndo: TAction;
    acRedo: TAction;
    acQATAboveRibbon: TAction;
    acQATBelowRibbon: TAction;
    dxBarManager: TdxBarManager;
    dxbFile: TdxBar;
    dxbQAT: TdxBar;
    dxbClipboard: TdxBar;
    dxbEditing: TdxBar;
    dxbParagraph: TdxBar;
    dxbFontAndColors: TdxBar;
    dxbStatusBarToolbar1: TdxBar;
    dxbStatusBarToolbar2: TdxBar;
    dxbStatusBarToolbar3: TdxBar;
    dxbSelectionTools: TdxBar;
    dxbRibbonOptions: TdxBar;
    dxbQATOptions: TdxBar;
    dxbColorScheme: TdxBar;
    dxBarManagerBar1: TdxBar;
    dxbContextMenuStyle: TdxBar;
    bbCursorLine: TdxBarButton;
    bbCursorColumn: TdxBarButton;
    bbLocked: TdxBarButton;
    bbModified: TdxBarButton;
    beFontName: TcxBarEditItem;
    beFontSize: TcxBarEditItem;
    scgiLookAndFeel: TdxSkinChooserGalleryItem;
    bbNew: TdxBarLargeButton;
    bbOpen: TdxBarLargeButton;
    bbSave: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bsSaveAs: TdxBarSubItem;
    dxBarSeparator1: TdxBarSeparator;
    bbSaveAsRTF: TdxBarLargeButton;
    bbSaveAsText: TdxBarLargeButton;
    bbTouchMode: TdxBarLargeButton;
    bbPaste: TdxBarLargeButton;
    bbCut: TdxBarLargeButton;
    bbCopy: TdxBarLargeButton;
    bbSelectAll: TdxBarLargeButton;
    bbFind: TdxBarLargeButton;
    bbReplace: TdxBarLargeButton;
    bbClear: TdxBarLargeButton;
    bbUndo: TdxBarLargeButton;
    rgiItemSymbol: TdxRibbonGalleryItem;
    dxRibbonGalleryItem1Group1: TdxRibbonGalleryGroup;
    dxRibbonGalleryItem1Group2: TdxRibbonGalleryGroup;
    dxRibbonGalleryItem1Group3: TdxRibbonGalleryGroup;
    dxRibbonGalleryItem1Group4: TdxRibbonGalleryGroup;
    bbBold: TdxBarLargeButton;
    bbItalic: TdxBarLargeButton;
    bbUnderline: TdxBarLargeButton;
    bbAlignLeft: TdxBarLargeButton;
    bbAlignCenter: TdxBarLargeButton;
    bbAlignRight: TdxBarLargeButton;
    bbBullets: TdxBarLargeButton;
    bbFontColor: TdxBarButton;
    rgiColorTheme: TdxRibbonGalleryItem;
    rgiFontColor: TdxRibbonGalleryItem;
    bccZoom: TdxBarControlContainerItem;
    bbOptions: TdxBarButton;
    bbExit: TdxBarButton;
    bbRibbonForm: TdxBarLargeButton;
    bbApplicationButton: TdxBarLargeButton;
    bbQATVisible: TdxBarLargeButton;
    bbQATAboveRibbon: TdxBarButton;
    bbQATBelowRibbon: TdxBarButton;
    bbFont: TdxBarButton;
    rgiUndo: TdxRibbonGalleryItem;
    bsSelectionInfo: TdxBarStatic;
    bsZoom: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    bbUndoAll: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    bbRadialMenu: TdxBarLargeButton;
    bbMiniToolbar: TdxBarLargeButton;
    bbAbout: TdxBarLargeButton;
    BackstageView: TdxRibbonBackstageView;
    bvtsOpen: TdxRibbonBackstageViewTabSheet;
    bvlSpacer1: TBevel;
    bvSpacer2: TBevel;
    bvSpacer7: TBevel;
    gbBackstageViewTabCaption: TcxGroupBox;
    bvSpacer4: TBevel;
    bvSpacer3: TBevel;
    lbbvTabCaption2010: TcxLabel;
    lbbvTabCaption2013: TcxLabel;
    gbLocationsMain: TcxGroupBox;
    gbLocationsPane: TcxGroupBox;
    bvSpacer5: TBevel;
    dxBevel1: TdxBevel;
    gbRecentPathsPane: TcxScrollBox;
    bvSpacer6: TBevel;
    gbRecentPathsPaneBottom: TcxGroupBox;
    gbRecentPathsPaneCurrentFolder: TcxGroupBox;
    lbCurrentFolder: TcxLabel;
    lbComputer: TcxLabel;
    gbRecentDocumentsPane: TcxScrollBox;
    bvSpacer8: TBevel;
    lbRecentDocuments: TcxLabel;
    bvtsSaveAs: TdxRibbonBackstageViewTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    bvtsAbout: TdxRibbonBackstageViewTabSheet;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    meAbout: TcxMemo;
    RibbonTab1: TdxRibbonTab;
    dxSkinController: TdxSkinController;
    dxTabbedMDIManager: TdxTabbedMDIManager;
    dxbVentanas: TdxBar;
    bbTabbedView: TdxBarLargeButton;
    RibbonTab2: TdxRibbonTab;
    dxbGrillas: TdxBar;
    procedure FormCreate(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure bbQATVisibleClick(Sender: TObject);
    procedure acQATBelowRibbonExecute(Sender: TObject);
    procedure bbRibbonFormClick(Sender: TObject);
    procedure bbApplicationButtonClick(Sender: TObject);
    procedure scgiLookAndFeelSkinChanged(Sender: TObject; const ASkinName: string);
    procedure bbTabbedViewClick(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acCutExecute(Sender: TObject);
    procedure acCopyExecute(Sender: TObject);
    procedure acPasteExecute(Sender: TObject);
    procedure acClearExecute(Sender: TObject);
    procedure acSelectAllExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
  private
    function CreateChildForm: TfrmChild;
    function CreateNewChild: TfrmChild;
    function GetActiveChild: TfrmChild;

    procedure UpdateControls;
    procedure ActivateChildHandler(Sender: TObject);
    procedure UpdateStatusBar;
    procedure SetColorScheme(const AName: string);

  public
    property ActiveChild: TfrmChild read GetActiveChild;

  end;

var
  frmRibbonMain: TfrmRibbonMain;

implementation

{$R *.dfm}

procedure TfrmRibbonMain.acClearExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acCopyExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acCutExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmRibbonMain.acFindExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acNewExecute(Sender: TObject);
begin
  CreateNewChild;

  UpdateStatusBar;
end;

procedure TfrmRibbonMain.acOpenExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acPasteExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acPrintExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acQATBelowRibbonExecute(Sender: TObject);
begin
  if TAction(Sender).Tag <> 0 then
    Ribbon.QuickAccessToolbar.Position := qtpBelowRibbon
  else
    Ribbon.QuickAccessToolbar.Position := qtpAboveRibbon;
end;

procedure TfrmRibbonMain.acSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.acSelectAllExecute(Sender: TObject);
begin
  //
end;

procedure TfrmRibbonMain.ActivateChildHandler(Sender: TObject);
begin
  if Sender = ActiveMDIChild then
    UpdateControls;
end;

procedure TfrmRibbonMain.bbApplicationButtonClick(Sender: TObject);
begin
  Ribbon.ApplicationButton.Visible := bbApplicationButton.Down;
end;

procedure TfrmRibbonMain.bbQATVisibleClick(Sender: TObject);
begin
  Ribbon.QuickAccessToolbar.Visible := bbQATVisible.Down;
end;

procedure TfrmRibbonMain.bbRibbonFormClick(Sender: TObject);
begin
  Ribbon.SupportNonClientDrawing := bbRibbonForm.Down;
end;

procedure TfrmRibbonMain.bbTabbedViewClick(Sender: TObject);
begin
  dxTabbedMDIManager.Active := bbTabbedView.Down;
end;

function TfrmRibbonMain.CreateChildForm: TfrmChild;
begin
  Result := TfrmChild.Create(Self);
  Result.Caption := 'Child ' + IntToStr(MDIChildCount);
end;

function TfrmRibbonMain.CreateNewChild: TfrmChild;
begin
  Result := CreateChildForm;
  Result.OnActivateChild := ActivateChildHandler;
  Result.OnChanged := nil;
end;

procedure TfrmRibbonMain.FormCreate(Sender: TObject);
begin
  Self.RibbonAlwaysOnTop := True;
end;

function TfrmRibbonMain.GetActiveChild: TfrmChild;
begin
  if ActiveMDIChild <> nil then
    Result := ActiveMDIChild as TfrmChild
  else
    Result := nil;
end;

procedure TfrmRibbonMain.scgiLookAndFeelSkinChanged(Sender: TObject; const ASkinName: string);
begin
{
  Leer bien el topic 'How to Apply Skins in the Application' del help de
  ExpressSkins Library...

  To apply a skin to the application interface, do the following:
    - To apply skins to an entire application, use the TdxSkinController component.
      It affects all forms and skinnable controls that reside on them. Alternatively,
      you can use the TcxLookAndFeelController component to apply skins only to
      skinnable controls.
    - To apply skins to all forms, use the TdxSkinController component.
    - To apply a skin to a specific control, use the control's LookAndFeel.SkinName
      property
}
  SetColorScheme(ASkinName);
end;

procedure TfrmRibbonMain.SetColorScheme(const AName: string);
begin
  scgiLookAndFeel.SelectedSkinName := AName;
  Ribbon.ColorSchemeName := AName;
//  UpdateColorSchemeRelatedControls;

  dxSkinController.BeginUpdate;
  try
    dxSkinController.SkinName := AName;
    dxSkinController.NativeStyle := cxLookAndFeelPaintersManager.GetPainter(AName) = nil;
  finally
    dxSkinController.EndUpdate;
  end;
end;

procedure TfrmRibbonMain.UpdateControls;
begin
  acNew.Enabled := ActiveChild <> nil;
  acOpen.Enabled := ActiveChild <> nil;
  acSave.Enabled := (ActiveChild <> nil) and ActiveChild.CanSave;
  acSaveAs.Enabled := ActiveChild <> nil;
  acPrint.Enabled := ActiveChild <> nil;

  acPaste.Enabled := (ActiveChild <> nil) and ActiveChild.CanPaste;
  acCopy.Enabled := (ActiveChild <> nil);
  acCut.Enabled := acCopy.Enabled and ActiveChild.CanEdit;
  acSelectAll.Enabled := ActiveChild <> nil;

  acFind.Enabled := ActiveChild <> nil;
  acClear.Enabled := acCopy.Enabled and ActiveChild.CanEdit;

  if (ActiveChild <> nil) and (ActiveChild.TipoABM = abmListaConFiltro) then
    Ribbon.Contexts[0].Activate(False)
  else
    Ribbon.Contexts[0].Visible := False;
end;

procedure TfrmRibbonMain.UpdateStatusBar;
begin
  RibbonStatusBar.Panels[0].Text := 'Ventanas abiertas = ' + IntToStr(MDIChildCount);
end;

end.
