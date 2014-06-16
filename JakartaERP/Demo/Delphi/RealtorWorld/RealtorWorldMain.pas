unit RealtorWorldMain;

interface

uses
  Forms, DB, Windows, Messages, SysUtils, Variants, Graphics, RealtorWorldDM,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxCustomTileControl,
  cxClasses, Classes, Controls, dxTileControl, cxImage, dxGDIPlusClasses,
  dxSkinsForm, dxSkinsDefaultPainters, RealtorWorldListing, RealtorWorldAgents,
  RealtorWorldResearch, RealtorWorldUnderConstruction, RealtorWorldLoanCalculator,
  RealtorWorldMortgageRate, RealtorWorldStatistic, ShellApi, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, jktFLogin, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxAnimation,
  Datasnap.DBClient;

type                                                    
  TfrmRealtorWorld = class(TForm)
    dxSkinController1: TdxSkinController;
    dxTile: TdxTileControl;
    dxTiledxTileControlGroup1: TdxTileControlGroup;
    dxTiledxTileControlGroup2: TdxTileControlGroup;
    dxTiledxTileControlGroup3: TdxTileControlGroup;
    tcaBlackTheme: TdxTileControlActionBarItem;
    tcaClearSelection: TdxTileControlActionBarItem;
    tcaExit: TdxTileControlActionBarItem;
    tcaMakeTileItemLarger: TdxTileControlActionBarItem;
    tcaMakeTileItemSmaller: TdxTileControlActionBarItem;
    tcaWhiteTheme: TdxTileControlActionBarItem;
    tlAgents: TdxTileControlItem;
    tlLoanCalculator: TdxTileControlItem;
    tlMortgageRates: TdxTileControlItem;
    tlPhotos: TdxTileControlItem;
    tlResearch: TdxTileControlItem;
    tlStatistics: TdxTileControlItem;
    tlSystemInformation: TdxTileControlItem;
    tlUserManagement: TdxTileControlItem;
    tlZillow: TdxTileControlItem;
    tcaLogin: TdxTileControlActionBarItem;
    tlLogin: TdxTileControlItem;
    cds_ItemsMenu: TClientDataSet;
    cds_ItemsMenucodItemMenu: TIntegerField;
    cds_ItemsMenudescItemMenu: TStringField;
    cds_ItemsMenucodItemPadre: TIntegerField;
    cds_ItemsMenuesGrupo: TBooleanField;
    cds_ItemsMenuesItemDeGrupo: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure tcaChangeThemeClick(Sender: TdxTileControlActionBarItem);
    procedure tcaExitClick(Sender: TdxTileControlActionBarItem);
    procedure tlActivateDetail(Sender: TdxTileControlItem);
    procedure tlUnderConstructionClick(Sender: TdxTileControlItem);
    procedure tlZillowClick(Sender: TdxTileControlItem);
    procedure dxTileItemCheck(Sender: TdxCustomTileControl; AItem: TdxTileControlItem);
    procedure tcaMakeTileItemLargerClick(Sender: TdxTileControlActionBarItem);
    procedure tcaLoginClick(Sender: TdxTileControlActionBarItem);
    procedure tlLoginActivateDetail(Sender: TdxTileControlItem);
    procedure tlLoginDeactivateDetail(Sender: TdxTileControlItem);
  private
    procedure SelectSkin(ABlackSkin: Boolean);
    procedure InitializeTileControlItemPhotos;
    procedure InitializeTileControlItemAgents;
    procedure UpdateActionBarsItems;
    procedure CrearMenu;
    procedure GenerarArchivoMenu;
  end;

var
  frmRealtorWorld: TfrmRealtorWorld;


implementation

uses
  RealtorWorldBaseFrame;

{$R *.dfm}

procedure TfrmRealtorWorld.CrearMenu;
var
  AGroup: TdxTileControlGroup;
  AItem: TdxTileControlItem;
  AFrame: TdxTileControlItemFrame;
