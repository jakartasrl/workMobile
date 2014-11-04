unit jktFNUti0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, jktCNMet0008, kbmMemTable, jktCNMet0012, jktCNMet0011, Vcl.StdCtrls,
  cxContainer, cxSplitter, cxGroupBox;

type
  TFNUti0001 = class(TfrmChild)
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    jktExpDBGrid1: TjktExpDBGrid;
    operConfig: TjktOperacion;
    mtConfigCampos: TjktMemTable;
    mtConfigCamposfieldName: TStringField;
    mtConfigCampostipo: TStringField;
    mtConfigCamposlongitud: TIntegerField;
    mtConfigCamposlabel: TStringField;
    mtConfigCamposvisible: TBooleanField;
    mtConfigCamposreadOnly: TBooleanField;
    dsInput: TDataSource;
    mtInput: TjktMemTable;
    mtConfigCamposorden: TSmallintField;
    mtConfigOper: TjktMemTable;
    mtConfigOperoperSave: TStringField;
    mtConfigOperoperTraer: TStringField;
    mtConfigValidador: TjktMemTable;
    mtConfigValidadorfieldName: TStringField;
    mtConfigValidadortipoValidacion: TStringField;
    mtConfigValidadorentidad: TStringField;
    mtConfigValidadoroidName: TStringField;
    mtConfigValidadordescrName: TStringField;
    mtConfigValidadorestadoForm: TStringField;
    mtConfigCampostag: TIntegerField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   procedure crearColumnasDataset;
   procedure crearColumnasGrilla;
   procedure completarOperaciones;
   procedure crearValidaciones;
  protected
    procedure llamarOperacionConfiguracion; override;

  public
    { Public declarations }

  end;


implementation

{$R *.dfm}

procedure TFNUti0001.llamarOperacionConfiguracion;
begin
  operConfig.execute;

  crearColumnasDataset;
  crearColumnasGrilla;
  crearValidaciones;
  completarOperaciones;
end;


procedure TFNUti0001.completarOperaciones;
begin
   mtConfigOper.first;
   operacionSave.OperName  := mtConfigOper.FieldByName('operSave').AsString;
   operacionTraer.OperName := mtConfigOper.FieldByName('operTraer').AsString;
end;

procedure TFNUti0001.crearColumnasDataset;
var
  name :string;
  tipo :TFieldType;
  size :integer;
  tag :integer;
  fieldDef :TFieldDef;
begin
  mtConfigCampos.First;
  while not mtConfigCampos.Eof do
    begin
       name :=  mtConfigCampos.FieldByName('fieldName').AsString;
       if        mtConfigCampos.FieldByName('tipo').AsString = 'Integer'
       then      begin
                   tipo := ftInteger;
                   size := 0;
                 end
       else      if mtConfigCampos.FieldByName('tipo').AsString = 'String'
       then      begin
                   tipo := ftString;
                   size := mtConfigCampos.FieldByName('longitud').asInteger;
                 end
       else      if mtConfigCampos.FieldByName('tipo').AsString = 'Float'
       then      begin
                   tipo := ftString;
                   size := 0;
                 end
       else      if mtConfigCampos.FieldByName('tipo').AsString = 'Currency'
       then      begin
                   tipo := ftCurrency;
                   size := 0;
                 end

       else      if mtConfigCampos.FieldByName('tipo').AsString = 'Boolean'
       then      begin
                   tipo := ftBoolean;
                   size := 0;
                 end;
       fieldDef := mtInput.FieldDefs.AddFieldDef ;
       fieldDef.name := name;
       fieldDef.dataType := tipo;
       fieldDef.Size := size;
       fieldDef.Required := false;

       //mtInput.FieldDefs.Add(name, tipo, size,  false);
       mtConfigCampos.Next;
    end;

  mtInput.CreateTable;

  mtConfigCampos.First;
  while not mtConfigCampos.Eof do
    begin
      tag := mtConfigCampos.FieldByName('tag').AsInteger;
      name :=  mtConfigCampos.FieldByName('fieldName').AsString;
      mtInput.FindField(name).Tag := tag;
      mtConfigCampos.Next;
    end;

  mtInput.Close;
  mtInput.Open;
