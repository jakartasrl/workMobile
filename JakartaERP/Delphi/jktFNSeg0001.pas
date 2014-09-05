unit jktFNSeg0001;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, jktCNMet0008, kbmMemTable, jktCNMet0012, jktCNMet0011;

type
  TFNSeg0001 = class(TfrmChild)
    dbgEmpresasDBTableView1: TcxGridDBTableView;
    dbgEmpresasLevel1: TcxGridLevel;
    dbgEmpresas: TjktExpDBGrid;
    TEmpresas: TjktMemTable;
    dsEmpresas: TDataSource;
    TEmpresasCodigo: TStringField;
    TEmpresasRazonSocial: TStringField;
    TEmpresasUrlDB: TStringField;
    dbgEmpresasDBTableView1Codigo: TcxGridDBColumn;
    dbgEmpresasDBTableView1RazonSocial: TcxGridDBColumn;
    dbgEmpresasDBTableView1UrlDB: TcxGridDBColumn;
    TEmpresasoid_empresa: TIntegerField;   
    TEmpresasActivo: TBooleanField;
    dbgEmpresasDBTableView1oid_empresa: TcxGridDBColumn;
    dbgEmpresasDBTableView1Activo: TcxGridDBColumn;
    valCodigo1: TjktValidador;
    valCodigo2: TjktValidador;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}
initialization
  RegisterClass(TFNSeg0001);

end.
