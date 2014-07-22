unit FUnit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  kbmMemTable, Vcl.Grids, Vcl.DBGrids, jktCMet002, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.DBCtrls, Vcl.Mask, jktCMet001,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, cxCheckBox,
  cxStyles, cxInplaceContainer, cxVGrid, cxDBVGrid, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    ds: TDataSource;
    IdHTTP1: TIdHTTP;
    Oper: TjktOperacion;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Driver: TjktDriver;
    mtTipoCtaProv: TkbmMemTable;
    mtTipoCtaProvoid: TIntegerField;
    mtTipoCtaProvcodigo: TStringField;
    mtTipoCtaProvdescripcion: TStringField;
    mtTipoCtaProvvalidar: TBooleanField;
    mtTipoCtaProvactivo: TBooleanField;
    chk_validar: TcxDBCheckBox;
    chk_activo: TcxDBCheckBox;
    edt_codigo: TcxDBTextEdit;
    edt_descripcion: TcxDBTextEdit;
    Button3: TButton;
    btn_anterior: TButton;
    btn_siguiente: TButton;
    Button5: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button6: TButton;
    procedure operNuevoDataSet(Sender: TObject; aDatasetName: string);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DriverOperacionTraer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DriverGuardar(Sender: TObject);
    procedure DriverLineaMensaje(Sender: TObject; Texto: string);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_siguienteClick(Sender: TObject);
    procedure cxGrid1ActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  jktCMet005;

procedure TForm1.btn_anteriorClick(Sender: TObject);
begin
  Driver.Anterior;
end;

procedure TForm1.btn_siguienteClick(Sender: TObject);
begin
  Driver.Proximo;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Driver.New;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Driver.Guardar;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Driver.Open;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//  DataSource1.DataSet := TArticulos;

  oper.InicioOperacion;
  oper.setOperacion('TraerSaldoStockArticulo');

  oper.addAtribute ('oculta_stk_fisico', false);
  oper.addAtribute('cod_desde', 1000);
  oper.addAtribute('cod_hasta', 2000);

  oper.execute;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  DBColumn: TcxGridDBColumn;
begin
  cxGrid1DBTableView1.DataController.DataSource := ds;
{
  cxGrid1DBTableView1.DataController.CreateAllItems; // creates items within a View for each field in the linked dataset
}

  // creamos las columnas de la grilla a mano
  DBColumn := cxGrid1DBTableView1.CreateColumn;
  DBColumn.DataBinding.FieldName := 'codigo';
  DBColumn.Name := 'cxGrid1DBTableView1Codigo';

  DBColumn := cxGrid1DBTableView1.CreateColumn;
  DBColumn.DataBinding.FieldName := 'descripcion';
  DBColumn.Name := 'cxGrid1DBTableView1Descripcion';

  DBColumn := cxGrid1DBTableView1.CreateColumn;
  DBColumn.DataBinding.FieldName := 'validar';
  DBColumn.Name := 'cxGrid1DBTableView1Validar';

  DBColumn := cxGrid1DBTableView1.CreateColumn;
  DBColumn.DataBinding.FieldName := 'activo';
  DBColumn.Name := 'cxGrid1DBTableView1Activo';

  // agrego un summary
  cxGrid1DBTableView1.OptionsView.Footer := True;
  DBColumn := cxGrid1DBTableView1.GetColumnByFieldName('codigo');
  cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.Add(DBColumn, spFooter, skCount);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  cxGrid1DBTableView1.ClearItems;
end;

procedure TForm1.cxGrid1ActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  showmessage('the end-user switch between grid levels at a nesting level using tabs');
end;

procedure TForm1.DriverGuardar(Sender: TObject);
begin
  oper.InicioOperacion;
  oper.setOperacion('SaveTipoCtaProv');
  driver.SetXMLSave(oper);
  oper.execute;
end;

procedure TForm1.DriverLineaMensaje(Sender: TObject; Texto: string);
begin
  Caption := Texto;
end;

procedure TForm1.DriverOperacionTraer(Sender: TObject);
begin
  oper.InicioOperacion;
  oper.setOperacion('TraerTipoCtaProv');
  oper.execute;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  caption := Login.ApeNom + ' - ' + Login.CurrentEmpresa.RazonSocial;

  oper.Host             := Login.Host;
  oper.Port             := Login.Port;
  oper.Servlet          := Login.Servlet;
  oper.Aplicacion       := Login.Aplicacion;
  oper.Protocolo        := Login.Protocolo;
  oper.HTTP.HTTPOptions := Login.HTTPOptions;
  oper.Trace            := Login.Trace;
end;

procedure TForm1.operNuevoDataSet(Sender: TObject; aDatasetName: string);
begin
  if aDatasetName = 'mtTipoCtaProv' then
    oper.Dataset := mtTipoCtaProv;
end;

end.
