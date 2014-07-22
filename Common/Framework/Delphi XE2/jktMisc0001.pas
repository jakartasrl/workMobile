unit jktMisc0001;

interface

uses
  SysUtils, Math, Classes, Controls, Buttons, Windows, Graphics, kbmMemTable,
  System.AnsiStrings;

const
  caracValImpFis = ' qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890/+-.,ñ:?';
  B64Table    = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

var
  CantCeros: Integer;

function getValorAleatorio(rangoDesde : integer; rangoHasta : integer) : double;
function SubString(aPosInicial, aPosFinal : Integer; aString : String) : String;
function GetNombreUsuario : String;
function GetNombreUsuarioRed : String;
//function Base64Decode(const S: AnsiString): AnsiString;
function getRichToText(texto : string) : string;
function getTextToRich(texto: AnsiString): AnsiString;
function getRichToTextToPrint(texto : string) : string;
function redondear(valor : double ; decimal : integer) : double;
function truncar(valor : double ; decimal : integer) : double;
function FirstDateOfMonth(Date: TDateTime): TDateTime;
function LastDateOfMonth(Date: TDateTime): TDateTime;




implementation


// ****************************************************************************
// *** Comienzo funciones de Aníbal *******************************************
// ****************************************************************************

// Redondear
function redondear(valor : double ; decimal : integer) : double;
var
  ValorTemp : double;
  esNegativo : boolean;
begin
  if (valor<0)
     then begin
          valor := valor * -1;
          esNegativo := true;
          end
     else esNegativo := false;
  ValorTemp := valor * IntPower(10, decimal);
  ValorTemp := ValorTemp + 0.5;
  ValorTemp := trunc(ValorTemp);
  ValorTemp := ValorTemp / IntPower(10, decimal);
  if (esNegativo)
      then result := ValorTemp*-1
      else result := ValorTemp;
end;

// Redondear
function truncar(valor : double ; decimal : integer) : double;
var
  ValorTemp : double;
begin
  ValorTemp := valor * IntPower(10, decimal);
  ValorTemp := ValorTemp;
  ValorTemp := trunc(ValorTemp);
  ValorTemp := ValorTemp / IntPower(10, decimal);
  result := ValorTemp;
end;


