unit jktFNCli0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0011, Data.DB, kbmMemTable,
  jktCNMet0012, jktCNMet0030, jktCNMet0002, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, dxBar, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008, cxGridDBCardView,
  cxGridCardView, cxGridCustomLayoutView, jktCNMet0014, dxLayoutLookAndFeels,
  cxSplitter, cxGroupBox, cxDBLookupComboBox;

type
  TFNCli0001 = class(TfrmChild)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lcMainGroup1: TdxLayoutGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    lcMainItem1: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcMainItem4: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    lcMainItem7: TdxLayoutItem;
    cxDBTextEdit8: TcxDBTextEdit;
    lcMainItem8: TdxLayoutItem;
    cxDBTextEdit9: TcxDBTextEdit;
    lcMainItem9: TdxLayoutItem;
    lcMainGroup7: TdxLayoutGroup;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    lcMainItem10: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    lcMainItem12: TdxLayoutItem;
    lcMainGroup8: TdxLayoutGroup;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    lcMainItem13: TdxLayoutItem;
    lcMainGroup9: TdxLayoutGroup;
    jktExpDBGrid2: TjktExpDBGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    lcMainItem14: TdxLayoutItem;
    cxButtonEdit1: TcxDBButtonEdit;
    lcMainItem16: TdxLayoutItem;
    cxTextEdit1: TcxDBTextEdit;
    lcMainItem15: TdxLayoutItem;
    mtSucursalesCliente: TjktMemTable;
    mtDomiciliosEntrega: TjktMemTable;
    mtContactos: TjktMemTable;
    mtClasificadoresSucursal: TjktMemTable;
    mtSucursalesClienteoid_SucClie: TIntegerField;
    mtSucursalesClienteoid_Cliente: TIntegerField;
    dsSucursalesCliente: TDataSource;
    dsDomiciliosEntrega: TDataSource;
    dsContactos: TDataSource;
    dsClasificadoresSucursal: TDataSource;
    tvSucursales: TcxGridDBTableView;
    lvSucursales: TcxGridLevel;
    jktExpDBGrid3: TjktExpDBGrid;
    lcMainItem17: TdxLayoutItem;
    lvDomiciliosEntrega: TcxGridLevel;
    tvDomiciliosEntrega: TcxGridDBTableView;
    lvContactos: TcxGridLevel;
    cvContactos: TcxGridDBCardView;
    lvClasificadores: TcxGridLevel;
    tvClasificadores: TcxGridDBTableView;
    mtSucursalesClienteNroSucursal: TSmallintField;
    mtSucursalesClienteDescripcion: TStringField;
    mtSucursalesClienteDireccion: TStringField;
    mtSucursalesClienteLocalidad: TStringField;
    mtSucursalesClienteCodPostal: TStringField;
    mtSucursalesClienteoid_Vendedor: TIntegerField;
    mtSucursalesClienteCodVendedor: TStringField;
    mtSucursalesClienteDescVendedor: TStringField;
    mtSucursalesClienteoid_Provincia: TIntegerField;
    mtSucursalesClienteCodProvincia: TStringField;
    mtSucursalesClienteDescProvincia: TStringField;
    mtSucursalesClienteActivo: TBooleanField;
    mtSucursalesClienteTelefonos: TStringField;
    tvSucursalesoid_SucClie: TcxGridDBColumn;
    tvSucursalesoid_Cliente: TcxGridDBColumn;
    tvSucursalesNroSucursal: TcxGridDBColumn;
    tvSucursalesDescripcion: TcxGridDBColumn;
    tvSucursalesDireccion: TcxGridDBColumn;
    tvSucursalesLocalidad: TcxGridDBColumn;
    tvSucursalesCodPostal: TcxGridDBColumn;
    tvSucursalesProvincia: TcxGridDBColumn;
    tvSucursalesVendedor: TcxGridDBColumn;
    tvSucursalesTelefonos: TcxGridDBColumn;
    tvSucursalesActivo: TcxGridDBColumn;
    mtDomiciliosEntregaoid_SucClie: TIntegerField;
    mtDomiciliosEntregaNroDomicilio: TSmallintField;
    mtDomiciliosEntregaDescripcion: TStringField;
    mtDomiciliosEntregaDireccion: TStringField;
    mtDomiciliosEntregaLocalidad: TStringField;
    mtDomiciliosEntregaCodPostal: TStringField;
    mtDomiciliosEntregaoid_Provincia: TIntegerField;
    mtDomiciliosEntregaCodProvincia: TStringField;
    mtDomiciliosEntregaDescProvincia: TStringField;
    mtDomiciliosEntregaTelefonos: TStringField;
    mtDomiciliosEntregaActivo: TBooleanField;
    mtDomiciliosEntregaoid_DomSuc: TIntegerField;
    mtDomiciliosEntregaHorariosEntrega: TStringField;
    tvDomiciliosEntregaoid_DomSuc: TcxGridDBColumn;
    tvDomiciliosEntregaoid_SucClie: TcxGridDBColumn;
    tvDomiciliosEntregaNroDomicilio: TcxGridDBColumn;
    tvDomiciliosEntregaDescripcion: TcxGridDBColumn;
    tvDomiciliosEntregaDireccion: TcxGridDBColumn;
    tvDomiciliosEntregaLocalidad: TcxGridDBColumn;
    tvDomiciliosEntregaCodPostal: TcxGridDBColumn;
    tvDomiciliosEntregaoid_Provincia: TcxGridDBColumn;
    tvDomiciliosEntregaProvincia: TcxGridDBColumn;
    tvDomiciliosEntregaHorariosEntrega: TcxGridDBColumn;
    tvDomiciliosEntregaTelefonos: TcxGridDBColumn;
    tvDomiciliosEntregaActivo: TcxGridDBColumn;
    mtContactosoid_SucClie: TIntegerField;
    mtContactosoid_ContSuc: TIntegerField;
    mtContactosApellidoYNombre: TStringField;
    mtContactosTelefono: TStringField;
    mtContactosEmail: TStringField;
    mtContactosCargo: TStringField;
    mtContactosActivo: TBooleanField;
    cvContactosoid_ContSuc: TcxGridDBCardViewRow;
    cvContactosoid_SucClie: TcxGridDBCardViewRow;
    cvContactosApellidoYNombre: TcxGridDBCardViewRow;
    cvContactosTelefono: TcxGridDBCardViewRow;
    cvContactosEmail: TcxGridDBCardViewRow;
    cvContactosCargo: TcxGridDBCardViewRow;
    cvContactosActivo: TcxGridDBCardViewRow;
    mtClasificadoresSucursaloid_SucClie: TIntegerField;
    mtClasificadoresSucursaloid_ClasifSuc: TIntegerField;
    mtClasificadoresSucursalDescClasif: TStringField;
    mtClasificadoresSucursaloid_ValorClasif: TIntegerField;
    mtClasificadoresSucursalCodValorClasif: TStringField;
    mtClasificadoresSucursalDescValorClasif: TStringField;
    mtClasificadoresSucursalActivo: TBooleanField;
    tvClasificadoresoid_ClasifSuc: TcxGridDBColumn;
    tvClasificadoresoid_SucClie: TcxGridDBColumn;
    tvClasificadoresDescClasif: TcxGridDBColumn;
    tvClasificadoresoid_ValorClasif: TcxGridDBColumn;
    tvClasificadoresCodValorClasif: TcxGridDBColumn;
    tvClasificadoresDescValorClasif: TcxGridDBColumn;
    tvClasificadoresActivo: TcxGridDBColumn;
    mtCliente: TjktMemTable;
    mtInscripImposit: TjktMemTable;
    mtClasificadoresCliente: TjktMemTable;
    dsCliente: TDataSource;
    dsInscripcionesImpositivas: TDataSource;
    dsClasificadoresCliente: TDataSource;
    mtClienteoid_Cliente: TIntegerField;
    mtClienteCodigo: TStringField;
    mtClienteActivo: TBooleanField;
    mtClienteoid_CondPago: TIntegerField;
    mtClienteCodCondPago: TStringField;
    mtClienteDescCondPago: TStringField;
    mtClienteTelefonos: TStringField;
    mtClasificadoresClienteoid_ClasifClie: TIntegerField;
    mtClasificadoresClienteDescClasif: TStringField;
    mtClasificadoresClienteoid_ValorClasif: TIntegerField;
    mtClasificadoresClienteCodValorClasif: TStringField;
    mtClasificadoresClienteDescValorClasif: TStringField;
    mtClasificadoresClienteActivo: TBooleanField;
    mtClasificadoresClienteoid_Cliente: TIntegerField;
    mtInscripImpositActivo: TBooleanField;
    mtInscripImpositoid_Cliente: TIntegerField;
    mtInscripImpositoid_InscClie: TIntegerField;
    mtInscripImpositoid_Impuesto: TIntegerField;
    mtInscripImpositDescImpuesto: TStringField;
    mtInscripImpositoid_Categoria: TIntegerField;
    mtInscripImpositCodCategoria: TStringField;
    mtInscripImpositDescCategoria: TStringField;
    mtInscripImpositVigenciaDesde: TDateField;
    jktExpDBGrid1DBTableView1oid_InscClie: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_Cliente: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_Impuesto: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescImpuesto: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1NroInscripcion: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_Categoria: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1CodCategoria: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescCategoria: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1VigenciaDesde: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn;
    cxGridDBTableView1oid_ClasifClie: TcxGridDBColumn;
    cxGridDBTableView1oid_Cliente: TcxGridDBColumn;
    cxGridDBTableView1DescClasif: TcxGridDBColumn;
    cxGridDBTableView1oid_ValorClasif: TcxGridDBColumn;
    cxGridDBTableView1CodValorClasif: TcxGridDBColumn;
    cxGridDBTableView1DescValorClasif: TcxGridDBColumn;
    cxGridDBTableView1Activo: TcxGridDBColumn;
    Help: TjktHelpGenerico;
    OperTraerClasifCliente: TjktOperacion;
    OperTraerClasifSucur: TjktOperacion;
    mtSujImp: TjktMemTable;
    dsSujImp: TDataSource;
    mtSujImpRazonSocial: TStringField;
    mtSujImpDireccion: TStringField;
    mtSujImpLocalidad: TStringField;
    mtSujImpCodPostal: TStringField;
    mtSujImpoid_Provincia: TIntegerField;
    mtSujImpCodProvincia: TStringField;
    mtSujImpDescProvincia: TStringField;
    mtSujImpoid_Pais: TIntegerField;
    mtSujImpCodPais: TStringField;
    mtSujImpDescPais: TStringField;
    mtSujImpPersonaJuridica: TBooleanField;
    mtSujImpCuit: TStringField;
    mtSujImpoid_Cliente: TIntegerField;
    mtInscripImpositCodImpuesto: TStringField;
    jktExpDBGrid1DBTableView1CodImpuesto: TcxGridDBColumn;
    cxDBCheckBox2: TcxDBCheckBox;
    lcMainItem18: TdxLayoutItem;
    HelpProvincia: TjktHelpGenerico;
    lcMainGroup11: TdxLayoutGroup;
    lcMainGroup10: TdxLayoutGroup;
    lcMainGroup12: TdxLayoutGroup;
    HelpPais: TjktHelpGenerico;
    HelpCondPago: TjktHelpGenerico;
    mtSujImpoid_SujImp: TIntegerField;
    ValProvincia: TjktValidador;
    ValPais: TjktValidador;
    ValCondPago: TjktValidador;
    mtSucursalesClienteoid_Pais: TIntegerField;
    mtDomiciliosEntregaoid_Pais: TIntegerField;
    ValCategoriaImp: TjktValidador;
    HelpValorClasifCliente: TjktHelpGenerico;
    HelpCategoriaImp: TjktHelpGenerico;
    mtClasificadoresClienteoid_Clasif: TIntegerField;
    mtClasificadoresSucursaloid_Clasif: TIntegerField;
    tvClasificadoresoid_Clasif: TcxGridDBColumn;
    cxGridDBTableView1oid_Clasif: TcxGridDBColumn;
    HelpValorClasifSucursal: TjktHelpGenerico;
    mtClasifSucurBackup: TjktMemTable;
    mtClasifSucurBackupoid_Clasif: TIntegerField;
    mtClasifSucurBackupDescClasif: TStringField;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    mtSucursalesClienteoid_Representante: TIntegerField;
    mtSucursalesClienteCodRepresentante: TStringField;
    mtSucursalesClienteDescRepresentante: TStringField;
    tvSucursalesRepresentante: TcxGridDBColumn;
    mtProvincias: TjktMemTable;
    mtVendedores: TjktMemTable;
    mtRepresentantes: TjktMemTable;
    dsProvincias: TDataSource;
    dsVendedores: TDataSource;
    dsRepresentantes: TDataSource;
    opTraerEntidades: TjktOperacion;
    mtParametroInicialOutputDatasetName: TStringField;
    mtProvinciasoid: TIntegerField;
    mtProvinciascodigo: TStringField;
    mtProvinciasdescripcion: TStringField;
    mtVendedoresoid: TIntegerField;
    mtVendedorescodigo: TStringField;
    mtVendedoresdescripcion: TStringField;
    mtRepresentantesoid: TIntegerField;
    mtRepresentantescodigo: TStringField;
    mtRepresentantesdescripcion: TStringField;
    mtParametroInicialNombreParametro: TStringField;
    opTraerParametro: TjktOperacion;
    mtParametrosFormoid_param: TIntegerField;
    mtParametrosFormcodigo: TStringField;
    mtParametrosFormdescripcion: TStringField;
    mtParametrosFormvalor_cadena: TStringField;
    mtParametrosFormvalor_entero: TIntegerField;
    mtParametrosFormvalor_fecha: TStringField;
    mtParametrosFormvalor_float: TFloatField;
    mtParametrosFormvalor_boolean: TBooleanField;
    mtClienteFax: TStringField;
    mtClienteEmail: TStringField;
    cxDBTextEdit6: TcxDBTextEdit;
    lcMainItem19: TdxLayoutItem;
    cxDBTextEdit10: TcxDBTextEdit;
    lcMainItem20: TdxLayoutItem;
    mtImpuestos: TjktMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    mtInscripImpositNroInscripcion: TStringField;
    mtContactosoid_TipoContacto: TIntegerField;
    cvContactosoid_TipoContacto: TcxGridDBCardViewRow;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBButtonEdit3: TcxDBButtonEdit;
    lcMainItem21: TdxLayoutItem;
    lcMainItem22: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainGroup14: TdxLayoutGroup;
    cxDBButtonEdit4: TcxDBButtonEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    lcMainItem23: TdxLayoutItem;
    lcMainItem24: TdxLayoutItem;
    mtClienteoid_vend: TIntegerField;
    mtClientecod_vend: TStringField;
    mtClientedes_vend: TStringField;
    mtClienteoid_repre: TIntegerField;
    mtClientecod_repre: TStringField;
    mtClientedes_repre: TStringField;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    hlpVend: TjktHelpGenerico;
    hlpRepre: TjktHelpGenerico;
    mtSucursalesClientedom_ent_fac: TStringField;
    tvSucursalesdom_ent_fac: TcxGridDBColumn;
    cxDBTextEdit13: TcxDBTextEdit;
    lcMainItem25: TdxLayoutItem;
    mtClienteNroProveedor: TStringField;
    mtTiposContacto: TjktMemTable;
    dsTiposContacto: TDataSource;
    mtTiposContactooid: TIntegerField;
    mtTiposContactocodigo: TStringField;
    mtTiposContactodescripcion: TStringField;
    mtContactosTelefonoAlternativo: TStringField;
    mtContactosCelular: TStringField;
    cvContactosTelefonoAlternativo: TcxGridDBCardViewRow;
    cvContactosCelular: TcxGridDBCardViewRow;
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure mtSucursalesClienteNewRecord(DataSet: TDataSet);
    procedure jktExpDBGrid1DBTableView1CodCategoriaPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
    procedure cxGridDBTableView1CodValorClasifPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure tvClasificadoresCodValorClasifPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure OperTraerClasifSucurBeforeEjecutar(Sender: TObject);
    procedure mtContactosNewRecord(DataSet: TDataSet);
    procedure mtDomiciliosEntregaNewRecord(DataSet: TDataSet);
    procedure mtClasificadoresSucursalNewRecord(DataSet: TDataSet);
    procedure OperacionSaveAfterEjecutar(Sender: TObject);
    procedure OperTraerClasifSucurAfterEjecutar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DriverNuevo(Sender: TObject);
    procedure opTraerParametroBeforeEjecutar(Sender: TObject);
    procedure opTraerParametroAfterEjecutar(Sender: TObject);
    procedure OperTraerClasifClienteAfterEjecutar(Sender: TObject);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    oid_PaisPorDefecto: Integer;

  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNCli0001.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  // Muestro el Help (o Filtro)
  if HelpCondPago.Ejecutar then
    // Seleccionó un registro
    mtCliente.FieldByName('DescCondPago').AsString := HelpCondPago.GetDescripcion
  else ;
    // No seleccionó nada!
