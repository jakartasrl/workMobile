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

  // ANALIZAR DONDE PONER TODOS LOS PROGRAMAS!
  jktFNMet0000,   jktFNSeg0001, jktFNSeg0002, Data.DB, Datasnap.DBClient;

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
    AItem.Style.GradientBeginColor := $008B8B8B;
    AItem.Style.GradientEndColor := $00D4D4D4;
    AItem.Text1.Align := oaTopLeft;
    AItem.Text1.Font.Size := 13;
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
begin
  // aca abrimos los Forms (los Programas)


//  MessageBox(0, PChar(Sender.Text1.Value), PChar('Programa ' + IntToStr(Sender.Tag)), 0);

  frmMainForm.Show;

  if Sender.Tag = 6 then
    begin
      // Maestro de Empresas
      FNSeg0001 := TFNSeg0001.Create(frmMainForm, frmMainForm.alActions)
    end
  else if Sender.Tag = 9 then
    begin
      // Maestro de Usuarios
      FNSeg0002 := TFNSeg0002.Create(frmMainForm, frmMainForm.alActions)
    end;

  // Oculto el Menu Principal
  TForm(Owner).Hide;
end;

end.
