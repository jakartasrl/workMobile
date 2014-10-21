unit jktFNVen0002;

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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCustomData,
  cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL,
  cxLabel, cxTextEdit, cxDBEdit, cxGroupBox, jktCNMet0011, Data.DB, kbmMemTable,
  jktCNMet0012, jktCNMet0030, jktCNMet0002, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, dxBar, cxClasses, dxBevel,
  jktCNMet0014, cxMaskEdit, cxButtonEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxSplitter;

type
  TFNVen0002 = class(TfrmChild)
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBTreeList1: TcxDBTreeList;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    dxBevel2: TdxBevel;
    mtCab: TjktMemTable;
    mtDet: TjktMemTable;
    dsCab: TDataSource;
    dsDet: TDataSource;
    mtCaboid_mod: TIntegerField;
    mtCabcod_mod: TStringField;
    mtCabdes_mod: TStringField;
    mtDetoid_titu_conc: TIntegerField;
    mtDetoid_mod: TIntegerField;
    mtDetcod_titu_conc: TStringField;
    mtDetdes_titu_conc: TStringField;
    mtDetoid_conc: TIntegerField;
    mtDettipo: TStringField;
    mtDetcodInterno: TIntegerField;
    mtDetcodInternoPadre: TIntegerField;
    Help: TjktHelpGenerico;
    HelpConcepto: TjktHelpGenerico;
    cxDBTreeList1oid_titu_conc: TcxDBTreeListColumn;
    cxDBTreeList1oid_mod: TcxDBTreeListColumn;
    cxDBTreeList1codInterno: TcxDBTreeListColumn;
    cxDBTreeList1codInternoPadre: TcxDBTreeListColumn;
    cxDBTreeList1cod_titu_conc: TcxDBTreeListColumn;
    cxDBTreeList1des_titu_conc: TcxDBTreeListColumn;
    cxDBTreeList1oid_conc: TcxDBTreeListColumn;
    cxDBTreeList1tipo: TcxDBTreeListColumn;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxButtonEdit3: TcxButtonEdit;
    cxTextEdit4: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    PopupMenu: TPopupMenu;
    menAnadirMismoNivel: TMenuItem;
    menAnadirSubTitulo: TMenuItem;
    menEliminar: TMenuItem;
    menAnadirConcepto: TMenuItem;
    dxBevel1: TdxBevel;
    mtCabActivo: TBooleanField;
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure menAnadirMismoNivelClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure menAnadirSubTituloClick(Sender: TObject);
    procedure menAnadirConceptoClick(Sender: TObject);
    procedure OperacionSaveBeforeEjecutar(Sender: TObject);
    procedure OperacionSaveAfterEjecutar(Sender: TObject);
  private
    procedure BorrarCampos;

  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFNVen0002.BorrarCampos;
begin
  cxTextEdit1.Clear;
  cxTextEdit2.Clear;
  cxButtonEdit3.Clear;
  cxTextEdit4.Clear;

  cxGroupBox4.Enabled := False;
  cxGroupBox5.Enabled := False;
  cxButton3.Enabled := False;

  cxDBTreeList1.Enabled := True;
end;

procedure TFNVen0002.cxButton1Click(Sender: TObject);
begin
  inherited;

  mtDet.FieldByName('cod_titu_conc').AsString := cxTextEdit1.Text;
  mtDet.FieldByName('des_titu_conc').AsString := cxTextEdit2.Text;

  mtDet.Post;
  BorrarCampos;
end;

procedure TFNVen0002.cxButton2Click(Sender: TObject);
begin
  inherited;

  mtDet.Cancel;
  BorrarCampos;
end;

procedure TFNVen0002.cxButton3Click(Sender: TObject);
begin
  inherited;

  mtDet.FieldByName('cod_titu_conc').AsString := cxButtonEdit3.Text;
  mtDet.FieldByName('des_titu_conc').AsString := cxTextEdit4.Text;

  mtDet.Post;
  BorrarCampos;
