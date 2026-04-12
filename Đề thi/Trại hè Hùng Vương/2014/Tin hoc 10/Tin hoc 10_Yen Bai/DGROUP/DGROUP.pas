Var
    m,n,k,x:int64;
Begin
    assign(input,'DGROUP.inp');
    reset(input);
    readln(m,n,k);
    close(input);
    x:=(m+n-k) div 3;
    if x>n then x:=n;
    if x> m div 2 then x:=m div 2;
    assign(output,'Dgroup.out');
    rewrite(output);
    write(x);
    close(output);
End.
