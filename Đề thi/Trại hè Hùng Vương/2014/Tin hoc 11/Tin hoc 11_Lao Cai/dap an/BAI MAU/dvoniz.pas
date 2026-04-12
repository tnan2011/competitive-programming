USES math;
CONST
        tfi = 'dvoniz.inp';
        tfo = 'dvoniz.out';
//        tfo2 = 'dvoniz.ou';
TYPE
        Sonminator = record
                      x,y : longint;
                     end;

VAR
        fi,fo,fo2 : text;
        n,Sum : longint;
        s,a : array [0..100001] of longint;
        t : array [0..4*100001] of Sonminator;

Procedure mo;
begin
    assign(fi,tfi);reset(fi);
    assign(fo,tfo);rewrite(fo);
end;

Procedure nhap;
var i,j : longint;
begin
    read(fi,n,Sum);
    for i := 1 to n do read(fi,a[i]);
end;

Function Check(i,j : longint) : boolean;
var s1,s2 : longint;
begin
    s1 := s[i]-s[i-j];
    s2 := s[i+j]-s[i];
    if (s1 <= Sum) and (s2 <= Sum) then exit(true) else exit(false);
end;

Function Find(i : longint) : longint;
var l,r,mid,res : longint;
begin
    l := 1;
    r := min(i,n-i);
    res := 0;
    while l <= r do
      begin
          mid := (l+r) div 2;
          if Check(i,mid) then
            begin
               res := mid;
               l := mid + 1
            end
          else r := mid - 1;
      end;
    exit(res);
end;

Procedure Init(i,L,R : longint);
var mid : longint;
begin
    if L = R then
      begin
          t[i].y := -1;
          exit;
      end;
    mid := (L+R) div 2;
    Init(2*i,L,mid);
    Init(2*i+1,mid+1,R);
end;

Procedure DonDl(i,L,R : longint);
var x : longint;
begin
    x := t[i].y;
    t[2*i].x := max(t[2*i].x,x);
    t[2*i].y := max(t[2*i].y,x);
    t[2*i+1].x := max(t[2*i+1].x,x);
    t[2*i+1].y := max(t[2*i+1].y,x);
    t[i].y := -1;
end;

Procedure Update(i,L,R,u,v,x : longint);
var mid : longint;
begin
    if (v < L) or (R < u) then exit;
    if (u <= L) and (R <= v) then
      begin
          t[i].x := max(t[i].x,x);
          t[i].y := max(t[i].y,x);
          exit;
      end;
    mid := (L+R) div 2;
    if t[i].y <> -1 then DonDl(i,L,R);
    Update(2*i,L,mid,u,v,x);
    Update(2*i+1,mid+1,R,u,v,x);
    t[i].x := max(t[2*i].x,t[2*i+1].x);
end;

Procedure khoi_tao;
var i,j : longint;
begin
    for i := 1 to n do s[i] := s[i-1] + a[i];
    Init(1,1,n);
    for i := 1 to n do
      begin
        j := Find(i);
        Update(1,1,n,i-j+1,i,i);
      end;
end;

Function Qr(i,L,R,u,v : longint) : longint;
var mid,q1,q2 : longint;
begin
    if (v < L) or (R < u) then exit(0);
    if (u <= L) and (R <= v) then exit(t[i].x);
    mid := (L+R) div 2;
    if t[i].y <> -1 then DonDl(i,L,R);
    q1 := Qr(2*i,L,mid,u,v);
    q2 := Qr(2*i+1,mid+1,R,u,v);
    Qr := max(q1,q2);
end;

Procedure xu_ly;
var i,j : longint;
begin
    khoi_tao;
    for i := 1 to n do
      begin
          j := Qr(1,1,n,i,i);
          if j = 0 then writeln(fo,0)
          else writeln(fo,2*(j-i+1));
      end;
end;

Procedure dong;
begin
    close(fi);
    close(fo);
end;

{Procedure Trau;
var i,j : longint;
begin
    assign(fo2,tfo2);rewrite(fo2);
    for i := 1 to n do s[i] := s[i-1] + a[i];
    for i := 1 to n do
      for j := (n-i+1) div 2 downto 0 do
        if Check(i+j-1,j) then
          begin
              writeln(fo2,2*j);
              break;
          end;
    close(fo2);
end;    }

Procedure make;
var i,j : longint;
begin
    assign(fi,tfi);rewrite(fi);
    randomize;
    n := random(1000);
    Sum := random(100000);
    writeln(fi,n,' ',Sum);
    for i := 1 to n do writeln(fi,random(2000));
    close(fi);
end;

BEGIN
  //  make;
    mo;
    nhap;
 //   Trau;
    xu_ly;
    dong;
END.
