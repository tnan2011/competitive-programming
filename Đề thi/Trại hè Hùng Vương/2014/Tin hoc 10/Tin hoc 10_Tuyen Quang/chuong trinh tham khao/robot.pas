const
  fi='robot.inp';
  fo='robot.out';
  maxn=5001;
Type banghi=record
        t,g,d:longint;
     end;
Var
    a:array[0..maxn,1..maxn] of banghi;
    m,n,kq:longint;
procedure docdl;
var f:text;
    i,j:longint;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,m,n);
  close(f);
  for i:=0 to m+1 do
  for j:=1 to n do
    Begin
      if (j=1) and (i>0) and (i<=m) then
        Begin
          a[i,j].t:=1;
          a[i,j].g:=1;
          a[i,j].d:=1;
        End
      Else
        Begin
          a[i,j].t:=0;
          a[i,j].g:=0;
          a[i,j].d:=0;
        End;
    End;
End;
Procedure Xuli;
Var i,j:longint;
Begin
    For j:=2 to n do
      for i:=1 to m do
      Begin
        a[i,j].g:=(a[i-1,j-1].t+a[i+1,j-1].d) mod trunc(1e9);
        a[i,j].t:=(a[i-1,j-1].t+a[i,j].g) mod trunc(1e9);
        a[i,j].d:=(a[i+1,j-1].d+a[i,j].g) mod trunc(1e9);
      End;
  kq:=0;
  for i:=1 to m do
    kq:=(kq+a[i,n].g) mod trunc(1e9);
End;
Procedure Ghikq;
Var f:text;
Begin
  Assign(f,fo);
  Rewrite(f);
  Write(f,kq);
  Close(f);
End;
BEGIN
    Docdl;
    Xuli;
    Ghikq;
END.