end;

procedure TFNVen0002.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  if HelpConcepto.Ejecutar then
    begin
      cxTextEdit4.Text   := HelpConcepto.GetDescripcion;
      cxButtonEdit3.Text := HelpConcepto.GetCodigo;

      cxButton3.Enabled := True;
    end;
end;

procedure TFNVen0002.menAnadirConceptoClick(Sender: TObject);
var
  codInternoPadre : Integer;
begin
  inherited;

  // Presionó en 'Añadir Concepto'

  // Si está parado sobre un Concepto entonces el padre del nuevo Concepto es
  // el mismo que el del Concepto donde está parado, así quedan al mismo nivel

  // Si está parado sobre un Título entonces el padre del nuevo Concepto es
  // justamente ese mismo Título

  if mtDet.FieldByName('tipo').Value = 'C' then
    codInternoPadre := mtDet.FieldByName('codInternoPadre').Value
  else
    codInternoPadre := mtDet.FieldByName('codInterno').Value;

  mtDet.Append;
  mtDet.FieldByName('codInterno').Value      := GetNewOid;
  mtDet.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtDet.FieldByName('oid_conc').Value        := -1;
  mtDet.FieldByName('tipo').Value            := 'C';

  // Habilito el panel de 'Alta de Concepto' y deshabilito el panel de 'Alta de Título'
  cxGroupBox4.Enabled := False;
  cxGroupBox5.Enabled := True;
  cxButtonEdit3.SetFocus;
  // No dejo tocar el árbol
  cxDBTreeList1.Enabled := False;
end;

procedure TFNVen0002.menAnadirMismoNivelClick(Sender: TObject);
var
  codInternoPadre : Integer;
begin
  inherited;

  // Presionó en 'Añadir Título'

  if mtDet.IsEmpty then
    begin
      codInternoPadre := 0;
    end
  else
    begin
      // El nuevo registro lo colocamos al mismo Nivel que el seleccionado!
      codInternoPadre := mtDet.FieldByName('codInternoPadre').Value;
    end;

  mtDet.Append;
  mtDet.FieldByName('codInterno').Value      := GetNewOid;
  mtDet.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtDet.FieldByName('oid_conc').Value        := -1;
  mtDet.FieldByName('tipo').Value            := 'T';

  // Habilito el panel de 'Alta de Título' y deshabilito el panel de 'Alta de Concepto'
  cxGroupBox4.Enabled := True;
  cxGroupBox5.Enabled := False;
  cxTextEdit1.SetFocus;
  // No dejo tocar el árbol
  cxDBTreeList1.Enabled := False;
end;

procedure TFNVen0002.menAnadirSubTituloClick(Sender: TObject);
var
  codInternoPadre : Integer;
begin
  inherited;

  // Presionó en 'Añadir SubTítulo'

  // El nuevo registro lo coloco como hijo del seleccionado!
  codInternoPadre := mtDet.FieldByName('codInterno').Value;

  mtDet.Append;
  mtDet.FieldByName('codInterno').Value      := GetNewOid;
  mtDet.FieldByName('codInternoPadre').Value := codInternoPadre;
  mtDet.FieldByName('oid_conc').Value        := -1;
  mtDet.FieldByName('tipo').Value            := 'T';

  // Habilito el panel de 'Alta de Título' y deshabilito el panel de 'Alta de Concepto'
  cxGroupBox4.Enabled := True;
  cxGroupBox5.Enabled := False;
  cxTextEdit1.SetFocus;
  // No dejo tocar el árbol
  cxDBTreeList1.Enabled := False;
end;


procedure TFNVen0002.OperacionSaveAfterEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := dsDet;
end;

procedure TFNVen0002.OperacionSaveBeforeEjecutar(Sender: TObject);
begin
  inherited;

  cxDBTreeList1.DataController.DataSource := nil;
end;


initialization
  RegisterClass(TFNVen0002);


end.
