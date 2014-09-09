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
  dxRibbon, dxSkinsdxBarPainter, dxBar, jktCNMet0002, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jktCNMet0001, Vcl.ActnList,
  jktCNMet0030, jktCNMet0005, Data.DB, kbmMemTable, jktCNMet0012, jktCNMet0011,
  IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  TjktEstado = (esAlta, esEdit, esRehabilita, esNil);

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
    mtParametroInicialEntidad: TStringField;
    OperacionTraer: TjktOperacion;
    ValidadorForm: TjktValidadorForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FEstado: TjktEstado;
    FParentActionList: TActionList; // guardamos la referencia al 'ActionList' del padre
    FOnActivateChild: TNotifyEvent;
    FOnChanged: TNotifyEvent;
    FParametroInicial: string;

    function GetCanEdit: Boolean;
    function GetCanPaste: Boolean;
    function CheckSaveChanges: Boolean;
    function QuerySaveFile: Integer;
    procedure DoActivateChild;
    procedure DoChanged;
    procedure setParametroInicial(aValue :string);

  protected
    FMultipleInstancia: Boolean;
    procedure llamarOperacionConfiguracion; virtual; abstract;

  public
    property CanEdit: Boolean read GetCanEdit;
    property CanPaste: Boolean read GetCanPaste;
    property Estado: TjktEstado read FEstado write FEstado;
    property MultipleInstancia: Boolean read FMultipleInstancia write FMultipleInstancia;
    property ParametroInicial: string read FParametroInicial;
    //
    property OnActivateChild: TNotifyEvent read FOnActivateChild write FOnActivateChild;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;

    procedure InicializarChild(ParentActionList: TActionList; ParametroInicial: string = '');

  published

  end;

var
  frmChild: TfrmChild;

implementation

{$R *.dfm}


function TfrmChild.CheckSaveChanges: Boolean;
begin
  Result := True;

  if not Driver.CanClose then
    begin
      Show;
      case QuerySaveFile of
        ID_YES:
          Result := True; // SaveFile(False);
        ID_NO:
          Result := False;
      end;
    end;
end;

procedure TfrmChild.setParametroInicial(aValue: string);
begin
  FParametroInicial := aValue;

  if not mtParametroInicial.Active
    then begin
      mtParametroInicial.Open;
      mtParametroInicial.Append;
    end;

  mtParametroInicial.FieldByName('Entidad').AsString := aValue;

  llamarOperacionConfiguracion;
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
  Driver.ActualizarEstadoBotones;
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

procedure TfrmChild.FormCreate(Sender: TObject);
begin
  FMultipleInstancia := False;
end;

function TfrmChild.GetCanEdit: Boolean;
begin
  Result := False;
end;

function TfrmChild.GetCanPaste: Boolean;
begin
  Result := False;
end;

procedure TfrmChild.InicializarChild(ParentActionList: TActionList;
  ParametroInicial: string);
begin
  // Cargo los datos de conexion al server para que se conecten todos los Programas
  Service.Host       := Login.Host;
  Service.Port       := Login.Port;
  Service.Servlet    := Login.Servlet;
  Service.Aplicacion := Login.Aplicacion;
  Service.Protocolo  := Login.Protocolo;

  if ParametroInicial <> '' then
    setParametroInicial(ParametroInicial);

  FParentActionList := ParentActionList;
  Driver.ActionList := FParentActionList;

  Driver.doOperacionesIniciales;
  ValidadorForm.inicializar;
  Driver.Inicio;
end;

function TfrmChild.QuerySaveFile: Integer;
begin
  // '¿Desea guardar los cambios realizados a "%s"?'
  Result := Application.MessageBox(
    PChar(Format('Perderá los datos editados en "%s",' + #$0D + #$0A + '¿Confirma Cancelar?', [Caption])),
    PChar(Application.Title), MB_ICONQUESTION or MB_YESNO);
end;

end.

