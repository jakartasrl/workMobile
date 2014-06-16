unit jktFNMet0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxRibbonForm, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMemo, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxSkinsdxBarPainter, dxBar;

type
  TjktEstado = (esAlta, esEdit, esRehabilita, esNil);
  TjktTipoABM = (abmLista, abmIndividual, abmListaConFiltro, abmEstandar);

type
  TfrmChild = class(TdxRibbonForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bbCopiarGrilla: TdxBarLargeButton;
    bbPegarGrilla: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    FEstado: TjktEstado;
    FTipoABM: TjktTipoABM;
    FModified: Boolean;
    FOnActivateChild: TNotifyEvent;
    FOnChanged: TNotifyEvent;

    function GetCanEdit: Boolean;
    function GetCanPaste: Boolean;
    function GetCanSave: Boolean;
    function CheckSaveChanges: Boolean;
    function QuerySaveFile: Integer;
    procedure DoActivateChild;
    procedure DoChanged;

  public
    property CanEdit: Boolean read GetCanEdit;
    property CanPaste: Boolean read GetCanPaste;
    property CanSave: Boolean read GetCanSave;
    property Modified: Boolean read FModified write FModified;
    property Estado: TjktEstado read FEstado write FEstado;
    //
    property OnActivateChild: TNotifyEvent read FOnActivateChild write FOnActivateChild;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;

  published
    property TipoABM: TjktTipoABM read FTipoABM write FTipoABM;

  end;

var
  frmChild: TfrmChild;

implementation

{$R *.dfm}

function TfrmChild.CheckSaveChanges: Boolean;
begin
  Result := True;
  if Modified then
    case QuerySaveFile of
      ID_YES:
        Result := True; // SaveFile(False);
      ID_CANCEL:
        Result := False;
    end;
end;

procedure TfrmChild.DoActivateChild;
begin
  if Assigned(OnActivateChild) then
    OnActivateChild(Self);
end;

procedure TfrmChild.DoChanged;
begin
  if Assigned(OnChanged) then
    OnChanged(Self);
end;

procedure TfrmChild.FormActivate(Sender: TObject);
begin
  DoActivateChild;
end;

procedure TfrmChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmChild.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := CheckSaveChanges;
end;

function TfrmChild.GetCanEdit: Boolean;
begin
  Result := False;
end;

function TfrmChild.GetCanPaste: Boolean;
begin
  Result := False;
end;

function TfrmChild.GetCanSave: Boolean;
begin
  Result := Modified;
end;

function TfrmChild.QuerySaveFile: Integer;
begin
  Result := Application.MessageBox(
    PChar(Format('¿Desea guardar los cambios realizados a "%s"?', [Caption])),
    PChar(Application.Title), MB_ICONQUESTION or MB_YESNOCANCEL);
end;

end.
