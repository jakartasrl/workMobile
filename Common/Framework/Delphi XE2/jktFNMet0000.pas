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
  cxPC, dxSkinscxPCPainter, cxPCdxBarPopupMenu, dxTabbedMDI, jktFNMet0001,
  Vcl.DBActns;

type
  TfrmMainForm = class(TdxRibbonForm)
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
    acCancel: TAction;
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
    BarManager: TdxBarManager;
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
    bbCancel: TdxBarLargeButton;
    acDataSetPrior: TDataSetPrior;
    acDataSetNext: TDataSetNext;
    bbAnterior: TdxBarLargeButton;
    bbSiguiente: TdxBarLargeButton;
    dxbtnDayView: TdxBarButton;
    dxbtnWorkWeek: TdxBarButton;
    dxbtnWeekView: TdxBarButton;
    dxbtnMonthView: TdxBarButton;
    dxbtnTimeGridView: TdxBarButton;
    dxbtnYearView: TdxBarButton;
    dxbtnGanttView: TdxBarButton;
    dxbtnCurrentView: TdxBarSubItem;
    dxbtnControlBox: TdxBarButton;
    dxbtnNavigator: TdxBarButton;
    dxbViewOptions: TdxBar;
    RibbonTab4: TdxRibbonTab;
    bbMenuPrincipal: TdxBarLargeButton;
    bbFindRemoved: TdxBarLargeButton;
    acFindRemoved: TAction;
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
    procedure acCancelExecute(Sender: TObject);
    procedure acSelectAllExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure acDataSetPriorExecute(Sender: TObject);
    procedure acDataSetNextExecute(Sender: TObject);
    procedure acViewTypeExecute(Sender: TObject);
    procedure dxbtnControlBoxClick(Sender: TObject);
    procedure dxbtnNavigatorClick(Sender: TObject);
    procedure bbMenuPrincipalClick(Sender: TObject);
    procedure acFindRemovedExecute(Sender: TObject);
  private
    FMenuPrincipal: TForm;
    function CreateChildForm: TfrmChild;
    function CreateNewChild: TfrmChild;
    function GetActiveChild: TfrmChild;

    procedure UpdateControls;
    procedure ActivateChildHandler(Sender: TObject);
    procedure UpdateStatusBar;
    procedure SetColorScheme(const AName: string);

  public
    property MenuPrincipal: TForm read FMenuPrincipal write FMenuPrincipal;
    property ActiveChild: TfrmChild read GetActiveChild;

  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}


procedure TfrmMainForm.acCancelExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.Cancelar;
end;

procedure TfrmMainForm.acCopyExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acCutExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acDataSetNextExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.Proximo;
end;

procedure TfrmMainForm.acDataSetPriorExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.Anterior;
end;

procedure TfrmMainForm.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainForm.acFindExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.Filtrar;
end;

procedure TfrmMainForm.acFindRemovedExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acNewExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.New;

{
  CreateNewChild;

  UpdateStatusBar;
}
end;

procedure TfrmMainForm.acOpenExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acPasteExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acPrintExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.acQATBelowRibbonExecute(Sender: TObject);
begin
  if TdxBarButton(Sender).Tag <> 0 then
    Ribbon.QuickAccessToolbar.Position := qtpBelowRibbon
  else
    Ribbon.QuickAccessToolbar.Position := qtpAboveRibbon;
end;

procedure TfrmMainForm.acSaveExecute(Sender: TObject);
begin
  if ActiveChild <> nil then
    ActiveChild.Driver.Guardar;
end;

procedure TfrmMainForm.acSelectAllExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMainForm.ActivateChildHandler(Sender: TObject);
begin
  if Sender = ActiveMDIChild then
    UpdateControls;
end;

procedure TfrmMainForm.bbApplicationButtonClick(Sender: TObject);
begin
  Ribbon.ApplicationButton.Visible := bbApplicationButton.Down;
end;

procedure TfrmMainForm.bbMenuPrincipalClick(Sender: TObject);
begin
  if FMenuPrincipal = nil then
    raise Exception.Create('Debe asignar un Menu Principal (Form) a la property ''MenuPrincipal''');

  // Oculto el frmMainForm y muestro el Menu Principal
  Self.Hide;

  FMenuPrincipal.Show;
