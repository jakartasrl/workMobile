unit jktFMet003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, StdCtrls, kbmMemTable, jktCMet008, Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridLevel, cxGrid, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCheckBox, cxBlobEdit,
  cxMaskEdit;

type
  TFMet003 = class(TForm)
    dsHelp: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    popSeleccion: TPopupMenu;
    MISeleccionarTodos: TMenuItem;
    MIAnularSeleccion: TMenuItem;
    MISeleccionar: TMenuItem;
    N1: TMenuItem;
    MIInvertirSeleccion: TMenuItem;
    Button1: TButton;
//    DBF: TDBFinderEdit;       reemplazo este componente obsoleto por el filtro que tiene la grilla
    dbgHelp: TjktExpDBGrid;
    dbgHelpLevel1: TcxGridLevel;
    dbgHelpDBTableView1: TcxGridDBTableView;
    dbgHelpSeleccionar: TcxGridDBColumn;
    dbgHelpDescripcion: TcxGridDBColumn;
    dbgHelpCodigo: TcxGridDBColumn;
    dbgHelSelec: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure dbgHelpDblClick(Sender: TObject);
    procedure dbgHelpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MIInvertirSeleccionClick(Sender: TObject);
    procedure popSeleccionPopup(Sender: TObject);
    procedure MISeleccionarClick(Sender: TObject);
    procedure MISeleccionarTodosClick(Sender: TObject);
    procedure MIAnularSeleccionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FDataSet         : TDataSet;
    FResultFieldName : String;
    FOidFieldName    : String;
    FCodFieldName    : String;
    FDescFieldName   : String;
    FSelecFieldName  : String;
    FMostrarColSelec : Boolean;
    FAllowNuevos : boolean;
    FFormNameABM : string;
    fSeleccionMultiple : boolean;
    function CrearABM(NombreForm : string) : TForm;
    procedure ValidateProperties();
    procedure setLayOut();
    procedure MarcarDesmarcaReg();
    function  HaySeleccionados() : Boolean;
  public
    { Public declarations }
    property AllowNuevos : boolean read fAllowNuevos write fAllowNuevos;
    property DataSet        : TDataSet  Read FDataSet          Write FDataSet;
    property OidFieldName   : String    Read FOidFieldName     Write FOidFieldName;
    property CodFieldName   : String    Read FCodFieldName     Write FCodFieldName;
    property DescFieldName  : String    Read FDescFieldName    Write FDescFieldName;
    property SelecFieldName : String    Read FSelecFieldName   Write FSelecFieldName;
    property ResultFieldName: String    Read FResultFieldName  Write FResultFieldName;
    property MostrarColSelec: Boolean   Read FMostrarColSelec  Write FMostrarColSelec;
    property SeleccionMultiple : Boolean read fSeleccionMultiple write fSeleccionMultiple;
    property FormNameABM : string read fFormNameABM write fFormNameABM;
  end;

var
  FMet003: TFMet003;

implementation

{$R *.DFM}

// uses jktFMet001;

//Al Construir el Form
procedure TFMet003.FormCreate(Sender: TObject);
begin
  FDataSet         := Nil;
  FOidFieldName    := '';
  FCodFieldName    := '';
  FDescFieldName   := '';
  FResultFieldName := '';
end;


procedure TFMet003.ValidateProperties();
begin
  if (FDataSet = Nil)
     then Raise Exception.Create('La propiedad DataSet no fue asignada.');

  if (FOidFieldName = '')
     then Raise Exception.Create('La propiedad OidFieldName no fue asignada.');

  if (FCodFieldName = '')
     then Raise Exception.Create('La propiedad CodFieldName no fue asignada.');

  if (FDescFieldName = '')
     then Raise Exception.Create('La propiedad DescripcionFieldName no fue asignada.');

  if (FResultFieldName = '')
     then Raise Exception.Create('La propiedad ResultFieldName no fue asignada.');
end;

procedure TFMet003.setLayOut();
begin
  if (FSeleccionMultiple = True)
     then dbgHelpSeleccionar.Visible := True
     else dbgHelpSeleccionar.Visible := False;
end;

//Al mostrar el form
procedure TFMet003.FormShow(Sender: TObject);
begin
  setLayOut();

  ValidateProperties();

  //seteo los controles
  dsHelp.DataSet               := FDataSet;
  dbgHelp.KeyField             := FOidFieldName;
  dbgHelpCodigo.DataBinding.FieldName := FCodFieldName;
  dbgHelpDescripcion.DataBinding.FieldName := FDescFieldName;

//  DBF.DataField := FDescFieldName;        se cambia por la property 'GridOptionsView.ShowAutoFilterRow'
//  DBF.SelectAll;

  if ( FMostrarColSelec )
     then begin
            dbgHelSelec.DataBinding.FieldName := FSelecFieldName;
            dbgHelSelec.Visible   := True;
          end;

  //Voy al primer registro de la grilla
  dbgHelp.GotoFirst;

  if (self.AllowNuevos)
      then Button1.visible := true
      else Button1.visible := false;