end;

procedure TFNCli0001.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  // Muestro el Help (o Filtro)
  if HelpProvincia.Ejecutar then
    // Seleccionó un registro
    mtSujImp.FieldByName('DescProvincia').AsString := HelpProvincia.GetDescripcion
  else ;
    // No seleccionó nada!
end;

procedure TFNCli0001.cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  // Muestro el Help (o Filtro)
  if HelpPais.Ejecutar then
    // Seleccionó un registro
    mtSujImp.FieldByName('DescPais').AsString := HelpPais.GetDescripcion
  else ;
    // No seleccionó nada!
end;

procedure TFNCli0001.cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpVend.Ejecutar then
    mtCliente.FieldByName('des_vend').AsString := hlpVend.GetDescripcion;
end;

procedure TFNCli0001.cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpRepre.Ejecutar then
    mtCliente.FieldByName('des_repre').AsString := hlpRepre.GetDescripcion;
end;

procedure TFNCli0001.cxGridDBTableView1CodValorClasifPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if HelpValorClasifCliente.Ejecutar then
    mtClasificadoresCliente.FieldByName('DescValorClasif').AsString :=
      HelpValorClasifCliente.GetDescripcion
  else
end;

procedure TFNCli0001.DriverNuevo(Sender: TObject);
begin
  inherited;

  mtSujImp.Append;
  mtSujImp.FieldByName('PersonaJuridica').AsBoolean := True;
