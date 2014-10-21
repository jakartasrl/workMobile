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
  cxInplaceContainer, cxTLData, cxDBTL, Vcl.Menus, cxSplitter;

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
    mtComponentesClasificadorcodInterno: TIntegerField;
    mtComponentesClasificadorCodigo: TStringField;
    mtComponentesClasificadorDescripcion: TStringField;
    mtComponentesClasificadorActivo: TBooleanField;
    cxDBTreeList1: TcxDBTreeList;
    mtComponentesClasificadoroid_Clasificador: TIntegerField;
    mtComponentesClasificadorcodInternoPadre: TIntegerField;
    valCodigo2: TjktValidador;
    valCodigo1: TjktValidador;
    mtComponentesClasificadorNivel: TSmallintField;
    dsEntidades: TDataSource;
    PopupMenu: TPopupMenu;
    menAnadirSubNivel: TMenuItem;
    menEliminar: TMenuItem;
    cxDBTreeList1oid_CompClasif: TcxDBTreeListColumn;
    cxDBTreeList1oid_Clasificador: TcxDBTreeListColumn;
    cxDBTreeList1codInterno: TcxDBTreeListColumn;
    cxDBTreeList1codInternoPadre: TcxDBTreeListColumn;
    cxDBTreeList1Nivel: TcxDBTreeListColumn;
    cxDBTreeList1Codigo: TcxDBTreeListColumn;
    cxDBTreeList1Descripcion: TcxDBTreeListColumn;
    cxDBTreeList1Activo: TcxDBTreeListColumn;
    procedure menAnadirSubNivelClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
    procedure DriverNuevo(Sender: TObject);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
    procedure OperacionSaveAfterEjecutar(Sender: TObject);
  private
    FcodInterno: SmallInt;

  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TFNCla0001.DriverNuevo(Sender: TObject);
begin
  inherited;

  FcodInterno := 0;
end;

procedure TFNCla0001.menAnadirSubNivelClick(Sender: TObject);
var
  codInternoPadre: Integer;
begin
  inherited;

  if mtComponentesClasificador.IsEmpty then
    codInternoPadre := 0
  else
    codInternoPadre := mtComponentesClasificador.FieldByName('codInterno').Value;

  Dec(FcodInterno);

  mtComponentesClasificador.Append;
  mtComponentesClasificador.FieldByName('codInterno').Value := FcodInterno;
  mtComponentesClasificador.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtComponentesClasificador.FieldByName('Activo').Value := True;
end;

procedure TFNCla0001.OperacionSaveAfterEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := dsComponentesClasificador;
end;

procedure TFNCla0001.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := nil;
end;

procedure TFNCla0001.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Luego de traer un Clasificador, inicializo el 'codInterno' para manejar
  // la jerarquía de los nuevos componentes agregados
  FcodInterno := 0;
end;

procedure TFNCla0001.PopupMenuPopup(Sender: TObject);
begin
  inherited;

  if mtComponentesClasificador.Active then
    begin
      menAnadirSubNivel.Visible := True;
      menEliminar.Visible := True;

      if mtComponentesClasificador.IsEmpty then
        begin
          menAnadirSubNivel.Caption := 'Añadir Nivel';
          menAnadirSubNivel.Enabled := True;
          menEliminar.Enabled := False;
        end
      else
        begin
          menAnadirSubNivel.Caption := 'Añadir SubNivel';
          // Si está parado sobre el último nivel, recién ahí dejo añadir
          if not cxDBTreeList1.FocusedNode.HasChildren then
            begin
              menAnadirSubNivel.Enabled := True;
              menEliminar.Enabled := True;
            end
          else
            begin
              menAnadirSubNivel.Enabled := False;
              menEliminar.Enabled := False;
            end;
        end;
    end
  else
    begin
      menAnadirSubNivel.Visible := False;
      menEliminar.Visible := False;
    end;
end;


initialization
  RegisterClass(TFNCla0001);

end.
