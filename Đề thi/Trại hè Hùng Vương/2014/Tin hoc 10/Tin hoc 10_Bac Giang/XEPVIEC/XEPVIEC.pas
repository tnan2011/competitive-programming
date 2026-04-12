Uses    math;

Const
        fi      ='XEPVIEC.INP';
        fo      ='XEPVIEC.OUT';
        maxn    =101;

Type
        arr     =array[0..maxn,0..maxn] of int64;

Var
        k,n     :longint;
        v,l     :arr;

Procedure nhap;
var
        i,j     :longint;
begin
        assign(input,fi);
        reset(input);
        readln(k,n);
        for i:=1 to k do
          for j:=1 to n do read(v[i,j]);
        close(input);
end;

Procedure Sol;
var
        i,j,x   :longint;
begin
        fillchar(l,sizeof(l),0);
        for i:=1 to k do
          for j:=1 to n do
            for x:=i to j do
              l[i,j]:=max(l[i,j],l[i-1,x-1]+v[i,x]);
end;

Procedure xuat;
begin
        assign(output,fo);
        rewrite(output);
        write(l[k,n]);
        close(output);
end;

Begin
        nhap;
        Sol;
        xuat;
End.