end;

procedure TFNCli0001.FormCreate(Sender: TObject);
begin
  inherited;

  // El ancho debe ser el total de la pantalla
  cxGroupBoxLeft.Width  := 0;
  cxGroupBoxRight.Width := 0;
end;

procedure TFNCli0001.jktExpDBGrid1DBTableView1CodCategoriaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if HelpCategoriaImp.Ejecutar then
    // Seleccionó un registro. No asigno por código la 'Descripcion' ya que
    // se obtiene con el Validador!
  else ;
    // No seleccionó nada!
end;

procedure TFNCli0001.mtClasificadoresSucursalNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    mtClasificadoresSucursal.FieldByName('oid_ClasifSuc').AsInteger := GetNewOid;
end;

procedure TFNCli0001.mtContactosNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    mtContactos.FieldByName('oid_ContSuc').AsInteger := GetNewOid;
end;

procedure TFNCli0001.mtDomiciliosEntregaNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    begin
      mtDomiciliosEntrega.FieldByName('oid_DomSuc').AsInteger := GetNewOid;

      if mtDomiciliosEntrega.RecordCount = 0 then
        begin
          // Generar y completar por defecto el domicilio de entrega "0" con los
          // datos de la sucursal
          mtDomiciliosEntrega.FieldByName('NroDomicilio').AsInteger := 0;

          mtDomiciliosEntrega.FieldByName('Direccion').AsString :=
            mtSucursalesCliente.FieldByName('Direccion').AsString;
          mtDomiciliosEntrega.FieldByName('Localidad').AsString :=
            mtSucursalesCliente.FieldByName('Localidad').AsString;
          mtDomiciliosEntrega.FieldByName('CodPostal').AsString :=
            mtSucursalesCliente.FieldByName('CodPostal').AsString;
          mtDomiciliosEntrega.FieldByName('oid_Provincia').AsInteger :=
            mtSucursalesCliente.FieldByName('oid_Provincia').AsInteger;
          mtDomiciliosEntrega.FieldByName('CodProvincia').AsString :=
            mtSucursalesCliente.FieldByName('CodProvincia').AsString;
          mtDomiciliosEntrega.FieldByName('DescProvincia').AsString :=
            mtSucursalesCliente.FieldByName('DescProvincia').AsString;
          mtDomiciliosEntrega.FieldByName('Telefonos').AsString :=
            mtSucursalesCliente.FieldByName('Telefonos').AsString;
        end;
    end;