end;


//Al cerrar el form
procedure TFMet003.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 27)
     then  btnCancelar.Click;
end;


function  TFMet003.HaySeleccionados() : Boolean;
var
  DataSet : TDataSet;
  Book    : TBookMark;
begin
  result := false;

  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Book    := DataSet.GetBookmark;
  Try
    DataSet.Filtered := False;
    DataSet.First;
    while not DataSet.EOF do
      begin
        if (DataSet.FieldByName('seleccionado').AsBoolean)
           then begin
                  result := true;
                  break;
                end;
        DataSet.Next;
      end;
  finally
    DataSet.GotoBookmark(Book);
    DataSet.FreeBookmark(Book);
    DataSet.EnableControls;
    DataSet := nil;
  end;
end;


procedure TFMet003.btnAceptarClick(Sender: TObject);
begin
  if (Assigned(FDataSet) and (FDataSet.Active))
 and (FDataSet.IsEmpty)
     then Abort;

  if (SeleccionMultiple)
 and (not HaySeleccionados())
     then Self.MarcarDesmarcaReg(); // Si no hay seleccionados y apreta ENTER o Aceptar selecciona el posicionado.
end;


procedure TFMet003.dbgHelpDblClick(Sender: TObject);
begin
  if (SeleccionMultiple = True)
     then Self.MarcarDesmarcaReg();
  btnAceptar.Click;
end;

procedure TFMet003.dbgHelpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (SeleccionMultiple = True)
     then if (Key = 32)
             then MarcarDesmarcaReg();
end;

procedure TFMet003.MarcarDesmarcaReg();
var
  valor : boolean;
begin
  valor := not dbgHelp.DataSource.DataSet.FieldByName('seleccionado').AsBoolean;
  if (not (dbgHelp.DataSource.DataSet.State in [dsEdit,dsInsert]))
     then dbgHelp.DataSource.DataSet.Edit;
  dbgHelp.DataSource.DataSet.FieldByName('seleccionado').AsBoolean := valor;
  dbgHelp.DataSource.DataSet.Post;
end;

procedure TFMet003.popSeleccionPopup(Sender: TObject);
begin
  if (Self.SeleccionMultiple)
     then begin
            MISeleccionarTodos.Enabled  := True;
            MIInvertirSeleccion.Enabled := True;
            MIAnularSeleccion.Enabled   := True;
          end
     else begin
            MISeleccionarTodos.Enabled  := False;
            MIInvertirSeleccion.Enabled := False;
            MIAnularSeleccion.Enabled   := False;
          end;
end;

procedure TFMet003.MISeleccionarClick(Sender: TObject);
begin
  if (SeleccionMultiple = True)
     then Self.MarcarDesmarcaReg()
     else btnAceptar.Click;
end;


procedure TFMet003.MISeleccionarTodosClick(Sender: TObject);
var
  DataSet : TDataSet;

begin
  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Try
    DataSet.Filtered := False;
    DataSet.First;
    while not DataSet.EOF do
      begin
        DataSet.Edit;
        DataSet.FieldByName('seleccionado').AsBoolean := True;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
    DataSet := nil;
  end;
  dbgHelp.GotoFirst;
end;


procedure TFMet003.MIInvertirSeleccionClick(Sender: TObject);
var
  DataSet : TDataSet;
  valor   : Boolean;
begin
  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Try
    DataSet.Filtered := False;
    DataSet.First;
    while not DataSet.EOF do
      begin
        valor := not DataSet.FieldByName('seleccionado').AsBoolean;
        DataSet.Edit;
        DataSet.FieldByName('seleccionado').AsBoolean := valor;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
    DataSet := nil;
  end;
  dbgHelp.GotoFirst;
end;

procedure TFMet003.MIAnularSeleccionClick(Sender: TObject);
var
  DataSet : TDataSet;
begin
  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Try
    DataSet.Filtered := False;
    DataSet.First;
    while not DataSet.EOF do
      begin
        DataSet.Edit;
        DataSet.FieldByName('seleccionado').AsBoolean := False;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
    DataSet := nil;
  end;
  dbgHelp.GotoFirst;
end;

function TFMet003.CrearABM(NombreForm : string) : TForm;
var
  formClase : TFormClass;
  form : TForm;
begin
  formClase := TFormClass(FindClass(NombreForm));
  form := formClase.Create(Nil);
  result := form;
end;

procedure TFMet003.Button1Click(Sender: TObject);
var
  form : TForm;
begin
//  if (FormNameABM<>'')
//      then begin
//           form := CrearABM(FormNameABM);
//           if (form is TFjkt001)
//               then TFjkt001(form).comportamiento := 'ALTA_DESDE_HELP';
//           form.showModal;
//           end;
end;

end.

