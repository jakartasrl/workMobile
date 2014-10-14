unit jktFNLab0001;

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
  cxEdit, cxTextEdit, cxDBEdit, Vcl.StdCtrls, Vcl.ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFNLab0001 = class(TfrmChild)
    TDet: TjktMemTable;
    TVal: TjktMemTable;
    DSDet: TDataSource;
    DSVal: TDataSource;
    TDetoid_det: TIntegerField;
    TDetcod_det: TStringField;
    TDetdes_det: TStringField;
    TDetmetodo: TStringField;
    TDettipo_res: TStringField;
    TDetactivo: TBooleanField;
    TValoid_det: TIntegerField;
    TValoid_carac: TIntegerField;
    TValvalor_desde: TFloatField;
    TValvalor_hasta: TFloatField;
    TValcod_tabla: TStringField;
    TValdes_tabla: TStringField;
    TValoid_tabla: TIntegerField;
    TVallimite_inf: TFloatField;
    TVallimite_sup: TFloatField;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    TDetkey: TIntegerField;
    TValkey: TIntegerField;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid1DBTableView1cod_det: TcxGridDBColumn;
    cxGrid1DBTableView1des_det: TcxGridDBColumn;
    cxGrid1DBTableView1metodo: TcxGridDBColumn;
    cxGrid1DBTableView1tipo_res: TcxGridDBColumn;
    cxGrid1DBTableView1activo: TcxGridDBColumn;
    cxGrid2DBTableView1valor_desde: TcxGridDBColumn;
    cxGrid2DBTableView1valor_hasta: TcxGridDBColumn;
    cxGrid2DBTableView1cod_tabla: TcxGridDBColumn;
    cxGrid2DBTableView1des_tabla: TcxGridDBColumn;
    cxGrid2DBTableView1limite_inf: TcxGridDBColumn;
    cxGrid2DBTableView1limite_sup: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    valDeter: TjktValidador;
    valTabla: TjktValidador;
    valLaboratorio: TjktValidador;
    TLabo: TjktMemTable;
    TLabooid_lab: TIntegerField;
    TLabodes_lab: TStringField;
    operTraerCarac: TjktOperacion;
    TCarac: TjktMemTable;
    TCaracoid_carac: TIntegerField;
    TCaraccod_carac: TStringField;
    TCaracdes_carac: TStringField;
    TDetoid_lab: TIntegerField;
    procedure TCabNewRecord(DataSet: TDataSet);
    procedure TValNewRecord(DataSet: TDataSet);
  private
    { Private declarations }

  protected
    procedure llamarOperacionConfiguracion; override;
  public
    { Public declarations }
  end;

var
  FNLab0001: TFNLab0001;

implementation

{$R *.dfm}

procedure TFNLab0001.llamarOperacionConfiguracion;
begin
  inherited;
  valLaboratorio.validar(mtParametroInicial.FieldByName('entidad').asString);
end;

procedure TFNLab0001.TCabNewRecord(DataSet: TDataSet);
begin
  inherited;
  if (not Service.ModoExecute)
     then begin
            Dataset.FieldByName('activo').AsBoolean := true;
            Dataset.FieldByName('oid_lab').AsBoolean := TLabo.FieldByName('oid_lab').AsInteger;
          end;

end;

procedure TFNLab0001.TValNewRecord(DataSet: TDataSet);
begin
  inherited;
    if (not Service.ModoExecute)
       then begin
               Dataset.FieldByName('activo').AsBoolean    := true;
               Dataset.FieldByName('oid_det').AsInteger   := TDet.FieldByName('oid_det').AsInteger;
               Dataset.FieldByName('oid_carac').AsInteger := TCarac.FieldByName('oid_carac').AsInteger;
            end;
end;

end.
