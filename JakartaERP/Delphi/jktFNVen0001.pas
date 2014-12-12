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
  cxGridBandedTableView, cxGridDBBandedTableView, jktCNMet0014, cxButtonEdit,
  cxContainer, cxSplitter, cxGroupBox;

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
    DBGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    DBGrid1DBBandedTableView1oid_conc: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1cod_conc: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1des_conc: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1pide_art: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1oid_val_cla: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1cod_val_cla: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1des_val_cla: TcxGridDBBandedColumn;
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
    mtConcoid_cla: TIntegerField;
    HelpValorClasif: TjktHelpGenerico;
    ValValorClasif: TjktValidador;
    mtConcoid_unid_med: TIntegerField;
    mtConccod_unid_med: TStringField;
    mtConcoid_mon: TIntegerField;
    mtConccod_mon: TStringField;
    DBGrid1DBBandedTableView1cod_unid_med: TcxGridDBBandedColumn;
    DBGrid1DBBandedTableView1cod_mon: TcxGridDBBandedColumn;
    hlpUnidMed: TjktHelpGenerico;
    hlpMoneda: TjktHelpGenerico;
    procedure opTraerParametroBeforeEjecutar(Sender: TObject);
    procedure opTraerParametroAfterEjecutar(Sender: TObject);
    procedure mtConcNewRecord(DataSet: TDataSet);
    procedure DBGrid1DBBandedTableView1cod_val_claPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure DBGrid1DBBandedTableView1cod_unid_medPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure DBGrid1DBBandedTableView1cod_monPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    oid_cla: Integer;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNVen0001.DBGrid1DBBandedTableView1cod_monPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  hlpMoneda.Ejecutar;
end;

procedure TFNVen0001.DBGrid1DBBandedTableView1cod_unid_medPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  hlpUnidMed.Ejecutar;
end;

procedure TFNVen0001.DBGrid1DBBandedTableView1cod_val_claPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if (mtConc.FieldByName('pide_art').AsBoolean) and (mtConc.FieldByName('oid_cla').AsInteger <> -1) then
    if HelpValorClasif.Ejecutar then
      mtConc.FieldByName('des_val_cla').AsString := HelpValorClasif.GetDescripcion;
end;

procedure TFNVen0001.mtConcNewRecord(DataSet: TDataSet);
begin
  inherited;

  // Siempre seteo el 'oid_clasificador', incluso cuando me llena la tabla el Servidor
  mtConc.FieldByName('oid_cla').AsInteger := oid_cla;

  if not Service.ModoExecute then
    mtConc.FieldByName('oid_conc').AsInteger := GetNewOid;
end;

procedure TFNVen0001.opTraerParametroAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Por ahora estamos pidiendo UN SOLO parámetro, habrá entonces una sola fila en
  // la tabla 'mtParametrosForm'. De todas maneras lo busco como si hubieran varios
  mtParametrosForm.First;
  if not mtParametrosForm.Locate('codigo', 'ClasifConceptos', [loCaseInsensitive]) then
    // 'Código de Parámetro inexistente'
    oid_cla := -1
  else
    oid_cla := mtParametrosForm.FieldByName('valor_entero').AsInteger;
end;

procedure TFNVen0001.opTraerParametroBeforeEjecutar(Sender: TObject);
begin
  inherited;

  // Esto se reemplazará cuando se recuperen TODOS los parámetros del Form
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
