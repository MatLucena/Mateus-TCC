function AB = projSobreComplementoOrto(A, B)
    H=[A;B]';
    [Q,R]=qr(H,0);
    Q=Q';
    L=R';
    j=size(A,2);
    q=size(A,1);
    p=q;
    L11=L(1:q,1:q);
    L21=L(q+1:q+p,1:q);
    L22=L(q+1:q+p,q+1:q+p);
    Q1t=Q(1:p,1:j);
    Q2t=Q(p+1:p+q,1:j);
    AB=L22*Q2t
end