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
  dxLayoutcxEditAdapters, cxTextEdit, cxDBEdit, cxLabel, cxDBLabel, cxMemo;

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
    mtItemnro_cotiz: TIntegerField;
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
    procedure OperacionTraerBeforeEjecutar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

uses
  jktFNVen0004;

procedure TFNVen0005.OperacionTraerBeforeEjecutar(Sender: TObject);
var
  HelpForm: TFNVen0004;
begin
  inherited;

  // OJO: Debo levantar un programa que funcione como Help... Es la primera vez
  // que NO usamos el Help Generico... El programa que funcione como Help debería
  // entonces devolverme un 'oid' seleccionado por el usuario (como lo hace siempre
  // el Help Generico), para que luego la 'OperacionTraer' del Driver funcione
  // y vaya a buscar sólo 1 registro!
  HelpForm := TFNVen0004.Create(Self);
  HelpForm.FormStyle := fsNormal;
  HelpForm.InicializarChild(nil);
end;

initialization
  RegisterClass(TFNVen0005);

end.
