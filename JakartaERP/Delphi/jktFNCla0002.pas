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
    mtValoresClasificadorCodigo: TStringField;
    mtValoresClasificadorDescripcion: TStringField;
    mtValoresClasificadorActivo: TBooleanField;
    dsValoresClasificador: TDataSource;
    Help: TjktHelpGenerico;
    cxDBTreeList2oid_Nivel: TcxDBTreeListColumn;
    cxDBTreeList2oid_NivelPadre: TcxDBTreeListColumn;
    cxDBTreeList2Descripcion: TcxDBTreeListColumn;
    cxDBTreeList2Codigo: TcxDBTreeListColumn;
    cxDBTreeList2Activo: TcxDBTreeListColumn;
    PopupMenu: TPopupMenu;
    menAnadirMismoNivel: TMenuItem;
    menAnadirSubNivel: TMenuItem;
    menEliminar: TMenuItem;
    mtValoresClasificadoroid_CompClasif: TIntegerField;
    mtValoresClasificadorcodInterno: TIntegerField;
    mtValoresClasificadorcodInternoPadre: TIntegerField;
    cxDBTreeList1oid_ValorClasif: TcxDBTreeListColumn;
    cxDBTreeList1oid_CompClasif: TcxDBTreeListColumn;
    cxDBTreeList1codInterno: TcxDBTreeListColumn;
    cxDBTreeList1codInternoPadre: TcxDBTreeListColumn;
    cxDBTreeList1Codigo: TcxDBTreeListColumn;
    cxDBTreeList1Descripcion: TcxDBTreeListColumn;
    cxDBTreeList1Activo: TcxDBTreeListColumn;
    mtComponentesClasificadoroid_CompClasif: TIntegerField;
    procedure PopupMenuPopup(Sender: TObject);
    procedure menAnadirMismoNivelClick(Sender: TObject);
    procedure menAnadirSubNivelClick(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
  private
    FcodInterno: SmallInt;
    function GetOid_Componente(Nivel: Byte): Integer;

  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

// Obtiene el 'oid_CompClasif' del Componente ubicado en el Nivel pasado por parámetro
function TFNCla0002.GetOid_Componente(Nivel: Byte): Integer;
var
  NodoActual: TcxTreeListNode;
begin
  NodoActual := cxDBTreeList2.TopNode;
  while NodoActual <> nil do
    begin
      if NodoActual.Level = Nivel then
        Break;

      NodoActual := NodoActual.getFirstChild;
    end;

  Result := NodoActual.Values[0];
end;

procedure TFNCla0002.menAnadirMismoNivelClick(Sender: TObject);
var
  codInternoPadre : Integer;
  oid_CompClasif  : Integer;
begin
  inherited;

  if mtValoresClasificador.IsEmpty then
    begin
      // Debo comenzar agregando un Valor para el Componente superior de la jerarquía
      codInternoPadre := 0;
      oid_CompClasif := cxDBTreeList2.TopNode.Values[0];
    end
  else
    begin
      // El nuevo registro lo colocamos al mismo Nivel que el seleccionado!
      codInternoPadre := mtValoresClasificador.FieldByName('codInternoPadre').Value;
      oid_CompClasif := mtValoresClasificador.FieldByName('oid_CompClasif').Value;
    end;

  Dec(FcodInterno);

  mtValoresClasificador.Append;
  mtValoresClasificador.FieldByName('oid_CompClasif').Value  := oid_CompClasif;
  mtValoresClasificador.FieldByName('codInterno').Value      := FcodInterno;
  mtValoresClasificador.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtValoresClasificador.FieldByName('Activo').Value          := True;
end;

procedure TFNCla0002.menAnadirSubNivelClick(Sender: TObject);
var
  codInternoPadre : Integer;
  oid_Componente  : Integer;
begin
  inherited;

  // El nuevo registro lo colocamos como hijo del seleccionado!
  codInternoPadre := mtValoresClasificador.FieldByName('codInterno').Value;
  // Debo buscar el 'oid_CompClasif' que le corresponde según el nivel
  oid_Componente := GetOid_Componente(cxDBTreeList1.FocusedNode.Level + 1);

  Dec(FcodInterno);

  mtValoresClasificador.Append;
  mtValoresClasificador.FieldByName('oid_CompClasif').Value  := oid_Componente;
  mtValoresClasificador.FieldByName('codInterno').Value      := FcodInterno;
  mtValoresClasificador.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtValoresClasificador.FieldByName('Activo').Value          := True;
end;

procedure TFNCla0002.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Luego de traer un Clasificador, inicializo el 'codInterno' para manejar
  // la jerarquía de los nuevos componentes agregados
  FcodInterno := 0;
end;

procedure TFNCla0002.PopupMenuPopup(Sender: TObject);
begin
  inherited;

  if mtValoresClasificador.Active then
    begin
      menAnadirMismoNivel.Visible := True;
      menAnadirSubNivel.Visible := True;
      menEliminar.Visible := True;

      menAnadirMismoNivel.Enabled := True;

      if mtValoresClasificador.IsEmpty then
        begin
          menAnadirSubNivel.Enabled := False;
          menEliminar.Enabled := False;
        end
      else
        begin
          // No dejo agregar más SubNiveles que los definidos en la Jerarquía
          if (cxDBTreeList1.FocusedNode.Level < cxDBTreeList2.LastNode.Level) then
            //   mtComponentesClasificador.RecordCount
            begin
              menAnadirSubNivel.Enabled := True;
            end
          else
            begin
              menAnadirSubNivel.Enabled := False;
            end;

          menEliminar.Enabled := True;
        end;
    end
  else
    begin
      menAnadirMismoNivel.Visible := False;
      menAnadirSubNivel.Visible := False;
      menEliminar.Visible := False;
    end;
end;



initialization
  RegisterClass(TFNCla0002);

end.
