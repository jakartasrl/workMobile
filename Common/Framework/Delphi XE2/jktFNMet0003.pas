unit jktFNMet0003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, StdCtrls, kbmMemTable, jktCNMet0008, Menus, cxGridCustomTableView,
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
  cxMaskEdit, cxContainer, cxGroupBox, cxSplitter, jktCNMet0012, jktCNMet0002,
  jktCNMet0030, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, jktCNTypes;


type
  TFormHelpGenerico = class(TForm)
    dsInput: TDataSource;
    popSeleccion: TPopupMenu;
    MISeleccionarTodos: TMenuItem;
    MIAnularSeleccion: TMenuItem;
    MISeleccionar: TMenuItem;
    N1: TMenuItem;
    MIInvertirSeleccion: TMenuItem;
    gbFiltroAvanzado: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    cxSplitter: TcxSplitter;
    mtConfigCampos: TjktMemTable;
    mtConfigCamposfieldName: TStringField;
    mtConfigCampostipo: TStringField;
    mtConfigCamposlongitud: TIntegerField;
    mtConfigCamposlabel: TStringField;
    mtConfigCamposvisible: TBooleanField;
    mtConfigCamposreadOnly: TBooleanField;
    mtConfigCamposorden: TSmallintField;
    mtInput: TjktMemTable;
    opConfig: TjktOperacion;
    opFiltroSimple: TjktOperacion;
    mtFiltros: TjktMemTable;
    mtParametros: TjktMemTable;
    mtParametrosEntidad: TStringField;
    Service: TjktServiceCaller;
    IdHTTP: TIdHTTP;
    dbgHelp: TjktExpDBGrid;
    dbgHelpDBTableView: TcxGridDBTableView;
    dbgHelpLevel1: TcxGridLevel;
    mtConfigCamposcolumnWidth: TSmallintField;
    mtParametrosEntidadMaestra: TStringField;
    mtParametrosOidEntidadMaestra: TIntegerField;
    opFiltroCompuesto: TjktOperacion;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure dbgHelpDblClick(Sender: TObject);
    procedure dbgHelpKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MIInvertirSeleccionClick(Sender: TObject);
    procedure popSeleccionPopup(Sender: TObject);
    procedure MISeleccionarClick(Sender: TObject);
    procedure MISeleccionarTodosClick(Sender: TObject);
    procedure MIAnularSeleccionClick(Sender: TObject);

  private
    { Private declarations }
    FEntidad           : string;
    FEntidadMaestra    : string;
    FOidEntidadMaestra : Integer;
    FTipoFiltro        : TjktTipoFiltro;
    FSeleccionMultiple : Boolean;

    FOidFieldName      : String;
    FCodFieldName      : String;
    FDescFieldName     : String;
    FResultFieldName   : String;

    procedure CrearColumnasDataSet;
    procedure CrearColumnasGrilla;
    procedure MarcarDesmarcaReg();
    function  HaySeleccionados() : Boolean;
  public
    { Public declarations }
    property Entidad           : string read FEntidad write FEntidad;
    property EntidadMaestra    : string read FEntidadMaestra write FEntidadMaestra;
    property OidEntidadMaestra : Integer read FOidEntidadMaestra write FOidEntidadMaestra;
    property TipoFiltro        : TjktTipoFiltro read FTipoFiltro write FTipoFiltro;
    property SeleccionMultiple : Boolean read FSeleccionMultiple write FSeleccionMultiple;

    property OidFieldName    : String    Read FOidFieldName     Write FOidFieldName;
    property CodFieldName    : String    Read FCodFieldName     Write FCodFieldName;
    property DescFieldName   : String    Read FDescFieldName    Write FDescFieldName;
    property ResultFieldName : String    Read FResultFieldName  Write FResultFieldName;

  end;

var
  FormHelpGenerico: TFormHelpGenerico;

const
  SelecFieldName = 'Selec';

implementation

{$R *.DFM}


procedure TFormHelpGenerico.FormCreate(Sender: TObject);
begin
  FEntidad           := '';
  FEntidadMaestra    := '';
  FOidEntidadMaestra := -1;

  FOidFieldName    := '';
  FCodFieldName    := '';
  FDescFieldName   := '';
  FResultFieldName := '';
end;

