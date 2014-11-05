unit jktFrameListaProgramas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  jktUtils, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, cxClasses,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, dxCustomTileControl, dxTileControl, dxAnimation,
  Data.DB, Datasnap.DBClient, jktFNMet0000;

type
  TframeListaProgramas = class(TFrame)
    cds_Programas: TClientDataSet;
    cds_ProgramascodItemMenu: TIntegerField;
    cds_ProgramasdescItemMenu: TStringField;
    cds_ProgramascodItemPadre: TIntegerField;
    cds_ProgramasesGrupo: TBooleanField;
    cds_ProgramasesItemDeGrupo: TBooleanField;
    tc_Programas: TdxTileControl;
    tc_ProgramasGroup1: TdxTileControlGroup;

  private
    Botones: TList;

    procedure OnButtonClick(Sender: TdxTileControlItem);
    procedure LimpiarVentana;
    function GetRandomColor: TColor;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure CargarListaProgramas(codItemDeGrupo: Integer);

  end;

var
  frameListaProgramas: TframeListaProgramas;

implementation

{$R *.dfm}


constructor TframeListaProgramas.Create(AOwner: TComponent);
begin
  inherited;

  Botones := TList.Create;
end;

destructor TframeListaProgramas.Destroy;
begin
  FreeAndNil(Botones);

  inherited;
end;

procedure TframeListaProgramas.CargarListaProgramas(codItemDeGrupo: Integer);
var
  AItem: TdxTileControlItem;
//  NewButton: TButton;
//  TopValue: Integer;
begin
  LimpiarVentana;

  // Debo pedirle al servidor la lista de Programas correspondientes al item de
  // grupo pasado por parametro. POR AHORA LO LEO DEL ARCHIVO 'MenuUsuario.xml'
  // En esa lista nos va a venir el nombre de la Clase del Form y sus parametros
  cds_Programas.LoadFromFile(DataPath + 'MenuUsuario.xml');

  // Filtro todos los Programas que tienen como Padre al codItemDeGrupo pasado
  cds_Programas.Filtered := False;
  cds_Programas.Filter := 'codItemPadre = ' + QuotedStr(IntToStr(codItemDeGrupo));
  cds_Programas.Filtered := True;

//  TopValue := 50;

  cds_Programas.First;
  while not cds_Programas.Eof do begin

//    NewButton := TButton.Create(Self);
//    NewButton.Parent := Self;

//    NewButton.Top := TopValue;
//    NewButton.Left := 70;
//    NewButton.Width := 160;
//    NewButton.Height := 70;

//    NewButton.Tag := cds_Programas.FieldByName('codItemMenu').AsInteger;
//    NewButton.Caption :=  cds_Programas.FieldByName('descItemMenu').AsString;

//    NewButton.OnClick := OnButtonClick;

//    Botones.Add(NewButton);
//    TopValue := TopValue + 90;

    AItem := tc_Programas.Items.Add;
    AItem.AnimationInterval := 3000;
    AItem.AnimationMode := amScrollUp;

    AItem.DetailOptions.ShowTab := False;
{
    AItem.Frames;
    AItem.Glyph.Image.LoadFromFieldValue( ),
    AItem.Glyph.Align := oaMiddleRight;
}
    AItem.GroupIndex := 0; // Ponemos los items todos en un grupo!
    AItem.Tag := cds_Programas.FieldByName('codItemMenu').AsInteger;
    AItem.IsLarge := True;
    AItem.OptionsAnimate.AnimateText := True;
    AItem.RowCount := 1;
    AItem.Style.Gradient := gmVertical;
    AItem.Style.BorderColor := clBlack;
    //AItem.Style.GradientBeginColor := $008B8B8B;
    AItem.Style.GradientBeginColor := GetRandomColor;
    //AItem.Style.GradientEndColor := $00D4D4D4;
    AItem.Style.GradientEndColor   := GetRandomColor;
    AItem.Text1.Align := oaTopLeft;
    AItem.Text1.Font.Size := 11;
    AItem.Text1.IndentHorz := 10;
    AItem.Text1.IndentVert := 10;
    AItem.Text1.TextColor := clDefault;
    AItem.Text1.Transparent := True;
    AItem.Text1.Value := cds_Programas.FieldByName('descItemMenu').AsString;

    AItem.OnClick := OnButtonClick;

    cds_Programas.Next;
  end;
  cds_Programas.Close;
end;

function TframeListaProgramas.GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

procedure TframeListaProgramas.LimpiarVentana;
begin
  tc_ProgramasGroup1.DeleteItems;

{
  // elimino los botones creados
  while Botones.Count > 0 do begin
    TButton(Botones.Items[0]).Free;
    Botones.Delete(0);
  end;
}
end;

procedure TframeListaProgramas.OnButtonClick(Sender: TdxTileControlItem);
var
  NombrePrograma: string;
  ParametroInicial: string;
  Titulo: string;
