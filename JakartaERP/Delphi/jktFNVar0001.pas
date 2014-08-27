unit jktFNVar0001;

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
  cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, jktCNMet0008,
  cxMaskEdit, cxCheckBox, cxDBEdit, cxLabel, cxTextEdit, cxGroupBox, dxBevel,
  jktCNMet0014;

type
  TFNVar0001 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    txtCodigo: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxGroupBox2: TcxGroupBox;
    dbgDetalleCondicion: TjktExpDBGrid;
    dbgDetalleCondicionDBTableView1: TcxGridDBTableView;
    dbgDetalleCondicionLevel1: TcxGridLevel;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    dxBevel1: TdxBevel;
    dsCondicionDePago: TDataSource;
    mtCondicionDePago: TjktMemTable;
    mtCondicionDePagooid_CondPago: TIntegerField;
    mtCondicionDePagoCodigo: TStringField;
    mtCondicionDePagoDescripcion: TStringField;
    mtCondicionDePagoActivo: TBooleanField;
    mtCondicionDePagoAPartirFechaFactura: TBooleanField;
    mtCondicionDePagoAPartirFechaRecepcion: TBooleanField;
    Help: TjktHelpGenerico;
    mtDetalleCondicionDePago: TjktMemTable;
    dsDetalleCondicionDePago: TDataSource;
    mtDetalleCondicionDePagooid_CondPago: TIntegerField;
    mtDetalleCondicionDePagooid_Det_CondPago: TIntegerField;
    mtDetalleCondicionDePagoDias: TIntegerField;
    mtDetalleCondicionDePagoPorcentaje: TIntegerField;
    dbgDetalleCondicionDBTableView1oid_Det_CondPago: TcxGridDBColumn;
    dbgDetalleCondicionDBTableView1oid_CondPago: TcxGridDBColumn;
    dbgDetalleCondicionDBTableView1Dias: TcxGridDBColumn;
    dbgDetalleCondicionDBTableView1Porcentaje: TcxGridDBColumn;
    valDias: TjktValidador;
    valPorcentaje: TjktValidador;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNVar0001: TFNVar0001;

implementation

{$R *.dfm}

end.
