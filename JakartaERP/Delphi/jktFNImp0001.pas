unit jktFNImp0001;

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
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxDBEdit, cxLabel, dxBevel, cxGroupBox,
  jktCNMet0014, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, jktCNMet0008;

type
  TFNImp0001 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    txtCodigo: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    OperTraerComportamientos: TjktOperacion;
    dsImpuesto: TDataSource;
    mtImpuesto: TjktMemTable;
    mtImpuestooid_Impuesto: TIntegerField;
    mtImpuestoCodigo: TStringField;
    mtImpuestoDescripcion: TStringField;
    mtImpuestoActivo: TBooleanField;
    mtImpuestooid_Comportamiento: TIntegerField;
    mtComportamientos: TjktMemTable;
    mtComportamientosoid_Comportamiento: TIntegerField;
    mtComportamientosDescripcion: TStringField;
    Help: TjktHelpGenerico;
    cxGroupBox2: TcxGroupBox;
    dbgImpuestoCategorias: TjktExpDBGrid;
    dbgImpuestoCategoriasDBTableView1: TcxGridDBTableView;
    dbgImpuestoCategoriasLevel1: TcxGridLevel;
    mtImpuestoCategorias: TjktMemTable;
    mtImpuestoCategoriasoid_ImpCat: TIntegerField;
    mtImpuestoCategoriasoid_Categoria: TIntegerField;
    mtImpuestoCategoriasCodigo: TStringField;
    mtImpuestoCategoriasActiva: TBooleanField;
    dsImpuestoCategorias: TDataSource;
    mtImpuestoCategoriasoid_Impuesto: TIntegerField;
    mtImpuestoCategoriasDescripcion: TStringField;
    valCodigo2: TjktValidador;
    valCodigo1: TjktValidador;
    dbgImpuestoCategoriasDBTableView1oid_ImpCat: TcxGridDBColumn;
    dbgImpuestoCategoriasDBTableView1oid_Impuesto: TcxGridDBColumn;
    dbgImpuestoCategoriasDBTableView1oid_Categoria: TcxGridDBColumn;
    dbgImpuestoCategoriasDBTableView1Codigo: TcxGridDBColumn;
    dbgImpuestoCategoriasDBTableView1Descripcion: TcxGridDBColumn;
    dbgImpuestoCategoriasDBTableView1Activa: TcxGridDBColumn;
    dsComportamientos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


initialization
  RegisterClass(TFNImp0001);

end.
