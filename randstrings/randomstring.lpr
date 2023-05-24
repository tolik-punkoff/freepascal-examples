program randomstring;
Uses Math;

function GenerateString (len:Integer; Pattern:String): String;
var I:Integer; C:Char;
begin
  Result:='';
  I:=0;
  SetLength(Result,len);

  while I < len do
  begin
       C:=Pattern[RandomRange(1, Length(Pattern))];
       Result[I+1]:=C;
       inc(I);
  end;
end;
var P1,P2,P3,P4:String; I:Integer;
begin
  P1:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  P2:='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  P3:='abcdefghijklmnopqrstuvwxyz0123456789';
  P4:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  for I:=1 to 23 do
  begin
    WriteLn(GenerateString(75,P1));
  end;
  WriteLn('Press ENTER');
  ReadLn();
end.

