unit jktFNMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxCustomTileControl, dxTileControl, Vcl.Menus, ShellAPI,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, dxAnimation, cxClasses, dxSkinsForm,
  cxContainer, cxEdit, cxGroupBox, cxLabel, cxTextEdit, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, cxSplitter, dxGDIPlusClasses, cxImage, cxButtons,
  jktUtils, jktFrameListaProgramas, jktCNMet0005, jktCNMet0002, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, kbmMemTable, jktCNMet0012,
  cxDBEdit, jktCNMet0030, jktCNMet0001, cxCheckBox, IdAntiFreezeBase,
  Vcl.IdAntiFreeze;

type
  TfrmMenuPrincipal = class(TForm)
    cds_MenuUsuario: TClientDataSet;
    cds_MenuUsuariocodItemMenu: TIntegerField;
    cds_MenuUsuariodescItemMenu: TStringField;
    cds_MenuUsuariocodItemPadre: TIntegerField;
    cds_MenuUsuarioesGrupo: TBooleanField;
    cds_MenuUsuarioesItemDeGrupo: TBooleanField;
    cds_MsjsCliente: TClientDataSet;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cds_MsjsJakarta: TClientDataSet;
    cds_MsjsVarios: TClientDataSet;
    cds_MsjsClienteAlignWithText: TByteField;
    cds_MsjsClienteImage: TBlobField;
    cds_MsjsClienteAlign: TByteField;
    cds_MsjsClienteAnimateText: TBooleanField;
    cds_MsjsClienteText1: TStringField;
    cds_MsjsClienteText2: TStringField;
    cds_MsjsClienteText3: TStringField;
    cds_MsjsClienteText4: TStringField;
    cds_MsjsJakartaAlign: TByteField;
    cds_MsjsJakartaAlignWithText: TByteField;
    cds_MsjsJakartaImage: TBlobField;
    cds_MsjsJakartaAnimateText: TBooleanField;
    cds_MsjsJakartaText1: TStringField;
    cds_MsjsJakartaText2: TStringField;
    cds_MsjsJakartaText3: TStringField;
    cds_MsjsJakartaText4: TStringField;
    cds_MsjsVariosAlign: TByteField;
    cds_MsjsVariosAlignWithText: TByteField;
    cds_MsjsVariosImage: TBlobField;
    cds_MsjsVariosAnimateText: TBooleanField;
    cds_MsjsVariosText1: TStringField;
    cds_MsjsVariosText2: TStringField;
    cds_MsjsVariosText3: TStringField;
    cds_MsjsVariosText4: TStringField;
    gbx_Login: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    txtPassword: TcxDBTextEdit;
    txtUsuario: TcxDBTextEdit;
    cxPageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    dxTileControl: TdxTileControl;
    tcaExit: TdxTileControlActionBarItem;
    tcaBlackTheme: TdxTileControlActionBarItem;
    tcaWhiteTheme: TdxTileControlActionBarItem;
    dxTileControlGroup3: TdxTileControlGroup;
    dxTileControlGroup2: TdxTileControlGroup;
    dxTileControlGroup1: TdxTileControlGroup;
    tci_MsjsVarios: TdxTileControlItem;
    tci_MsjsCliente: TdxTileControlItem;
    tci_MsjsJakarta: TdxTileControlItem;
    cxGroupBox2: TcxGroupBox;
    tc_Novedades: TdxTileControl;
    tc_MenuUsuario: TdxTileControl;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    tc_Favoritos: TdxTileControl;
    tc_FavoritosGroup1: TdxTileControlGroup;
    IdHTTP: TIdHTTP;
    Service: TjktServiceCaller;
    TUsuario: TjktMemTable;
    TUsuariosesionID: TStringField;
    TUsuariodecimalSeparator: TStringField;
    TUsuariocertificado: TStringField;
    TLogin: TjktMemTable;
    TLoginusuario: TStringField;
    TLoginpassword: TStringField;
    dsLogin: TDataSource;
    OperConsultaLogin: TjktOperacion;
    TUsuariooid_usuario: TIntegerField;
    TUsuarioCodigo: TStringField;
    TUsuarioApellido: TStringField;
    TUsuarioNombre: TStringField;
    TUsuarioEmail: TStringField;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    EHost: TcxTextEdit;
    EPort: TcxTextEdit;
    EAplicacion: TcxTextEdit;
    EServlet: TcxTextEdit;
    cxButton1: TcxButton;
    TMenues: TjktMemTable;
    TMenuesoid_menu: TIntegerField;
    TMenuesCodigo: TStringField;
    TMenuesDescripcion: TStringField;
    TMenuesTipo: TStringField;
    TMenuesImagen: TStringField;
    TMenuesRutaDeImagen: TStringField;
    TMenuesOrden: TIntegerField;
    TMenuesArgumento: TStringField;
    TTextosMenues: TjktMemTable;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure FormCreate(Sender: TObject);
    procedure tcaChangeThemeClick(Sender: TdxTileControlActionBarItem);
    procedure tcaExitClick(Sender: TdxTileControlActionBarItem);
    procedure tci_MsjsVariosClick(Sender: TdxTileControlItem);
    procedure txtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure OnActivateDetail_ItemDeGrupo(Sender: TdxTileControlItem);

    procedure SelectSkin(ABlackSkin: Boolean);
    procedure GenerarArchivoMenuUsuario;
    procedure GenerarArchivosDeMensajes;

    procedure CargarMenuUsuario;
    procedure CargarNuevosMensajes;

    function ValidarLogin: Boolean;

    function GetRandomColor: TColor;
    procedure CrearLogin;

  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}


