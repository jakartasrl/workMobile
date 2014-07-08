unit jktFNProg0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0002, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, dxBar,
  cxClasses, jktCNMet0030, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  jktCNMet0008, kbmMemTable, jktCNMet0012, cxButtonEdit, dxLayoutLookAndFeels,
  dxLayoutControlAdapters, Vcl.StdCtrls, cxRadioGroup, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxCheckBox, cxMemo,
  cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView, Vcl.ImgList,
  cxCurrencyEdit, cxCheckGroup, Vcl.Menus, cxButtons, kbmMemBinaryStreamFormat,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerTreeListBrowser, dxSkinscxSchedulerPainter, cxPCdxBarPopupMenu,
  cxGroupBox, cxLabel, cxPC, cxSchedulercxGridConnection, cxImageComboBox,
  cxColorComboBox, cxProgressBar, ShellApi;

type
  TFNProg0001 = class(TfrmChild)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lcMainGroup1: TdxLayoutGroup;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcMainItem4: TdxLayoutItem;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    lcMainGroup7: TdxLayoutGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    lcMainItem6: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    lcMainItem7: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    lcMainItem8: TdxLayoutItem;
    cxDBTextEdit8: TcxDBTextEdit;
    lcMainItem9: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    lcMainItem10: TdxLayoutItem;
    jktExpDBGrid2DBTableView1: TcxGridDBTableView;
    jktExpDBGrid2Level1: TcxGridLevel;
    jktExpDBGrid2: TjktExpDBGrid;
    lcMainItem11: TdxLayoutItem;
    lcMainGroup11: TdxLayoutGroup;
    jktExpDBGrid3DBTableView1: TcxGridDBTableView;
    jktExpDBGrid3Level1: TcxGridLevel;
    jktExpDBGrid3: TjktExpDBGrid;
    lcMainItem5: TdxLayoutItem;
    TCondicionesFacturacion: TjktMemTable;
    TCondicionesFacturacionConcepto: TStringField;
    TCondicionesFacturacionImporte: TFloatField;
    TCondicionesFacturacionMoneda: TStringField;
    TCondicionesFacturacionFormaPago: TStringField;
    dsCondicionesFacturacion: TDataSource;
    jktExpDBGrid3DBTableView1Concepto: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1Importe: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1Moneda: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1FormaPago: TcxGridDBColumn;
    cxDBButtonEdit1: TcxDBButtonEdit;
    lcMainItem12: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    TContactosComerciales: TjktMemTable;
    dsContactosComerciales: TDataSource;
    dsContactosTecnicos: TDataSource;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    TContactosComercialesNombreApellido: TStringField;
    TContactosComercialesTelefono: TStringField;
    TContactosComercialesEmail2: TStringField;
    jktExpDBGrid1DBTableView1NombreApellido: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Telefono: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Email: TcxGridDBColumn;
    TContactosTecnicos: TjktMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    jktExpDBGrid2DBTableView1NombreApellido: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1Telefono: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1Email: TcxGridDBColumn;
    cxRadioButton1: TcxRadioButton;
    lcMainItem15: TdxLayoutItem;
    cxRadioButton2: TcxRadioButton;
    lcMainItem16: TdxLayoutItem;
    lcMainGroup10: TdxLayoutGroup;
    lcMainGroup14: TdxLayoutGroup;
    lcMainGroup15: TdxLayoutGroup;
    cxRadioButton3: TcxRadioButton;
    lcMainItem13: TdxLayoutItem;
    cxRadioButton4: TcxRadioButton;
    lcMainItem14: TdxLayoutItem;
    cxRadioButton5: TcxRadioButton;
    lcMainItem17: TdxLayoutItem;
    cxRadioButton6: TcxRadioButton;
    lcMainItem18: TdxLayoutItem;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    cxDBButtonEdit2: TcxDBButtonEdit;
    lcMainItem1: TdxLayoutItem;
    jktExpDBGrid4DBTableView1: TcxGridDBTableView;
    jktExpDBGrid4Level1: TcxGridLevel;
    jktExpDBGrid4: TjktExpDBGrid;
    lcMainItem19: TdxLayoutItem;
    TPolizasSeguros: TjktMemTable;
    dsPolizasSeguros: TDataSource;
    TPolizasSegurosCompania: TStringField;
    TPolizasSegurosTipoPoliza: TStringField;
    TPolizasSegurosMonto: TFloatField;
    TPolizasSegurosVencimiento: TDateField;
    TPolizasSegurosContactos: TStringField;
    jktExpDBGrid4DBTableView1Compania: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1TipoPoliza: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1Monto: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1Vencimiento: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1Contactos: TcxGridDBColumn;
    lcMainGroup16: TdxLayoutGroup;
    jktExpDBGrid5DBTableView1: TcxGridDBTableView;
    jktExpDBGrid5Level1: TcxGridLevel;
    jktExpDBGrid5: TjktExpDBGrid;
    lcMainItem20: TdxLayoutItem;
    TArchivosAsociados: TjktMemTable;
    dsArchivosAsociados: TDataSource;
    TArchivosAsociadosFechaSubida: TDateTimeField;
    TArchivosAsociadosComentario: TStringField;
    TArchivosAsociadosArchivo: TStringField;
    jktExpDBGrid5DBTableView1FechaSubida: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Comentario: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Archivo: TcxGridDBColumn;
    OpenDialog: TOpenDialog;
    lcMainGroupLaboratorio: TdxLayoutGroup;
    lcMainGroupService: TdxLayoutGroup;
    cxDBTreeList1: TcxDBTreeList;
    lcMainItem21: TdxLayoutItem;
    dsItemsLaboratorio: TDataSource;
    TItemsLaboratorio: TjktMemTable;
    TItemsLaboratorioCodItem: TIntegerField;
    TItemsLaboratorioEnsayo: TIntegerField;
    TItemsLaboratorioDescripcion: TStringField;
    TItemsLaboratorioTomaMuestra: TBooleanField;
    TItemsLaboratorioCantidad: TIntegerField;
    TItemsLaboratorioPrecio: TFloatField;
    TItemsLaboratorioMoneda: TStringField;
    cxDBTreeList1CodItem: TcxDBTreeListColumn;
    cxDBTreeList1Ensayo: TcxDBTreeListColumn;
    cxDBTreeList1Descripcion: TcxDBTreeListColumn;
    cxDBTreeList1TomaMuestra: TcxDBTreeListColumn;
    cxDBTreeList1Cantidad: TcxDBTreeListColumn;
    cxDBTreeList1Moneda: TcxDBTreeListColumn;
    cxDBTreeList1PrecioUnit: TcxDBTreeListColumn;
    TItemsLaboratorioCodItemPadre: TIntegerField;
    TItemsLaboratorioPrecioTotal: TFloatField;
    cxDBTreeList1PrecioTotal: TcxDBTreeListColumn;
    TItemsLaboratorioNotas: TStringField;
    cxDBTreeList1Notas: TcxDBTreeListColumn;
    TItemsService: TjktMemTable;
    TItemsServiceNroItem: TIntegerField;
    TItemsServiceCodigo: TIntegerField;
    TItemsServiceDescripcion: TStringField;
    TItemsServicePrecio: TFloatField;
    TItemsServiceMoneda: TStringField;
    TItemsServiceDetalle: TMemoField;
    dsItemsService: TDataSource;
    Images: TcxImageList;
    cxGridService: TcxGrid;
    DBLayoutView: TcxGridDBLayoutView;
    DBLayoutViewNroItem: TcxGridDBLayoutViewItem;
    DBLayoutViewCodigo: TcxGridDBLayoutViewItem;
    DBLayoutViewDescripcion: TcxGridDBLayoutViewItem;
    DBLayoutViewPrecio: TcxGridDBLayoutViewItem;
    DBLayoutViewMoneda: TcxGridDBLayoutViewItem;
    DBLayoutViewDetalle: TcxGridDBLayoutViewItem;
    dxLayoutGroup1: TdxLayoutGroup;
    DBLayoutViewGroup3: TdxLayoutGroup;
    cxGridLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewLayoutItem2: TcxGridLayoutItem;
    DBLayoutViewLayoutItem3: TcxGridLayoutItem;
    DBLayoutViewLayoutItem4: TcxGridLayoutItem;
    DBLayoutViewLayoutItem5: TcxGridLayoutItem;
    DBLayoutViewLayoutItem6: TcxGridLayoutItem;
    DBLayoutViewGroup2: TdxLayoutGroup;
    DBLayoutViewGroup4: TdxLayoutGroup;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGridServiceLevel1: TcxGridLevel;
    lcMainItem22: TdxLayoutItem;
    TArchivosAsociadosUsuario: TStringField;
    jktExpDBGrid5DBTableView1Usuario: TcxGridDBColumn;
    DBLayoutViewLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewFechaEntrega: TcxGridDBLayoutViewItem;
    DBLayoutViewLayoutItem7: TcxGridLayoutItem;
    DBLayoutViewPlazoEntrega: TcxGridDBLayoutViewItem;
    DBLayoutViewLayoutItem8: TcxGridLayoutItem;
    DBLayoutViewAPartirDe: TcxGridDBLayoutViewItem;
    TItemsServiceFechaEntrega: TDateTimeField;
    TItemsServicePlazoEntrega: TIntegerField;
    TItemsServiceAPartirDe: TStringField;
    DBLayoutViewSeparatorItem1: TdxLayoutSeparatorItem;
    DBLayoutViewGroup1: TdxLayoutGroup;
    DBLayoutViewGroup5: TdxLayoutGroup;
    cxComboBox1: TcxComboBox;
    lcMainItem23: TdxLayoutItem;
    lcMainGroup12: TdxLayoutGroup;
    lcMainGroup17: TdxLayoutGroup;
    lcMainGroup18: TdxLayoutGroup;
    lcMainGroup19: TdxLayoutGroup;
    lcMainGroup20: TdxLayoutGroup;
    lcMainLabeledItem1: TdxLayoutLabeledItem;
    lcMainGroup21: TdxLayoutGroup;
    DBLayoutViewSeparatorItem2: TdxLayoutSeparatorItem;
    jktExpDBGrid6DBTableView1: TcxGridDBTableView;
    jktExpDBGrid6Level1: TcxGridLevel;
    jktExpDBGrid6: TjktExpDBGrid;
    lcMainItem24: TdxLayoutItem;
    TTareasTaller: TjktMemTable;
    TTareasService: TjktMemTable;
    TTareasLaboQuimico: TjktMemTable;
    dsTareasTaller: TDataSource;
    dsTareasService: TDataSource;
    dsTareasLaboQuimico: TDataSource;
    TTareasTallerDescripcion: TStringField;
    kbmBSF: TkbmBinaryStreamFormat;
    TTareasTallerCodTarea: TIntegerField;
    TTareasTallerComentario: TStringField;
    TTareasTallerIncluida: TBooleanField;
    jktExpDBGrid6DBTableView1Incluida: TcxGridDBColumn;
    jktExpDBGrid6DBTableView1CodTarea: TcxGridDBColumn;
    jktExpDBGrid6DBTableView1Descripcion: TcxGridDBColumn;
    jktExpDBGrid6DBTableView1Comentario: TcxGridDBColumn;
    jktExpDBGrid7: TjktExpDBGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    lcMainItem26: TdxLayoutItem;
    TTareasServiceIncluida: TBooleanField;
    TTareasServiceCodTarea: TIntegerField;
    TTareasServiceDescripcion: TStringField;
    TTareasServiceComentario: TStringField;
    lcMainItem25: TdxLayoutItem;
    jktExpDBGrid8: TjktExpDBGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TTareasLaboQuimicoIncluida: TBooleanField;
    TTareasLaboQuimicoCodTarea: TIntegerField;
    TTareasLaboQuimicoDescripcion: TStringField;
    TTareasLaboQuimicoComentario: TStringField;
    lcMainGroup22: TdxLayoutGroup;
    lcMainItem27: TdxLayoutItem;
    Scheduler: TcxScheduler;
    cxPageControl1: TcxPageControl;
    tbsGantt: TcxTabSheet;
    btnGanttExpandAll: TcxButton;
    btnGanttCollapseAll: TcxButton;
    cbxEventsStyle: TcxComboBox;
    cxLabel5: TcxLabel;
    cbxExpandButton: TcxCheckBox;
    cbxProgress: TcxCheckBox;
    cbxSnapGanttEvents: TcxCheckBox;
    cbxTreeBrowser: TcxCheckBox;
    lcMainItem28: TdxLayoutItem;
    Storage: TcxSchedulerStorage;
    SchedulerGrid: TjktExpDBGrid;
    jktExpDBGrid1TableView1: TcxGridTableView;
    cxGridLevel3: TcxGridLevel;
    cxSchedulerGridConnection1: TcxSchedulerGridConnection;
    jktExpDBGrid1TableView1cxGridColumn1: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn2: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn3: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn4: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn5: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn6: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn7: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn8: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn9: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn10: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn11: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn12: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn13: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn14: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn15: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn16: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn17: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn18: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn19: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn20: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn21: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn22: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn23: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn24: TcxGridColumn;
    jktExpDBGrid1TableView1cxGridColumn25: TcxGridColumn;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxComboBox2: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure TTareasTallerAfterOpen(DataSet: TDataSet);
    procedure TTareasServiceAfterOpen(DataSet: TDataSet);
    procedure TTareasTallerAfterPost(DataSet: TDataSet);
    procedure TTareasServiceAfterPost(DataSet: TDataSet);
    procedure TTareasLaboQuimicoAfterOpen(DataSet: TDataSet);
    procedure TTareasLaboQuimicoAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGanttCollapseAllClick(Sender: TObject);
    procedure cxComboBox2PropertiesChange(Sender: TObject);
    procedure cbxEventsStylePropertiesChange(Sender: TObject);
    procedure cbxExpandButtonClick(Sender: TObject);
    procedure cbxProgressClick(Sender: TObject);
    procedure cbxSnapGanttEventsClick(Sender: TObject);
    procedure cbxTreeBrowserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNProg0001: TFNProg0001;

