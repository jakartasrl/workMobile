unit jktFNVen0010;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0011,
  Data.DB, kbmMemTable, jktCNMet0012, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxDBData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBLookupComboBox, cxButtonEdit, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxLayoutLookAndFeels, cxGridTableView, cxGridDBTableView,
  jktCNMet0008, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxGridLevel,
  cxGridLayoutView, cxGridCustomTableView, cxGridDBLayoutView, cxGridCustomView,
  cxGridCustomLayoutView, cxGrid, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  dxLayoutControl, jktCNMet0014;

type
  TFNVen0010 = class(TfrmChild)
    lcMain: TdxLayoutControl;
    dxLayoutGroup4: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem4: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    mtPrecios: TjktMemTable;
    mtPreciosoid_det: TIntegerField;
    mtPrecioscodigo: TStringField;
    mtPreciosdescripcion: TStringField;
    mtPreciosprecio: TFloatField;
    mtPreciosoid: TIntegerField;
    mtParametroInicialNroSolapa: TSmallintField;
    lcMainGroup1: TdxLayoutGroup;
    mtPreciosoid_mon: TIntegerField;
    mtPreciosfecha: TDateField;
    lcMainItem1: TdxLayoutItem;
    jktExpDBGrid4: TjktExpDBGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1oid_det: TcxGridDBColumn;
    cxGridDBTableView1oid: TcxGridDBColumn;
    cxGridDBTableView1codigo: TcxGridDBColumn;
    cxGridDBTableView1descripcion: TcxGridDBColumn;
    cxGridDBTableView1precio: TcxGridDBColumn;
    cxGridDBTableView1oid_mon: TcxGridDBColumn;
    cxGridDBTableView1fecha: TcxGridDBColumn;
    opTraerEntidades: TjktOperacion;
    dsMonedas: TDataSource;
    mtMonedas: TjktMemTable;
    mtMonedasoid: TIntegerField;
    mtMonedascodigo: TStringField;
    mtMonedasdescripcion: TStringField;
    mtParametroInicialOutputDatasetName: TStringField;
    cxDBTextEdit1: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    lcMainGroup6: TdxLayoutGroup;
    mtParametroInicialCodArtDes: TStringField;
    mtParametroInicialCodArtHas: TStringField;
    dsParametroInicial: TDataSource;
    jktExpDBGrid2: TjktExpDBGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    lcMainItem5: TdxLayoutItem;
    jktExpDBGrid3: TjktExpDBGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    procedure opTraerEntidadesBeforeEjecutar(Sender: TObject);
    procedure lcMainGroup5TabChanging(Sender: TObject; ANewTabIndex: Integer;
      var Allow: Boolean);
    procedure OperacionTraerBeforeEjecutar(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
  private
    FNroSolapa: Integer;

  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNVen0010.lcMainGroup5TabChanging(Sender: TObject;
  ANewTabIndex: Integer; var Allow: Boolean);
begin
  inherited;

  Allow := Driver.Cancelar;

  if Allow then
    FNroSolapa := TdxLayoutGroup(Sender).Items[ANewTabIndex].Tag;

//  Driver.FiltrarActivos;
end;

procedure TFNVen0010.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.Edit;
end;

procedure TFNVen0010.OperacionTraerBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.FieldByName('NroSolapa').AsInteger := FNroSolapa;
  // Hago un Post para forzar la llamada al OnValidate del campo que tiene foco.
  // Sino no se actualiza el último cambio en el campo.
  mtParametroInicial.Post;
end;

procedure TFNVen0010.opTraerEntidadesBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.Open;
  mtParametroInicial.Append;

  // Traigo las Monedas activas
  mtParametroInicial.FieldByName('Entidad').AsString := 'moneda';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtMonedas.Name;
end;

initialization
  RegisterClass(TFNVen0010);

end.