procedure CopyClientDataset(Origen, Destino: TClientDataset);
var
  Stream: TMemoryStream;
begin
  Stream:= TMemoryStream.Create;
  try
    Origen.SaveToStream(Stream);
    Stream.Position:= 0;
    Destino.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TfrmMenuPrincipal.CargarNuevosMensajes;
var
  AFrame: TdxTileControlItemFrame;
begin
  cds_MsjsCliente.LoadFromFile(DataPath + 'MsjsCliente.xml');
  cds_MsjsJakarta.LoadFromFile(DataPath + 'MsjsJakarta.xml');
  cds_MsjsVarios.LoadFromFile (DataPath + 'MsjsVarios.xml');

  // cargo los mensajes del cliente como Frames (animados)
  cds_MsjsCliente.First;
  while not cds_MsjsCliente.Eof do
  begin
    AFrame := tci_MsjsCliente.Frames.Add;

    AFrame.Glyph.Align := TdxTileItemInnerObjectAlignment(cds_MsjsCliente.FieldByName('Align').AsInteger);
    AFrame.Glyph.AlignWithText := TdxTileControlImageWithTextAlignment(cds_MsjsCliente.FieldByName('AlignWithText').AsInteger);
    AFrame.Glyph.Image.LoadFromFieldValue(cds_MsjsCliente.FieldByName('Image').Value);
    AFrame.Glyph.Image.Scale(70, 100);

    AFrame.OptionsAnimate.AnimateText := cds_MsjsCliente.FieldByName('AnimateText').AsBoolean;

    AFrame.Style.BorderColor := $2026BBDA;
    AFrame.Style.Font.Size := 13;
    AFrame.Style.Gradient := gmBackwardDiagonal;
    AFrame.Style.GradientBeginColor := $2000AFD4;
    AFrame.Style.GradientEndColor := $201AC8E0;

    AFrame.Text1.Value := cds_MsjsCliente.FieldByName('Text1').AsString;
//    AFrame.Text1.IndentHorz := 10;
//    AFrame.Text1.IndentVert := 10;
    AFrame.Text2.Value := cds_MsjsCliente.FieldByName('Text2').AsString;
