uses math;
var  A1,A2,A3,B1,B2,B3,S,x:longint;
function sub(u,v:longint):longint;
begin
        if u<0 then u:=0;
        if v<0 then v:=0;
        if u<=v then sub:=0 else sub:=u-v;
end;
begin
        assign(input,'computer.inp');
        reset(input);
        assign(output,'computer.out');
        rewrite(output);
        read(A1,A2,A3,B1,B2,B3);
        S:=min(A1,B1)+min(A2,B2);
                S:=S+min(A3,sub(B1,A1));
                A3:=A3-min(A3,sub(B1,A1)); x:=min(A3,sub(B1,A1));A1:=A1-x;B1:=B1-x;
                S:=S+min(A3,sub(B2,A2));
                A3:=A3-min(A3,sub(B2,A2)); x:=min(A3,sub(B2,A2));A2:=A2-x;B2:=B2-x;
                S:=S+min(B3,sub(A1,B1));
                B3:=B3-min(B3,sub(A1,B1)); x:=min(B3,sub(A1,B1));A1:=A1-x;B1:=B1-x;
                S:=S+min(B3,sub(A2,B2));
                B3:=B3-min(B3,sub(A2,B2)); x:=min(B3,sub(A2,B2));A2:=A2-x;B2:=B2-x;
        S:=S+min(A3,B3);
        write(S);
        close(input);close(output);
end.
