Const fi='PHOMAT.INP';
      fo='PHOMAT.OUT';
Var f,g:text;
    N,L:longint;
    t,w:array[1..100000] of int64; F1:array[0..100,0..100] of int64;

Procedure Readfile;
Var i:integer;
Begin
     Assign(f,fi);
     Reset(f);
     Readln(f,N,L);
     For i:=1 to N do Readln(f,t[i],w[i]);
     Close(f);
end;
Procedure tinh;
var i,j:integer;
Begin
Fillchar(F1[0],sizeof(F1[0]),0);
for i:=1 to n do
for j:=1 to L do
begin
f1[i,j]:=f1[i-1,j];
if (j>=t[i]) and (f1[i,j]<f1[i-1,j-t[i]]+ w[i])then f1[i,j]:=f1[i-1,j-t[i]]+w[i];
end;
end;
Begin
  readfile;tinh;
          assign(g,fo);rewrite(g);
write(g,f1[n,l]);close(g);
end.
End.