//    AFrame.Text2.Align := oaTopLeft;
//    AFrame.Text2.IndentHorz := 10;
//    AFrame.Text2.IndentVert := 30;
    AFrame.Text3.Value := cds_MsjsCliente.FieldByName('Text3').AsString;
    AFrame.Text4.Value := cds_MsjsCliente.FieldByName('Text4').AsString;

    cds_MsjsCliente.Next;
  end;

  cds_MsjsCliente.Close;
  cds_MsjsJakarta.Close;
  cds_MsjsVarios.Close;
end;

procedure TfrmMenuPrincipal.CrearLogin;
var
  OidEmpresaActiva : Integer;
begin
  OidEmpresaActiva := 0;

  TUsuario.First;
  Login := TjktLogin.New(TUsuario.FieldByName('oid_usuario').AsInteger,
                         TUsuario.FieldByName('Apellido').AsString + ' ' + TUsuario.fieldByName('Nombres').AsString,
                         TUsuario.FieldByName('sesionID').AsString,
                         TUsuario.FieldByName('certificado').AsString);

//  Login.OidSucursal :=  mtSucursalLogin.fieldByName('oid_suc').AsInteger;

{
  Empresa.First;
  while not Empresa.Eof do
    begin
       Login.addEmpresa( Empresa.fieldByName('oid_emp').AsInteger,
                         Empresa.FieldByName('descEmpresa').asString,
                         0,
                         0);

       if Empresa.fieldByName('is_default').AsBoolean
          then begin
                 OidEmpresaActiva := Empresa.fieldByName('oid_emp').AsInteger;
                 if Empresa.fieldByName('color').asString <> ''
                      then FPrimerColor      := Empresa.fieldByName('color').AsInteger
                      else FPrimerColor      := clBtnFace;
                end;

       Empresa.Next;
    end;
}


{******     AGREGADO POR AHORA... QUITAR CUANDO SE IMPLEMENTEN LAS EMPRESAS ******}

       Login.addEmpresa( 0,
                         'Empresa FAKE',
                         0,
                         0);

{*********************************************************************************}

  // Seteo Datos del Login
  Login.setEmpresaActiva(OidEmpresaActiva);

  Login.Host       := EHost.Text;
  Login.Port       := EPort.Text;
  Login.Servlet    := EServlet.Text;
  Login.Aplicacion := EAplicacion.Text;
  Login.Protocolo  := 'http://';

{

  if (integAuth = 'S')
     then begin
            Login.IntegAuth   := True;
            Login.HTTPOptions := [hoInProcessAuth,hoForceEncodeParams];
          end
     else begin
            Login.IntegAuth   := False;
            Login.HTTPOptions := [hoForceEncodeParams];
          end;

  if (trace = 'S')
      then Login.trace := true
      else Login.trace := false;

}

end;

procedure TfrmMenuPrincipal.CargarMenuUsuario;
var
  AGroup: TdxTileControlGroup;
  AItem: TdxTileControlItem;
  AFrame: TdxTileControlItemFrame;
