var     a,b,x,y:int64;


begin
        assign(input,'FROG.INP');       reset(input);
        assign(output,'FROG.OUT');      rewrite(output);
        read(a,b);
        while 2>1 do
                begin
                        if b mod a = 0 then
                                begin
                                        write(a);
                                        break;
                                end
                          else
                                begin
                                        x:=a;
                                        y:=b;
                                        a:=y-((y div x)*x);
                                        b:=a+x;
                                end;
                end;
        close(input);
        close(output);
end.