begin
//  GenerarArchivoMenu;

  cds_ItemsMenu.LoadFromFile('ItemsMenu.xml');

  // primero creo los Grupos
  cds_ItemsMenu.Filtered := False;
  cds_ItemsMenu.Filter := 'esGrupo = True';
  cds_ItemsMenu.Filtered := True;

  cds_ItemsMenu.First;
  while not cds_ItemsMenu.Eof do
  begin
    AGroup := dxTile.Groups.Add;
    AGroup.Caption.Alignment := taLeftJustify;
    AGroup.Caption.Color := clDefault;
    AGroup.Caption.Font.Size := 16;
    AGroup.Caption.Text := cds_ItemsMenu.FieldByName('descItemMenu').AsString;
    AGroup.Index := cds_ItemsMenu.FieldByName('codItemMenu').AsInteger;

    cds_ItemsMenu.Next;
  end;

  // creo los Items de los Grupos
  cds_ItemsMenu.Filtered := False;
  cds_ItemsMenu.Filter := 'esItemDeGrupo = True';
  cds_ItemsMenu.Filtered := True;

  cds_ItemsMenu.First;
  while not cds_ItemsMenu.Eof do
  begin
    AItem := dxTile.Items.Add;
    AItem.AnimationInterval := 3000;
    AItem.AnimationMode := amScrollUp;

    AItem.DetailOptions.Caption := cds_ItemsMenu.FieldByName('descItemMenu').AsString;
    AItem.DetailOptions.DetailControl := nil;
    AItem.DetailOptions.ShowTab := True;
{
    AItem.Frames;
    AItem.Glyph.Image.LoadFromFieldValue( ),
    AItem.Glyph.Align := oaMiddleRight;
}
    AItem.GroupIndex := cds_ItemsMenu.FieldByName('codItemPadre').AsInteger;
    AItem.IsLarge := True;
    AItem.OptionsAnimate.AnimateText := True;
    AItem.RowCount := 1;
    AItem.Style.Gradient := gmVertical;
    AItem.Style.GradientBeginColor := $20205EE6;
    AItem.Style.GradientEndColor := $202774EB;
    AItem.Text1.Align := oaTopLeft;
    AItem.Text1.Font.Size := 13;
    AItem.Text1.IndentHorz := 10;
    AItem.Text1.IndentVert := 10;
    AItem.Text1.TextColor := clDefault;
    AItem.Text1.Transparent := True;
    AItem.Text1.Value := cds_ItemsMenu.FieldByName('descItemMenu').AsString;

    cds_ItemsMenu.Next;
  end;

  cds_ItemsMenu.Close;
{

  cds_ItemsMenu.First;
  while not cds_ItemsMenu.Eof do
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

    cds_ItemsMenu.Next;
  end;

}
end;

procedure TfrmRealtorWorld.dxTileItemCheck(
  Sender: TdxCustomTileControl; AItem: TdxTileControlItem);
begin
  UpdateActionBarsItems;
end;

procedure TfrmRealtorWorld.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  dxSkinController1.NativeStyle := False; 
  SelectSkin(True);
  dxTile.LookAndFeel.AssignedValues := [];
  InitializeTileControlItemPhotos;
  InitializeTileControlItemAgents;
  UpdateActionBarsItems;

  dxTile.Controller.StopFramesAnimation;
  try
    for I := 0 to dxTile.Items.Count - 1 do
      if dxTile.Items[I].Frames.Count > 0 then
        dxTile.Items[I].ActiveFrame := dxTile.Items[I].Frames[0];
  finally
  // hasta que no se loguee no movemos los frames!
//    dxTile.Controller.StartFramesAnimation;
  end;

  CrearMenu;
end;

procedure TfrmRealtorWorld.GenerarArchivoMenu;
begin
  // 'codItemMenu' representara el Index del grupo "TdxTileControlGroup" que
  // crearemos (lo necesitaremos para alojar o ubicar los ItemDeGrupo).
  // En 'GroupIndex' de los items "TdxTileControlItem" indicaremos este codigo
  // para que los items se ubiquen en el grupo correspondiente.
  // Para los Programas seteamos 'esGrupo' y 'esItemDeGrupo' en False, pues
  // no son ni un Grupo ni un Item de grupo.

  // creo los Grupos
  cds_ItemsMenu.CreateDataSet;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 1;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Seguridad';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 0;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := True;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 2;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Configuración';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 0;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := True;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 3;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Contabilidad';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 0;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := True;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  // creo los Items de cada grupo
  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 4;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Administración';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 1;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := True;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 5;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Interfaces';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 1;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := True;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 6;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Autorizaciones';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 1;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := True;
  cds_ItemsMenu.Post;

  // creo los Programas
  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 7;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Maestro de Empresas';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 4;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 8;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Maestro de Menu';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 4;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 9;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Maestro Perfil Funcional';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 4;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.Append;
  cds_ItemsMenu.FieldByName('codItemMenu').Value   := 10;
  cds_ItemsMenu.FieldByName('descItemMenu').Value  := 'Usuarios conectados';
  cds_ItemsMenu.FieldByName('codItemPadre').Value  := 4;
  cds_ItemsMenu.FieldByName('esGrupo').Value       := False;
  cds_ItemsMenu.FieldByName('esItemDeGrupo').Value := False;
  cds_ItemsMenu.Post;

  cds_ItemsMenu.SaveToFile('ItemsMenu.xml', dfXML); // dfBinary);