end;

procedure TFNCli0001.mtSucursalesClienteNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    begin
      mtSucursalesCliente.FieldByName('oid_SucClie').AsInteger := GetNewOid;

      if mtSucursalesCliente.RecordCount = 0 then
        begin
          // La sucursal '0' se debe dar de alta por defecto con todos los datos
          // genericos del cliente
          mtSucursalesCliente.FieldByName('NroSucursal').AsInteger := 0;

          mtSucursalesCliente.FieldByName('Direccion').AsString :=
            mtSujImp.FieldByName('Direccion').AsString;
          mtSucursalesCliente.FieldByName('Localidad').AsString :=
            mtSujImp.FieldByName('Localidad').AsString;
          mtSucursalesCliente.FieldByName('CodPostal').AsString :=
            mtSujImp.FieldByName('CodPostal').AsString;
          mtSucursalesCliente.FieldByName('oid_Provincia').AsInteger :=
            mtSujImp.FieldByName('oid_Provincia').AsInteger;
          mtSucursalesCliente.FieldByName('CodProvincia').AsString :=
            mtSujImp.FieldByName('CodProvincia').AsString;
          mtSucursalesCliente.FieldByName('DescProvincia').AsString :=
            mtSujImp.FieldByName('DescProvincia').AsString;
          mtSucursalesCliente.FieldByName('Telefonos').AsString :=
            mtCliente.FieldByName('Telefonos').AsString;
        end;

      // OJO, por cada Sucursal nueva tengo que replicarle todos los Clasificadores
      // existentes para una Sucursal (así, cada Sucursal tiene sus propios
      // Valores de Clasificador !). Pero a cada registro NO se le asigna automáticamente
      // el 'oid_SucClie' nuevo!

      mtClasifSucurBackup.First;
      while not mtClasifSucurBackup.Eof do
        begin
          mtClasificadoresSucursal.Append;

          mtClasificadoresSucursal.FieldByName('oid_SucClie').AsInteger :=
            mtSucursalesCliente.FieldByName('oid_SucClie').AsInteger;
          mtClasificadoresSucursal.FieldByName('oid_Clasif').AsInteger :=
            mtClasifSucurBackup.FieldByName('oid_Clasif').AsInteger;
          mtClasificadoresSucursal.FieldByName('DescClasif').AsString :=
            mtClasifSucurBackup.FieldByName('DescClasif').AsString;

          mtClasificadoresSucursal.Post;
          mtClasifSucurBackup.Next;
        end;
    end;
