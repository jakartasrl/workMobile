unit jktFNCla0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0011, Data.DB, kbmMemTable,
  jktCNMet0012, jktCNMet0030, jktCNMet0002, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, dxBar, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxDBEdit, cxLabel, cxTextEdit, cxGroupBox,
  jktCNMet0014, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxTLData, cxDBTL, Vcl.Menus;

type
  TFNCla0001 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    txtCodigo: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    OperTraerEntidades: TjktOperacion;
    cxDBCheckBox2: TcxDBCheckBox;
    mtEntidades: TjktMemTable;
    mtEntidadesoid_Entidad: TIntegerField;
    mtEntidadesDescripcion: TStringField;
    mtClasificador: TjktMemTable;
    mtClasificadoroid_Clasificador: TIntegerField;
    mtClasificadorCodigo: TStringField;
    mtClasificadorDescripcion: TStringField;
    mtClasificadorActivo: TBooleanField;
    dsClasificador: TDataSource;
    mtClasificadoroid_Entidad: TIntegerField;
    mtClasificadorObligatorio: TBooleanField;
    Help: TjktHelpGenerico;
    dsComponentesClasificador: TDataSource;
    mtComponentesClasificador: TjktMemTable;
    mtComponentesClasificadoroid_CompClasif: TIntegerField;
    mtComponentesClasificadoroid_Nivel: TIntegerField;
    mtComponentesClasificadorCodigo: TStringField;
    mtComponentesClasificadorDescripcion: TStringField;
    mtComponentesClasificadorActivo: TBooleanField;
    cxDBTreeList1: TcxDBTreeList;
    mtComponentesClasificadoroid_Clasificador: TIntegerField;
    mtComponentesClasificadoroid_NivelPadre: TIntegerField;
    cxDBTreeList1oid_CompClasif: TcxDBTreeListColumn;
    cxDBTreeList1oid_Clasificador: TcxDBTreeListColumn;
    cxDBTreeList1oid_Nivel: TcxDBTreeListColumn;
    cxDBTreeList1oid_NivelPadre: TcxDBTreeListColumn;
    cxDBTreeList1Codigo: TcxDBTreeListColumn;
    cxDBTreeList1Descripcion: TcxDBTreeListColumn;
    cxDBTreeList1Activo: TcxDBTreeListColumn;
    valCodigo2: TjktValidador;
    valCodigo1: TjktValidador;
    PopupMenu: TPopupMenu;
    menAnadirSubNivel: TMenuItem;
    procedure menAnadirSubNivelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TFNCla0001.menAnadirSubNivelClick(Sender: TObject);
var
  oid_NivelPadre: Integer;
begin
  inherited;

  if mtComponentesClasificador.IsEmpty then
    oid_NivelPadre := -1
  else
    oid_NivelPadre := mtComponentesClasificador.FieldByName('oid_Nivel').Value;

  mtComponentesClasificador.Append;
  mtComponentesClasificador.FieldByName('oid_NivelPadre').Value := oid_NivelPadre;
  mtComponentesClasificador.FieldByName('Activo').Value := True;
end;



initialization
  RegisterClass(TFNCla0001);

end.