end;

procedure TfrmRealtorWorld.InitializeTileControlItemPhotos;
var
  AFrame: TdxTileControlItemFrame;
  AText2, AText3: string;
  AParentID, AHomeID: Integer;
  dsHomes, dsHomesInterior: TDataSet;
  AFmtSettings: TFormatSettings;

  procedure SetTexts(AItem: TdxTileControlCustomItem);
  begin
    AItem.Style.Font.Size := 13;
    AItem.Text2.Value := AText2;
    AItem.Text2.IndentHorz := 0;
    AItem.Text2.IndentVert := 0;
    AItem.Text2.Transparent := False;
    AItem.Text3.Value := AText3;
    AItem.Text3.IndentHorz := 0;
    AItem.Text3.IndentVert := 0;
    AItem.Text3.Transparent := False;
  end;

begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, AFmtSettings);
  dsHomes := DMRealtorWorld.clHomesAndHomes;
  dsHomesInterior := DMRealtorWorld.clHomePhotos;
  dsHomes.First;
  while not dsHomes.EOF do
  begin
    AFrame := tlPhotos.Frames.Add;
    AFrame.Glyph.Mode := ifmFill;
    AFrame.Glyph.Image.LoadFromFieldValue(dsHomes.FieldByName('Photo').Value);
    AFrame.Tag := dsHomes.FieldByName('ID').AsInteger;
    AHomeID := AFrame.Tag;
    AParentID := dsHomes.FieldByName('ID').AsInteger mod 7 + 1;
    AText2 := ' ' + dsHomes.FieldByName('Beds').AsString + ' Beds' + #10 + ' ' + dsHomes.FieldByName('Baths').AsString + ' Baths ';
    AText3 := ' ' + FloatToStrF(dsHomes.FieldByName('Price').AsFloat, ffCurrency, 10, 0, AFmtSettings)+ ' ';
    SetTexts(AFrame);

    dsHomesInterior.Locate('ParentID', AParentID, []);
    while not dsHomesInterior.EOF and
      (dsHomesInterior.FieldByName('ParentID').AsInteger = AParentID) do
    begin
      AFrame := tlPhotos.Frames.Add;
      AFrame.Glyph.Mode := ifmFill;
      AFrame.Glyph.Image.LoadFromFieldValue(dsHomesInterior.FieldByName('Photo').Value);
      AFrame.Tag := AHomeID;
      SetTexts(AFrame);
      dsHomesInterior.Next;
    end;
    dsHomes.Next;
  end;
end;

procedure TfrmRealtorWorld.SelectSkin(ABlackSkin: Boolean);
const
  SkinFileNames: array[Boolean] of string = ('MetroWhite.skinres', 'MetroBlack.skinres');
begin
  dxSkinsUserSkinLoadFromFile(DMRealtorWorld.DataPath + SkinFileNames[ABlackSkin]);
  tcaBlackTheme.Visible := not ABlackSkin;
  tcaWhiteTheme.Visible := ABlackSkin;
end;

procedure TfrmRealtorWorld.InitializeTileControlItemAgents;
var
  AFrame: TdxTileControlItemFrame;
  dsAgents: TDataSet;
begin
  dsAgents := DMRealtorWorld.clHomesAndAgents;
  dsAgents.First;
  while not dsAgents.EOF do
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
    dsAgents.Next;
  end;
end;

procedure TfrmRealtorWorld.tcaChangeThemeClick(Sender: TdxTileControlActionBarItem);
begin
  SelectSkin(Sender.Tag = 0);
end;

