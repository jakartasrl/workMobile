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
  cxGridCardView, cxGridCustomLayoutView, jktCNMet0014;

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
    lcMainGroup10: TdxLayoutGroup;
    cxDBTextEdit5: TcxDBTextEdit;
    lcMainItem10: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
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
    tvSucursalesoid_Provincia: TcxGridDBColumn;
    tvSucursalesCodProvincia: TcxGridDBColumn;
    tvSucursalesDescProvincia: TcxGridDBColumn;
    tvSucursalesoid_Vendedor: TcxGridDBColumn;
    tvSucursalesCodVendedor: TcxGridDBColumn;
    tvSucursalesDescVendedor: TcxGridDBColumn;
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
    tvDomiciliosEntregaCodProvincia: TcxGridDBColumn;
    tvDomiciliosEntregaDescProvincia: TcxGridDBColumn;
    tvDomiciliosEntregaHorariosEntrega: TcxGridDBColumn;
    tvDomiciliosEntregaTelefonos: TcxGridDBColumn;
    tvDomiciliosEntregaActivo: TcxGridDBColumn;
    mtContactosoid_SucClie: TIntegerField;
    mtContactosoid_ContSuc: TIntegerField;
    mtContactosApellido: TStringField;
    mtContactosNombres: TStringField;
    mtContactosTelefonos: TStringField;
    mtContactosEmail: TStringField;
    mtContactosCargo: TStringField;
    mtContactosActivo: TBooleanField;
    cvContactosoid_ContSuc: TcxGridDBCardViewRow;
    cvContactosoid_SucClie: TcxGridDBCardViewRow;
    cvContactosApellido: TcxGridDBCardViewRow;
    cvContactosNombres: TcxGridDBCardViewRow;
    cvContactosTelefonos: TcxGridDBCardViewRow;
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
    mtClienteRazonSocial: TStringField;
    mtClienteDireccion: TStringField;
    mtClienteLocalidad: TStringField;
    mtClienteCodPostal: TStringField;
    mtClienteoid_Provincia: TIntegerField;
    mtClienteoid_Pais: TIntegerField;
    mtClienteDescProvincia: TStringField;
    mtClienteDescPais: TStringField;
    mtClienteActivo: TBooleanField;
    mtClienteCuit: TStringField;
    mtClienteoid_CondPago: TIntegerField;
    mtClienteCodCondPago: TStringField;
    mtClienteDescCondPago: TStringField;
    mtClienteTelefonos: TStringField;
    mtClientePersonaJuridica: TBooleanField;
    mtClienteCodProvincia: TStringField;
    mtClienteCodPais: TStringField;
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
    mtInscripImpositNroInscripcion: TIntegerField;
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
    jktHelpGenerico1: TjktHelpGenerico;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


initialization
  RegisterClass(TFNCli0001);


end.