implementation

{$R *.dfm}

procedure TFNProg0001.btnGanttCollapseAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  with Storage do
    for I := 0 to EventCount - 1 do
      if TcxButton(Sender).Tag = 0 then
        Events[I].TaskLinks.Expanded := False
      else
        Events[I].TaskLinks.Expanded := True;
end;

procedure TFNProg0001.cbxEventsStylePropertiesChange(Sender: TObject);
begin
  inherited;

  Scheduler.ViewGantt.EventsStyle := TcxSchedulerGanttViewEventStyle(TcxComboBox(Sender).ItemIndex);
end;

procedure TFNProg0001.cbxExpandButtonClick(Sender: TObject);
begin
  inherited;

  Scheduler.ViewGantt.ShowExpandButtons := TcxCheckBox(Sender).Checked;
end;

procedure TFNProg0001.cbxProgressClick(Sender: TObject);
begin
  inherited;

  Scheduler.ViewGantt.ShowTotalProgressLine := TcxCheckBox(Sender).Checked;
end;

procedure TFNProg0001.cbxSnapGanttEventsClick(Sender: TObject);
begin
  inherited;

  Scheduler.ViewGantt.SnapEventsToTimeSlots := TcxCheckBox(Sender).Checked;
end;

procedure TFNProg0001.cbxTreeBrowserClick(Sender: TObject);
begin
  inherited;

  Scheduler.ViewGantt.TreeBrowser.Visible := cbxTreeBrowser.Checked;