procedure TFormHelpGenerico.FormShow(Sender: TObject);
begin
  Self.Caption := Self.Caption + FEntidad;

  mtParametros.Open;
  mtParametros.Append;
  mtParametros.FieldByName('Entidad').Value := FEntidad;
  if Trim(FEntidadMaestra) <> '' then
    mtParametros.FieldByName('EntidadMaestra').Value := FEntidadMaestra;
  mtParametros.FieldByName('OidEntidadMaestra').Value := FOidEntidadMaestra;

  opConfig.execute;

  CrearColumnasDataSet;
  CrearColumnasGrilla;

  // Ahora pido los datos de la entidad dependiendo del Tipo de Filtro!
  if FTipoFiltro = fi_Activos then
    begin
      gbFiltroAvanzado.Visible := False;
      cxSplitter.Visible := False;

      if Trim(FEntidadMaestra) = '' then
        begin
          opFiltroSimple.OperName := 'FiltroActivos';
          opFiltroSimple.execute;
        end
      else
        begin
          opFiltroCompuesto.OperName := 'FiltroActivosCompuesto';
          opFiltroCompuesto.execute;
        end;
    end
  else if FTipoFiltro = fi_Inactivos then
    begin
      gbFiltroAvanzado.Visible := False;
      cxSplitter.Visible := False;
      opFiltroSimple.OperName := 'FiltroInactivos';
      opFiltroSimple.execute;
    end
  else if FTipoFiltro = fi_Avanzado then
    begin
      // Acá pido al server la configuración de los Filtros! Debería usar 'opConfig'
      gbFiltroAvanzado.Visible := True;
      cxSplitter.Visible := True;
      opFiltroSimple.OperName := 'FiltroAvanzado';
    end
  else if FTipoFiltro = fi_ValoresClasificador then
    begin
      // Voy a mostrar los Valores de TODOS los Componentes ubicados en el último
      // nivel de un Clasificador en particular. Por ahora se decidió hacer esto
      // para no tener que cambiar la grilla. Lo mejor sería mostrar el árbol
      // completo con todos los Valores
      gbFiltroAvanzado.Visible := False;
      cxSplitter.Visible := False;
      opFiltroCompuesto.OperName := 'FiltroValoresClasificador';
      opFiltroCompuesto.execute;
    end;

  btnAceptar.Enabled := True;
end;


procedure TFormHelpGenerico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 27) then
    btnCancelar.Click;
end;


function  TFormHelpGenerico.HaySeleccionados() : Boolean;
var
  DataSet : TDataSet;
  Book    : TBookMark;
begin
  Result := False;

  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Book    := DataSet.GetBookmark;
  Try
    DataSet.Filtered := False;
    DataSet.First;
    while not DataSet.EOF do
      begin
        if (DataSet.FieldByName(SelecFieldName).AsBoolean) then
          begin
            Result := True;
            Break;
          end;
        DataSet.Next;
      end;
  finally
    DataSet.GotoBookmark(Book);
    DataSet.FreeBookmark(Book);
    DataSet.EnableControls;
  end;
end;


procedure TFormHelpGenerico.btnAceptarClick(Sender: TObject);
begin
  if not (mtInput.Active) or ((mtInput.Active) and (mtInput.IsEmpty)) then
    Exit;

  if (SeleccionMultiple) and (not HaySeleccionados()) then
    // Si no hay seleccionados y apreta ENTER o Aceptar selecciona el posicionado.
    Self.MarcarDesmarcaReg();

  ModalResult := mrOk;
end;


procedure TFormHelpGenerico.CrearColumnasDataSet;
var
  name: string;
  tipo: TFieldType;
  size: Integer;
  fieldDef: TFieldDef;
begin
  mtConfigCampos.First;
  while not mtConfigCampos.Eof do
    begin
      name :=  mtConfigCampos.FieldByName('fieldName').AsString;
      if mtConfigCampos.FieldByName('tipo').AsString = 'Integer' then
        begin
          tipo := ftInteger;
          size := 0;
        end
      else if mtConfigCampos.FieldByName('tipo').AsString = 'String' then
        begin
          tipo := ftString;
          size := mtConfigCampos.FieldByName('longitud').asInteger;
        end
      else if mtConfigCampos.FieldByName('tipo').AsString = 'Float' then
        begin
          tipo := ftString;
          size := 0;
        end
      else if mtConfigCampos.FieldByName('tipo').AsString = 'Currency' then
        begin
          tipo := ftCurrency;
          size := 0;
        end
      else if mtConfigCampos.FieldByName('tipo').AsString = 'Boolean' then
        begin
          tipo := ftBoolean;
          size := 0;
        end;

      fieldDef := mtInput.FieldDefs.AddFieldDef ;
      fieldDef.name := name;
      fieldDef.dataType := tipo;
      fieldDef.Size := size;
      fieldDef.Required := false;

      mtConfigCampos.Next;
    end;

  fieldDef := mtInput.FieldDefs.AddFieldDef ;
  fieldDef.name := 'key';
  fieldDef.dataType := ftInteger;
  fieldDef.Size := 0;
  fieldDef.Required := false;

  if FSeleccionMultiple then
    begin
      fieldDef := mtInput.FieldDefs.AddFieldDef ;
      fieldDef.Name := SelecFieldName;
      fieldDef.DataType := ftBoolean;
      fieldDef.Required := False;
    end;

  mtInput.CreateTable;
  mtInput.Close;
  mtInput.Open;
