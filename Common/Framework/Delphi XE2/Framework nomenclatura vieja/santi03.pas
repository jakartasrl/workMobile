unit santi03;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktCMet008, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, kbmMemTable, jktCMet012,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    mtTipoCtaProv: TkbmMemTable;
    mtTipoCtaProvoid: TIntegerField;
    mtTipoCtaProvcodigo: TStringField;
    mtTipoCtaProvdescripcion: TStringField;
    mtTipoCtaProvvalidar: TBooleanField;
    mtTipoCtaProvactivo: TBooleanField;
    mtConsulta: TjktMemTable;
    mtConsultasecu: TIntegerField;
    mtConsultaoid_cco_ped: TIntegerField;
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
    mtConsultacotiz_ori: TCurrencyField;
    Panel1: TPanel;
    Grilla: TjktExpDBGrid;
    GrillaDBTableView1: TcxGridDBTableView;
    GrillaLevel1: TcxGridLevel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Grid: TjktExpDBGrid;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
{
    Grid := TjktExpDBGrid.Create(Self);
    Grid.Parent := self;
    Grid.Align := alClient;

    Grid.Visible := True;
}
  if Grilla.DataSource <> nil then
    Grilla.DataSource :=  nil
  else
    Grilla.DataSource := DataSource1;
end;

end.
