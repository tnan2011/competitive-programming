Const
fi	='DIVISION.INP';
fo	='DIVISION.OUT';
Var
l,x : longint;
s 	: ansistring;
res : longint;

test : longint;

Procedure ReadData();
begin
	  res:=0;
    readln(x,l);
    Readln(s);
end;

function toInt(c: char): longint;
begin
    exit(ord(c) - ord('0'));
end;

Procedure Solve();
var
md   : longint = 1;
Sum  : longint = 0;
i    : longint;
begin

sum:=toInt(s[l]);
for i:=l-1 downto 1 do
  begin
  	 md:=(md*10) mod x;
     Sum := (Sum + toInt(s[i])*md) mod x;
  end;

if Sum = 0 then inc(res);

for i:=l+1 to length(s) do
	begin
    Sum:=((Sum - toInt(s[i -l])*md)*10 + toInt(s[i])) mod x;
    if (Sum = 0) and(s[i- l + 1] <>'0') then inc(res);
  end;

end;

BEGIN
    assign(input,fi); reset(input);
    assign(output,fo); rewrite(output);
			Readln(test);
      while test > 0 do
      	begin
          ReadData();
          Solve();
          Writeln(res);
          dec(test);
        end;
    close(input); close(output);
END.
