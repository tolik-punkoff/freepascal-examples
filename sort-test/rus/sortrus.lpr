program sortrus;
uses Classes;
var
  lstTest:TStringList;
  i:integer;

function SortByDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
    if List[Index1]<List[Index2] then
    begin
      Result := 1;
      Exit;
    end;
    if List[Index1]=List[Index2]
      then Result := 0
      else Result := -1;
end;

function SortByAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if List[Index1]>List[Index2] then
  begin
    Result := 1;
    Exit;
  end;
  if List[Index1]=List[Index2]
    then Result := 0
    else Result := -1;
end;
function SortByLenAsc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if Length(List[Index1])>Length(List[Index2]) then
  begin
    Result := 1;
    Exit;
  end;
  if Length(List[Index1])=Length(List[Index2])
    then Result := 0
    else Result := -1;
end;

function SortByLenDesc(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if Length(List[Index1])<Length(List[Index2]) then
  begin
    Result := 1;
    Exit;
  end;
  if Length(List[Index1])=Length(List[Index2])
    then Result := 0
    else Result := -1;
end;

begin
  lstTest:=TStringList.Create;
  lstTest.Add('собака');
  lstTest.Add('щенок');
  lstTest.Add('кот');
  lstTest.Add('кошка');
  lstTest.Add('котёнок');
  lstTest.Add('попугай');
  lstTest.Add('хомяк');
  lstTest.Add('шиншилла');
  lstTest.Add('морская свинка');
  lstTest.Add('мышь');
  lstTest.Add('крыса');

  Writeln('Вывод массива:');
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  WriteLn();
  lstTest.Sort;
  WriteLn('Сортировка по возрастанию (по-умолчанию):');
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Сортировка по убыванию (пользовательская):');
  lstTest.CustomSort(@SortByDesc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Сортировка по возрастанию (пользовательская):');
  lstTest.CustomSort(@SortByAsc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Сортировка по возрастанию (по длине) (пользовательская):');
  lstTest.CustomSort(@SortByLenAsc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

  WriteLn('Сортировка по убыванию (по длине) (пользовательская):');
  lstTest.CustomSort(@SortByLenDesc);
  i:=0;
  while i < lstTest.Count do begin
    WriteLn(lstTest[i]);
    inc(i);
  end;

  Writeln(); WriteLn('Press Enter...'); ReadLn();

end.

