unit jktFNLab0002;

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
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxTextEdit,
  cxDBEdit, Vcl.StdCtrls, Vcl.ExtCtrls, cxSplitter, cxGroupBox, jktCNMet0014,
  cxButtonEdit;

type
  TFNLab0002 = class(TfrmChild)
    valLaboratorio: TjktValidador;
    TLabo: TjktMemTable;
    TLabooid_lab: TIntegerField;
    TLabodes_lab: TStringField;
    TCab: TjktMemTable;
    TCaboid_ana: TIntegerField;
    TCabcod_ana: TStringField;
    TCabdes_ana: TStringField;
    TCaboid_lab: TIntegerField;
    TCabactivo: TBooleanField;
    TDet: TjktMemTable;
    TDetoid_det: TIntegerField;
    TDetcod_det: TStringField;
    TDetdes_det: TStringField;
    TDetactivo: TBooleanField;
    TDetkey: TIntegerField;
    DSDet: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    DSCab: TDataSource;
    TDetoid_ana: TIntegerField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1cod_det: TcxGridDBColumn;
    cxGrid1DBTableView1des_det: TcxGridDBColumn;
    cxGrid1DBTableView1activo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    valDeter: TjktValidador;
    valAna: TjktValidador;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    TDetoid_detalle: TIntegerField;
    Label1: TLabel;
    hlpAnalisis: TjktHelpGenerico;
    hlpDeter: TjktHelpGenerico;
    procedure FormCreate(Sender: TObject);
    procedure TCabNewRecord(DataSet: TDataSet);
    procedure TDetNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1cod_detPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }

  protected
    procedure llamarOperacionConfiguracion; override;

  public
    { Public declarations }
  end;

var
  FNLab0002: TFNLab0002;

implementation

{$R *.dfm}


procedure TFNLab0002.cxGrid1DBTableView1cod_detPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  hlpDeter.Ejecutar;
end;

procedure TFNLab0002.FormCreate(Sender: TObject);
begin
  inherited;
  FMultipleInstancia := True;
end;

procedure TFNLab0002.llamarOperacionConfiguracion;
begin
//  inherited;
  TLabo.Open;
  TLabo.Append;
  valLaboratorio.validar(mtParametroInicial.FieldByName('entidad'));
end;



procedure TFNLab0002.TCabNewRecord(DataSet: TDataSet);
begin
  inherited;
  if (not Service.ModoExecute)
       then begin
               TCab.fieldByName('oid_ana').AsInteger := self.GetNewOid;
               TCab.fieldByName('oid_lab').AsInteger := TLabo.FieldByName('oid_lab').AsInteger;
               TCab.fieldByName('activo').AsBoolean  := true;
            end;

end;

procedure TFNLab0002.TDetNewRecord(DataSet: TDataSet);
begin
  inherited;
  TDet.fieldByName('key').AsInteger := self.getNewKey();
   if (not Service.ModoExecute)
       then begin
               TDet.fieldByName('oid_detalle').AsInteger := self.GetNewOid;
               TDet.fieldByName('oid_ana').AsInteger := TDet.FieldByName('oid_ana').AsInteger;
               TDet.fieldByName('activo').AsBoolean  := true;

            end;
end;

initialization
  RegisterClass(TFNLab0002);
end.