end;

procedure TFormHelpGenerico.CrearColumnasGrilla;
var
  name     :string;
  etiqueta :string;
  visible  :boolean;
  readOnly :boolean;
  columna  :TcxGridDBColumn;
begin
  mtConfigCampos.SortFields := 'orden';
  mtConfigCampos.SortDefault;
  mtConfigCampos.First;
  while not mtConfigCampos.Eof do
    begin
       name     :=  mtConfigCampos.FieldByName('fieldName').AsString;
       etiqueta :=  mtConfigCampos.FieldByName('label').AsString;
       visible  :=  mtConfigCampos.FieldByName('visible').AsBoolean;
       readOnly :=  mtConfigCampos.FieldByName('readOnly').AsBoolean;

       columna  := dbgHelpDBTableView.CreateColumn;
       columna.Width := mtConfigCampos.FieldByName('columnWidth').AsInteger;
       columna.Caption := etiqueta;
       columna.HeaderAlignmentHorz := taCenter;
       columna.Options.Editing := not readOnly;
       columna.Visible  := visible;
       columna.DataBinding.FieldName := name;

       mtConfigCampos.Next;
    end;

{
  if FSeleccionMultiple then
    dbgHelpSeleccionar.Visible := True
  else
    dbgHelpSeleccionar.Visible := False;

}
end;

procedure TFormHelpGenerico.dbgHelpDblClick(Sender: TObject);
begin
  if SeleccionMultiple then
    Self.MarcarDesmarcaReg();
  btnAceptar.Click;
end;

procedure TFormHelpGenerico.dbgHelpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 32) and SeleccionMultiple then
    MarcarDesmarcaReg();
end;

procedure TFormHelpGenerico.MarcarDesmarcaReg();
var
  valor : Boolean;
begin
  valor := not dbgHelp.DataSource.DataSet.FieldByName(SelecFieldName).AsBoolean;
  if not (dbgHelp.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    dbgHelp.DataSource.DataSet.Edit;
  dbgHelp.DataSource.DataSet.FieldByName(SelecFieldName).AsBoolean := valor;
  dbgHelp.DataSource.DataSet.Post;
end;

procedure TFormHelpGenerico.popSeleccionPopup(Sender: TObject);
begin
  if (Self.SeleccionMultiple) then
    begin
      MISeleccionarTodos.Enabled  := True;
      MIInvertirSeleccion.Enabled := True;
      MIAnularSeleccion.Enabled   := True;
    end
  else
    begin
      MISeleccionarTodos.Enabled  := False;
      MIInvertirSeleccion.Enabled := False;
      MIAnularSeleccion.Enabled   := False;
    end;
end;

procedure TFormHelpGenerico.MISeleccionarClick(Sender: TObject);
begin
  if SeleccionMultiple then
    Self.MarcarDesmarcaReg()
  else
    btnAceptar.Click;
end;


procedure TFormHelpGenerico.MISeleccionarTodosClick(Sender: TObject);
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
        DataSet.FieldByName(SelecFieldName).AsBoolean := True;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
  end;
  dbgHelp.GotoFirst;
end;


procedure TFormHelpGenerico.MIInvertirSeleccionClick(Sender: TObject);
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
        valor := not DataSet.FieldByName(SelecFieldName).AsBoolean;
        DataSet.Edit;
        DataSet.FieldByName(SelecFieldName).AsBoolean := valor;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
  end;
  dbgHelp.GotoFirst;
end;

procedure TFormHelpGenerico.MIAnularSeleccionClick(Sender: TObject);
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
        DataSet.FieldByName(SelecFieldName).AsBoolean := False;
        DataSet.Next;
      end;
  finally
    DataSet.EnableControls;
  end;
  dbgHelp.GotoFirst;
end;


end.
