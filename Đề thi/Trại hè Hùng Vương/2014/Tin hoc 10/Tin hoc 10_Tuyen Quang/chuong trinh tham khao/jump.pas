uses  math;
const
  fi='jump.inp';
  fo='jump.out';
  maxn=100000;
var
  a,t:array[1..maxn] of longint;
  n,p,kq:longint;

procedure docdl;
var f:text;
    i:longint;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,N,P);
  for i:=1 to N do read(f,a[i]);
  t[1]:=a[1];
  for i:=2 to n do
    t[i]:=min(t[i-1],a[i]);
  close(f);
End;
function tknp(l,h:longint):longint;
var tg,dau,cuoi,giua:longint;
Begin
  tg:=h;
  dau:=1;
  cuoi:=h-1;
  while dau<=cuoi do
    Begin
      giua:=(dau+cuoi) div 2;
      if t[giua]<=a[h]-p then
        Begin
          tg:=giua;
          cuoi:=giua-1;
        End
      else dau:=giua+1;
    End;
  Exit(tg);
End;
Procedure Xuli;
var i,j:longint;
Begin
  kq:=0;
  for i:=2 to n do
    Begin
      j:=tknp(1,i);
      if i-j>kq then kq:=i-j;
    End;
End;
Procedure Ghikq;
Var f:text;
Begin
  Assign(f,fo);
  Rewrite(f);
  Write(f,kq);
  close(f);
End;
BEGIN
  Docdl;
  Xuli;
  Ghikq;
END.