procedure TfrmRealtorWorld.tlActivateDetail(Sender: TdxTileControlItem);
begin
  if Sender.DetailOptions.DetailControl = nil then
    Sender.DetailOptions.DetailControl := GetDetailControlClass(Sender.Tag).Create(Self);
  TfrmBase(Sender.DetailOptions.DetailControl).SelectItem(tlPhotos.ActiveFrame.Tag,
    tlAgents.ActiveFrame.Tag);
end;

procedure TfrmRealtorWorld.tlLoginActivateDetail(Sender: TdxTileControlItem);
begin
  if Sender.DetailOptions.DetailControl = nil then
  begin
    Sender.DetailOptions.DetailControl := TfrmLogin.Create(Self);
    Sender.DetailOptions.DetailControl.Name := Sender.Name + 'DetailControl';
  end else
    Sender.DetailOptions.DetailControl.Tag := 0;
end;

procedure TfrmRealtorWorld.tlLoginDeactivateDetail(Sender: TdxTileControlItem);
begin
  if Assigned(Sender.DetailOptions.DetailControl) then begin
    if Sender.DetailOptions.DetailControl.Tag = 1 then begin
      // se loguearon!
      MessageBox(0, 'Logueado!', 'Authentication', 0);

      dxTile.Controller.StartFramesAnimation;
      dxTile.Title.Text := 'Jakarta ERP' + ' / ' +
        TfrmLogin(Sender.DetailOptions.DetailControl).txtUsuario.Text;
      dxTile.Title.Font.Color := clAqua;

      tcaLogin.Caption := 'Logout';
      tcaLogin.Tag := 0;
    end;
  end;
end;

procedure TfrmRealtorWorld.tcaExitClick(Sender: TdxTileControlActionBarItem);
begin
  Close;
end;

procedure TfrmRealtorWorld.tcaLoginClick(Sender: TdxTileControlActionBarItem);
begin
  if Sender.Tag = 1 then
    tlLogin.ActivateDetail
  else begin
      // cerramos sesion
      MessageBox(0, 'Sesión finalizada', 'Authentication', 0);

      dxTile.Controller.StopFramesAnimation;
      dxTile.Title.Text := 'Jakarta ERP';
      dxTile.Title.Font.Color := clDefault;

      tcaLogin.Caption := 'Login';
      tcaLogin.Tag := 1;
  end;
end;

procedure TfrmRealtorWorld.tcaMakeTileItemLargerClick(Sender: TdxTileControlActionBarItem);
var
  I: Integer;
begin
  for I := 0 to dxTile.CheckedItemCount - 1 do
    dxTile.CheckedItems[I].IsLarge := Sender.Tag = 1;
end;

procedure TfrmRealtorWorld.tlZillowClick(Sender: TdxTileControlItem);
begin
  ShellExecute(0, 'open', 'http://www.zillow.com', nil, nil, SW_SHOW);
end;

procedure TfrmRealtorWorld.UpdateActionBarsItems;
var
  AAllCheckedItemsAreLarge: Boolean;
  AAllCheckedItemsAreSmall: Boolean;
  AItem: TdxTileControlItem;
  I: Integer;
begin
  AAllCheckedItemsAreLarge := True;
  AAllCheckedItemsAreSmall := True;
  for I := 0 to dxTile.CheckedItemCount - 1 do
  begin
    AItem := dxTile.CheckedItems[I];
    AAllCheckedItemsAreLarge := AAllCheckedItemsAreLarge and (AItem.RowCount = 1) and AItem.IsLarge;
    AAllCheckedItemsAreSmall := AAllCheckedItemsAreSmall and (AItem.RowCount = 1) and not AItem.IsLarge;
  end;
  tcaMakeTileItemSmaller.Visible := (dxTile.CheckedItemCount > 0) and AAllCheckedItemsAreLarge;
  tcaMakeTileItemLarger.Visible := (dxTile.CheckedItemCount > 0) and AAllCheckedItemsAreSmall;
  tcaClearSelection.Visible := dxTile.CheckedItemCount > 0;
end;

procedure TfrmRealtorWorld.tlUnderConstructionClick(Sender: TdxTileControlItem);
begin
  if Sender.DetailOptions.DetailControl = nil then
  begin
    Sender.DetailOptions.DetailControl := TfrmUnderConstruction.Create(Self);
    Sender.DetailOptions.DetailControl.Name := Sender.Name + 'DetailControl';
  end;
end;

end.

