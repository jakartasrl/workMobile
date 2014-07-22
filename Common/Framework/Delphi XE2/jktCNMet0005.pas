unit jktCNMet0005;

interface

uses
  Classes, idHTTP;

type
  TjktUsuEmp = class(TObject)
    private
      FOidEmp    :integer;
      FDescEmp   :string;
      FOidPedDat :integer;
      FOidPedFun :integer;
    protected
    public
      constructor new (aOidEmp :integer; aDescEmp :String; aOidPerDat, aOidPerFun :integer);
      property OidEmp        :integer  read FOidEmp;
      property RazonSocial   :string   read FDescEmp;
      property OidPedDat     :integer  read FOidPedDat;
      property OidPedFun     :integer  read FOidPedFun;

end;

type

  TjktLogin = class(TObject)
    private
       FUsuario :integer;
       FApeNom  :string;
       FEmpresas :TList;
       FCurrentEmpresa :integer;
       FHost           :string;
       FPort           :string;
       FServlet        :string;
       FAplicacion     :string;
       FSesionID       :string;
       FProtocolo      :string;
       FHTTPOptions    :TidHTTPOptions;
       FIntegAuth      :boolean;
       FTrace          :boolean;
       FCertificado    :string;
       FOidSucursal : integer;
       function getCurrentEmpresa :TjktUsuEmp ;
       function getCountEmpresas :integer;
       function getEmpresa(aIndex :integer) :TjktUsuEmp;
    protected
    public
       constructor New(aUsu :integer; aApeNom :string; aSesionID :string ; Certificado : string);
       destructor Destroy; override;
       procedure addEmpresa(aOidEmp :integer; aDescEmp :String; aOidPerDat, aOidPerFun :integer);
       procedure setCurrentEmpresa(aValue :integer);
       procedure setEmpresaActiva(OIDEmpresa : integer);
       property Usuario   :integer  read FUsuario;
       property ApeNom    :string   read FApeNom;
       property CurrentEmpresa :TjktUsuEmp read getCurrentEmpresa;
       property CountEmpresas  :integer    read getCountEmpresas;
       property Empresa[index :integer] :TjktUsuEmp read getEmpresa;
       property Host         :string         read FHost         write FHost;
       property Port         :string         read FPort         write FPort;
       property Servlet      :string         read FServlet      write FServlet;
       property Aplicacion   :string         read FAplicacion   write FAplicacion;
       property SesionID     :string         read FSesionID     write FSesionID;
       property Protocolo    :string         read FProtocolo    write FProtocolo;
       property OidSucursal : integer read fOidSucursal write fOidSucursal;
       property HTTPOptions  :TIdHTTPOptions read FHTTPOptions  write FHTTPOptions;
       property IntegAuth    :boolean        read FIntegAuth    write FIntegAuth;
       property Trace        :boolean        read FTrace        write FTrace;
       property Certificado  : string        read FCertificado  write FCertificado;
end;

var
    Login: TjktLogin;

implementation

uses
  sysutils;

constructor TjktLogin.New(aUsu :integer;
                          aApeNom :string;
                          aSesionID :string;
                          Certificado : string);
begin
   inherited create;
   FUsuario        := aUsu;
   FApeNom         := aApeNom;
   FEmpresas       := TList.create;
   FCurrentEmpresa := 0;
   FSesionID       := aSesionID;
   FCertificado    := Certificado;
   FOidSucursal    := 0;
end;

destructor  TjktLogin.destroy;
var
  i :integer;
  obj :TObject;
begin
  for i:=0 to FEmpresas.count -1 do
     begin
        obj := TObject (FEmpresas.Items[i]);
        obj.free;
     end;
  FEmpresas.free;
  inherited destroy;
end;

procedure TjktLogin.addEmpresa(aOidEmp :integer; aDescEmp :String; aOidPerDat, aOidPerFun :integer);
begin
   FEmpresas.add(TjktUsuEmp.new(aOidEmp, aDescEmp, aOidPerDat, aOidPerFun));
end;

function TjktLogin.getCurrentEmpresa :TjktUsuEmp ;
begin
  if Self.getCountEmpresas() = 0
     then raise Exception.create('Sin Empresas Habilitadas')
     else result := TjktUsuEmp (FEmpresas.Items[FCurrentEmpresa]);
end;

procedure TjktLogin.setEmpresaActiva(OIDEmpresa : integer);
var
  i : integer;
begin
  for i:=0 to FEmpresas.Count-1 do
    begin
    if (TjktUsuEmp (FEmpresas.Items[i]).OidEmp = OIDEmpresa)
       then begin
            FCurrentEmpresa := i;
            break;
            end;
    end;
end;

function TjktLogin.getCountEmpresas :integer;
begin
  try
    if FEmpresas = nil
       then result := 0
       else result := FEmpresas.Count;
  except
    result := 0
  end;
end;

procedure TjktLogin.setCurrentEmpresa(aValue :integer);
begin
  FCurrentEmpresa := aValue;
end;

function TjktLogin.getEmpresa(aIndex :integer):TjktUsuEmp;
begin
   result := TjktUsuEmp(FEmpresas.Items[aIndex]);
end;
//--------------------------
constructor TjktUsuEmp.new (aOidEmp :integer; aDescEmp :String; aOidPerDat, aOidPerFun :integer);
begin
    inherited create;
    FOidEmp    := aOidEmp;
    FDescEmp   := aDescEmp;
    FOidPedDat := aOidPerDat;
    FOidPedFun := aOidPerFun;
end;



end.