end;

procedure TFNCli0001.OperacionSaveAfterEjecutar(Sender: TObject);
begin
  inherited;

  mtDomiciliosEntrega.MasterSource := nil;
  mtContactos.MasterSource := nil;
  mtClasificadoresSucursal.MasterSource := nil;
end;

procedure TFNCli0001.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtDomiciliosEntrega.MasterSource := dsSucursalesCliente;
  mtContactos.MasterSource := dsSucursalesCliente;
  mtClasificadoresSucursal.MasterSource := dsSucursalesCliente;

  // Agrego el 'oid_Pais' a los Domicilios de Entrega y Sucursales del Cliente
  mtSucursalesCliente.First;
  while not mtSucursalesCliente.Eof do
    begin
      mtSucursalesCliente.Edit;

      mtSucursalesCliente.FieldByName('oid_Pais').AsInteger :=
        mtSujImp.FieldByName('oid_Pais').AsInteger;

      {******************************}
      // Modifico todos los Domicilios de Entrega de la Sucursal 'actual'
      mtDomiciliosEntrega.First;
      while not mtDomiciliosEntrega.Eof do
        begin
          mtDomiciliosEntrega.Edit;

          mtDomiciliosEntrega.FieldByName('oid_Pais').AsInteger :=
            mtSujImp.FieldByName('oid_Pais').AsInteger;

          mtDomiciliosEntrega.Next;
        end;
      {******************************}

      mtSucursalesCliente.Next;
    end;
