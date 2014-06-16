unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, kbmMWClient, kbmMWCustomTransport,kbmMWTCPIPIndyTransport,
  kbmMWInventoryClient, Db, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWClientDataset, Grids, DBGrids, kbmMemTable,
  kbmMemCSVStreamFormat, DBCtrls, kbmMWBinaryStreamFormat,
  kbmMWStreamFormat, ExtCtrls, ComCtrls,
  kbmMemBinaryStreamFormat, kbmMWTCPIPIndyClientTransport;

type
  TForm1 = class(TForm)
    kbmMWSimpleClient1: TkbmMWSimpleClient;
    kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport;
    kbmMWInventoryClient1: TkbmMWInventoryClient;
    kbmMWClientConnectionPool1: TkbmMWClientConnectionPool;
    kbmMWPooledSession1: TkbmMWPooledSession;
    dsClientSide: TDataSource;
    kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat;
    Label5: TLabel;
    qClientSide: TkbmMWClientQuery;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    Label6: TLabel;
    Button4: TButton;
    lbDebug: TListBox;
    TabSheet3: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    btnNamedServerSideQueryAll: TButton;
    btnNamedServerSideQuerySelected: TButton;
    btnNamedQueryServerSideResolve: TButton;
    TabSheet4: TTabSheet;
    btnClientSideQuery: TButton;
    Label3: TLabel;
    btnClientSideQueryResolve: TButton;
    btnSaveToBriefCase: TButton;
    btnLoadFromBriefCase: TButton;
    kbmMWClientBriefCaseBinaryStreamFormat1: TkbmMWClientBriefCaseBinaryStreamFormat;
    TabSheet5: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    dbgMaster: TDBGrid;
    dsMaster: TDataSource;
    qMaster: TkbmMWClientQuery;
    Button5: TButton;
    dbgClientSide: TDBGrid;
    dbiClientSide: TDBImage;
    dbmClientSide: TDBMemo;
    dbgServerSide: TDBGrid;
    dbiServerSide: TDBImage;
    dbmServerSide: TDBMemo;
    qServerSide: TkbmMWClientQuery;
    dsServerSide: TDataSource;
    qDetail: TkbmMWClientQuery;
    dsDetail: TDataSource;
    dbiMaster: TDBImage;
    dbmMaster: TDBMemo;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBImage1: TDBImage;
    btnResolveMaster: TButton;
    btnResolveDetail: TButton;
    TabSheet6: TTabSheet;
    Button6: TButton;
    mPerformancelog: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnNamedServerSideQueryAllClick(Sender: TObject);
    procedure btnNamedQueryServerSideResolveClick(Sender: TObject);
    procedure btnNamedServerSideQuerySelectedClick(Sender: TObject);
    procedure btnClientSideQueryClick(Sender: TObject);
    procedure btnClientSideQueryResolveClick(Sender: TObject);
    procedure btnSaveToBriefCaseClick(Sender: TObject);
    procedure btnLoadFromBriefCaseClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnResolveMasterClick(Sender: TObject);
    procedure btnResolveDetailClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure qClientSideResolveError(Sender: TObject; ErrorType: Integer;
      Message: String; RecordID: Integer; Current: Boolean;
      var Retry: Boolean);
    procedure qClientSideResolveFieldValueChange(Sender: TObject;
      Fields: TkbmMWFieldsList; Message: String; RecordID: Integer;
      Current: Boolean; var Skip: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
     // Connect a simple client to the server via the given transport.
     kbmMWSimpleClient1.Connect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     // Disconnect a simple client from the server.
     kbmMWSimpleClient1.Disconnect;
end;

// This button will make 100 inventory requests on the server.
// The inventory service gives the client a posibility to figure out
// which services the server provides, and via different inventory
// requests, the syntax for those services can also be provided.
procedure TForm1.Button3Click(Sender: TObject);
var
   v:variant;
   t1,t2:TDateTime;
   td:TDateTime;
   i:integer;
   slst:TStringList;
begin
     slst:=TStringList.Create;
     try
        for i:=0 to 100 do
        begin
             t1:=now();
             v:=kbmMWSimpleClient1.Request('KBMMW_INVENTORY','','',[]);
             t2:=now();
             td:=t2-t1;
             slst.CommaText:=v;
             lbDebug.Items.AddStrings(slst);
             lbDebug.Items.Add(inttostr(trunc(td*secsperday*1000)));
             Application.ProcessMessages;
        end;
     finally
        slst.Free;
     end;
end;

// This will ask for syntax details for the service named KBMMW_INVENTORY.
procedure TForm1.Button4Click(Sender: TObject);
var
   v:variant;
   slst:TStringList;
begin
     slst:=TStringList.Create;
     try
        v:=kbmMWSimpleClient1.Request('KBMMW_INVENTORY','','GET SYNTAX DETAILS',['KBMMW_INVENTORY']);
        slst.CommaText:=v;
        lbDebug.Items.AddStrings(slst);
     finally
        slst.free;
     end;
end;

// This will open the client dataset.
// Opening a service bound client dataset initiates communication
// with the specific query service on the server with the name
// as set in QueryService.
procedure TForm1.btnNamedServerSideQueryAllClick(Sender: TObject);
begin
     // Gets all records from server event table.
     if qServerSide.Active then qServerSide.Close;

     // Use named query.
     qServerSide.Query.Text:='@ALL_EVENTS';
     qServerSide.Open;
end;

// This call will resolve changes in the clients dataset back to the server.
// If any exceptions happens on the server, the client will be notified,
// and the client can correct the records which are reason to the exception,
// and retry the resolve operation. Check the OnResolveError event.
procedure TForm1.btnNamedQueryServerSideResolveClick(Sender: TObject);
begin
     // The server decides about KeyFields and TableName.
     qServerSide.Resolve;
end;

// This event is called whenever a record could not be resolved on the server.
// The server will try to resolve all records, and thus the client will be handed
// all the records which didnt succeed via this event handler.
procedure TForm1.btnNamedServerSideQuerySelectedClick(Sender: TObject);
begin
     // Gets selected record from server event table.
     if qServerSide.Active then qServerSide.Close;

     // Use named queries.
     qServerSide.Query.Text:='@SELECTED_EVENT';

     // Make sure to get parameters from the server along with the field definitions.
     qServerSide.FieldDefs.Update;

     // Set parameters.
     qServerSide.Params.ParamByName('EVENTID').AsSmallint:=3; // Request only record with event ID 3.
     qServerSide.Open;
end;

procedure TForm1.btnClientSideQueryClick(Sender: TObject);
begin
     // Gets records from server using a client side defined query.
     if qClientSide.Active then qClientSide.Close;
     qClientSide.Open;
end;

procedure TForm1.btnClientSideQueryResolveClick(Sender: TObject);
begin
     // Since its a client side defined query, the server do not know keyfield names and actual tablename.
     // Thus the client needs to provide these informations.
     // But in this example its set at designtime.
     qClientSide.Resolve;
end;

procedure TForm1.btnSaveToBriefCaseClick(Sender: TObject);
begin
     qClientSide.SaveToFileViaFormat('briefcase.dat',kbmMWClientBriefCaseBinaryStreamFormat1);
end;

procedure TForm1.btnLoadFromBriefCaseClick(Sender: TObject);
begin
     qClientSide.LoadFromFileViaFormat('briefcase.dat',kbmMWClientBriefCaseBinaryStreamFormat1);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     // Setup of M/D relationship has been done on designtime via the
     // MasterFields and DetailFields properties in this case.
     if qDetail.Active then qDetail.Close;
     if qMaster.Active then qMaster.Close;
     qMaster.Open;
     qDetail.Open;
end;

procedure TForm1.btnResolveMasterClick(Sender: TObject);
begin
     qMaster.Resolve;
end;

procedure TForm1.btnResolveDetailClick(Sender: TObject);
begin
     qDetail.Resolve;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
   i:integer;
   t1,t2:TDateTime;
   v:variant;
   tsec:integer;
begin
     t1:=now();
     for i:=0 to 9999 do
     begin
          v:=kbmMWSimpleClient1.Request('KBMMW_INVENTORY','','',[]);
     end;
     t2:=now();
     tsec:=trunc((t2-t1)*24*60*60);
     mPerformanceLog.Lines.Add('Time: '+inttostr(tsec)+' secs. = '+inttostr(trunc(tsec/10000)*1000)+' msecs/request.');
end;

procedure TForm1.qClientSideResolveError(Sender: TObject;
  ErrorType: Integer; Message: String; RecordID: Integer; Current: Boolean;
  var Retry: Boolean);
begin
     if Current then
        ShowMessage(format('Errortype=%d, Msg=%s, Field[0]=%s',[ErrorType,Message,TkbmMWClientQuery(Sender).Fields[0].AsString]))
     else
         ShowMessage(format('Errortype=%d, Msg=%s, RecordID=%d',[ErrorType,Message,RecordID]));
end;

procedure TForm1.qClientSideResolveFieldValueChange(Sender: TObject;
  Fields: TkbmMWFieldsList; Message: String; RecordID: Integer;
  Current: Boolean; var Skip: Boolean);
var
   s:string;
   i:integer;
begin
     dbgClientSide.Update;
     s:='Some fields changed values: ';
     for i:=0 to Fields.Count-1 do
     begin
          s:=s+Fields.Field[i].FieldName+'='+Fields.Field[i].AsString+',';
     end;
     ShowMessage(s);
end;

end.