end;

procedure TFNUti0001.crearColumnasGrilla;
var
  name     :string;
  etiqueta :string;
  visible  :boolean;
  readOnly :boolean;
  columna  :TcxGridDBColumn;
begin
  mtConfigCampos.SortFields:='orden';
  mtConfigCampos.SortDefault;
  mtConfigCampos.First;
  while not mtConfigCampos.Eof do
    begin
       name     :=  mtConfigCampos.FieldByName('fieldName').AsString;
       etiqueta :=  mtConfigCampos.FieldByName('label').AsString;
       visible  :=  mtConfigCampos.FieldByName('visible').AsBoolean;
       readOnly :=  mtConfigCampos.FieldByName('readOnly').AsBoolean;

       columna  :=  jktExpDBGrid1DBTableView1.CreateColumn;
       //columna.Width := 40;
       columna.Caption := etiqueta;
       columna.HeaderAlignmentHorz := taCenter;
       columna.Options.Editing := not readOnly;
       columna.Visible  := visible;
       columna.DataBinding.FieldName := name;
       mtConfigCampos.Next;
    end;
end;

procedure TFNUti0001.crearValidaciones;
var
  validador :TjktValidador;
  validadorField :TjktValidadorField;

  validacion :TjktValidacion;
  asignador  : TjktAsignadorField;
begin
  mtConfigValidador.first;
  while not mtConfigValidador.eof do
  begin
    validador :=TjktValidador.Create(self);
    validador.Entidad := mtConfigValidador.fieldByName('entidad').AsString ;

    if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'Existente'
            then validacion := tExistente
    else if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'Inexistente'
            then validacion := tInexistente
    else if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'MayorCero'
            then validacion := tMayorCero
    else if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'MayorIgualCero'
            then validacion := tMayorIgualCero
    else if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'MenorIgualCien'
            then validacion := tMenorIgualCien
    else if mtConfigValidador.fieldByName('tipoValidacion').AsString = 'DistintoEspacio'
            then validacion := tDistintoEspacio;
    validador.Validacion := validacion;
    validadorField := validadorForm.ListaValidaciones.add;
    if  mtConfigValidador.fieldByName('estadoForm').AsString = 'New' then
      validadorField.ValidadorNew := validador
    else if  mtConfigValidador.fieldByName('estadoForm').AsString = 'Modif' then
      validadorField.ValidadorModif := validador
    else
      validadorField.ValidadorGral  := validador;

    validadorField.Field := mtInput.FieldByName(mtConfigValidador.FieldByName('fieldName').AsString);
    if validacion = tExistente
      then begin
            //oid
            asignador  := TjktAsignadorField.Create(validador.ListaAsignaciones);
            asignador.FieldName := mtConfigValidador.fieldByName('oidName').AsString;
            asignador.FieldTarget := mtInput.FieldByName(asignador.FieldName);
            asignador.SourceName  := 'oid';

            // Descripcion
            asignador  := TjktAsignadorField.Create(validador.ListaAsignaciones);
            asignador.FieldName := mtConfigValidador.fieldByName('descrName').AsString;
            asignador.FieldTarget := mtInput.FieldByName(asignador.FieldName);
            asignador.SourceName  := 'descripcion';

           end;

    validadorField.Field.OnValidate := validadorForm.validar;
    mtConfigValidador.Next;
  end;
end;

procedure TFNUti0001.FormCreate(Sender: TObject);
begin
  inherited;

  FMultipleInstancia := True;
  cxGroupBoxLeft.Width  := trunc(Screen.Width * 0.1);
  cxGroupBoxRight.Width := cxGroupBoxLeft.Width;
end;

initialization
  RegisterClass(TFNUti0001);

end.
