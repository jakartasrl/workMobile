unit jktFNVen0004;

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
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jktCNMet0008,
  cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TFNVen0004 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    jktExpDBGrid1DBTableView: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    mtItems: TjktMemTable;
    dsItems: TDataSource;
    mtItemsoid_item: TIntegerField;
    mtItemscant: TFloatField;
    mtItemsdetalle: TMemoField;
    mtItemsnro_cotiz: TIntegerField;
    mtItemsfecha: TDateTimeField;
    mtItemsdes_clie_sucu: TStringField;
    mtItemsdes_vend: TStringField;
    mtItemsnro_item: TIntegerField;
    cxGridPopupMenu: TcxGridPopupMenu;
    jktExpDBGrid1DBTableViewnro_cotiz: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewfecha: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewdes_clie_sucu: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewdes_vend: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewoid_item: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewnro_item: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewcant: TcxGridDBColumn;
    jktExpDBGrid1DBTableViewdetalle: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}


initialization
  RegisterClass(TFNVen0004);

end.
