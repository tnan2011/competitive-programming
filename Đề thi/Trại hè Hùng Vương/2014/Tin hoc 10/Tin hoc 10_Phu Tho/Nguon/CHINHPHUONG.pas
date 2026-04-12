const fi='CPHUONG.inp';
      fo='CPHUONG.out';
Var N: Longint;
    f,g:text;
Procedure readfile;
Begin
      Assign(f,fi);
      Reset(f);
      Read(f,N);
      Close(f);
end;
Procedure main;
Var i,j,k,l:integer;
    ok:boolean;
Begin
      Assign(g,fo);
      Rewrite(g);
      Readfile;
      ok:=true;
      For i:=1 to N do
         if (sqr(i) <=N) and ok then
           for j:=i to N do
             if (sqr(i)+sqr(j) <=N) and ok then
                For k:=j to N  do
                    if (sqr(i)+sqr(j)+sqr(k) <=N) and ok then
                      For l:=k to N  do
                        If (sqr(i)+ sqr(j)+ sqr(k) + sqr(l)= N) and ok then
                            begin
                                 writeln(g,i,' ',j,' ',k,' ',l);
                                 ok:=false;
                             end;
      if ok then write(g,-1);
       close(g);
end;

Begin
    Main;
End.
