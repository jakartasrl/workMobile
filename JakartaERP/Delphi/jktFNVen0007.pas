unit jktFNVen0007;

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
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxDBData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBLookupComboBox, cxButtonEdit, cxMemo, dxLayoutcxEditAdapters,
  dxLayoutContainer, dxLayoutLookAndFeels, cxGridTableView, cxGridDBTableView,
  jktCNMet0008, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxGridLevel,
  cxGridLayoutView, cxGridCustomTableView, cxGridDBLayoutView, cxGridCustomView,
  cxGridCustomLayoutView, cxGrid, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  dxLayoutControl, jktCNMet0014;

type
  TFNVen0007 = class(TfrmChild)
    lcMain: TdxLayoutControl;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    jktExpDBGrid1: TjktExpDBGrid;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid2: TjktExpDBGrid;
    jktExpDBGrid2DBTableView1: TcxGridDBTableView;
    jktExpDBGrid2Level1: TcxGridLevel;
    jktExpDBGrid3: TjktExpDBGrid;
    jktExpDBGrid3DBTableView1: TcxGridDBTableView;
    jktExpDBGrid3Level1: TcxGridLevel;
    dxLayoutGroup4: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainItem6: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup5: TdxLayoutGroup;
    lcMainItem7: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    cxDBTextEdit3: TcxDBTextEdit;
    lcMainItem1: TdxLayoutItem;
    cxDBDateEdit1: TcxDBDateEdit;
    lcMainItem3: TdxLayoutItem;
    lcMainGroup1: TdxLayoutGroup;
    Help: TjktHelpGenerico;
    mtListaPrecio: TjktMemTable;
    mtPreciosLaboQuim: TjktMemTable;
    mtPreciosLaboElec: TjktMemTable;
    mtPreciosMateriales: TjktMemTable;
    mtListaPreciooid: TIntegerField;
    mtListaPreciocodigo: TStringField;
    mtListaPreciodescripcion: TStringField;
    mtListaPreciovig_des: TDateField;
    mtListaPreciovig_has: TDateField;
    mtListaPreciodes_mon: TStringField;
    dsListaPrecio: TDataSource;
    dsPreciosLaboQuim: TDataSource;
    dsPreciosLaboElec: TDataSource;
    dsPreciosMateriales: TDataSource;
    mtPreciosLaboQuimoid_detalle: TIntegerField;
    mtPreciosLaboQuimoid_det: TIntegerField;
    mtPreciosLaboQuimcod_det: TStringField;
    mtPreciosLaboQuimdes_det: TStringField;
    mtPreciosLaboQuimprecio: TFloatField;
    mtPreciosLaboElecoid_detalle: TIntegerField;
    mtPreciosLaboElecoid_det: TIntegerField;
    mtPreciosLaboEleccod_det: TStringField;
    mtPreciosLaboElecdes_det: TStringField;
    mtPreciosLaboElecprecio: TFloatField;
    mtPreciosMaterialesoid_detalle: TIntegerField;
    mtPreciosMaterialesoid_pro: TIntegerField;
    mtPreciosMaterialescod_pro: TStringField;
    mtPreciosMaterialesdes_pro: TStringField;
    mtPreciosMaterialesprecio: TFloatField;
    jktExpDBGrid1DBTableView1oid_detalle: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1cod_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1des_det: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1precio: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1oid_detalle: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1oid_det: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1cod_det: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1des_det: TcxGridDBColumn;
    jktExpDBGrid2DBTableView1precio: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_detalle: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1oid_pro: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1cod_pro: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1des_pro: TcxGridDBColumn;
    jktExpDBGrid3DBTableView1precio: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


initialization
  RegisterClass(TFNVen0007);

end.