end;

procedure TfrmMainForm.bbQATVisibleClick(Sender: TObject);
begin
  Ribbon.QuickAccessToolbar.Visible := bbQATVisible.Down;
end;

procedure TfrmMainForm.bbRibbonFormClick(Sender: TObject);
begin
  Ribbon.SupportNonClientDrawing := bbRibbonForm.Down;
end;

procedure TfrmMainForm.bbTabbedViewClick(Sender: TObject);
begin
  dxTabbedMDIManager.Active := bbTabbedView.Down;
end;

function TfrmMainForm.CreateChildForm: TfrmChild;
begin
  Result := TfrmChild.Create(Self);
  Result.Caption := 'Child ' + IntToStr(MDIChildCount);
end;

function TfrmMainForm.CreateNewChild: TfrmChild;
begin
  Result := CreateChildForm;
  Result.OnActivateChild := ActivateChildHandler;
  Result.OnChanged := nil;
end;

procedure TfrmMainForm.dxbtnControlBoxClick(Sender: TObject);
begin
{
  if (ActiveChild <> nil) and Assigned(ActiveChild.Driver.Scheduler) then
    ActiveChild.Driver.Scheduler.ControlBox.Visible := dxbtnControlBox.Down;
}
end;

procedure TfrmMainForm.dxbtnNavigatorClick(Sender: TObject);
begin
{
  if (ActiveChild <> nil) and Assigned(ActiveChild.Driver.Scheduler) then
    ActiveChild.Driver.Scheduler.DateNavigator.Visible := dxbtnNavigator.Down;
}
end;

procedure TfrmMainForm.acViewTypeExecute(Sender: TObject);
var
  ADate: TDateTime;
begin
{
  if (ActiveChild <> nil) and Assigned(ActiveChild.Driver.Scheduler) then begin

    ADate := Trunc(ActiveChild.Driver.Scheduler.SelStart);

    case TdxBarButton(Sender).Tag of
      0:
        ActiveChild.Driver.Scheduler.GoToDate(ADate, vmDay);
      1:
        ActiveChild.Driver.Scheduler.GoToDate(ADate, vmWorkWeek);
      2:
        ActiveChild.Driver.Scheduler.GoToDate(ADate, vmWeek);
      3:
        ActiveChild.Driver.Scheduler.GoToDate(ADate, vmMonth);
      4:
        begin
          ActiveChild.Driver.Scheduler.SelectedDays.Clear;
          ActiveChild.Driver.Scheduler.SelectedDays.Add(ADate);
          ActiveChild.Driver.Scheduler.ViewTimeGrid.Active := True;
        end;
      5:
        ActiveChild.Driver.Scheduler.ViewYear.Active := True;
      6:
        ActiveChild.Driver.Scheduler.ViewGantt.Active := True;
    end;

  end;
}
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  Self.RibbonAlwaysOnTop := True;
end;

function TfrmMainForm.GetActiveChild: TfrmChild;
begin
  if ActiveMDIChild <> nil then
    Result := ActiveMDIChild as TfrmChild
  else
    Result := nil;
end;

procedure TfrmMainForm.scgiLookAndFeelSkinChanged(Sender: TObject; const ASkinName: string);
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

procedure TfrmMainForm.SetColorScheme(const AName: string);
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

procedure TfrmMainForm.UpdateControls;
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
  acCancel.Enabled := acCopy.Enabled and ActiveChild.CanEdit;

{

  if (ActiveChild <> nil) and (ActiveChild.Driver.TipoPrograma = tp_abmListaConFiltro) then
    Ribbon.Contexts[0].Activate(False)
  else
    Ribbon.Contexts[0].Visible := False;

}
end;

procedure TfrmMainForm.UpdateStatusBar;
var
  Texto: string;
  ProgramasAbiertos: Integer;
begin
  ProgramasAbiertos := MDIChildCount;

  if ProgramasAbiertos = 0 then
    Texto := 'Ningún programa abierto'
  else if ProgramasAbiertos = 1 then
    Texto := '1 programa abierto'
  else
    Texto := IntToStr(ProgramasAbiertos) + ' programas abiertos';

  RibbonStatusBar.Panels[0].Text := Texto;
end;

end.