begin
  GenerarArchivoMenuUsuario;

  cds_MenuUsuario.LoadFromFile(DataPath + 'MenuUsuario.xml');

  // primero creo los Grupos
  cds_MenuUsuario.Filtered := False;
  cds_MenuUsuario.Filter := 'esGrupo = True';
  cds_MenuUsuario.Filtered := True;

  cds_MenuUsuario.First;
  while not cds_MenuUsuario.Eof do
  begin
    AGroup := tc_MenuUsuario.Groups.Add;
    AGroup.Caption.Alignment := taLeftJustify;
    AGroup.Caption.Color := clDefault;
    AGroup.Caption.Font.Size := 14;
    AGroup.Caption.Text := cds_MenuUsuario.FieldByName('descItemMenu').AsString;
    AGroup.Index := cds_MenuUsuario.FieldByName('codItemMenu').AsInteger;

    cds_MenuUsuario.Next;
  end;

  // creo los Items de los Grupos
  cds_MenuUsuario.Filtered := False;
  cds_MenuUsuario.Filter := 'esItemDeGrupo = True';
  cds_MenuUsuario.Filtered := True;

  cds_MenuUsuario.First;
  while not cds_MenuUsuario.Eof do
  begin
    AItem := tc_MenuUsuario.Items.Add;
    AItem.AnimationInterval := 3000;
    AItem.AnimationMode := amScrollUp;

    AItem.DetailOptions.Caption := cds_MenuUsuario.FieldByName('descItemMenu').AsString;
    AItem.DetailOptions.DetailControl := frameListaProgramas;
    AItem.DetailOptions.ShowTab := True;
{
    AItem.Frames;
    AItem.Glyph.Image.LoadFromFieldValue( ),
    AItem.Glyph.Align := oaMiddleRight;
}
    AItem.GroupIndex := cds_MenuUsuario.FieldByName('codItemPadre').AsInteger;
    AItem.Tag := cds_MenuUsuario.FieldByName('codItemMenu').AsInteger;
    AItem.IsLarge := true;
    AItem.OptionsAnimate.AnimateText := True;
    AItem.RowCount := 1;
    AItem.Style.Gradient := gmVertical;
    //AItem.Style.GradientBeginColor := $20205EE6;
    //AItem.Style.GradientEndColor := $202774EB;
    AItem.Style.GradientBeginColor := GetRandomColor;
    AItem.Style.GradientEndColor   := GetRandomColor;
    AItem.Text1.Align := oaTopLeft;
    AItem.Text1.Font.Size := 12;
    AItem.Text1.IndentHorz := 10;
    AItem.Text1.IndentVert := 10;
    AItem.Text1.TextColor := clDefault;
    AItem.Text1.Transparent := True;
    AItem.Text1.Value := cds_MenuUsuario.FieldByName('descItemMenu').AsString;

    AItem.OnActivateDetail := OnActivateDetail_ItemDeGrupo;

    cds_MenuUsuario.Next;
  end;

  cds_MenuUsuario.Close;
{

  cds_MenuUsuario.First;
  while not cds_MenuUsuario.Eof do
  begin
    AFrame := tlAgents.Frames.Add;
    AFrame.Glyph.Image.LoadFromFieldValue(dsAgents.FieldByName('Photo').Value);
    AFrame.Glyph.Image.Scale(70, 100);
    AFrame.Glyph.Align := oaMiddleRight;
    AFrame.Tag := dsAgents.FieldByName('ID').AsInteger;
    AFrame.Style.Font.Size := 13;
    AFrame.Text1.Value := dsAgents.FieldByName('FirstName').AsString + ' ' + dsAgents.FieldByName('LastName').AsString;
    AFrame.Text1.IndentHorz := 10;
    AFrame.Text1.IndentVert := 10;
    AFrame.Text2.Value := dsAgents.FieldByName('Phone').AsString;
    AFrame.Text2.Align := oaTopLeft;
    AFrame.Text2.IndentHorz := 10;
    AFrame.Text2.IndentVert := 30;

    cds_MenuUsuario.Next;
  end;

}
end;



function TfrmMenuPrincipal.GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

procedure TfrmMenuPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // No cierro este Form, solo lo oculto. El MainForm se encargará de hacerlo!
  CanClose := False;

  Self.Hide;
  Application.MainForm.Show;
  Application.MainForm.Close;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  frameListaProgramas := TframeListaProgramas.Create(Self);

  // Cargo los datos de conexion al server en la solapa de 'Parámetros de Conexión'
  if FileExists(ApplicationFile.FileName) then begin
    EHost.Text := ApplicationFile.ReadString('LOGIN', 'host', '');
    EPort.Text := ApplicationFile.ReadString('LOGIN', 'port', '');
    EAplicacion.Text := ApplicationFile.ReadString('LOGIN', 'aplicacion', '');
    EServlet.Text := ApplicationFile.ReadString('LOGIN', 'servlet', '');
  end;

  TLogin.Open;

  cxPageControl.ActivePageIndex := 0;

  SelectSkin(True);
  dxTileControl.LookAndFeel.AssignedValues := [];

  tci_MsjsCliente.IsLarge := True;
  tci_MsjsCliente.OptionsAnimate.AnimateText := False;
  tci_MsjsCliente.RowCount := 1;

  tci_MsjsJakarta.IsLarge := True;
  tci_MsjsJakarta.OptionsAnimate.AnimateText := False;
  tci_MsjsJakarta.RowCount := 1;

  tci_MsjsVarios.IsLarge := False;
  tci_MsjsVarios.OptionsAnimate.AnimateText := False;
  tci_MsjsVarios.RowCount := 1;

