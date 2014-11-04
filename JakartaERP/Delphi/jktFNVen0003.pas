unit jktFNVen0003;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxButtonEdit, cxCurrencyEdit, cxDropDownEdit, cxMemo, cxTextEdit,
  cxCalendar, cxImageComboBox, cxCheckBox, cxColorComboBox, cxProgressBar, cxTL,
  cxMaskEdit, cxTLdxBarBuiltInMenu, Vcl.Menus, cxScheduler, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerDateNavigator, cxSchedulerHolidays, cxSchedulerTimeGridView,
  cxSchedulerUtils, cxSchedulerWeekView, cxSchedulerYearView,
  cxSchedulerGanttView, cxSchedulerTreeListBrowser, dxSkinscxSchedulerPainter,
  cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutLookAndFeels, cxLabel, Vcl.StdCtrls,
  cxButtons, cxPC, cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView,
  cxInplaceContainer, cxDBTL, cxTLData, cxRadioGroup, cxDBEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, jktCNMet0008, dxLayoutControl, jktCNMet0011,
  kbmMemTable, jktCNMet0012, jktCNMet0030, jktCNMet0002, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, dxBar,
  cxSplitter, cxGroupBox, cxDBLookupComboBox, jktCNMet0014;

type
  TFNVen0003 = class(TfrmChild)
    lcMain: TdxLayoutControl;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxRadioButton6: TcxRadioButton;
    cxDBButtonEdit2: TcxDBButtonEdit;
    jktExpDBGrid5: TjktExpDBGrid;
    jktExpDBGrid5DBTableView1: TcxGridDBTableView;
    jktExpDBGrid5DBTableView1FechaSubida: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Usuario: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Comentario: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Archivo: TcxGridDBColumn;
    jktExpDBGrid5Level1: TcxGridLevel;
    dxLayoutGroup4: TdxLayoutGroup;
    lcMainGroup1: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainItem1: TdxLayoutItem;
    lcMainItem7: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    lcMainItem9: TdxLayoutItem;
    lcMainGroup11: TdxLayoutGroup;
    lcMainItem12: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    lcMainItem15: TdxLayoutItem;
    lcMainItem16: TdxLayoutItem;
    lcMainGroup10: TdxLayoutGroup;
    lcMainGroup14: TdxLayoutGroup;
    lcMainGroup15: TdxLayoutGroup;
    lcMainItem13: TdxLayoutItem;
    lcMainItem14: TdxLayoutItem;
    lcMainItem17: TdxLayoutItem;
    lcMainItem18: TdxLayoutItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutItem1: TdxLayoutItem;
    lcMainGroup16: TdxLayoutGroup;
    lcMainItem20: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    cxDBButtonEdit3: TcxDBButtonEdit;
    lcMainItem3: TdxLayoutItem;
    cxDBButtonEdit4: TcxDBButtonEdit;
    lcMainItem4: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    cxGridItems: TcxGrid;
    DBLayoutView: TcxGridDBLayoutView;
    DBLayoutViewCodigo: TcxGridDBLayoutViewItem;
    DBLayoutViewDescripcion: TcxGridDBLayoutViewItem;
    DBLayoutViewDetalle: TcxGridDBLayoutViewItem;
    dxLayoutGroup1: TdxLayoutGroup;
    DBLayoutViewGroup3: TdxLayoutGroup;
    DBLayoutViewLayoutItem2: TcxGridLayoutItem;
    DBLayoutViewLayoutItem3: TcxGridLayoutItem;
    DBLayoutViewLayoutItem6: TcxGridLayoutItem;
    DBLayoutViewGroup2: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGridItemsLevel1: TcxGridLevel;
    DBLayoutViewLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewTipo: TcxGridDBLayoutViewItem;
    DBLayoutViewLayoutItem4: TcxGridLayoutItem;
    DBLayoutViewCantidad: TcxGridDBLayoutViewItem;
    OpenDialog: TOpenDialog;
    Help: TjktHelpGenerico;
    mtItems: TjktMemTable;
    mtItemsdetalle: TMemoField;
    dsItems: TDataSource;
    mtArchivos: TjktMemTable;
    mtArchivosfecha_subida: TDateTimeField;
    mtArchivosusuario: TStringField;
    mtArchivoscomentario: TStringField;
    mtArchivosarchivo: TStringField;
    dsArchivos: TDataSource;
    mtCotizacion: TjktMemTable;
    dsCotizacion: TDataSource;
    mtCotizacionoid_cotiz: TIntegerField;
    mtCotizacionnro_cotiz: TIntegerField;
    mtCotizacionoid_clie: TIntegerField;
    mtCotizacioncod_clie: TStringField;
    mtCotizacionRazonSocial: TStringField;
    mtCotizacionoid_sucu: TIntegerField;
    mtCotizacionnro_sucu: TSmallintField;
    mtCotizaciondes_sucu: TStringField;
    mtCotizacionfecha: TDateTimeField;
    mtCotizacionoid_vend: TIntegerField;
    mtCotizacioncod_vend: TStringField;
    mtCotizaciondes_vend: TStringField;
    mtCotizacionoid_repre: TIntegerField;
    mtCotizacioncod_repre: TStringField;
    mtCotizaciondes_repre: TStringField;
    mtCotizacionrespCargaEmpr: TBooleanField;
    mtCotizacionrespCargaClie: TBooleanField;
    mtCotizacionrespDescargaEmpr: TBooleanField;
    mtCotizacionrespDescargaClie: TBooleanField;
    mtCotizacionrespTranspEmpr: TBooleanField;
    mtCotizacionrespTranspClie: TBooleanField;
    mtItemsoid_art: TIntegerField;
    mtItemscod_art: TStringField;
    mtItemsdes_abrev_art: TStringField;
    mtItemsoid_tipo: TIntegerField;
    mtItemscant: TFloatField;
    mtArchivosoid_arch: TIntegerField;
    mtArchivosoid_usu: TIntegerField;
    mtItemsoid_cotiz: TIntegerField;
    mtArchivosoid_cotiz: TIntegerField;
    mtItemsoid_item: TIntegerField;
    DBLayoutViewGroup1: TdxLayoutGroup;
    hlpVend: TjktHelpGenerico;
    hlpRepre: TjktHelpGenerico;
    hlpArt: TjktHelpGenerico;
    hlpClie: TjktHelpGenerico;
    hlpSucu: TjktHelpGenerico;
    mtTiposVenta: TjktMemTable;
    mtTiposVentaoid_tipo: TIntegerField;
    mtTiposVentades_tipo: TStringField;
    opTraerTiposDeVenta: TjktOperacion;
    dsTiposVenta: TDataSource;
    valClie: TjktValidador;
    valVend: TjktValidador;
    valRepre: TjktValidador;
    valArt: TjktValidador;
    procedure DriverNuevo(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
    procedure DBLayoutViewCodigoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure mtItemsNewRecord(DataSet: TDataSet);
    procedure mtArchivosNewRecord(DataSet: TDataSet);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  jktCNMet0005, ShellAPI;

procedure TFNVen0003.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpClie.Ejecutar then
    mtCotizacion.FieldByName('razonSocial').AsString := hlpClie.GetDescripcion;
end;

procedure TFNVen0003.cxDBButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpVend.Ejecutar then
    mtCotizacion.FieldByName('des_vend').AsString := hlpVend.GetDescripcion;
end;

procedure TFNVen0003.cxDBButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpSucu.Ejecutar then
    mtCotizacion.FieldByName('des_sucu').AsString := hlpSucu.GetDescripcion;
end;

procedure TFNVen0003.cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpRepre.Ejecutar then
    mtCotizacion.FieldByName('des_repre').AsString := hlpRepre.GetDescripcion;
end;

procedure TFNVen0003.DBLayoutViewCodigoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if hlpArt.Ejecutar then
    mtItems.FieldByName('des_abrev_art').AsString := hlpArt.GetDescripcion;
end;

procedure TFNVen0003.DriverNuevo(Sender: TObject);
begin
  inherited;

  lcMainItem2.Visible := False;
  mtCotizacion.Append;
  mtCotizacion.FieldByName('fecha').AsDateTime := Now;
end;

procedure TFNVen0003.jktExpDBGrid5DBTableView1ArchivoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;

  if AButtonIndex = 0 then begin
    if OpenDialog.Execute then
      mtArchivos.Edit;
      mtArchivosarchivo.AsString := OpenDialog.FileName
  end else if AButtonIndex = 1 then begin
    // Abro el archivo
    if (mtArchivos.FieldByName('archivo').AsString <> '') then
      ShellExecute(Self.Handle, 'open',
        PChar(mtArchivos.FieldByName('archivo').AsString), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TFNVen0003.mtArchivosNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    begin
      mtArchivos.FieldByName('oid_arch').AsInteger := GetNewOid;
      mtArchivos.FieldByName('fecha_subida').AsDateTime := Now();
      mtArchivos.FieldByName('oid_usu').AsInteger := Login.Usuario;
      mtArchivos.FieldByName('usuario').AsString := Login.ApeNom;
    end;
end;

procedure TFNVen0003.mtItemsNewRecord(DataSet: TDataSet);
begin
  inherited;

  if not Service.ModoExecute then
    mtItems.FieldByName('oid_item').AsInteger := GetNewOid;
end;

procedure TFNVen0003.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  mtCotizacion.Edit;
  mtCotizacion.FieldByName('respCargaClie').AsBoolean    := cxRadioButton2.Checked;
  mtCotizacion.FieldByName('respTranspClie').AsBoolean   := cxRadioButton4.Checked;
  mtCotizacion.FieldByName('respDescargaClie').AsBoolean := cxRadioButton6.Checked;
  mtCotizacion.Post;
end;

procedure TFNVen0003.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  lcMainItem2.Visible := True;

  if mtCotizacion.FieldByName('respCargaClie').AsBoolean then
    cxRadioButton2.Checked := True
  else
    cxRadioButton1.Checked := True;

  if mtCotizacion.FieldByName('respTranspClie').AsBoolean then
    cxRadioButton4.Checked := True
  else
    cxRadioButton3.Checked := True;

  if mtCotizacion.FieldByName('respDescargaClie').AsBoolean then
    cxRadioButton6.Checked := True
  else
    cxRadioButton5.Checked := True;
end;


initialization
  RegisterClass(TFNVen0003);

end.
