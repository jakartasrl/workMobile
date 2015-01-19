unit jktFNVen0009;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jktFNMet0001, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, jktCNMet0011,
  Data.DB, kbmMemTable, jktCNMet0012, jktCNMet0030, jktCNMet0002,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  jktCNMet0001, dxBar, cxClasses, cxSplitter, cxGroupBox, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, dxLayoutcxEditAdapters, dxLayoutContainer, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, jktCNMet0008, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  dxLayoutControl, dxLayoutLookAndFeels, cxTextEdit;

type
  TFNVen0009 = class(TfrmChild)
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    lcMain: TdxLayoutControl;
    cxDBDateEdit2: TcxDBDateEdit;
    jktExpDBGrid1: TjktExpDBGrid;
    jktExpDBGrid1DBTableView1: TcxGridDBTableView;
    jktExpDBGrid1Level1: TcxGridLevel;
    cxDBDateEdit1: TcxDBDateEdit;
    dxLayoutGroup4: TdxLayoutGroup;
    lcMainGroup6: TdxLayoutGroup;
    lcMainGroup3: TdxLayoutGroup;
    lcMainItem6: TdxLayoutItem;
    lcMainItem7: TdxLayoutItem;
    lcMainItem3: TdxLayoutItem;
    mtTipoCambio: TjktMemTable;
    dsTipoCambio: TDataSource;
    mtHeaders: TjktMemTable;
    mtHeadersfieldName: TStringField;
    mtHeaderslabel: TStringField;
    mtHeaderscolumnWidth: TSmallintField;
    mtTipoCambiooid_mon: TIntegerField;
    mtTipoCambiodes_mon: TStringField;
    mtTipoCambiodato1: TFloatField;
    mtTipoCambiodato2: TFloatField;
    mtTipoCambiodato3: TFloatField;
    mtTipoCambiodato4: TFloatField;
    mtTipoCambiodato5: TFloatField;
    mtTipoCambiovalor: TFloatField;
    mtTipoCambiooid: TIntegerField;
    jktExpDBGrid1DBTableView1oid: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1oid_mon: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1des_mon: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1dato1: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1dato2: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1dato3: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1dato4: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1dato5: TcxGridDBColumn;
    jktExpDBGrid1DBTableView1valor: TcxGridDBColumn;
    procedure OperacionTraerAfterEjecutar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


procedure TFNVen0009.OperacionTraerAfterEjecutar(Sender: TObject);
begin
  inherited;

  // Cambio los Captions de los Headers de la grilla
  if not mtHeaders.IsEmpty then
    begin
      if mtHeaders.Locate('fieldName', 'dato1', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1dato1.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1dato1.Caption := '';
      if mtHeaders.Locate('fieldName', 'dato2', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1dato2.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1dato2.Caption := '';
      if mtHeaders.Locate('fieldName', 'dato3', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1dato3.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1dato3.Caption := '';
      if mtHeaders.Locate('fieldName', 'dato4', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1dato4.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1dato4.Caption := '';
      if mtHeaders.Locate('fieldName', 'dato5', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1dato5.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1dato5.Caption := '';
      if mtHeaders.Locate('fieldName', 'valor', [loCaseInsensitive]) then
        jktExpDBGrid1DBTableView1valor.Caption := mtHeaders.FieldByName('label').AsString
      else
        jktExpDBGrid1DBTableView1valor.Caption := '';
    end;
end;

initialization
  RegisterClass(TFNVen0009);

end.