//  UpdateActionBarsItems;

//  GenerarArchivosDeMensajes;
  CargarNuevosMensajes;

  dxTileControl.Controller.StopFramesAnimation;
  try
    for i := 0 to dxTileControl.Items.Count - 1 do
      if dxTileControl.Items[i].Frames.Count > 0 then
        dxTileControl.Items[i].ActiveFrame := dxTileControl.Items[i].Frames[0];
  finally
    dxTileControl.Controller.StartFramesAnimation;
  end;
end;

procedure TfrmMenuPrincipal.GenerarArchivosDeMensajes;
begin
  // creo los Grupos
  cds_MsjsCliente.CreateDataSet;
  cds_MsjsJakarta.CreateDataSet;
  cds_MsjsVarios.CreateDataSet;

  // cada registro del archivo será un Frame que querramos mostrar
  // Mensajes Cliente
  cds_MsjsCliente.Append;
  cds_MsjsCliente.FieldByName('Align').Value         := TdxTileItemInnerObjectAlignment(oaDefault);    // Glyph
  cds_MsjsCliente.FieldByName('AlignWithText').Value := TdxTileControlImageWithTextAlignment(itaNone); // Glyph
  cds_MsjsCliente.FieldByName('Image').Value         := '';
  cds_MsjsCliente.FieldByName('AnimateText').Value   := True;
  cds_MsjsCliente.FieldByName('Text1').Value := 'Cumpleaños:';
  cds_MsjsCliente.FieldByName('Text2').Value := '13/05';
  cds_MsjsCliente.FieldByName('Text3').Value := '';
  cds_MsjsCliente.FieldByName('Text4').Value := 'Vale Peñalva';
  cds_MsjsCliente.Post;

  cds_MsjsCliente.Append;
  cds_MsjsCliente.FieldByName('Align').Value         := TdxTileItemInnerObjectAlignment(oaDefault);    // Glyph
  cds_MsjsCliente.FieldByName('AlignWithText').Value := TdxTileControlImageWithTextAlignment(itaNone); // Glyph
  cds_MsjsCliente.FieldByName('Image').Value         := '';
  cds_MsjsCliente.FieldByName('AnimateText').Value   := True;
  cds_MsjsCliente.FieldByName('Text1').Value := 'Feriados del mes:';
  cds_MsjsCliente.FieldByName('Text2').Value := '25/05';
  cds_MsjsCliente.FieldByName('Text3').Value := '';
  cds_MsjsCliente.FieldByName('Text4').Value := 'Revolución de Mayo';
  cds_MsjsCliente.Post;

  // Mensajes Jakarta
  cds_MsjsJakarta.Append;
  cds_MsjsJakarta.FieldByName('Align').Value         := TdxTileItemInnerObjectAlignment(oaDefault);    // Glyph
  cds_MsjsJakarta.FieldByName('AlignWithText').Value := TdxTileControlImageWithTextAlignment(itaNone); // Glyph
  cds_MsjsJakarta.FieldByName('Image').Value         := '';
  cds_MsjsJakarta.FieldByName('AnimateText').Value   := True;
  cds_MsjsJakarta.FieldByName('Text1').Value := '¿Sabías que...?';
  cds_MsjsJakarta.FieldByName('Text2').Value := '...';
  cds_MsjsJakarta.FieldByName('Text3').Value := '...';
  cds_MsjsJakarta.FieldByName('Text4').Value := '...';
  cds_MsjsJakarta.Post;

  cds_MsjsJakarta.Append;
  cds_MsjsJakarta.FieldByName('Align').Value         := TdxTileItemInnerObjectAlignment(oaDefault);    // Glyph
  cds_MsjsJakarta.FieldByName('AlignWithText').Value := TdxTileControlImageWithTextAlignment(itaNone); // Glyph
  cds_MsjsJakarta.FieldByName('Image').Value         := '';
  cds_MsjsJakarta.FieldByName('AnimateText').Value   := True;
  cds_MsjsJakarta.FieldByName('Text1').Value := 'Nueva versión disponible!';
  cds_MsjsJakarta.FieldByName('Text2').Value := '';
  cds_MsjsJakarta.FieldByName('Text3').Value := 'Comuníquese al:';
  cds_MsjsJakarta.FieldByName('Text4').Value := '4999-9999';
  cds_MsjsJakarta.Post;

  // Acerca de ...
  cds_MsjsVarios.Append;
  cds_MsjsVarios.FieldByName('Align').Value         := TdxTileItemInnerObjectAlignment(oaDefault);    // Glyph
  cds_MsjsVarios.FieldByName('AlignWithText').Value := TdxTileControlImageWithTextAlignment(itaNone); // Glyph
  cds_MsjsVarios.FieldByName('Image').Value         := '';
  cds_MsjsVarios.FieldByName('AnimateText').Value   := True;
  cds_MsjsVarios.FieldByName('Text1').Value := 'Versión: v9.0.0.0';
  cds_MsjsVarios.FieldByName('Text2').Value := 'Fecha modificación:';
  cds_MsjsVarios.FieldByName('Text3').Value := '';
  cds_MsjsVarios.FieldByName('Text4').Value := '';
  cds_MsjsVarios.Post;

  cds_MsjsCliente.SaveToFile(DataPath + 'MsjsCliente.xml', dfXML); // dfBinary);
  cds_MsjsJakarta.SaveToFile(DataPath + 'MsjsJakarta.xml', dfXML); // dfBinary);
  cds_MsjsVarios.SaveToFile (DataPath + 'MsjsVarios.xml' , dfXML); // dfBinary);