begin
  // aca abrimos los Forms (los Programas)

//  MessageBox(0, PChar(Sender.Text1.Value), PChar('Programa ' + IntToStr(Sender.Tag)), 0);

  NombrePrograma   := '';
  ParametroInicial := '';
  Titulo := '';

  if Sender.Tag = 6 then
    // Maestro de Empresas
    NombrePrograma := 'TFNSeg0001'
  else if Sender.Tag = 9 then
    // Maestro de Usuarios
    NombrePrograma := 'TFNSeg0002'
  else if Sender.Tag = 8 then
    // Maestro de Condiciones de Pago
    NombrePrograma := 'TFNVar0001'
  else if Sender.Tag = 13 then
    // Maestro de Impuestos
    NombrePrograma := 'TFNImp0001'
  else if Sender.Tag = 7 then
    // Maestro de Clientes
    NombrePrograma := 'TFNCli0001'
  else if Sender.Tag = 19 then
    // Maestro de Clasificadores
    NombrePrograma := 'TFNCla0001'
  else if Sender.Tag = 20 then
    // Maestro de Valores de Clasificador
    NombrePrograma := 'TFNCla0002'
  else if Sender.Tag = 21 then
    // Maestro de Artículos
    NombrePrograma := 'TFNArt0001'
  else if Sender.Tag = 12 then
    // Maestro de Tipo de Producto
    NombrePrograma := 'TFNArt0002'
  else if Sender.Tag = 24 then
    NombrePrograma := 'TFNVen0001'
  else if Sender.Tag = 25 then
    NombrePrograma := 'TFNVen0002'
  else if Sender.Tag = 26 then
    NombrePrograma := 'TFNVen0003'
  else if Sender.Tag = 27 then
    NombrePrograma := 'TFNVen0004'
  else if Sender.Tag = 10 then
    // Maestro de Tablas de Validacion
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'TablaValidacionCaracProducto' ;
      Titulo :=  'ABM de Tablas de Validacion Caracteristicas de Producto';
    end
  else if Sender.Tag = 11 then
    // Maestro de Caracteristicas
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'CaracProducto' ;
      Titulo := 'ABM de Caracteristicas de Producto';
    end
  else if Sender.Tag = 14 then
    // Maestro de Idiomas
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Idioma' ;
      Titulo := 'ABM de Idiomas';
    end
  else if Sender.Tag = 15 then
    // Maestro de Paises
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Pais' ;
      Titulo := 'ABM de Paises';
    end
  else if Sender.Tag = 16 then
    // Maestro de Provincia
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Provincia' ;
      Titulo := 'ABM de Provincias';
    end
  else if Sender.Tag = 17 then
    // Maestro de Vendedor
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Vendedor' ;
      Titulo := 'ABM de Vendedores';
    end
  else if Sender.Tag = 18 then
    // Maestro de Representante
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Representante' ;
      Titulo := 'ABM de Representantes';
    end
  else if Sender.Tag = 22 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'UnidadMedida';
      Titulo := 'ABM de Unidades de Medida';
    end
  else if Sender.Tag = 23 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'ValoresDeTablas';
      Titulo := 'ABM de Valores de Tablas de Características';
    end
  else if Sender.Tag = 29 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Configuracion';
      Titulo := 'ABM de Parametros';
    end
  else if Sender.Tag = 30 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'Laboratorio';
      Titulo := 'ABM de Laboratorio';
    end
  else if Sender.Tag = 31 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'TablaValidacionDeterminacion';
      Titulo := 'ABM de Tablas de Validacion';
    end
  else if Sender.Tag = 32 then
    begin
      NombrePrograma   := 'TFNUti0001';
      ParametroInicial := 'ValoresTablaValidacionDeter';
      Titulo := 'ABM de Valores Tablas de Validacion';
    end
  else if Sender.Tag = 33 then
    begin
      NombrePrograma   := 'TFNLab0001';
      ParametroInicial := 'QUI';
      Titulo := 'ABM de Determinaciones';
    end
  else if Sender.Tag = 34 then
    begin
      NombrePrograma   := 'TFNLab0001';
      ParametroInicial := 'ELE';
      Titulo := 'ABM de Ensayos';
    end
  else if Sender.Tag = 35 then
    begin
      NombrePrograma   := 'TFNLab0002';
      ParametroInicial := 'QUI';
      Titulo := 'ABM de Analisis Quimicos';
    end
  else if Sender.Tag = 36 then
    begin
      NombrePrograma   := 'TFNLab0002';
      ParametroInicial := 'ELE';
      Titulo := 'ABM de Analisis Electricos';
    end;

  frmMainForm.Show;
  frmMainForm.AbrirPrograma(NombrePrograma, parametroInicial, titulo);
  // Oculto el Menu Principal
  TForm(Owner).Hide;
end;

end.
