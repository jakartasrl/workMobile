unit jktFNCla0002;

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
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxTLData, cxDBTL, jktCNMet0014, Vcl.Menus;

type
  TFNCla0002 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    txtCodigo: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    mtComponentesClasificador: TjktMemTable;
    mtComponentesClasificadoroid_Nivel: TIntegerField;
    mtComponentesClasificadoroid_NivelPadre: TIntegerField;
    mtComponentesClasificadorCodigo: TStringField;
    mtComponentesClasificadorDescripcion: TStringField;
    mtComponentesClasificadorActivo: TBooleanField;
    dsComponentesClasificador: TDataSource;
    mtClasificador: TjktMemTable;
    mtClasificadoroid_Clasificador: TIntegerField;
    mtClasificadorCodigo: TStringField;
    mtClasificadorDescripcion: TStringField;
    dsClasificador: TDataSource;
    cxGroupBox3: TcxGroupBox;
    cxDBTreeList1: TcxDBTreeList;
    cxGroupBox2: TcxGroupBox;
    cxDBTreeList2: TcxDBTreeList;
    mtValoresClasificador: TjktMemTable;
    mtValoresClasificadoroid_ValorClasif: TIntegerField;
    mtValoresClasificadoroid_Valor: TIntegerField;
    mtValoresClasificadoroid_ValorPadre: TIntegerField;
    mtValoresClasificadorCodigo: TStringField;
    mtValoresClasificadorDescripcion: TStringField;
    mtValoresClasificadorActivo: TBooleanField;
    dsValoresClasificador: TDataSource;
    mtValoresClasificadoroid_Clasificador: TIntegerField;
    Help: TjktHelpGenerico;
    cxDBTreeList2oid_Nivel: TcxDBTreeListColumn;
    cxDBTreeList2oid_NivelPadre: TcxDBTreeListColumn;
    cxDBTreeList2Descripcion: TcxDBTreeListColumn;
    cxDBTreeList2Codigo: TcxDBTreeListColumn;
    cxDBTreeList2Activo: TcxDBTreeListColumn;
    cxDBTreeList1oid_ValorClasif: TcxDBTreeListColumn;
    cxDBTreeList1oid_Clasificador: TcxDBTreeListColumn;
    cxDBTreeList1oid_Valor: TcxDBTreeListColumn;
    cxDBTreeList1oid_ValorPadre: TcxDBTreeListColumn;
    cxDBTreeList1Codigo: TcxDBTreeListColumn;
    cxDBTreeList1Descripcion: TcxDBTreeListColumn;
    cxDBTreeList1Activo: TcxDBTreeListColumn;
    PopupMenu: TPopupMenu;
    menAnadirMismoNivel: TMenuItem;
    menAnadirSubNivel: TMenuItem;
    menEliminar: TMenuItem;
    procedure PopupMenuPopup(Sender: TObject);
    procedure menAnadirMismoNivelClick(Sender: TObject);
    procedure menAnadirSubNivelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNCla0002: TFNCla0002;

implementation

{$R *.dfm}

procedure TFNCla0002.menAnadirMismoNivelClick(Sender: TObject);
var
  oid_ValorPadre: Integer;
begin
  inherited;

  if mtValoresClasificador.IsEmpty then
    oid_ValorPadre := -1
  else
    oid_ValorPadre := mtValoresClasificador.FieldByName('oid_ValorPadre').Value;

  mtValoresClasificador.Append;
  mtValoresClasificador.FieldByName('oid_ValorPadre').Value := oid_ValorPadre;
  mtValoresClasificador.FieldByName('Activo').Value := True;
end;

procedure TFNCla0002.menAnadirSubNivelClick(Sender: TObject);
var
  oid_ValorPadre: Integer;
begin
  inherited;

  oid_ValorPadre := mtValoresClasificador.FieldByName('oid_Valor').Value;

  mtValoresClasificador.Append;
  mtValoresClasificador.FieldByName('oid_ValorPadre').Value := oid_ValorPadre;
  mtValoresClasificador.FieldByName('Activo').Value := True;
end;

procedure TFNCla0002.PopupMenuPopup(Sender: TObject);
begin
  inherited;

  if mtValoresClasificador.Active then
    begin
      menAnadirMismoNivel.Enabled := True;

      if mtValoresClasificador.IsEmpty then
        begin
          menAnadirSubNivel.Enabled := False;
          menEliminar.Enabled := False;
        end
      else
        begin
          menAnadirSubNivel.Enabled := True;
          menEliminar.Enabled := True;
        end;
    end
  else
    begin
      menAnadirMismoNivel.Enabled := False;
      menAnadirSubNivel.Enabled := False;
      menEliminar.Enabled := False;
    end;
end;

end.