end;

procedure TFNProg0001.cxComboBox1PropertiesChange(Sender: TObject);
begin
  inherited;

  if TcxComboBox(Sender).ItemIndex = 0 then
    begin
      // Venta
      lcMainGroupService.Visible := True;
      lcMainGroupLaboratorio.Visible := False;

      lcMainGroupService.Caption := 'Venta';
    end
  else if TcxComboBox(Sender).ItemIndex = 1 then
    begin
      // Reparaciones
      lcMainGroupService.Visible := True;
      lcMainGroupLaboratorio.Visible := False;

      lcMainGroupService.Caption := 'Reparaciones';
    end
  else if TcxComboBox(Sender).ItemIndex = 2 then
    begin
      // Ensayos Laboratorio
      lcMainGroupService.Visible := False;
      lcMainGroupLaboratorio.Visible := True;
    end
  else if TcxComboBox(Sender).ItemIndex = 3 then
    begin
      // Service
      lcMainGroupService.Visible := True;
      lcMainGroupLaboratorio.Visible := False;

      lcMainGroupService.Caption := 'Service';
    end;
end;

procedure TFNProg0001.cxComboBox2PropertiesChange(Sender: TObject);
const
  AKind: array[0..2] of TcxSchedulerGroupingKind = (gkNone, gkByDate, gkByResource);
