unit santi02;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, StdCtrls, jktCMet002, jktCMet001, jktCMet005, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jktCMet008,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridLevel, cxGrid, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxMaskEdit, cxCheckBox,
  jktCMet023, jktCMet014, cxBlobEdit, cxGridDBTableView, cxContainer,
  cxTextEdit, cxButtonEdit, cxDBEdit, jktCMet022, jktCMet011, jktCMet013,
  Vcl.ComCtrls, jktCMet017, jktCMet018, cxEditRepositoryItems, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData, jktCMet024;

type
  TForm2 = class(TForm)
    Driver: TjktDriver;
    Oper: TjktOperacion;
    Button1: TButton;
    DataSource1: TDataSource;
    mtTipoCtaProv: TkbmMemTable;
    mtTipoCtaProvoid: TIntegerField;
    mtTipoCtaProvcodigo: TStringField;
    mtTipoCtaProvdescripcion: TStringField;
    mtTipoCtaProvvalidar: TBooleanField;
    mtTipoCtaProvactivo: TBooleanField;
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    cxGrid1: TjktExpDBGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1oid1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1codigo1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1descripcion1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1validar1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1activo1: TcxGridDBBandedColumn;
    jktImportCSV1: TjktImportCSV;
    Help1: TjktHelp;
    Button2: TButton;
    cxDBButtonEdit1: TcxDBButtonEdit;
    jktFiltro2: TjktFiltro;
    jktValidador1: TjktValidador;
    Button3: TButton;
    jktDBLeyenda1: TjktDBLeyenda;
    jktdxButtonEdit1: TjktdxButtonEdit;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    Button4: TButton;
    jktDBTreeList1: TjktDBTreeList;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OperNuevoDataSet(Sender: TObject; aDatasetName: String);
    procedure Button2Click(Sender: TObject);
    procedure mtTipoCtaProvcodigoValidate(Sender: TField);
    procedure jktdxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Button2Click(Sender: TObject);
begin
  Help1.Help(mtTipoCtaProv.fieldByName('descripcion'));
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  jktDBTreeList1.CrearColumn('Columna nueva', 'oid', '', nil, 150,
    taRightJustify, skMax);

  jktDBTreeList1.CrearBanda('Banda nueva');
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  oper.Host             := Login.Host;
  oper.Port             := Login.Port;
  oper.Servlet          := Login.Servlet;
  oper.Aplicacion       := Login.Aplicacion;
  oper.Protocolo        := Login.Protocolo;
  oper.Trace            := Login.Trace;
end;

procedure TForm2.jktdxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ShowMessage('ButtonClick');
end;

procedure TForm2.mtTipoCtaProvcodigoValidate(Sender: TField);
begin
  if (not Oper.modoexecute) then
    jktValidador1.searchByCodigo(Sender.Text);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  oper.InicioOperacion;
  oper.setOperacion('TraerTipoCtaProv');
  oper.execute;
end;

procedure TForm2.OperNuevoDataSet(Sender: TObject; aDatasetName: String);
begin
   if aDatasetName = 'mtTipoCtaProv' then
    oper.Dataset := mtTipoCtaProv;
end;

end.
