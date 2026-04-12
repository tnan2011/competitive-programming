const
  fi='kd.inp';
  fo='kd.out';
  maxn=100000;
Type  banghi=record
    d,c:longint;
    end;
var adj:array[1..2*maxn] of longint;
    lt,head:array[1..maxn+1] of longint;
    e:array[1..2*maxn] of banghi;
    kt:array[1..maxn] of boolean;
    m,n,kq,max1,max2,stplt:longint;

procedure docdl;
var f:text;
    i:longint;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,n,m);
  for i:=1 to m do
    begin
      readln(f,e[i].d,e[i].c);
      e[m+i].d:=e[i].c;
      e[m+i].c:=e[i].d;
    end;
  m:=2*m;
  for i:=1 to n do head[i]:=0;
  for i:=1 to m do
    with e[i] do
        head[d]:=head[d]+1;
  for i:=2 to n do  head[i]:=head[i-1]+head[i];
  for i:=m downto 1 do
    with e[i] do
    Begin
      adj[head[d]]:=c;
      dec(head[d]);
    End;
  head[n+1]:=m;
  close(f);
End;
function dfs(u:longint):longint;
var v:longint;
Begin
  inc(lt[stplt]);
  kt[u]:=false;
  for v:=head[u]+1 to head[u+1] do
    if kt[adj[v]] then dfs(adj[v]);

End;
procedure xuli;
var i:longint;
Begin
  fillchar(kt,sizeof(kt),true);
  fillchar(lt,sizeof(lt),0);
  stplt:=0;
  for i:=1 to n do
    if kt[i] then
    Begin
      inc(stplt);
      dfs(i)
    end;
    max1:=0;
    max2:=0;
    for i:=1 to stplt do
      if lt[i]>max1 then
        begin
          max2:=max1;
          max1:=lt[i];
        end
      else
        if max2<lt[i] then max2:=lt[i];
End;
procedure ghikq;
var    f:text;
Begin
  Assign(f,fo);
  Rewrite(f);
  Write(f,max1+max2);
  close(f);
End;
BEGIN
  Docdl;
  Xuli;
  Ghikq;
END.
