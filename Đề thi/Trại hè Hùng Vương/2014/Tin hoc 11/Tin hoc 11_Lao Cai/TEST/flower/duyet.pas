{$MODE DELPHI}

const
	MODULO = 1000000007;

var
	i, m, n, k : integer;
	used : array[1..4] of boolean;
	total, res : int64;

function duyet(i : integer) : integer;
var
	j, c, r : integer;
begin
	c := 0;
	for j:=1 to 4 do 
		if used[j] then
			inc(c);
	if c >= k then
	begin
		r := 1;
		for j:=i to n do r := int64(r) * 4 mod MODULO;
		duyet := r;
		exit;
	end;
	if i > n then
	begin
		duyet := 0;
		exit;
	end;
	r := 0;
	for j:=1 to 4 do
		if used[j] then
		begin
			r := (r + int64(c) * duyet(i+1)) mod MODULO;
			break;
		end;
	for j:=1 to 4 do
		if not used[j] then
		begin
			used[j] := true;
			r := (r + duyet(i+1)) mod MODULO;
			used[j] := false;
		end;
	duyet := r;
end;	

begin
	read(m, n, k);
	total := duyet(1);
	res := 1;
	for i:=1 to m do res := res * total mod MODULO;
	writeln(res);
end.
