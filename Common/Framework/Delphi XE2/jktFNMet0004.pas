unit jktFNMet0004;

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
  TFormHelpCustomizado = class(TForm)
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
    mtInput: TjktMemTable;
    opFiltro: TjktOperacion;
    Service: TjktServiceCaller;
    IdHTTP: TIdHTTP;
    dbgHelp: TjktExpDBGrid;
    dbgHelpDBTableView: TcxGridDBTableView;
    dbgHelpLevel1: TcxGridLevel;
    mtInputoid: TIntegerField;
    mtInputcodigo: TStringField;
    mtInputdescripcion: TStringField;
    mtInputseleccionado: TBooleanField;
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
    FSeleccionMultiple : Boolean;

    procedure MarcarDesmarcaReg();
    function  HaySeleccionados() : Boolean;
  public
    { Public declarations }
    property SeleccionMultiple : Boolean read FSeleccionMultiple write FSeleccionMultiple;

  end;

var
  FormHelpCustomizado: TFormHelpCustomizado;

const
  SelecFieldName = 'seleccionado';

implementation

{$R *.DFM}


procedure TFormHelpCustomizado.FormShow(Sender: TObject);
begin
  opFiltro.execute;

  btnAceptar.Enabled := True;
end;


procedure TFormHelpCustomizado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 27) then
    btnCancelar.Click;
end;


function  TFormHelpCustomizado.HaySeleccionados() : Boolean;
var
  DataSet : TDataSet;
  Book    : TBookMark;
begin
  Result := False;

  DataSet := dbgHelp.DataSource.DataSet;
  DataSet.DisableControls;
  Book := DataSet.GetBookmark;
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


procedure TFormHelpCustomizado.btnAceptarClick(Sender: TObject);
begin
  if not (mtInput.Active) or ((mtInput.Active) and (mtInput.IsEmpty)) then
    Exit;

  if (SeleccionMultiple) and (not HaySeleccionados()) then
    // Si no hay seleccionados y apreta ENTER o Aceptar selecciona el posicionado.
    Self.MarcarDesmarcaReg();

  ModalResult := mrOk;
end;

procedure TFormHelpCustomizado.dbgHelpDblClick(Sender: TObject);
begin
  if SeleccionMultiple then
    Self.MarcarDesmarcaReg();
  btnAceptar.Click;
end;

procedure TFormHelpCustomizado.dbgHelpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 32) and SeleccionMultiple then
    MarcarDesmarcaReg();
end;

procedure TFormHelpCustomizado.MarcarDesmarcaReg();
var
  valor : Boolean;
begin
  valor := not dbgHelp.DataSource.DataSet.FieldByName(SelecFieldName).AsBoolean;
  if not (dbgHelp.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    dbgHelp.DataSource.DataSet.Edit;
  dbgHelp.DataSource.DataSet.FieldByName(SelecFieldName).AsBoolean := valor;
  dbgHelp.DataSource.DataSet.Post;
end;

procedure TFormHelpCustomizado.popSeleccionPopup(Sender: TObject);
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

procedure TFormHelpCustomizado.MISeleccionarClick(Sender: TObject);
begin
  if SeleccionMultiple then
    Self.MarcarDesmarcaReg()
  else
    btnAceptar.Click;
end;


procedure TFormHelpCustomizado.MISeleccionarTodosClick(Sender: TObject);
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


procedure TFormHelpCustomizado.MIInvertirSeleccionClick(Sender: TObject);
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

procedure TFormHelpCustomizado.MIAnularSeleccionClick(Sender: TObject);
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
