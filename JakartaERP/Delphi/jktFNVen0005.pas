unit jktFNVen0005;

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
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, jktCNMet0014,
  dxSkinscxPCPainter, dxLayoutLookAndFeels, dxLayoutContainer, dxLayoutControl,
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxLabel, cxDBLabel, cxMemo,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008, cxTL, cxDBTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxCheckBox, cxTLData, cxRadioGroup, jktFNVen0008;

type
  TFNVen0005 = class(TfrmChild)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    lcMainGroup1: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    mtItem: TjktMemTable;
    mtItemfecha: TDateTimeField;
    mtItemdes_clie_sucu: TStringField;
    mtItemdes_vend: TStringField;
    mtItemoid_item: TIntegerField;
    mtItemdetalle_item: TMemoField;
    mtItemcod_art: TStringField;
    mtItemdes_abrev_art: TStringField;
    mtItemdes_tipo_item: TStringField;
    dsItem: TDataSource;
    cxDBTextEdit1: TcxDBTextEdit;
    lcMainItem1: TdxLayoutItem;
    cxDBTextEdit2: TcxDBTextEdit;
    lcMainItem2: TdxLayoutItem;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBTextEdit4: TcxDBTextEdit;
    lcMainItem4: TdxLayoutItem;
    cxDBTextEdit6: TcxDBTextEdit;
    lcMainItem7: TdxLayoutItem;
    cxDBTextEdit7: TcxDBTextEdit;
    lcMainItem8: TdxLayoutItem;
    lcMainGroup4: TdxLayoutGroup;
    cxDBLabel1: TcxDBLabel;
    lcMainItem5: TdxLayoutItem;
    lcMainGroup5: TdxLayoutGroup;
    cxDBMemo1: TcxDBMemo;
    lcMainItem6: TdxLayoutItem;
    Help: TjktHelpGenerico;
    cxDBButtonEdit1: TcxDBButtonEdit;
    lcMainItem9: TdxLayoutItem;
    cxDBTextEdit5: TcxDBTextEdit;
    lcMainItem10: TdxLayoutItem;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    lcMainItem11: TdxLayoutItem;
    lcMainGroup6: TdxLayoutGroup;
    mtTiposDeCambio: TjktMemTable;
    dsTiposDeCambio: TDataSource;
    mtTiposDeCambiooid_moneda: TIntegerField;
    mtTiposDeCambiocod_moneda: TStringField;
    mtTiposDeCambiodes_moneda: TStringField;
    mtTiposDeCambiocotizacion: TFloatField;
    opTraerTiposDeCambio: TjktOperacion;
    mtDetCotiz: TjktMemTable;
    hlpModelo: TjktHelpGenerico;
    mtCabCotiz: TjktMemTable;
    mtCabCotizoid_mod: TIntegerField;
    mtCabCotizcod_mod: TStringField;
    mtCabCotizdes_mod: TStringField;
    mtDetCotizcodInterno: TIntegerField;
    mtDetCotizcodInternoPadre: TIntegerField;
    mtDetCotizcod_titu_conc: TStringField;
    mtDetCotizdes_titu_conc: TStringField;
    mtDetCotizoid_conc: TIntegerField;
    mtDetCotiztipo: TStringField;
    mtDetCotizoid_art: TIntegerField;
    mtDetCotizdes_art: TStringField;
    opTraerModeloParaCotizar: TjktOperacion;
    dsCabCotiz: TDataSource;
    dsDetCotiz: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    lcMainItem13: TdxLayoutItem;
    mtDetCotizcant: TIntegerField;
    mtDetCotizoid_unid_med: TIntegerField;
    mtDetCotizimporte_unit: TFloatField;
    mtDetCotizoid_moneda: TIntegerField;
    mtDetCotizimporte_total: TFloatField;
    mtDetCotizimporte_total_2: TFloatField;
    mtCabCotizoid_cotiz: TIntegerField;
    mtDetCotizoid_cotiz: TIntegerField;
    mtDetCotizoid_det: TIntegerField;
    mtCabCotizoid_moneda_expresada: TIntegerField;
    mtDetCotizcod_unid_med: TStringField;
    hlpUnidMed: TjktHelpGenerico;
    cxDBTreeList1oid_det: TcxDBTreeListColumn;
    cxDBTreeList1oid_cotiz: TcxDBTreeListColumn;
    cxDBTreeList1oid_mod: TcxDBTreeListColumn;
    cxDBTreeList1codInterno: TcxDBTreeListColumn;
    cxDBTreeList1codInternoPadre: TcxDBTreeListColumn;
    cxDBTreeList1cod_titu_conc: TcxDBTreeListColumn;
    cxDBTreeList1des_titu_conc: TcxDBTreeListColumn;
    cxDBTreeList1tipo: TcxDBTreeListColumn;
    cxDBTreeList1oid_conc: TcxDBTreeListColumn;
    cxDBTreeList1oid_art: TcxDBTreeListColumn;
    cxDBTreeList1des_art: TcxDBTreeListColumn;
    cxDBTreeList1cant: TcxDBTreeListColumn;
    cxDBTreeList1oid_unid_med: TcxDBTreeListColumn;
    cxDBTreeList1cod_unid_med: TcxDBTreeListColumn;
    cxDBTreeList1importe_unit: TcxDBTreeListColumn;
    cxDBTreeList1oid_moneda: TcxDBTreeListColumn;
    cxDBTreeList1importe_total: TcxDBTreeListColumn;
    cxDBTreeList1importe_total_2: TcxDBTreeListColumn;
    cxStyleRepository: TcxStyleRepository;
    cxStyleDisabled: TcxStyle;
    lcMainGroup7: TdxLayoutGroup;
    mtItemnro_cotiz: TStringField;
    lcMainGroup8: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    lcMainSplitterItem1: TdxLayoutSplitterItem;
    opTraerEntidades: TjktOperacion;
    dsMonedas: TDataSource;
    mtMonedas: TjktMemTable;
    mtMonedasoid: TIntegerField;
    mtMonedascodigo: TStringField;
    mtMonedasdescripcion: TStringField;
    mtParametroInicialOutputDatasetName: TStringField;
    mtParametroInicialNombreParametro: TStringField;
    opTraerParametro: TjktOperacion;
    mtParametrosFormoid_param: TIntegerField;
    mtParametrosFormcodigo: TStringField;
    mtParametrosFormdescripcion: TStringField;
    mtParametrosFormvalor_cadena: TStringField;
    mtParametrosFormvalor_entero: TIntegerField;
    mtParametrosFormvalor_fecha: TStringField;
    mtParametrosFormvalor_float: TFloatField;
    mtParametrosFormvalor_boolean: TBooleanField;
    mtItemcod_estado: TStringField;
    cxCheckBox1: TcxCheckBox;
    lcMainItem14: TdxLayoutItem;
    mtCabCotizoid_item: TIntegerField;
    mtCabCotizcod_estado: TStringField;
    cxCheckBox2: TcxCheckBox;
    lcMainItem15: TdxLayoutItem;
    lcMainGroup10: TdxLayoutGroup;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    cxButton1: TcxButton;
    lcMainItem16: TdxLayoutItem;
    procedure OperacionTraerBeforeEjecutar(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure mtDetCotizCalcFields(DataSet: TDataSet);
    procedure cxDBLookupComboBox1PropertiesChange(Sender: TObject);
    procedure cxDBTreeList1cod_unid_medPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
    procedure OperacionSaveAfterEjecutar(Sender: TObject);
    procedure cxDBTreeList1importe_total_2TcxTreeListColumnSummaryFooterSummaryItems0GetText(
      Sender: TcxTreeListSummaryItem; const AValue: Variant; var AText: string);
    procedure cxDBTreeList1Editing(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
    procedure cxDBTreeList1StylesGetContentStyle(Sender: TcxCustomTreeList;
      AColumn: TcxTreeListColumn; ANode: TcxTreeListNode; var AStyle: TcxStyle);
    procedure cxDBTreeList1importe_totalGetDisplayText(
      Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: string);
    procedure FormCreate(Sender: TObject);
    procedure opTraerEntidadesBeforeEjecutar(Sender: TObject);
    procedure opTraerParametroBeforeEjecutar(Sender: TObject);
    procedure opTraerParametroAfterEjecutar(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxDBTreeList1importe_total_2GetDisplayText(
      Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFormTiposCambio: TFNVen0008;
    oid_MonedaPorDefecto: Integer;

  public
    { Public declarations }
  end;



implementation

{$R *.dfm}


procedure TFNVen0005.cxCheckBox1Click(Sender: TObject);
begin
  inherited;

  if cxCheckBox1.Checked then
    cxCheckBox2.Checked := False;
end;

procedure TFNVen0005.cxCheckBox2Click(Sender: TObject);
begin
  inherited;

  if cxCheckBox2.Checked then
    cxCheckBox1.Checked := False;
end;

procedure TFNVen0005.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpModelo.Ejecutar then
    begin
      mtCabCotiz.FieldByName('des_mod').AsString := hlpModelo.GetDescripcion;
      // Ya eligió un Modelo de Cotizador, nos traemos los datos del Modelo y
      // mostramos el árbol
      opTraerModeloParaCotizar.execute;
    end;
end;

procedure TFNVen0005.cxDBLookupComboBox1PropertiesChange(Sender: TObject);
begin
  inherited;

  // Le cambio el Caption a la última columna
  cxDBTreeList1importe_total_2.Caption.Text :=
    'Importe en ' + cxDBLookupComboBox1.Text;
end;

procedure TFNVen0005.cxDBTreeList1cod_unid_medPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  hlpUnidMed.Ejecutar;
end;

procedure TFNVen0005.cxDBTreeList1Editing(Sender: TcxCustomTreeList;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  inherited;

  if (TcxDBTreeList(Sender).DataController.Values
    [TcxDBTreeList(Sender).DataController.FocusedRecordIndex, cxDBTreeList1tipo.Position.ColIndex] <> 'C') then
      Allow := False;
end;

procedure TFNVen0005.cxDBTreeList1importe_totalGetDisplayText(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: string);
begin
  inherited;

  if (ANode.Texts[cxDBTreeList1tipo.Position.ColIndex] <> 'C') then
    Value := '';
end;

procedure TFNVen0005.cxDBTreeList1importe_total_2GetDisplayText(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: string);
begin
  inherited;

  if (ANode.Texts[cxDBTreeList1tipo.Position.ColIndex] <> 'C') then
    Value := '';
end;

procedure TFNVen0005.cxDBTreeList1importe_total_2TcxTreeListColumnSummaryFooterSummaryItems0GetText(
  Sender: TcxTreeListSummaryItem; const AValue: Variant; var AText: string);
begin
  inherited;

//  AText := cxDBLookupComboBox1.Text + ' ' + FormatFloat('0.00', AValue);
end;

procedure TFNVen0005.cxDBTreeList1StylesGetContentStyle(
  Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn; ANode: TcxTreeListNode;
  var AStyle: TcxStyle);
begin
  inherited;

  if (ANode.Texts[cxDBTreeList1tipo.Position.ColIndex] <> 'C') then
    AStyle := cxStyleDisabled;
end;

procedure TFNVen0005.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FFormTiposCambio.Free;
end;

procedure TFNVen0005.FormCreate(Sender: TObject);
begin
  inherited;

  FFormTiposCambio := TFNVen0008.Create(Self);
  FFormTiposCambio.Parent := Self;

  // El ancho debe ser el total de la pantalla
  cxGroupBoxLeft.Width  := 0;
  cxGroupBoxRight.Width := 0;
end;

procedure TFNVen0005.mtDetCotizCalcFields(DataSet: TDataSet);
var
  ImporteMonedaDefecto: Double;
begin
  inherited;

  DataSet.FieldByName('importe_total').AsFloat :=
    DataSet.FieldByName('cant').AsInteger * DataSet.FieldByName('importe_unit').AsFloat;

  ImporteMonedaDefecto := 0;
  // Primero paso el importe del registro actual a la moneda de curso legal
  if DataSet.FieldByName('oid_moneda').AsInteger = oid_MonedaPorDefecto then
    begin
      ImporteMonedaDefecto := DataSet.FieldByName('importe_total').AsFloat;
    end
  else
    if mtTiposDeCambio.Locate('oid_moneda', DataSet.FieldByName('oid_moneda').AsInteger, []) then
      begin
        ImporteMonedaDefecto := DataSet.FieldByName('importe_total').AsFloat *
          mtTiposDeCambio.FieldByName('cotizacion').AsFloat;
      end;

  if mtCabCotiz.FieldByName('oid_moneda_expresada').AsInteger = oid_MonedaPorDefecto then
    begin
      DataSet.FieldByName('importe_total_2').AsFloat := ImporteMonedaDefecto;
    end
  else
    // El importe expresado en la moneda de curso legal, lo expreso en la moneda que quieren!
    if mtTiposDeCambio.Locate('oid_moneda', mtCabCotiz.FieldByName('oid_moneda_expresada').AsInteger, []) then
      if mtTiposDeCambio.FieldByName('cotizacion').AsFloat <> 0 then
        DataSet.FieldByName('importe_total_2').AsFloat :=
          ImporteMonedaDefecto / mtTiposDeCambio.FieldByName('cotizacion').AsFloat;
end;

procedure TFNVen0005.OperacionSaveAfterEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := dsDetCotiz;
  cxDBTreeList1.FullExpand;
end;

procedure TFNVen0005.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := nil;

  mtItem.Editar;
  if cxCheckBox1.Checked then
    mtItem.FieldByName('cod_estado').AsString := '3'
  else
    if cxCheckBox2.Checked then
      mtItem.FieldByName('cod_estado').AsString := '4'
    else
      mtItem.FieldByName('cod_estado').AsString := '2';
  mtItem.Postear;

  mtCabCotiz.Editar;
  mtCabCotiz.FieldByName('oid_item').AsInteger :=
    mtItem.FieldByName('oid_item').AsInteger;
  // Le paso el 'cod_estado' a la tabla 'mtCabCotiz' para mandar una sola tabla
  // en la operación de Guardar, ya que el 'com.jkt.operaciones.GuardarLista' en
  // java, acepta por ahora un solo objeto
  mtCabCotiz.FieldByName('cod_estado').AsString :=
    mtItem.FieldByName('cod_estado').AsString;
  mtCabCotiz.Postear;
end;

procedure TFNVen0005.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  if (mtItem.FieldByName('cod_estado').AsString = '1') or
     (mtItem.FieldByName('cod_estado').AsString = '2') then

    begin
      // El ítem está "Pendiente de Cotizar" o bien "Cotizado pero No Autorizado"
      // Traigo los últimos Tipos de Cambio ya que los puede modificar
      opTraerTiposDeCambio.execute;

      lcMainGroup2.Enabled := True;
      lcMainGroup10.Enabled := True;
      cxDBTreeList1.OptionsData.Editing := True;

      cxCheckBox1.Caption := 'AUTORIZAR';
      cxCheckBox2.Caption := 'RECHAZAR';

      cxCheckBox1.Checked := False;
      cxCheckBox2.Checked := False;
    end
  else
    begin
      // Si el item es "Autorizado" se debe deshabilitar el botón 'Guardar'!

      lcMainGroup2.Enabled := False;
      lcMainGroup10.Enabled := False;
      cxDBTreeList1.OptionsData.Editing := False;

      cxCheckBox1.Caption := 'AUTORIZADO';
      cxCheckBox2.Caption := 'RECHAZADO';

      Driver.Opciones := Driver.Opciones - [opGuardar];

      if (mtItem.FieldByName('cod_estado').AsString = '3') then
        begin
          // 3 = "Autorizado"
          cxCheckBox1.Checked := True;
          cxCheckBox2.Checked := False;
        end
      else
        begin
          // 4 = "Rechazado"
          cxCheckBox1.Checked := False;
          cxCheckBox2.Checked := True;
        end;
    end;
end;

procedure TFNVen0005.OperacionTraerBeforeEjecutar(Sender: TObject);
begin
  inherited;

  // OJO: Debo levantar un programa que funcione como Help... Es la primera vez
  // que NO usamos el Help Generico... El programa que funcione como Help debería
  // entonces devolverme un 'oid' seleccionado por el usuario (como lo hace siempre
  // el Help Generico), para que luego la 'OperacionTraer' del Driver funcione
  // y vaya a buscar sólo 1 registro!

//  HelpForm := TFNVen0004.Create(Self);
//  HelpForm.FormStyle := fsNormal;
//  HelpForm.InicializarChild(nil);





//  1 = "Pendiente de Cotizar"
//  2 = "Cotizado pero No Autorizado"
//  3 = "Autorizado"
//  4 = "Rechazado"

  // Según el Estado del ítem, voy a llamar a distintas operaciones
  if mtItem.FieldByName('cod_estado').AsString = '1' then
    OperacionTraer.OperName := 'TraerItem'
  else
    OperacionTraer.OperName := 'TraerCotizacionDelItem';
end;

procedure TFNVen0005.opTraerEntidadesBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtParametroInicial.Open;
  mtParametroInicial.Append;

  // Traigo las Monedas activas
  mtParametroInicial.FieldByName('Entidad').AsString := 'moneda';
  mtParametroInicial.FieldByName('OutputDatasetName').AsString := mtMonedas.Name;
end;

procedure TFNVen0005.opTraerParametroAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Por ahora estamos pidiendo UN SOLO parámetro, habrá entonces una sola fila en
  // la tabla 'mtParametrosForm'. De todas maneras lo busco como si hubieran varios
  mtParametrosForm.First;
  if not mtParametrosForm.Locate('codigo', 'MonedaPorDefecto', [loCaseInsensitive]) then
    // 'Código de Parámetro inexistente'
    oid_MonedaPorDefecto := -1
  else
    oid_MonedaPorDefecto := mtParametrosForm.FieldByName('valor_entero').AsInteger;
end;

procedure TFNVen0005.opTraerParametroBeforeEjecutar(Sender: TObject);
begin
  inherited;

  // Esto se reemplazará cuando se recuperen TODOS los parámetros del Form
  mtParametroInicial.FieldByName('NombreParametro').AsString := 'MonedaPorDefecto';
end;

initialization
  RegisterClass(TFNVen0005);

end.
