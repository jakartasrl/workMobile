unit jktFNVen0001;

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
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008,
  cxGridBandedTableView, cxGridDBBandedTableView;

type
  TFNVen0001 = class(TfrmChild)
    jktExpDBGrid1: TjktExpDBGrid;
    jktExpDBGrid1Level1: TcxGridLevel;
    mtConc: TjktMemTable;
    dsConc: TDataSource;
    mtConcoid_conc: TIntegerField;
    mtConccod_conc: TStringField;
    mtConcdes_conc: TStringField;
    mtConcpide_art: TBooleanField;
    mtConcoid_val_cla: TIntegerField;
    mtConccod_val_cla: TStringField;
    mtConcdes_val_cla: TStringField;
    jktExpDBGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    jktExpDBGrid1DBBandedTableView1oid_conc: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1cod_conc: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1des_conc: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1pide_art: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1oid_val_cla: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1cod_val_cla: TcxGridDBBandedColumn;
    jktExpDBGrid1DBBandedTableView1des_val_cla: TcxGridDBBandedColumn;
    opTraerParametro: TjktOperacion;
    mtParametroInicialNombreParametro: TStringField;
    mtParametrosFormoid_param: TIntegerField;
    mtParametrosFormcodigo: TStringField;
    mtParametrosFormdescripcion: TStringField;
    mtParametrosFormvalor_cadena: TStringField;
    mtParametrosFormvalor_entero: TIntegerField;
    mtParametrosFormvalor_fecha: TStringField;
    mtParametrosFormvalor_decimal: TFloatField;
    mtParametrosFormvalor_boolean: TBooleanField;
    procedure opTraerParametroBeforeEjecutar(Sender: TObject);
    procedure opTraerParametroAfterEjecutar(Sender: TObject);
    procedure mtConcNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNVen0001.mtConcNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    begin
      mtParametrosForm.First;
      if not mtParametrosForm.Locate('codigo', 'ClasifConceptos', [loCaseInsensitive]) then
        raise Exception.Create('Código de Parámetro inexistente ' );

  //    result := TParametrosFormvalor_entero.AsInteger;

    end;
end;

procedure TFNVen0001.opTraerParametroAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Como ahora estamos pidiendo UN SOLO parámetro, habrá una sola fila en
  // la tabla 'mtParametrosForm'
end;

procedure TFNVen0001.opTraerParametroBeforeEjecutar(Sender: TObject);
begin
  inherited;

  // Esto se reemplazará cuando se recuperen TODOS los parametros del Form
  if not mtParametroInicial.Active
    then begin
      mtParametroInicial.Open;
      mtParametroInicial.Append;
    end;

  mtParametroInicial.FieldByName('NombreParametro').AsString := 'ClasifConceptos';
end;

initialization
  RegisterClass(TFNVen0001);


end.
