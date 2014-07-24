unit jktPrograma1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxSkinsdxBarPainter,
  cxFontNameComboBox, cxDropDownEdit,  Vcl.ActnList, dxBarExtItems,
  dxRibbonGallery, dxBar, dxSkinChooserGallery, cxBarEditItem, Vcl.ImgList,
  cxClasses, dxRibbon, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, jktCNMet0008, kbmMemTable, jktCNMet0012,
  cxContainer, cxTextEdit, cxDBEdit, cxLabel, cxGroupBox, jktCNMet0002, jktCNMet0001,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, cxCheckBox,
  jktCNMet0005, jktFNSeg0001, jktCNMet0030, jktCNMet0011, Vcl.StdCtrls,
  Vcl.Menus;

type
  TForm2 = class(TForm)
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    cxLargeImages: TcxImageList;
    cxSmallImages: TcxImageList;
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
    dxbVentanas: TdxBar;
    dxbGrillas: TdxBar;
    bbCursorLine: TdxBarButton;
    bbCursorColumn: TdxBarButton;
    bbLocked: TdxBarButton;
    bbModified: TdxBarButton;
    beFontName: TcxBarEditItem;
    beFontSize: TcxBarEditItem;
    scgiLookAndFeel: TdxSkinChooserGalleryItem;
    bbNew: TdxBarLargeButton;
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
    bbTabbedView: TdxBarLargeButton;
    alActions: TActionList;
    acNew: TAction;
    acExit: TAction;
    acOpen: TAction;
    acSave: TAction;
    acSaveAs: TAction;
    acCut: TAction;
    acCopy: TAction;
    acPaste: TAction;
    acClose: TAction;
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
    acImport: TAction;
    acExport: TAction;
    acQATAboveRibbon: TAction;
    acQATBelowRibbon: TAction;
    Driver: TjktDriver;
    mtTipoCtaProv: TjktMemTable;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    DataSource: TDataSource;
    mtTipoCtaProvoid: TIntegerField;
    gbCliente: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    txtOid: TcxDBTextEdit;
    txtDescripcion: TcxDBTextEdit;
    txtCodigo: TcxDBTextEdit;
    bbAnt: TdxBarButton;
    bbSig: TdxBarButton;
    mtTipoCtaProvCodigo: TStringField;
    mtTipoCtaProvdescripcion: TStringField;
    mtTipoCtaProvValidar: TBooleanField;
    mtTipoCtaProvActivo: TBooleanField;
    IdHTTP: TIdHTTP;
    jktExpDBGrid1DBTableView1Oid: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Codigo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Descripcion: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Validar: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    OperTraer: TjktOperacion;
    service: TjktServiceCaller;
    jktValidadorForm1: TjktValidadorForm;
    PopupMenu1: TPopupMenu;
    jktOperacion1: TjktOperacion;
    jktExpDBGrid1DBTableView1Column1: TcxGridDBColumn;
    mtTipoCtaProvprueba: TIntegerField;
    cxDBTextEdit1: TcxDBTextEdit;
    jktValidador1: TjktValidador;
    procedure acNewExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbAntClick(Sender: TObject);
    procedure bbSigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.acCloseExecute(Sender: TObject);
begin
  Driver.Cancelar;
end;

procedure TForm2.acFindExecute(Sender: TObject);
begin
   Driver.Filtrar;
end;

procedure TForm2.acNewExecute(Sender: TObject);
var x:integer;
begin
  if (Driver.TipoPrograma = tpABM) then
    Driver.New;




end;

procedure TForm2.acPrintExecute(Sender: TObject);
begin
  //
end;

procedure TForm2.acSaveExecute(Sender: TObject);
begin
  Driver.Guardar;
end;

procedure TForm2.bbAntClick(Sender: TObject);
begin
  Driver.Anterior;
end;

procedure TForm2.bbSigClick(Sender: TObject);
begin
  Driver.Proximo;
end;


procedure TForm2.FormShow(Sender: TObject);
begin
  Driver.Inicio;

  if Login = nil then begin
    FPampaSG0005 := TFPampaSG0005.create(Application);

    if (not FPampaSG0005.AutoLogin) then
      FPampaSG0005.showModal;

    if FPampaSG0005.OK = False then
      Application.Terminate
    else begin
      service.Host             := Login.Host;
      service.Port             := Login.Port;
      service.Servlet          := Login.Servlet;
      service.Aplicacion       := Login.Aplicacion;
      service.Protocolo        := Login.Protocolo;
    end;

    FPampaSG0005.Free;
  end;
  jktValidadorForm1.inicializar;
end;

end.
