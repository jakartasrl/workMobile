unit jktFNHlp0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0004, cxGraphics, cxControls,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0002, jktCNMet0030, kbmMemTable, jktCNMet0012, Vcl.Menus, cxSplitter,
  Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008, cxGroupBox, cxMemo;

type
  TFNHlp0001 = class(TFormHelpCustomizado)
    mtInputnro_cotiz: TIntegerField;
    mtInputfecha: TDateTimeField;
    mtInputdes_vend: TStringField;
    mtInputnro_item: TIntegerField;
    mtInputcant: TFloatField;
    mtInputdetalle: TMemoField;
    dbgHelpDBTableViewoid: TcxGridDBColumn;
    dbgHelpDBTableViewcodigo: TcxGridDBColumn;
    dbgHelpDBTableViewdescripcion: TcxGridDBColumn;
    dbgHelpDBTableViewseleccionado: TcxGridDBColumn;
    dbgHelpDBTableViewnro_cotiz: TcxGridDBColumn;
    dbgHelpDBTableViewfecha: TcxGridDBColumn;
    dbgHelpDBTableViewdes_vend: TcxGridDBColumn;
    dbgHelpDBTableViewnro_item: TcxGridDBColumn;
    dbgHelpDBTableViewcant: TcxGridDBColumn;
    dbgHelpDBTableViewdetalle: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}


procedure TFNHlp0001.FormShow(Sender: TObject);
begin
  inherited;

  dbgHelpDBTableView.DataController.Groups.FullExpand;
end;

initialization
  RegisterClass(TFNHlp0001);

end.
