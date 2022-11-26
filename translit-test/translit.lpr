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
     Regex.Expression:='[�-�]|[�-�]|\s';
     if not Regex.Exec(Str) then begin
       exit(Str);
     end;
     Dict:=TDictTrans.Create;
     Dict.Add(' ','_');
     Dict.Add('�','A'); Dict.Add('�','a');
     Dict.Add('�','B'); Dict.Add('�','b');
     Dict.Add('�','V'); Dict.Add('�','v');
     Dict.Add('�','G'); Dict.Add('�','g');
     Dict.Add('�','D'); Dict.Add('�','d');
     Dict.Add('�','E'); Dict.Add('�','e');
     Dict.Add('�','YO'); Dict.Add('�','yo');
     Dict.Add('�','ZH'); Dict.Add('�','zh');
     Dict.Add('�','Z'); Dict.Add('�','z');
     Dict.Add('�','I'); Dict.Add('�','i');
     Dict.Add('�','J'); Dict.Add('�','j');
     Dict.Add('�','K'); Dict.Add('�','k');
     Dict.Add('�','L'); Dict.Add('�','l');
     Dict.Add('�','M'); Dict.Add('�','m');
     Dict.Add('�','N'); Dict.Add('�','n');
     Dict.Add('�','O'); Dict.Add('�','o');
     Dict.Add('�','P'); Dict.Add('�','p');
     Dict.Add('�','R'); Dict.Add('�','r');
     Dict.Add('�','S'); Dict.Add('�','s');
     Dict.Add('�','T'); Dict.Add('�','t');
     Dict.Add('�','U'); Dict.Add('�','u');
     Dict.Add('�','F'); Dict.Add('�','f');
     Dict.Add('�','KH'); Dict.Add('�','kh');
     Dict.Add('�','TS'); Dict.Add('�','ts');
     Dict.Add('�','CH'); Dict.Add('�','ch');
     Dict.Add('�','SH'); Dict.Add('�','sh');
     Dict.Add('�','SHCH'); Dict.Add('�','shch');
     Dict.Add('�','_'); Dict.Add('�','_');
     Dict.Add('�','Y'); Dict.Add('�','y');
     Dict.Add('�','_'); Dict.Add('�','_');
     Dict.Add('�','JE'); Dict.Add('�','je');
     Dict.Add('�','JU'); Dict.Add('�','ju');
     Dict.Add('�','JA'); Dict.Add('�','ja');

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

