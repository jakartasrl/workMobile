unit jktFNVen0006;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxButtonEdit, cxDBLookupComboBox, cxMemo, dxLayoutcxEditAdapters,
  dxLayoutContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxGridLayoutView, cxGridDBLayoutView, cxGridCustomLayoutView, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, jktCNMet0008, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  dxLayoutControl, dxLayoutLookAndFeels;

type
  TFNVen0006 = class(TfrmChild)
    lcMain: TdxLayoutControl;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBButtonEdit2: TcxDBButtonEdit;
    jktExpDBGrid5: TjktExpDBGrid;
    jktExpDBGrid5DBTableView1: TcxGridDBTableView;
    jktExpDBGrid5DBTableView1FechaSubida: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Usuario: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Comentario: TcxGridDBColumn;
    jktExpDBGrid5DBTableView1Archivo: TcxGridDBColumn;
    jktExpDBGrid5Level1: TcxGridLevel;
    cxDBButtonEdit3: TcxDBButtonEdit;
    cxDBButtonEdit4: TcxDBButtonEdit;
    cxGridItems: TcxGrid;
    DBLayoutView: TcxGridDBLayoutView;
    DBLayoutViewTipo: TcxGridDBLayoutViewItem;
    DBLayoutViewCodigo: TcxGridDBLayoutViewItem;
    DBLayoutViewDescripcion: TcxGridDBLayoutViewItem;
    DBLayoutViewCantidad: TcxGridDBLayoutViewItem;
    DBLayoutViewReferencia: TcxGridDBLayoutViewItem;
    DBLayoutViewItem1: TcxGridDBLayoutViewItem;
    DBLayoutViewDetalle: TcxGridDBLayoutViewItem;
    dxLayoutGroup1: TdxLayoutGroup;
    DBLayoutViewLayoutItem2: TcxGridLayoutItem;
    DBLayoutViewLayoutItem3: TcxGridLayoutItem;
    DBLayoutViewLayoutItem6: TcxGridLayoutItem;
    DBLayoutViewGroup2: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGridLayoutItem1: TcxGridLayoutItem;
    DBLayoutViewLayoutItem4: TcxGridLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    DBLayoutViewLayoutItem5: TcxGridLayoutItem;
    DBLayoutViewGroup4: TdxLayoutGroup;
    DBLayoutViewLayoutItem7: TcxGridLayoutItem;
    DBLayoutViewGroup3: TdxLayoutGroup;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    DBLayoutViewGroup5: TdxLayoutGroup;
    cxGridItemsLevel1: TcxGridLevel;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    lcMainItem2: TdxLayoutItem;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lcMainItem7: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    lcMainItem9: TdxLayoutItem;
    lcMainGroup11: TdxLayoutGroup;
    lcMainItem12: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup9: TdxLayoutGroup;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutItem2: TdxLayoutItem;
    lcMainGroup16: TdxLayoutGroup;
    lcMainItem20: TdxLayoutItem;
    lcMainItem3: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNVen0006: TFNVen0006;

implementation

{$R *.dfm}

end.
