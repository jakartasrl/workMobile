unit jktFNArt0001;

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
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxCheckBox, cxMemo, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, jktCNMet0008, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, jktCNMet0014;

type
  TFNArt0001 = class(TfrmChild)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    lcMainGroup1: TdxLayoutGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    lcMainItem1: TdxLayoutItem;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBCheckBox1: TcxDBCheckBox;
    lcMainItem4: TdxLayoutItem;
    cxDBCheckBox2: TcxDBCheckBox;
    lcMainItem5: TdxLayoutItem;
    cxDBCheckBox3: TcxDBCheckBox;
    lcMainItem6: TdxLayoutItem;
    cxDBCheckBox4: TcxDBCheckBox;
    lcMainItem7: TdxLayoutItem;
    cxDBCheckBox5: TcxDBCheckBox;
    lcMainItem8: TdxLayoutItem;
    cxDBCheckBox6: TcxDBCheckBox;
    lcMainItem9: TdxLayoutItem;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainSeparatorItem2: TdxLayoutSeparatorItem;
    lcMainGroup6: TdxLayoutGroup;
    lcMainGroup7: TdxLayoutGroup;
    lcMainSeparatorItem3: TdxLayoutSeparatorItem;
    cxDBMemo1: TcxDBMemo;
    lcMainGroup8: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    lcMainGroup10: TdxLayoutGroup;
    lcMainGroup11: TdxLayoutGroup;
    lcMainGroup12: TdxLayoutGroup;
    lcMainGroup13: TdxLayoutGroup;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    lcMainItem10: TdxLayoutItem;
    jktExpDBGrid2DBTableView1: TcxGridDBTableView;
    jktExpDBGrid2Level1: TcxGridLevel;
    jktExpDBGrid2: TjktExpDBGrid;
    lcMainItem11: TdxLayoutItem;
    jktExpDBGrid3DBTableView1: TcxGridDBTableView;
    jktExpDBGrid3Level1: TcxGridLevel;
    jktExpDBGrid3: TjktExpDBGrid;
    lcMainItem12: TdxLayoutItem;
    jktExpDBGrid4DBTableView1: TcxGridDBTableView;
    jktExpDBGrid4Level1: TcxGridLevel;
    jktExpDBGrid4: TjktExpDBGrid;
    lcMainItem13: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    lcMainItem14: TdxLayoutItem;
    cxDBButtonEdit1: TcxDBButtonEdit;
    lcMainItem15: TdxLayoutItem;
    cxDBButtonEdit2: TcxDBButtonEdit;
    lcMainItem16: TdxLayoutItem;
    cxDBButtonEdit3: TcxDBButtonEdit;
    lcMainItem17: TdxLayoutItem;
    cxDBButtonEdit4: TcxDBButtonEdit;
    lcMainItem18: TdxLayoutItem;
    cxDBButtonEdit5: TcxDBButtonEdit;
    lcMainItem19: TdxLayoutItem;
    cxDBButtonEdit6: TcxDBButtonEdit;
    lcMainItem20: TdxLayoutItem;
    lcMainSpaceItem1: TdxLayoutEmptySpaceItem;
    lcMainSpaceItem2: TdxLayoutEmptySpaceItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem21: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcMainItem22: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    lcMainItem23: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    lcMainItem24: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    lcMainItem25: TdxLayoutItem;
    cxDBTextEdit8: TcxDBTextEdit;
    lcMainItem26: TdxLayoutItem;
    lcMainGroup14: TdxLayoutGroup;
    lcMainGroup15: TdxLayoutGroup;
    lcMainGroup16: TdxLayoutGroup;
    lcMainGroup17: TdxLayoutGroup;
    lcMainGroup18: TdxLayoutGroup;
    lcMainGroup19: TdxLayoutGroup;
    mtArticulo: TjktMemTable;
    mtValoresCaracProd: TjktMemTable;
    mtAperturaStock: TjktMemTable;
    mtEquivalencias: TjktMemTable;
    mtClasifProd: TjktMemTable;
    mtTiposDeProducto: TjktMemTable;
    dsArticulo: TDataSource;
    dsValoresCaracProd: TDataSource;
    dsAperturaStock: TDataSource;
    dsEquivalencias: TDataSource;
    dsClasifProd: TDataSource;
    dsTiposDeProducto: TDataSource;
    mtArticulooid_Art: TIntegerField;
    mtArticuloCodigo: TStringField;
    mtArticuloDescripcion: TStringField;
    mtArticuloDescAbrev: TStringField;
    mtArticulooid_TipoArt: TIntegerField;
    mtArticuloActivo: TBooleanField;
    mtArticuloEsBien: TBooleanField;
    mtArticuloEsServicio: TBooleanField;
    mtArticuloEsStockeable: TBooleanField;
    mtArticuloEsProdPropia: TBooleanField;
    mtArticuloEsComprable: TBooleanField;
    mtArticuloEsVendible: TBooleanField;
    mtArticulooid_UnidStockPrinc: TIntegerField;
    mtArticulooid_UnidStockSecun: TIntegerField;
    mtArticulooid_UnidStockTerc: TIntegerField;
    mtArticulooid_UnidVenta: TIntegerField;
    mtArticulooid_UnidProd: TIntegerField;
    mtArticulooid_UnidCompra: TIntegerField;
    mtArticuloCodUnidStockPrinc: TStringField;
    mtArticuloDescUnidStockPrinc: TStringField;
    mtArticuloCodUnidStockSecun: TStringField;
    mtArticuloDescUnidStockSecun: TStringField;
    mtArticuloCodUnidStockTerc: TStringField;
    mtArticuloDescUnidStockTerc: TStringField;
    mtArticuloCodUnidVenta: TStringField;
    mtArticuloDescUnidVenta: TStringField;
    mtArticuloCodUnidProd: TStringField;
    mtArticuloDescUnidProd: TStringField;
    mtArticuloCodUnidCompra: TStringField;
    mtArticuloDescUnidCompra: TStringField;
    mtValoresCaracProdoid_Art: TIntegerField;
    mtValoresCaracProdoid_ValorCarac: TIntegerField;
    mtValoresCaracProdoid_Carac: TIntegerField;
    mtValoresCaracProdDescCarac: TStringField;
    mtValoresCaracProdTipoDeDato: TStringField;
    mtValoresCaracProdCodValorCarac: TStringField;
    mtValoresCaracProdDescValorCarac: TStringField;
    mtTiposDeProductooid_TipoArt: TIntegerField;
    mtTiposDeProductoCodTipoArt: TStringField;
    mtTiposDeProductoDescTipoArt: TStringField;
    mtAperturaStockoid_Art: TIntegerField;
    mtEquivalenciasoid_EquivArt: TIntegerField;
    mtEquivalenciasoid_Art: TIntegerField;
    mtEquivalenciasoid_UnidMedOrig: TIntegerField;
    mtEquivalenciasoid_UnidMedDest: TIntegerField;
    mtEquivalenciasActivo: TBooleanField;
    mtEquivalenciasCodUnidMedOrig: TStringField;
    mtEquivalenciasDescUnidMedOrig: TStringField;
    mtEquivalenciasCodUnidMedDest: TStringField;
    mtEquivalenciasDescUnidMedDest: TStringField;
    mtEquivalenciasFactConv: TFloatField;
    mtClasifProdoid_ClasifProd: TIntegerField;
    mtClasifProdoid_Art: TIntegerField;
    mtClasifProdoid_Clasif: TIntegerField;
    mtClasifProdDescClasif: TStringField;
    mtClasifProdoid_ValorClasif: TIntegerField;
    mtClasifProdCodValorClasif: TStringField;
    mtClasifProdDescValorClasif: TStringField;
    mtClasifProdActivo: TBooleanField;
    Help: TjktHelpGenerico;
    opTraerClasifProd: TjktOperacion;
    opTraerTiposDeProducto: TjktOperacion;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNArt0001: TFNArt0001;

implementation

{$R *.dfm}

end.
