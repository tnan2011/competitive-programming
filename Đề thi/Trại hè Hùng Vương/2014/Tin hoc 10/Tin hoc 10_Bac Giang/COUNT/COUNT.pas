Const
        fi      ='COUNT.INP';
        fo      ='COUNT.OUT';
        e       =123456789;

Var
        n,res   :int64;

Procedure nhap;
begin
        assign(input,fi);
        reset(input);
        read(n);
        close(input);
end;

Function pow(n:int64):int64;
var
        x       :int64;
begin
        if n=0 then exit(1);
        if n=1 then exit(2);
        x:=pow(n div 2);
        if n mod 2 = 0 then exit((x*x) mod e);
        exit((x*x*2) mod e);
end;

Procedure Sol;
begin
        if n=0 then res:=1
        else
          res:=pow(n-1);
end;

Procedure xuat;
begin
        assign(output,fo);
        rewrite(output);
        write(res);
        close(output);
end;

Begin
        nhap;
        Sol;
        xuat;
End.