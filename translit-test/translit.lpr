program translit;
{$mode objfpc} {H+}
{$codepage CP866}
uses regexpr, fgl;
type
  TDictTrans=class(specialize TFPGMap<string, string>);
var
    strInput, strOutput:string;

function Translit(Str:string):string;
var Regex:TRegExpr;
    Dict:TDictTrans;
    Ch,oStr,oTrans:string;
    I:LongInt;
begin
     Regex:=TRegExpr.Create;
     Regex.Expression:='[Ä-ü]|[†-Ô]|\s';
     if not Regex.Exec(Str) then begin
       exit(Str);
     end;
     Dict:=TDictTrans.Create;
     Dict.Add(' ','_');
     Dict.Add('Ä','A'); Dict.Add('†','a');
     Dict.Add('Å','B'); Dict.Add('°','b');
     Dict.Add('Ç','V'); Dict.Add('¢','v');
     Dict.Add('É','G'); Dict.Add('£','g');
     Dict.Add('Ñ','D'); Dict.Add('§','d');
     Dict.Add('Ö','E'); Dict.Add('•','e');
     Dict.Add('','YO'); Dict.Add('Ò','yo');
     Dict.Add('Ü','ZH'); Dict.Add('¶','zh');
     Dict.Add('á','Z'); Dict.Add('ß','z');
     Dict.Add('à','I'); Dict.Add('®','i');
     Dict.Add('â','J'); Dict.Add('©','j');
     Dict.Add('ä','K'); Dict.Add('™','k');
     Dict.Add('ã','L'); Dict.Add('´','l');
     Dict.Add('å','M'); Dict.Add('¨','m');
     Dict.Add('ç','N'); Dict.Add('≠','n');
     Dict.Add('é','O'); Dict.Add('Æ','o');
     Dict.Add('è','P'); Dict.Add('Ø','p');
     Dict.Add('ê','R'); Dict.Add('‡','r');
     Dict.Add('ë','S'); Dict.Add('·','s');
     Dict.Add('í','T'); Dict.Add('‚','t');
     Dict.Add('ì','U'); Dict.Add('„','u');
     Dict.Add('î','F'); Dict.Add('‰','f');
     Dict.Add('ï','KH'); Dict.Add('Â','kh');
     Dict.Add('ñ','TS'); Dict.Add('Ê','ts');
     Dict.Add('ó','CH'); Dict.Add('Á','ch');
     Dict.Add('ò','SH'); Dict.Add('Ë','sh');
     Dict.Add('ô','SHCH'); Dict.Add('È','shch');
     Dict.Add('ö','_'); Dict.Add('Í','_');
     Dict.Add('õ','Y'); Dict.Add('Î','y');
     Dict.Add('ú','_'); Dict.Add('Ï','_');
     Dict.Add('ù','JE'); Dict.Add('Ì','je');
     Dict.Add('û','JU'); Dict.Add('Ó','ju');
     Dict.Add('ü','JA'); Dict.Add('Ô','ja');

     Ch:=''; oStr:='';
     for I:=1 to Length(Str) do begin
       Ch:=Copy(Str,I,1);
       if Dict.TryGetData(Ch, oTrans) then begin
          oStr:=oStr+oTrans; //russkaya bukva - transliteriruem
       end
       else begin
         oStr:=oStr+Ch; //nerusskaya bukva, ostavlaem v pokoe
       end;
     end;
     Dict.Free;
     exit(oStr);
end;

begin
  Write('Input string:'); ReadLn(strInput);
  strOutput:=Translit(strInput);
  WriteLn(strOutput);
  WriteLn('Press Enter...'); ReadLn();
end.

