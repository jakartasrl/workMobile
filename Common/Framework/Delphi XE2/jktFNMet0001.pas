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
  dxSkinWhiteprint, dxSkinXmas2008Blue,

   cxTextEdit, cxMemo, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxRibbonSkins, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, dxSkinsdxBarPainter, dxBar, jktCNMet0002, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, Vcl.ActnList,
  jktCNMet0030, Data.DB, kbmMemTable, jktCNMet0012;

type
  TjktEstado = (esAlta, esEdit, esRehabilita, esNil);
  TjktTipoABM = (abmLista, abmIndividual, abmListaConFiltro, abmEstandar);

type
  TfrmChild = class(TdxRibbonForm)
    BarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bbCopiarGrilla: TdxBarLargeButton;
    bbPegarGrilla: TdxBarLargeButton;
    Driver: TjktDriver;
    IdHTTP: TIdHTTP;
    Service: TjktServiceCaller;
    OperacionSave: TjktOperacion;
    mtParametroInicial: TjktMemTable;
    mtParametroInicialvalor: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FEstado: TjktEstado;
    FTipoABM: TjktTipoABM;
    FParentActionList: TActionList; // guardamos la referencia al 'ActionList' del padre
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
    procedure setParametroInicial(aValue :string);
  protected
    procedure llamarOperacionConfiguracion;  dynamic; abstract;

  public
    constructor Create(AOwner: TComponent; ParentActionList: TActionList); overload;
    property CanEdit: Boolean read GetCanEdit;
    property CanPaste: Boolean read GetCanPaste;
    property CanSave: Boolean read GetCanSave;
    property Modified: Boolean read FModified write FModified;
    property Estado: TjktEstado read FEstado write FEstado;
    property ParametroInicial :string write setParametroInicial;
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

procedure TfrmChild.setParametroInicial(aValue :string);
begin
  if not mtParametroInicial.Active
    then begin
           mtParametroInicial.open;
           mtParametroInicial.append;
    end;
  mtParametroInicial.FieldByName('valor').AsString := aValue;
  llamarOperacionConfiguracion;
end;

constructor TfrmChild.Create(AOwner: TComponent; ParentActionList: TActionList);
begin
  inherited Create(AOwner);
  // Guardo la referencia del ActionList del padre para que el Driver pueda
  // inhibir o desinhibir los botones del menu
  FParentActionList := ParentActionList;
  Driver.ActionList := FParentActionList;
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

procedure TfrmChild.FormShow(Sender: TObject);
begin
  Driver.Inicio;
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