end;

procedure TFNCli0001.OperTraerClasifClienteAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Traigo los Impuestos y los cargo en la grilla de 'Inscripciones Impositivas'
  mtParametroInicial.FieldByName('Entidad').AsString := 'impuesto';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtImpuestos.Name;
  opTraerEntidades.execute;

  mtImpuestos.First;
  while not mtImpuestos.Eof do
    begin
      mtInscripImposit.Append;

      mtInscripImposit.FieldByName('oid_Impuesto').AsInteger :=
        mtImpuestos.FieldByName('oid').AsInteger;
      mtInscripImposit.FieldByName('CodImpuesto').AsString :=
        mtImpuestos.FieldByName('codigo').AsString;
      mtInscripImposit.FieldByName('DescImpuesto').AsString :=
        mtImpuestos.FieldByName('descripcion').AsString;

      mtInscripImposit.Post;

      mtImpuestos.Next;
    end;
end;

procedure TFNCli0001.OperTraerClasifSucurAfterEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.Open;
  mtParametroInicial.Append;

  // Traigo las Provincias
  mtParametroInicial.FieldByName('Entidad').AsString := 'provincia';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtProvincias.Name;
  opTraerEntidades.execute;

  // Traigo los Vendedores
  mtParametroInicial.FieldByName('Entidad').AsString := 'vendedor';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtVendedores.Name;
  opTraerEntidades.execute;

  // Traigo los Representantes
  mtParametroInicial.FieldByName('Entidad').AsString := 'representante';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtRepresentantes.Name;
  opTraerEntidades.execute;

  // Traigo los Tipos de Contacto
  mtParametroInicial.FieldByName('Entidad').AsString := 'tipoContacto';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtTiposContacto.Name;
  opTraerEntidades.execute;
