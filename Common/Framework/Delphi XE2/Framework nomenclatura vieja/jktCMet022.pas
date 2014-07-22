unit jktCMet022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jktCMet002, jktCMet012, jktCMet014, db, menus, cxDBEdit, cxTextEdit;

type
  TjktFiltro = class(TcxDBButtonEdit)
  private
    { Private declarations }
    FPropertysHelp : TPropertysTjktHelp;
    FHelp          : TjktHelp;
    FDataSet       : TjktMemTable;
    FField         : TField;
    FPopUp         : TPopUpMenu;
    FItemPopUp     : TMenuItem;

    procedure jktOnButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure jktOnKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
    procedure ValidarPropiedades();
    procedure CrearHelp();
    function  CrearFieldInterno() : TField;
    procedure ItemPopUpClick(Sender: TObject);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    function GetSeleccionados() : TDataSet;
  published
    { Published declarations }
    property PropertysHelp : TPropertysTjktHelp read FPropertysHelp write FPropertysHelp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Jakarta', [TjktFiltro]);
end;


procedure TjktFiltro.jktOnKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F1)
     then Self.jktOnButtonClick(self, 0);
end;


procedure TjktFiltro.jktOnButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
  Self.ValidarPropiedades();

  FHelp.Help(FField);
end;


constructor TjktFiltro.Create(AOwner : TComponent);
begin
  FPropertysHelp := TPropertysTjktHelp.Create;
  FPropertysHelp.Query := 3;
  inherited Create(AOwner);
  Self.Properties.OnButtonClick := jktOnButtonClick;
  Self.OnKeyDown     := jktOnKeyDown;
  Self.Properties.ViewStyle := vsHideCursor;
  FPopUp             := TPopUpMenu.Create(Self);
  FItemPopUp         := TMenuItem.Create(FPopUp);
  FItemPopUp.Caption := 'Limpiar Filtros';
  FItemPopUp.OnClick := ItemPopUpClick;
  FPopUp.Items.Add(FItemPopUp);
  Self.PopupMenu     := FPopUp;
end;


destructor TjktFiltro.Destroy();
begin
  FPropertysHelp.Destroy;
  FField := nil;
  if Assigned(FDataSet)
     then FDataSet.Close();
  FDataSet.Free;
  FHelp.Free;
  inherited Destroy();
end;


procedure TjktFiltro.CrearHelp();
begin
  FHelp := TjktHelp.Create(Self);
  FHelp.SeleccionMultiple := True;
  FHelp.Clasificador      := FPropertysHelp.Clasificador;
  FHelp.Componente        := FPropertysHelp.Componente;
  FHelp.Operacion         := FPropertysHelp.Operacion;
  FHelp.OSName            := FPropertysHelp.OSName;
  FHelp.Query             := FPropertysHelp.Query;
  FHelp.RefreshDatos      := FPropertysHelp.RefreshDatos;
end;


function TjktFiltro.CrearFieldInterno() : TField;
begin
  if not Assigned(FDataSet)
     then begin
            FDataSet := TjktMemTable.Create(Self);
            FDataSet.FieldDefs.Add('codigos_jktCMet022', ftString, 255, false);
            FDataSet.CreateTable;
            FDataSet.Open;
            DataBinding.DataSource := TDataSource.Create(Self);
            DataBinding.DataSource.DataSet := FDataSet;
            DataBinding.DataField  := 'codigos_jktCMet022';
          end;

  result := FDataSet.FieldByName('codigos_jktCMet022');
end;


procedure TjktFiltro.ValidarPropiedades();
begin
 // Si se asigno en el Form estas propiedades las usa, sino creo uno interno.
  if Assigned(Self.DataBinding.DataSource) and (Self.DataBinding.DataField <> '') then
    FField := Self.DataBinding.DataSource.DataSet.FieldByName(Self.DataBinding.DataField)
  else
    FField := Self.CrearFieldInterno();

  if not Assigned(FHelp)
     then Self.CrearHelp();
end;


function TjktFiltro.GetSeleccionados() : TDataSet;
var
  MTResult : TjktMemTable;
begin
  Self.ValidarPropiedades();

  MTResult      := TjktMemTable(FHelp.GetSelectedRecord());
  MTResult.Name := FPropertysHelp.DataSetName;

  if (not MTResult.Active)
     then MTResult.Open;

  result:= MTResult;
end;


procedure TjktFiltro.ItemPopUpClick(Sender: TObject);
begin
  if Assigned(FHelp)
     then FHelp.LimpiarDataSets;
  if Assigned(FField)
     then begin
            FField.DataSet.Edit;
            FField.Clear;
          end;
end;

end.