end;

procedure TfrmMenuPrincipal.OnActivateDetail_ItemDeGrupo(Sender: TdxTileControlItem);
begin
  // en Sender.Tag nos viene el 'codItemMenu' !!!
  TframeListaProgramas(Sender.DetailOptions.DetailControl).CargarListaProgramas(Sender.Tag);
end;

procedure TfrmMenuPrincipal.GenerarArchivoMenuUsuario;
begin
  // 'codItemMenu' representara el Index del grupo "TdxTileControlGroup" que
  // crearemos (lo necesitaremos para alojar o ubicar los ItemDeGrupo).
  // En 'GroupIndex' de los items "TdxTileControlItem" indicaremos este codigo
  // para que los items se ubiquen en el grupo correspondiente.
  // Para los Programas seteamos 'esGrupo' y 'esItemDeGrupo' en False, pues
  // no son ni un Grupo ni un Item de grupo.

  // creo los Grupos
  cds_MenuUsuario.CreateDataSet;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 0;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Configuracion';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := -1;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := True;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 1;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Ventas';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := -1;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := True;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;


  // creo los Items de cada grupo  -----------------------------
  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 200;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Seguridad';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 0;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 201;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Clasificadores';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 0;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 202;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Varios';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 0;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 203;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Articulos';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 0;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 204;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Ventas';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 0;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 300;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Clientes';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 1;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 301;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Articulos';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 1;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := True;
  cds_MenuUsuario.Post;


  // creo los Programas -------------------------------------------------------
  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 6;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Empresas';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 200;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 9;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Usuarios';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 200;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 17;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Vendedores';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 300;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 18;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Representantes';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 300;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 7;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Clientes';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 300;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 8;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Condiciones de Pago';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 300;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 10;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Tablas de Validacion';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 203;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 11;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Caracteristicas de Producto';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 203;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 12;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Tipo de Producto';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 203;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 13;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Impuestos';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 202;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 14;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Idioma';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 202;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 15;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Paises';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 202;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 16;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Provincias';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 202;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 22;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Unidades de Medida';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 203;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 19;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Clasificadores';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 201;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 20;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Valores de Clasificador';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 201;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 21;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Artículos';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 301;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 23;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Tablas de Valores de Características';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 203;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 24;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Conceptos';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 204;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.Append;
  cds_MenuUsuario.FieldByName('codItemMenu').Value   := 25;
  cds_MenuUsuario.FieldByName('descItemMenu').Value  := 'Modelos de Cotizador';
  cds_MenuUsuario.FieldByName('codItemPadre').Value  := 204;
  cds_MenuUsuario.FieldByName('esGrupo').Value       := False;
  cds_MenuUsuario.FieldByName('esItemDeGrupo').Value := False;
  cds_MenuUsuario.Post;

  cds_MenuUsuario.SaveToFile(DataPath + 'MenuUsuario.xml', dfXML); // dfBinary);
