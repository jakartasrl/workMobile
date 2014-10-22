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
  cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter, cxGroupBox,
  cxMaskEdit, cxDropDownEdit, cxCheckBox, cxLabel, jktCNMet0008,
  cxGridBandedTableView, cxGridDBBandedTableView, Vcl.FileCtrl, jktCNMet0014;

type
  TFNLab0001 = class(TfrmChild)
    TDet: TjktMemTable;
    TVal: TjktMemTable;
    DSDet: TDataSource;
    DSVal: TDataSource;
    TDetoid_det: TIntegerField;
    TDetcod_det: TStringField;
    TDetdes_det: TStringField;
    TDettipo_res: TStringField;
    TDetactivo: TBooleanField;
    TValoid_carac: TIntegerField;
    TValvalor_desde: TFloatField;
    TValvalor_hasta: TFloatField;
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
    operParam: TjktOperacion;
    mtParametrosFormoid_param: TIntegerField;
    mtParametrosFormcodigo: TStringField;
    mtParametrosFormdescripcion: TStringField;
    mtParametrosFormvalor_cadena: TStringField;
    mtParametrosFormvalor_entero: TIntegerField;
    mtParametrosFormvalor_fecha: TStringField;
    mtParametrosFormvalor_float: TFloatField;
    mtParametrosFormvalor_boolean: TBooleanField;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxLabel2: TcxLabel;
    cxDBComboBox1: TcxDBComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBComboBox2: TcxDBComboBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxGroupBox2: TcxGroupBox;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxSplitter1: TcxSplitter;
    cxGroupBox5: TcxGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    TDetcalc_res: TBooleanField;
    TDetformato: TStringField;
    TDetley_cero: TStringField;
    TMet: TjktMemTable;
    TMetoid_det: TIntegerField;
    TMetoid_met: TIntegerField;
    TMetmetodo: TStringField;
    TMetexpresion: TStringField;
    DSMet: TDataSource;
    TVallimite: TStringField;
    jktExpDBGrid1DBTableView1metodo: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1expresion: TcxGridDBColumn;
    cxGrid2DBTableView1valor_desde: TcxGridDBColumn;
    cxGrid2DBTableView1valor_hasta: TcxGridDBColumn;
    cxGrid2DBTableView1limite: TcxGridDBColumn;
    TValoid_val: TIntegerField;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView1valor_desde: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1valor_hasta: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1limite: TcxGridDBBandedColumn;
    TValoid_met: TIntegerField;
    TVar: TjktMemTable;
    TVaroid_met: TIntegerField;
    TVaroid_var: TIntegerField;
    TVarcod_var: TStringField;
    TVardes_var: TStringField;
    DSVar: TDataSource;
    cxGrid1DBTableView1cod_var: TcxGridDBColumn;
    cxGrid1DBTableView1des_var: TcxGridDBColumn;
    hlpDeter: TjktHelpGenerico;
    TVaractivo: TBooleanField;
    TMetactivo: TBooleanField;
    TValactivo: TBooleanField;
    procedure TValNewRecord(DataSet: TDataSet);
    procedure TDetNewRecord(DataSet: TDataSet);
    procedure TMetNewRecord(DataSet: TDataSet);
    procedure TVarNewRecord(DataSet: TDataSet);
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
  //inherited;
  TLabo.Open;
  TLabo.Append;
  valLaboratorio.validar(mtParametroInicial.FieldByName('entidad'));
  mtParametroInicial.Append;
  mtParametroInicial.FieldByName('entidad').AsString := 'CaracProdValDet';
  operParam.execute;
  cxGrid2DBBandedTableView1.Bands[0].Caption := mtParametrosForm.FieldByName('valor_cadena').AsString;
end;

procedure TFNLab0001.TDetNewRecord(DataSet: TDataSet);
begin
  inherited;
   if (not Service.ModoExecute)
       then begin
               TDet.fieldByName('oid_det').AsInteger := self.GetNewOid;
               TDet.fieldByName('oid_lab').AsInteger := TLabo.FieldByName('oid_lab').AsInteger;
               TDet.fieldByName('activo').AsBoolean  := true;
            end;
end;

procedure TFNLab0001.TMetNewRecord(DataSet: TDataSet);
begin
  inherited;
   if (not Service.ModoExecute)
       then begin
               TMet.fieldByName('oid_met').AsInteger := self.GetNewOid;
               TMet.fieldByName('oid_det').AsInteger := TDet.FieldByName('oid_det').AsInteger;
            end;
end;

procedure TFNLab0001.TValNewRecord(DataSet: TDataSet);
begin
  inherited;
    if (not Service.ModoExecute)
       then begin
               TVal.fieldByName('oid_val').AsInteger := self.GetNewOid;
               TVal.fieldByName('oid_met').AsInteger := TMet.FieldByName('oid_met').AsInteger;
               TVal.FieldByName('oid_carac').AsInteger := mtParametrosForm.FieldByName('valor_entero').AsInteger;
            end;
end;


procedure TFNLab0001.TVarNewRecord(DataSet: TDataSet);
begin
  inherited;
  if (not Service.ModoExecute)
       then begin
               TVar.fieldByName('oid_var').AsInteger := self.GetNewOid;
               TVar.fieldByName('oid_met').AsInteger := TMet.FieldByName('oid_met').AsInteger;
            end;
end;

initialization
  RegisterClass(TFNLab0001);

end.
