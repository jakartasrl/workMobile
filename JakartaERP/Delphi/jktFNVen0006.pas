unit jktFNVen0006;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0011,
  Data.DB, kbmMemTable, jktCNMet0012, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxButtonEdit, cxDBLookupComboBox, cxMemo, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, jktCNMet0008, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  dxLayoutControl, dxLayoutLookAndFeels, jktCNMet0014;

type
  TFNVen0006 = class(TfrmChild)
    lcMain: TdxLayoutControl;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    cxDBButtonEdit3: TcxDBButtonEdit;
    cxGridItems: TcxGrid;
    DBLayoutView: TcxGridDBLayoutView;
    DBLayoutViewTipo: TcxGridDBLayoutViewItem;
    DBLayoutViewCodigo: TcxGridDBLayoutViewItem;
    DBLayoutViewDescripcion: TcxGridDBLayoutViewItem;
    DBLayoutViewCantidad: TcxGridDBLayoutViewItem;
    DBLayoutViewReferencia: TcxGridDBLayoutViewItem;
    DBLayoutViewItem1: TcxGridDBLayoutViewItem;
    DBLayoutViewDetalle: TcxGridDBLayoutViewItem;
    dxLayoutGroup1: TdxLayoutGroup;
    DBLayoutViewLayoutItem2: TcxGridLayoutItem;
    DBLayoutViewLayoutItem3: TcxGridLayoutItem;
    DBLayoutViewLayoutItem6: TcxGridLayoutItem;
    DBLayoutViewGroup2: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGridLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewLayoutItem4: TcxGridLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    DBLayoutViewLayoutItem5: TcxGridLayoutItem;
    DBLayoutViewGroup4: TdxLayoutGroup;
    DBLayoutViewLayoutItem7: TcxGridLayoutItem;
    DBLayoutViewGroup3: TdxLayoutGroup;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    DBLayoutViewGroup5: TdxLayoutGroup;
    cxGridItemsLevel1: TcxGridLevel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutGroupRoot: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lcMainItem7: TdxLayoutItem;
    lcMainItem12: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    lcMainItem3: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    lcMainGroup1: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    lcMainItem1: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    jktExpDBGrid3DBTableView1: TcxGridDBTableView;
    jktExpDBGrid3Level1: TcxGridLevel;
    jktExpDBGrid3: TjktExpDBGrid;
    lcMainItem8: TdxLayoutItem;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    lcMainSeparatorItem2: TdxLayoutSeparatorItem;
    cxDBButtonEdit1: TcxDBButtonEdit;
    lcMainItem9: TdxLayoutItem;
    Help: TjktHelpGenerico;
    hlpCotiz: TjktHelpGenerico;
    mtPresupuesto: TjktMemTable;
    mtPresupuestooid_presu: TIntegerField;
    mtPresupuestonro_cotiz: TStringField;
    mtPresupuestofecha: TDateTimeField;
    mtPresupuestooid_clie: TIntegerField;
    mtPresupuestocod_clie: TStringField;
    mtPresupuestoRazonSocial: TStringField;
    mtPresupuestooid_sucu: TIntegerField;
    mtPresupuestonro_sucu: TSmallintField;
    mtPresupuestodes_sucu: TStringField;
    mtPresupuestoreferencia: TStringField;
    mtPresupuestooid_cont_suc: TIntegerField;
    mtPresupuestooid_vend: TIntegerField;
    mtPresupuestocod_vend: TStringField;
    mtPresupuestodes_vend: TStringField;
    mtPresupuestooid_repre: TIntegerField;
    mtPresupuestocod_repre: TStringField;
    mtPresupuestodes_repre: TStringField;
    mtItems: TjktMemTable;
    mtItemsoid_item: TIntegerField;
    mtItemsoid_presu: TIntegerField;
    mtItemsoid_tipo: TIntegerField;
    mtItemsoid_art: TIntegerField;
    mtItemscod_art: TStringField;
    mtItemsdes_abrev_art: TStringField;
    mtItemscant: TFloatField;
    mtItemsreferencia: TStringField;
    mtItemsdetalle: TMemoField;
    mtPresupuestonro_presu: TStringField;
    mtItemsimporte: TFloatField;
    mtItemsoid_mon: TIntegerField;
    dsItems: TDataSource;
    dsPresupuesto: TDataSource;
    mtParametroInicialOutputDatasetName: TStringField;
    mtParametroInicialNroSolapa: TSmallintField;
    mtParametroInicialCodArtDes: TStringField;
    mtParametroInicialCodArtHas: TStringField;
    mtMonedas: TjktMemTable;
    mtMonedasoid: TIntegerField;
    mtMonedascodigo: TStringField;
    mtMonedasdescripcion: TStringField;
    opTraerEntidades: TjktOperacion;
    dsMonedas: TDataSource;
    lcMainGroup7: TdxLayoutGroup;
    cxDBButtonEdit4: TcxDBButtonEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBButtonEdit5: TcxDBButtonEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    lcMainItem13: TdxLayoutItem;
    lcMainItem14: TdxLayoutItem;
    lcMainItem15: TdxLayoutItem;
    lcMainItem16: TdxLayoutItem;
    hlpRepre: TjktHelpGenerico;
    valArt: TjktValidador;
    hlpArt: TjktHelpGenerico;
    valRepre: TjktValidador;
    valVend: TjktValidador;
    hlpVend: TjktHelpGenerico;
    hlpSucu: TjktHelpGenerico;
    valClie: TjktValidador;
    hlpClie: TjktHelpGenerico;
    dsTiposVenta: TDataSource;
    mtTiposVenta: TjktMemTable;
    mtTiposVentaoid_tipo: TIntegerField;
    mtTiposVentades_tipo: TStringField;
    opTraerTiposDeVenta: TjktOperacion;
    DBLayoutViewLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewImporte: TcxGridDBLayoutViewItem;
    DBLayoutViewLayoutItem8: TcxGridLayoutItem;
    DBLayoutViewMoneda: TcxGridDBLayoutViewItem;
    DBLayoutViewGroup1: TdxLayoutGroup;
    hlpPlantilla: TjktHelpGenerico;
    opTraerCotizParaPresu: TjktOperacion;
    mtPresupuestooid_cotiz: TIntegerField;
    opTraerVendRepre: TjktOperacion;
    mtVendRepre: TjktMemTable;
    mtVendRepreoid_vend: TIntegerField;
    mtVendReprecod_vend: TStringField;
    mtVendRepredes_vend: TStringField;
    mtVendRepreoid_repre: TIntegerField;
    mtVendReprecod_repre: TStringField;
    mtVendRepredes_repre: TStringField;
    dsContactos: TDataSource;
    mtContactos: TjktMemTable;
    mtContactosoid_cont_suc: TIntegerField;
    mtContactostipo_cont: TStringField;
    mtContactosape_nom: TStringField;
    mtContactosemail: TStringField;
    opTraerContactosSucu: TjktOperacion;
    mtClienteSucursal: TjktMemTable;
    mtClienteSucursaloid_clie_suc: TIntegerField;
    mtItemsimporte_total: TFloatField;
    DBLayoutViewLayoutItem9: TcxGridLayoutItem;
    DBLayoutViewImporteTotal: TcxGridDBLayoutViewItem;
    DBLayoutViewSeparatorItem1: TdxLayoutSeparatorItem;
    lcMainSeparatorItem3: TdxLayoutSeparatorItem;
    cxDBButtonEdit6: TcxDBButtonEdit;
    lcMainItem17: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem18: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    mtPresupuestooid_lis_pre: TIntegerField;
    mtPresupuestocod_lis_pre: TStringField;
    mtPresupuestodes_lis_pre: TStringField;
    valListaPrecios: TjktValidador;
    hlpListaPrecios: TjktHelpGenerico;
    lcMainGroup10: TdxLayoutGroup;
    lcMainGroup11: TdxLayoutGroup;
    jktExpDBGrid4DBTableView1: TcxGridDBTableView;
    jktExpDBGrid4Level1: TcxGridLevel;
    jktExpDBGrid4: TjktExpDBGrid;
    lcMainItem19: TdxLayoutItem;
    lcMainItem20: TdxLayoutItem;
    mtNotas: TjktMemTable;
    mtCondComerciales: TjktMemTable;
    dsNotas: TDataSource;
    dsCondComerciales: TDataSource;
    mtNotasoid: TIntegerField;
    mtNotasdescripcion: TMemoField;
    jktExpDBGrid4DBTableView1oid: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1descripcion: TcxGridDBColumn;
    mtNotasoid_presu: TIntegerField;
    jktExpDBGrid6: TjktExpDBGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    mtCondComercialesoid: TIntegerField;
    mtCondComercialesoid_presu: TIntegerField;
    mtCondComercialesdescripcion: TMemoField;
    mtDeterLaboQuim: TjktMemTable;
    mtDeterLaboElec: TjktMemTable;
    mtMateriales: TjktMemTable;
    dsDeterLaboQuim: TDataSource;
    dsDeterLaboElec: TDataSource;
    dsMateriales: TDataSource;
    mtDeterLaboQuimoid_item: TIntegerField;
    mtDeterLaboQuimoid_det: TIntegerField;
    mtDeterLaboQuimcod_det: TStringField;
    mtDeterLaboQuimdes_det: TStringField;
    mtDeterLaboQuimimporte: TFloatField;
    mtMaterialesoid_item: TIntegerField;
    mtMaterialesoid_art: TIntegerField;
    mtMaterialescod_art: TStringField;
    mtMaterialesdes_art: TStringField;
    mtMaterialesimporte: TFloatField;
    mtDeterLaboQuimcant: TIntegerField;
    mtDeterLaboQuimoid_mon: TIntegerField;
    mtDeterLaboQuimoid_presu: TIntegerField;
    mtDeterLaboQuimcod_ana: TStringField;
    mtDeterLaboQuimdes_ana: TStringField;
    mtDeterLaboElecoid_item: TIntegerField;
    mtDeterLaboElecoid_presu: TIntegerField;
    mtDeterLaboEleccod_ana: TStringField;
    mtDeterLaboElecdes_ana: TStringField;
    mtDeterLaboElecoid_det: TIntegerField;
    mtDeterLaboEleccod_det: TStringField;
    mtDeterLaboElecdes_det: TStringField;
    mtDeterLaboEleccant: TIntegerField;
    mtDeterLaboElecimporte: TFloatField;
    mtDeterLaboElecoid_mon: TIntegerField;
    mtMaterialescant: TIntegerField;
    mtMaterialesoid_mon: TIntegerField;
    mtMaterialesoid_presu: TIntegerField;
    mtItemsoid_item_cotiz: TIntegerField;
    jktExpDBGrid1DBTableView1oid_item: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_presu: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1cod_ana: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1des_ana: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1cod_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1des_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1cant: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1importe: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_mon: TcxGridDBColumn;
    mtDeterLaboQuimimporte_total: TFloatField;
    mtDeterLaboElecimporte_total: TFloatField;
    mtMaterialesimporte_total: TFloatField;
    jktExpDBGrid1DBTableView1importe_total: TcxGridDBColumn;
    opTraerDeterQuimConPrecio: TjktOperacion;
    opTraerDeterElecConPrecio: TjktOperacion;
    mtParametroInicialLaboratorio: TStringField;
    opTraerProductoConPrecio: TjktOperacion;
    lcMainGroup14: TdxLayoutGroup;
    lcMainSeparatorItem4: TdxLayoutSeparatorItem;
    lcMainGroup2: TdxLayoutGroup;
    jktExpDBGrid3DBTableView1oid_item: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_presu: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_art: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1cod_art: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1des_art: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1cant: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_mon: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1importe: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1importe_total: TcxGridDBColumn;
    hlpArt2: TjktHelpGenerico;
    valArt2: TjktValidador;
    mtPrecioMaterial: TjktMemTable;
    mtPrecioMaterialoid_item: TIntegerField;
    mtPrecioMaterialoid_mon: TIntegerField;
    mtPrecioMaterialimporte: TFloatField;
    mtNotasselec: TBooleanField;
    mtCondComercialesselec: TBooleanField;
    mtNotascodigo: TStringField;
    mtCondComercialescodigo: TStringField;
    jktExpDBGrid4DBTableView1selec: TcxGridDBColumn;
    cxGridDBTableView1oid: TcxGridDBColumn;
    cxGridDBTableView1selec: TcxGridDBColumn;
    cxGridDBTableView1descripcion: TcxGridDBColumn;
    valSucu: TjktValidador;
    jktExpDBGrid5: TjktExpDBGrid;
    jktExpDBGrid5DBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    opGenerarComprobantePresupuesto: TjktOperacion;
    mtComprobante: TjktMemTable;
    mtComprobanteruta: TStringField;
    mtComprobantearchivo: TStringField;
    mtComprobanteoid_presu: TIntegerField;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DBLayoutViewCodigoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DBLayoutViewItem1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DriverNuevo(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure mtItemsCalcFields(DataSet: TDataSet);
    procedure cxDBButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DriverCancel(Sender: TObject);
    procedure lcMainGroup3TabChanging(Sender: TObject; ANewTabIndex: Integer;
      var Allow: Boolean);
    procedure lcMainGroup3TabChanged(Sender: TObject);
    procedure mtDeterLaboQuimCalcFields(DataSet: TDataSet);
    procedure opTraerDeterQuimConPrecioBeforeEjecutar(Sender: TObject);
    procedure opTraerDeterElecConPrecioBeforeEjecutar(Sender: TObject);
    procedure mtPresupuestocod_lis_preChange(Sender: TField);
    procedure jktExpDBGrid3DBTableView1cod_artPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure mtMaterialescod_artChange(Sender: TField);
    procedure mtMaterialesCalcFields(DataSet: TDataSet);
    procedure opTraerTiposDeVentaAfterEjecutar(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
    procedure DriverGuardar(Sender: TObject);

  private
    FNroSolapa: Integer;

    procedure DeshabilitarCampos;
    procedure HabilitarCampos;

  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  ShellAPI;

procedure TFNVen0006.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpCotiz.Ejecutar then
    begin
      opTraerCotizParaPresu.execute;
      opTraerContactosSucu.execute;

      DeshabilitarCampos;
    end;
end;

procedure TFNVen0006.cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpClie.Ejecutar then
    begin
      // Traigo el Vendedor y el Representante por defecto del Cliente
      opTraerVendRepre.execute;

      if mtVendRepre.RecordCount = 1 then
        begin
          // Copio los datos a la tabla 'mtPresupuesto'
          if (mtVendRepre.FieldByName('cod_vend').AsString <> '') then
            begin
              mtPresupuesto.FieldByName('oid_vend').AsInteger :=
                mtVendRepre.FieldByName('oid_vend').AsInteger;
              mtPresupuesto.FieldByName('cod_vend').AsString :=
                mtVendRepre.FieldByName('cod_vend').AsString;
              mtPresupuesto.FieldByName('des_vend').AsString :=
                mtVendRepre.FieldByName('des_vend').AsString;
            end;

          if (mtVendRepre.FieldByName('cod_repre').AsString <> '') then
            begin
              mtPresupuesto.FieldByName('oid_repre').AsInteger :=
                mtVendRepre.FieldByName('oid_repre').AsInteger;
              mtPresupuesto.FieldByName('cod_repre').AsString :=
                mtVendRepre.FieldByName('cod_repre').AsString;
              mtPresupuesto.FieldByName('des_repre').AsString :=
                mtVendRepre.FieldByName('des_repre').AsString;
            end;
        end;
    end;
end;

procedure TFNVen0006.cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpSucu.Ejecutar then
    begin
      mtPresupuesto.FieldByName('nro_sucu').AsString := hlpSucu.GetCodigo;

      opTraerContactosSucu.execute;
    end;
end;

procedure TFNVen0006.cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  hlpVend.Ejecutar;
end;

procedure TFNVen0006.cxDBButtonEdit5PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  hlpRepre.Ejecutar;
end;

procedure TFNVen0006.cxDBButtonEdit6PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  hlpListaPrecios.Ejecutar;
end;

procedure TFNVen0006.DeshabilitarCampos;
begin
  cxDBButtonEdit1.Enabled := False;
  lcMainSeparatorItem3.Visible := False;
  lcMainGroup8.Visible := False;
  // Dejo sólo visible la solapa "Ítems"
  lcMainGroup1.Visible := False;
  lcMainGroup4.Visible := False;
  lcMainGroup5.Visible := False;
  // Ahora deshabilito los campos para que no los modifique
  DBLayoutViewTipo.Properties.ReadOnly := True;
  DBLayoutViewCodigo.Visible := False;
  DBLayoutViewDescripcion.Visible := False;
  DBLayoutViewReferencia.Options.Editing := False;
  DBLayoutViewItem1.Visible := False;
  DBLayoutViewDetalle.Properties.ReadOnly := True;
  DBLayoutViewMoneda.Properties.ReadOnly := True;
  DBLayoutViewImporte.Options.Editing := False;
  // No dejo agregar nuevos ítems ni borrar los que están
  DBLayoutView.OptionsData.Inserting := False;
  DBLayoutView.OptionsData.Deleting := False;
end;

procedure TFNVen0006.HabilitarCampos;
begin
  cxDBButtonEdit1.Enabled := True;
  lcMainSeparatorItem3.Visible := True;
  lcMainGroup8.Visible := True;
  // Muestro todas las solapas de nuevo
  lcMainGroup1.Visible := True;
  lcMainGroup4.Visible := True;
  lcMainGroup5.Visible := True;

  lcMainGroup13.MakeVisible;

  // Habilito nuevamente los campos del DBLayoutView para que los pueda modificar
  DBLayoutViewTipo.Properties.ReadOnly := False;
  DBLayoutViewCodigo.Visible := True;
  DBLayoutViewDescripcion.Visible := True;
  DBLayoutViewReferencia.Options.Editing := True;
  DBLayoutViewItem1.Visible := True;
  DBLayoutViewDetalle.Properties.ReadOnly := False;
  DBLayoutViewMoneda.Properties.ReadOnly := False;
  DBLayoutViewImporte.Options.Editing := True;
  // Dejo agregar nuevos ítems y borrar los que creó
  DBLayoutView.OptionsData.Inserting := True;
  DBLayoutView.OptionsData.Deleting := True;
end;

procedure TFNVen0006.jktExpDBGrid3DBTableView1cod_artPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  hlpArt2.Ejecutar;
end;

procedure TFNVen0006.lcMainGroup3TabChanged(Sender: TObject);
begin
  inherited;

  if Driver.esNuevo and (mtPresupuesto.FieldByName('oid_lis_pre').AsInteger <> 0) then
    begin
      if (FNroSolapa = 2) and mtDeterLaboQuim.IsEmpty then
        opTraerDeterQuimConPrecio.execute
      else if (FNroSolapa = 3) and mtDeterLaboElec.IsEmpty then
        opTraerDeterElecConPrecio.execute
    end;
end;

procedure TFNVen0006.lcMainGroup3TabChanging(Sender: TObject;
  ANewTabIndex: Integer; var Allow: Boolean);
begin
  inherited;

  Allow := TdxLayoutGroup(Sender).Items[ANewTabIndex].Tag <> 5 ;

  if Allow then
    FNroSolapa := TdxLayoutGroup(Sender).Items[ANewTabIndex].Tag;
end;

procedure TFNVen0006.DBLayoutViewCodigoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpArt.Ejecutar then
    mtItems.FieldByName('des_abrev_art').AsString := hlpArt.GetDescripcion;
end;

procedure TFNVen0006.DBLayoutViewItem1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpPlantilla.Ejecutar then
    begin
      mtItems.Editar;
      mtItems.FieldByName('detalle').AsString := hlpPlantilla.GetDescripcion;
      mtItems.Postear;
    end;
end;

procedure TFNVen0006.DriverCancel(Sender: TObject);
begin
  inherited;

  HabilitarCampos;
  dxLayoutGroupRoot.Enabled := False;
end;

procedure TFNVen0006.DriverGuardar(Sender: TObject);
var
  NombreArchivo: string;
begin
  inherited;

  if MessageDlg('¿Desea imprimir el detalle del presupuesto?', mtWarning, // mtConfirmation,
    [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        NombreArchivo := '';
        opGenerarComprobantePresupuesto.execute;

        NombreArchivo := mtComprobante.FieldByName('ruta').AsString +
          mtComprobante.FieldByName('archivo').AsString;
        if not FileExists(NombreArchivo) then
          MessageDlg(Format('No se encuentra el archivo del presupuesto generado (%s)', [NombreArchivo]),
            mtError, [mbOK], 0)
        else
          ShellExecute(Self.Handle, nil, PChar(NombreArchivo), nil, nil, SW_SHOWNORMAL);
      end;
end;

procedure TFNVen0006.DriverNuevo(Sender: TObject);
begin
  inherited;

  dxLayoutGroupRoot.Enabled := True;
  HabilitarCampos;

  mtPresupuesto.Append;
  mtPresupuesto.FieldByName('fecha').AsDateTime := Now;

  // Traigo las Notas
  mtParametroInicial.FieldByName('Entidad').AsString := 'nota';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtNotas.Name;
  opTraerEntidades.execute;

  // Traigo las Cond. Comerciales
  mtParametroInicial.FieldByName('Entidad').AsString := 'condicionComercial';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtCondComerciales.Name;
  opTraerEntidades.execute;
end;

procedure TFNVen0006.mtDeterLaboQuimCalcFields(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName('importe_total').AsFloat :=
    DataSet.FieldByName('cant').AsInteger * DataSet.FieldByName('importe').AsFloat;
end;

procedure TFNVen0006.mtItemsCalcFields(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName('importe_total').AsFloat :=
    DataSet.FieldByName('cant').AsFloat * DataSet.FieldByName('importe').AsFloat;
end;

procedure TFNVen0006.mtMaterialesCalcFields(DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName('importe_total').AsFloat :=
    DataSet.FieldByName('cant').AsInteger * DataSet.FieldByName('importe').AsFloat;
end;

procedure TFNVen0006.mtMaterialescod_artChange(Sender: TField);
begin
  inherited;

//  if mtPresupuesto.FieldByName('oid_lis_pre').AsInteger <> 0 then

  if not Service.ModoExecute then
    begin
      opTraerProductoConPrecio.execute;
      // Copio los datos en la fila abierta actual
      mtMateriales.FieldByName('oid_item').AsInteger :=
        mtPrecioMaterial.FieldByName('oid_item').AsInteger;
      mtMateriales.FieldByName('oid_mon').AsInteger :=
        mtPrecioMaterial.FieldByName('oid_mon').AsInteger;
      mtMateriales.FieldByName('importe').AsFloat :=
        mtPrecioMaterial.FieldByName('importe').AsFloat;
    end;
end;

procedure TFNVen0006.mtPresupuestocod_lis_preChange(Sender: TField);
begin
  inherited;

  if not Service.ModoExecute then
    begin
      opTraerDeterQuimConPrecio.execute;
      opTraerDeterElecConPrecio.execute;
      mtMateriales.Close;
      mtMateriales.Open;
    end;
end;

procedure TFNVen0006.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Si el Presupuesto seleccionado se hizo en base a una Cotización, entonces
  // no dejo modificar NADA!
  if mtPresupuesto.FieldByName('oid_cotiz').AsInteger <> 0 then
    DeshabilitarCampos
  else
    HabilitarCampos;

  opTraerContactosSucu.execute;
  dxLayoutGroupRoot.Enabled := True;
  cxDBButtonEdit1.Enabled := False;
end;

procedure TFNVen0006.opTraerDeterElecConPrecioBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.FieldByName('Laboratorio').AsString := 'LaboratorioElectrico';
end;

procedure TFNVen0006.opTraerDeterQuimConPrecioBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.FieldByName('Laboratorio').AsString := 'LaboratorioQuimico';
end;

procedure TFNVen0006.opTraerTiposDeVentaAfterEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.Open;
  mtParametroInicial.Append;

  // Traigo las Monedas activas
  mtParametroInicial.FieldByName('Entidad').AsString := 'moneda';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtMonedas.Name;
  opTraerEntidades.execute;
end;


initialization
  RegisterClass(TFNVen0006);

end.