end;

procedure TfrmMenuPrincipal.SelectSkin(ABlackSkin: Boolean);
const
  SkinFileNames: array[Boolean] of string = ('MetroWhite.skinres', 'MetroBlack.skinres');
begin
  dxSkinsUserSkinLoadFromFile(DataPath + SkinFileNames[ABlackSkin]);
  tcaBlackTheme.Visible := not ABlackSkin;
  tcaWhiteTheme.Visible := ABlackSkin;
end;

procedure TfrmMenuPrincipal.tcaChangeThemeClick(Sender: TdxTileControlActionBarItem);
begin
  SelectSkin(Sender.Tag = 0);
end;

procedure TfrmMenuPrincipal.tcaExitClick(Sender: TdxTileControlActionBarItem);
begin
  Close;
end;

procedure TfrmMenuPrincipal.tci_MsjsVariosClick(Sender: TdxTileControlItem);
begin
  ShellExecute(0, 'open', 'http://www.jakartasrl.com.ar', nil, nil, SW_SHOW);
end;

procedure TfrmMenuPrincipal.txtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    begin
      cxPageControl.ActivePageIndex := 2;
      cxGroupBox3.Left :=  (cxTabSheet3.Width div 2) - (cxGroupBox3.Width div 2);
    end
  else if (Key = 13) then
    begin
      if TLogin.isEditando then
        TLogin.Post;

      if ValidarLogin then
        begin
          // iniciamos sesion!
          gbx_Login.Visible := False;
          // cambiamos al 'cxTabSheet2' (segunda pagina) y mostramos ahi el Menu de Usuario
          cxPageControl.ActivePageIndex := 1;

          CargarMenuUsuario;
        end;
    end
end;

function TfrmMenuPrincipal.ValidarLogin: Boolean;
begin
  Result := False;

  if Login = nil then begin

    if TUsuario.Active then
      TUsuario.Close;
    TUsuario.Open;

    Service.Host       := EHost.Text;
    Service.Port       := EPort.Text;
    Service.Servlet    := EServlet.Text;    // 'FrontServletXML';
    Service.Aplicacion := EAplicacion.Text; // 'JakartaERP';
    Service.Protocolo  := 'http://';

{
    if (integAuth = 'S')
       then Service.HTTP.HTTPOptions := [hoInProcessAuth,hoForceEncodeParams];
}

    OperConsultaLogin.execute;

{
    Service.InicioOperacion;
    Service.setOperacion('Login');
    Service.addAtribute('usuario', txtUsuario.Text);
    Service.addAtribute('password',  txtPassword.Text);
}

{
    if (FAutoLogin)
       then Service.addAtribute('autologin', 'S')
       else Service.addAtribute('autologin', 'N');

    if instalacion
       then Service.addAtribute('instalacion', '1');
}

//    Service.execute;

    CrearLogin;

    Result := True;

  end;

end;

end.