begin
  inherited;

  Scheduler.OptionsView.GroupingKind := AKind[TcxComboBox(Sender).ItemIndex];
end;

procedure TFNProg0001.FormClose(Sender: TObject; var Action: TCloseAction);
const
  FileName = 'AgendaPedido.dat';
begin
  inherited;

  // guardo los datos al archivo cuando se cierra la aplicacion
  Storage.SaveToFile(FileName);
end;

procedure TFNProg0001.FormShow(Sender: TObject);
const
  DlgMsg = 'No se encontraron los datos de la agenda!';
  FileName = 'AgendaPedido.dat';
begin
  inherited;

  if FileExists(FileName) then
    // cargo los datos desde el archivo cuando se abre el programa
    Storage.LoadFromFile(FileName)
  else
    ShowMessage(DlgMsg);
end;

procedure TFNProg0001.jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if AButtonIndex = 0 then begin
    if OpenDialog.Execute then
      TArchivosAsociadosArchivo.AsString := OpenDialog.FileName
  end else if AButtonIndex = 1 then begin
    // Abro el archivo
    if (TArchivosAsociados.FieldByName('Archivo').AsString <> '') then
      ShellExecute(Self.Handle, 'open',
        PChar(TArchivosAsociados.FieldByName('Archivo').AsString), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TFNProg0001.TTareasLaboQuimicoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TTareasLaboQuimico.LoadFromFileViaFormat('TareasLaboQuimico', kbmBSF);
end;

procedure TFNProg0001.TTareasLaboQuimicoAfterPost(DataSet: TDataSet);
begin
  inherited;
  TTareasLaboQuimico.SaveToFileViaFormat('TareasLaboQuimico', kbmBSF);
end;

procedure TFNProg0001.TTareasServiceAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TTareasService.LoadFromFileViaFormat('TareasService', kbmBSF);
end;

procedure TFNProg0001.TTareasServiceAfterPost(DataSet: TDataSet);
begin
  inherited;
  TTareasService.SaveToFileViaFormat('TareasService', kbmBSF);
end;

procedure TFNProg0001.TTareasTallerAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TTareasTaller.LoadFromFileViaFormat('TareasTaller', kbmBSF);
end;

procedure TFNProg0001.TTareasTallerAfterPost(DataSet: TDataSet);
begin
  inherited;
  TTareasTaller.SaveToFileViaFormat('TareasTaller', kbmBSF);
end;

end.
