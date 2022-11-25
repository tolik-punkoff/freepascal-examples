program regexptest;
uses regexpr;
var  Regex:TRegExpr;

begin
     Regex:=TRegExpr.Create;
     Regex.Expression:='[а-я]|\s';
     Writeln(Regex.Exec('АБВГ'));
     Writeln(Regex.Exec('ABCD'));
     ReadLn();
end.

