unit jktFNArt0002;

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
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008, jktCNMet0014,
  cxContainer, cxGroupBox, cxLabel, cxTextEdit, cxDBEdit, cxButtonEdit;

type
  TFNArt0002 = class(TfrmChild)
    Help: TjktHelpGenerico;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    jktExpDBGrid1: TjktExpDBGrid;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    mtTipoProd: TjktMemTable;
    mtDet: TjktMemTable;
    mtTipoProdoid_tipo: TIntegerField;
    mtTipoProdCodigo: TStringField;
    mtTipoProddescr: TStringField;
    mtTipoProdActivo: TBooleanField;
    mtDetoid_det: TIntegerField;
    mtDetoid_tipo: TIntegerField;
    mtDetorden: TIntegerField;
    mtDetoid_carac: TIntegerField;
    mtDetdes_carac: TStringField;
    mtDetcod_carac: TStringField;
    mtDetActivo: TBooleanField;
    mtDetoblig: TBooleanField;
    mtDetarma_cod: TBooleanField;
    mtDetarma_desc: TBooleanField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    dsTipoProd: TDataSource;
    dsDet: TDataSource;
    jktExpDBGrid1DBTableView1oid_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_tipo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1orden: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_carac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1cod_carac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1des_carac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1Activo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oblig: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1arma_cod: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1arma_desc: TcxGridDBColumn;
    HelpCarac: TjktHelpGenerico;
    ValCarac: TjktValidador;
    procedure jktExpDBGrid1DBTableView1cod_caracPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure mtTipoProdNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFNArt0002.jktExpDBGrid1DBTableView1cod_caracPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  HelpCarac.Ejecutar;
end;

procedure TFNArt0002.mtTipoProdNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    mtTipoProd.FieldByName('Activo').AsBoolean := True;
end;

initialization
  RegisterClass(TFNArt0002);


end.