end;

procedure TFNCli0001.OperTraerClasifSucurBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtClasifSucurBackup.Open;
end;

procedure TFNCli0001.opTraerParametroAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Por ahora estamos pidiendo UN SOLO parámetro, habrá entonces una sola fila en
  // la tabla 'mtParametrosForm'. De todas maneras lo busco como si hubieran varios
  mtParametrosForm.First;
  if not mtParametrosForm.Locate('codigo', 'PaisPorDefecto', [loCaseInsensitive]) then
    // 'Código de Parámetro inexistente'
    oid_PaisPorDefecto := -1
  else
    oid_PaisPorDefecto := mtParametrosForm.FieldByName('valor_entero').AsInteger;
end;

procedure TFNCli0001.opTraerParametroBeforeEjecutar(Sender: TObject);
begin
  inherited;

  // Esto se reemplazará cuando se recuperen TODOS los parámetros del Form
  mtParametroInicial.FieldByName('NombreParametro').AsString := 'PaisPorDefecto';
end;

procedure TFNCli0001.tvClasificadoresCodValorClasifPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if HelpValorClasifSucursal.Ejecutar then
    mtClasificadoresSucursal.FieldByName('DescValorClasif').AsString :=
      HelpValorClasifSucursal.GetDescripcion
  else ;
end;

initialization
  RegisterClass(TFNCli0001);


end.
