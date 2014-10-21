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
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, jktCNMet0014,
  dxLayoutLookAndFeels, cxSplitter, cxGroupBox;

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
    jktExpDBGrid1DBTableView1oid_ValorCarac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_Art: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_Carac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescCarac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1TipoDeDato: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1CodValorCarac: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1DescValorCarac: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_EquivArt: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_Art: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_UnidMedOrig: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1CodUnidMedOrig: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1DescUnidMedOrig: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_UnidMedDest: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1CodUnidMedDest: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1DescUnidMedDest: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1FactConv: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1Activo: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1oid_ClasifProd: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1oid_Art: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1oid_Clasif: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1DescClasif: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1oid_ValorClasif: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1CodValorClasif: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1DescValorClasif: TcxGridDBColumn;
    jktExpDBGrid4DBTableView1Activo: TcxGridDBColumn;
    HelpValorCarac: TjktHelpGenerico;
    mtValoresCaracProdoid_TablaValores: TIntegerField;
    jktExpDBGrid1DBTableView1oid_TablaValores: TcxGridDBColumn;
    HelpValorClasifProd: TjktHelpGenerico;
    opTraerCaractProducto: TjktOperacion;
    ValUnidStockPrinc: TjktValidador;
    ValUnidStockSecun: TjktValidador;
    HelpUnidStockPrinc: TjktHelpGenerico;
    HelpUnidStockSecun: TjktHelpGenerico;
    HelpUnidStockTerc: TjktHelpGenerico;
    ValUnidStockTerc: TjktValidador;
    HelpUnidVenta: TjktHelpGenerico;
    HelpUnidProd: TjktHelpGenerico;
    HelpUnidCompra: TjktHelpGenerico;
    ValUnidVenta: TjktValidador;
    ValUnidProd: TjktValidador;
    ValUnidCompra: TjktValidador;
    jktHelpGenerico1: TjktHelpGenerico;
    jktHelpGenerico2: TjktHelpGenerico;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    procedure jktExpDBGrid1DBTableView1CodValorCaracPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxDBCheckBox1PropertiesChange(Sender: TObject);
    procedure jktExpDBGrid4DBTableView1CodValorClasifPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure mtArticulooid_TipoArtValidate(Sender: TField);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit5PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit6PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNArt0001.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidStockPrinc.Ejecutar;
end;

procedure TFNArt0001.cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidStockSecun.Ejecutar;
end;

procedure TFNArt0001.cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidStockTerc.Ejecutar;
end;

procedure TFNArt0001.cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidVenta.Ejecutar;
end;

procedure TFNArt0001.cxDBButtonEdit5PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidProd.Ejecutar;
end;

procedure TFNArt0001.cxDBButtonEdit6PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  HelpUnidCompra.Ejecutar;
end;

procedure TFNArt0001.cxDBCheckBox1PropertiesChange(Sender: TObject);
begin
  inherited;

  if TcxDBCheckBox(Sender).Tag = 0 then
    begin
      // presionó sobre 'Bien'
      cxDBCheckBox2.Checked := not cxDBCheckBox1.Checked;
    end
  else
    begin
      // presionó sobre 'Servicio'
      cxDBCheckBox1.Checked := not cxDBCheckBox2.Checked;
    end;

  if cxDBCheckBox1.Checked then
    begin
      // Si está marcado 'Bien', muestro la sección de 'Especificaciones de Producto',
      // la de 'Apertura de Stock' y 'Unidades de Medida'
      lcMainGroup9.Visible  := True;
      lcMainGroup11.Visible := True;
      lcMainGroup12.Visible := True;
    end
  else
    begin
      // Si está marcado 'Servicio', oculto la sección de 'Especificaciones de Producto',
      // la de 'Apertura de Stock' y 'Unidades de Medida'
      lcMainGroup9.Visible  := False;
      lcMainGroup11.Visible := False;
      lcMainGroup12.Visible := False;
    end;
end;

procedure TFNArt0001.jktExpDBGrid1DBTableView1CodValorCaracPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if mtValoresCaracProd.FieldByName('TipoDeDato').AsString = 'Tabla' then
    HelpValorCarac.Ejecutar;
end;

procedure TFNArt0001.jktExpDBGrid4DBTableView1CodValorClasifPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if HelpValorClasifProd.Ejecutar then
    mtClasifProd.FieldByName('DescValorClasif').AsString :=
      HelpValorClasifProd.GetDescripcion
  else ;
end;

procedure TFNArt0001.mtArticulooid_TipoArtValidate(Sender: TField);
begin
  inherited;

  if not Service.ModoExecute then
    opTraerCaractProducto.execute;
end;

procedure TFNArt0001.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  if cxDBCheckBox2.Checked then
    begin
      // Si es un 'Servicio', vacío las tablas no necesarias ('Especificaciones de Producto',
      // 'Apertura de Stock' y 'Unidades de Medida')
      mtValoresCaracProd.EmptyTable;
      mtAperturaStock.EmptyTable;
      mtEquivalencias.EmptyTable;
    end;
end;

initialization
  RegisterClass(TFNArt0001);


end.
