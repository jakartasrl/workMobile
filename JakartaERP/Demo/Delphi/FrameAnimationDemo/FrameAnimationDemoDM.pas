unit FrameAnimationDemoDM;

{$I cxVer.inc}

interface

uses
  SysUtils, Classes, Forms, DB, DBClient;

type
  TDM = class(TDataModule)
    dsHomePhotos: TDataSource;
    clHomePhotos: TClientDataSet;
    clHomePhotosID: TIntegerField;
    clHomePhotosParentID: TIntegerField;
    clHomePhotosPhoto: TBlobField;
    dsHomesAndAgents: TDataSource;
    clHomesAndAgents: TClientDataSet;
    clHomesAndAgentsID: TIntegerField;
    clHomesAndAgentsFirstName: TMemoField;
    clHomesAndAgentsLastName: TMemoField;
    clHomesAndAgentsPhone: TMemoField;
    clHomesAndAgentsEmail: TMemoField;
    clHomesAndAgentsPhoto: TBlobField;
    dsHomesAndHomes: TDataSource;
    clHomesAndHomes: TClientDataSet;
    clHomesAndHomesID: TIntegerField;
    clHomesAndHomesAddress: TMemoField;
    clHomesAndHomesBeds: TSmallintField;
    clHomesAndHomesBaths: TSmallintField;
    clHomesAndHomesHouseSize: TFloatField;
    clHomesAndHomesLotSize: TFloatField;
    clHomesAndHomesPrice: TFloatField;
    clHomesAndHomesFeatures: TMemoField;
    clHomesAndHomesYearBuilt: TMemoField;
    clHomesAndHomesType: TIntegerField;
    clHomesAndHomesStatus: TIntegerField;
    clHomesAndHomesPhoto: TBlobField;
    clHomesAndHomesAgentID: TIntegerField;
    clHomesAndHomesYearID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  ADataPath: string;
begin
  ADataPath := ExtractFilePath(Application.ExeName) + '..\..\Data\';
  clHomePhotos.LoadFromFile(ADataPath + 'HomePhotos.cds');
  clHomesAndAgents.LoadFromFile(ADataPath + 'HomesAndAgents.cds');
  clHomesAndHomes.LoadFromFile(ADataPath + 'HomesAndHomes.cds');
end;

end.
