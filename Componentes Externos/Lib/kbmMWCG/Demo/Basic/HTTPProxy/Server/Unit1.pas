unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  kbmMWServer, StdCtrls, kbmMWCustomTransport,
  kbmMWInventoryService, kbmMWTCPIPIndyTransport,
  Db, kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWBDE,
  kbmMWQueryService, kbmMemTable, DBTables, kbmMWResolvers,
  kbmMemCSVStreamFormat, kbmMWGlobal, kbmMWSecurity, kbmMWHTTPStdTransStream,
  kbmMWTCPIPIndyServerTransport;

type
  TForm1 = class(TForm)
    kbmMWServer1: TkbmMWServer;
    kbmMWTCPIPIndyServerTransport1: TkbmMWTCPIPIndyServerTransport;
    kbmMWBDEConnectionPool1: TkbmMWBDEConnectionPool;
    kbmMWPooledSession1: TkbmMWPooledSession;
    Database1: TDatabase;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    lCounter: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure kbmMWServer1ServeRequest(Sender: TObject;
      InStream: IkbmMWCustomRequestTransportStream;
      Service: TkbmMWCustomService; ClientIdent: TkbmMWClientIdentity;
      Args: TkbmMWVariantList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.DFM}

// This is a sample customizable server.
// New services can be created by creating a new kbmMWQueryService or
// kbmMWCustomService file via File->New->kbmMW Service objects
// and add the needed code/components.
//
// This example includes a TDatabase which is used as a _template_
// for how to connect to a BDE database by the TkbmMWBDEConnectionPool.
// TkbmMWBDEConnectionPool is a BDE connection pool (other database types
// can and will be supported by creating other TkbmMWCustomConnectionPool based
// components). The connection pool's job is to handle all connections towards
// the database, and handling database caching and more.
// Queries on the query service objects (see unit2.pas) are connected to
// the connection pool via a TkbmMWPooledSession which can be used to
// ensure the order of requests being in sync for a specific group of queries.
// Queries are grouped by connecting to different pooled session components.
//
// A server doesnt need to include any query service objects. Another way is to
// create business objects which themself contains all needed code to handle
// a client request.
// If the result of a client request is a dataset, its usually best to use
// a query session object instead of a standard object as base for
// the business objects.

procedure TForm1.Button1Click(Sender: TObject);
begin
     kbmMWServer1.Active:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     kbmMWServer1.Active:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   sd:TkbmMWCustomServiceDefinition;
begin
     // Register services here which this server application should provide.
     // RegisterService registers the service with the name the service prefers to be known as.
     // Using RegisterServiceByName you can register services under other custom names.
     // This can be of interest if you want to provide a standard service under a custom name.

     kbmMWDebugLevel:=mwdlAll;
     kbmMWDebugWhere:=mwddOneTextFile;
     kbmMWDebugTypes:=[mwdtTransport];
     kbmMWDebugFile:='c:\kbmMWHTTPProxyServer.log';

     // Set properties on sd to control additional servicedefinition settings.
     sd:=kbmMWServer1.RegisterService(TkbmMWInventoryService,false);
     sd:=kbmMWServer1.RegisterServiceByName('KBMMW_QUERY',TTestQuery,false);
end;

procedure TForm1.kbmMWServer1ServeRequest(Sender: TObject;
  InStream: IkbmMWCustomRequestTransportStream; Service: TkbmMWCustomService;
  ClientIdent: TkbmMWClientIdentity; Args: TkbmMWVariantList);
begin
     // Here you can catch requests before they are actually served.
     // It can f.ex. be usefull for logging, stats or other things.
     lCounter.Caption:=inttostr(strtoint(lCounter.Caption)+1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     kbmMWServer1.Statistics.Save('Stats.txt');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     kbmMWServer1.Statistics.Load('Stats.txt');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     kbmMWServer1.Active:=false;
end;

end.