function FirstDateOfMonth(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function LastDateOfMonth(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  // (if Month < 12 then inc(Month)
  // else begin Month := 1; inc(Year) end;
  // Result := EncodeDate(Year, Month, 1) - 1;
  Result := EncodeDate(Year, Month, MonthDays[IsLeapYear(Year), Month]);
end;

// ****************************************************************************
// *** Fin ********************************************************************
// ****************************************************************************


// Devuelve una valor aleatorio dentro del rango rangoDesde y rangoHasta.
function getValorAleatorio(rangoDesde : integer; rangoHasta : integer) : double;
var
valor : double;
begin
Randomize;
valor := rangoDesde;
while true do
  begin
  valor := Random(rangoHasta);
  if valor >= rangoDesde
     then break;
  end;
result := valor;
end;


function SubString(aPosInicial, aPosFinal : Integer; aString : String) : String;
var
SubStr : String;
posAct : Integer;
begin
if aPosInicial > Length(aString)
   then raise Exception.Create('La posicion inicial de la subcadena, supera la longitud de la cadena que la contiene.');

if aPosFinal > Length(aString)
   then raise Exception.Create('La posicion final de la subcadena, supera la longitud de la cadena que la contiene.');

SubStr := '';

for posAct := aPosInicial to aPosFinal do
 SubStr := SubStr + aString[posAct];

result := SubStr;
end;


function GetNombreUsuario : String;
var
  Name : PChar;
  Size : DWord;

begin

  Size := SizeOf(ShortString);
  GetMem(Name, Size);

  try
    GetUserName(Name, Size);
    Result := Trim(StrPas(Name));
  finally
    FreeMem(Name, Size);
  end;

end;

function GetNombreUsuarioRed : String;
var
  dwI : DWord;
begin
  dwI := MAX_PATH;
  SetLength (Result, dwI + 1);
  if WNetGetUser (Nil, PChar (Result), dwI) = NO_ERROR then
    SetLength (Result, StrLen (PChar (Result)))
  else
    SetLength (Result, 0)
end;

{
function Base64Decode(const S: AnsiString): AnsiString;
var
  OutBuf: array[0..2] of Byte;
  InBuf : array[0..3] of Byte;
  iI, iJ: Integer;
begin

    if Length(S) mod 4 <> 0 then
      raise Exception.Create('Base64: Incorrect string format');
    SetLength(Result, ((Length(S) div 4) - 1) * 3);
    for iI := 1 to (Length(S) div 4) - 1 do begin
      Move(S[(iI - 1) * 4 + 1], InBuf, 4);
      for iJ := 0 to 3 do
        case InBuf[iJ] of
          43: InBuf[iJ] := 62;
          48..57: Inc(InBuf[iJ], 4);
          65..90: Dec(InBuf[iJ], 65);
          97..122: Dec(InBuf[iJ], 71);
        else
          InBuf[iJ] := 63;
        end;
      OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
      OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
      OutBuf[2] := (InBuf[2] shl 6) or (InBuf[3] and $3F);
      Move(OutBuf, Result[(iI - 1) * 3 + 1], 3);
    end;
    if Length(S) <> 0 then begin
      Move(S[Length(S) - 3], InBuf, 4);
      if InBuf[2] = 61 then begin
        for iJ := 0 to 1 do
          case InBuf[iJ] of
            43: InBuf[iJ] := 62;
            48..57: Inc(InBuf[iJ], 4);
            65..90: Dec(InBuf[iJ], 65);
            97..122: Dec(InBuf[iJ], 71);
          else
            InBuf[iJ] := 63;
          end;
        OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
        Result := Result + Char(OutBuf[0]);
      end else if InBuf[3] = 61 then begin
        for iJ := 0 to 2 do
          case InBuf[iJ] of
            43: InBuf[iJ] := 62;
            48..57: Inc(InBuf[iJ], 4);
            65..90: Dec(InBuf[iJ], 65);
            97..122: Dec(InBuf[iJ], 71);
          else
            InBuf[iJ] := 63;
          end;
        OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
        OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
        Result := Result + Char(OutBuf[0]) + Char(OutBuf[1]);
      end else begin
        for iJ := 0 to 3 do
          case InBuf[iJ] of
            43: InBuf[iJ] := 62;
            48..57: Inc(InBuf[iJ], 4);
            65..90: Dec(InBuf[iJ], 65);
            97..122: Dec(InBuf[iJ], 71);
          else
            InBuf[iJ] := 63;
          end;
        OutBuf[0] := (InBuf[0] shl 2) or ((InBuf[1] shr 4) and $3);
        OutBuf[1] := (InBuf[1] shl 4) or ((InBuf[2] shr 2) and $F);
        OutBuf[2] := (InBuf[2] shl 6) or (InBuf[3] and $3F);
        Result := Result + Char(OutBuf[0]) + Char(OutBuf[1]) + Char(OutBuf[2]);
      end;
    end;

end;
}

function getRichToText(texto : string) : string;
var
 nuevoTexto : string;
begin
 nuevoTexto := StringReplace(texto,chr(13)+chr(10),'<#e#>',[rfReplaceAll]);
 nuevoTexto := StringReplace(nuevoTexto,chr(9),'<#t#>',[rfReplaceAll]);
 result := nuevoTexto;
end;

function getRichToTextToPrint(texto : string) : string;
var
 nuevoTexto : string;
 i : integer;
 caracter : string;
 nuevaCadena : string;
begin
 nuevaCadena := '';
 nuevoTexto := StringReplace(texto,chr(13)+chr(10),' ',[rfReplaceAll]);
 nuevoTexto := StringReplace(nuevoTexto,chr(9),' ',[rfReplaceAll]);
 for i:=1 to length(nuevoTexto) do
   begin
   caracter := nuevoTexto[i];
   if (ansiPos(caracter,caracValImpFis)=0)
      then nuevaCadena := nuevaCadena +  ' '
      else nuevaCadena := nuevaCadena +  caracter;
   end;
 result := nuevaCadena;
end;


function getTextToRich(texto: AnsiString): AnsiString;
var
  nuevoTexto : AnsiString;
begin
  nuevoTexto := System.AnsiStrings.StringReplace(texto, AnsiString('<#e#>'), AnsiChar(13) + AnsiChar(10), [rfReplaceAll]);
  nuevoTexto := System.AnsiStrings.StringReplace(nuevoTexto, AnsiString('<#t#>'), AnsiChar(9), [rfReplaceAll]);
  result := nuevoTexto;
end;

initialization
  CantCeros := 3;

end.
