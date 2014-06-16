unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, kbmMWClient, kbmMWCustomTransport,kbmMWTCPIPIndyTransport,
  kbmMWInventoryClient, Db, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWClientDataset, Grids, DBGrids, kbmMemTable,
  kbmMemCSVStreamFormat, DBCtrls, kbmMWBinaryStreamFormat,
  kbmMWStreamFormat, ExtCtrls, ComCtrls,
  kbmMemBinaryStreamFormat;

type
  TForm1 = class(TForm)
    kbmMWSimpleClient1: TkbmMWSimpleClient;
    kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport;
    kbmMWInventoryClient1: TkbmMWInventoryClient;
    Label5: TLabel;
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
    TabSheet6: TTabSheet;
    Button6: TButton;
    mPerformancelog: TMemo;
    Button5: TButton;
    Label3: TLabel;
    lValue: TLabel;
    Button7: TButton;
    Button8: TButton;
    mStateIDs: TMemo;
    Label4: TLabel;
    Button9: TButton;
    Label7: TLabel;
    lStateID: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateStateIDs;
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

procedure TForm1.Button5Click(Sender: TObject);
var
   v:variant;
begin
     v:=kbmMWSimpleClient1.Request('STATEFUL','','GETNUMBER',[]);
     lValue.Caption:=inttostr(v);
     UpdateStateIDs;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
   v:variant;
begin
     v:=kbmMWSimpleClient1.Request('STATEFUL','','INCNUMBER',[]);
     lValue.Caption:=inttostr(v);
     UpdateStateIDs;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
     kbmMWSimpleClient1.ReleaseAllStates;
     UpdateStateIDs;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
     kbmMWSimpleClient1.ClearAllStates;
     UpdateStateIDs;
end;

procedure TForm1.UpdateStateIDs;
var
   i:integer;
   lst:TList;
begin
     lst:=kbmMWSimpleClient1.StateIDs.LockList;
     try
        mStateIDs.Clear;
        for i:=0 to lst.count-1 do
        begin
             with TkbmMWClientStateID(lst.Items[i]) do
             begin
                  mStateIDs.Lines.Add('ID:'+inttostr(FStateID)+' Service:'+FServiceName+'/'+FServiceVersion);
             end;
        end;
     finally
        kbmMWSimpleClient1.StateIDs.UnlockList;
     end;
     lStateID.Caption:=inttostr(kbmMWSimpleClient1.StateID);
end;

end.
