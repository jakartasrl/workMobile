unit jktFPampaVE0379;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jktCMet012, kbmMemTable, kbmMemCSVStreamFormat, Db,
  jktCMet002, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, jktCMet001, dxPSCore, ImgList, Menus, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, Mask, DBCtrls, jktCMet008;

type
  TFPampaVE0379 = class
    mtConsulta: TjktMemTable;
    DSConsulta: TDataSource;
    mtConsultasecu: TIntegerField;
    mtConsultanro_ped: TIntegerField;
    mtConsultacliente: TStringField;
    mtConsultavendedor: TStringField;
    mtConsultamoneda_ori: TStringField;
    mtConsultaimporte_ped_tot: TCurrencyField;
    mtConsultaimpo_facturas: TCurrencyField;
    mtConsultaimpo_facturas_varias: TCurrencyField;
    mtConsultaimpo_nc: TCurrencyField;
    mtConsultaimpo_remito: TCurrencyField;
    mtConsultasaldo_sin_facturar: TCurrencyField;
    mtConsultaoid_cco_ped: TIntegerField;
    mtConsultacotiz_ori: TCurrencyField;
    jktExpDBGrid1: TjktExpDBGrid;
    jktExpDBGrid1secu: TdxDBGridMaskColumn;
    jktExpDBGrid1oid_cco_ped: TdxDBGridMaskColumn;
    jktExpDBGrid1nro_ped: TdxDBGridMaskColumn;
    jktExpDBGrid1cliente: TdxDBGridMaskColumn;
    jktExpDBGrid1vendedor: TdxDBGridMaskColumn;
    jktExpDBGrid1moneda_ori: TdxDBGridMaskColumn;
    jktExpDBGrid1Column13: TdxDBGridColumn;
    jktExpDBGrid1importe_ped_tot: TdxDBGridCurrencyColumn;
    jktExpDBGrid1impo_facturas: TdxDBGridCurrencyColumn;
    jktExpDBGrid1impo_facturas_varias: TdxDBGridCurrencyColumn;
    jktExpDBGrid1impo_nc: TdxDBGridCurrencyColumn;
    jktExpDBGrid1impo_remito: TdxDBGridCurrencyColumn;
    jktExpDBGrid1saldo_sin_facturar: TdxDBGridCurrencyColumn;
    procedure jkDBClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure mtFiltroscod_clienteValidate(Sender: TField);
    procedure mtFiltrosnro_sucuValidate(Sender: TField);
    procedure DriverBuscar(Sender: TObject);
    procedure jktdxButtonEdit2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure mtFiltrosnro_ext_pedValidate(Sender: TField);
    procedure VerComprobantesAsociados1Click(Sender: TObject);
    procedure VerFacturasAsociadas1Click(Sender: TObject);
    procedure VerRemitosAsociados1Click(Sender: TObject);
    procedure VerComprobantePedido1Click(Sender: TObject);
  private
    { Private declarations }
    procedure HelpClientes();
    procedure ValidarClienteSucursal( codigoCliente: String; Sucursal: integer);
    procedure MostrarFacturasAsociadas(OidCcoPed: Integer );
    procedure MostarComprobante( OidCco: Integer );
    procedure MostrarRemitosAsociados( OidCco: Integer );
  public
    { Public declarations }
  end;

var
  FPampaVE0379: TFPampaVE0379;

implementation

{$R *.DFM}


end.
