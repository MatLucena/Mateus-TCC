function G= getSystem(U, Y, i, n)
    u_i=getdatasamples(U,1:3000);
    u_s=prepare_prbs(u_i,10,-10);
    y_s=getdatasamples(Y,1:3000);
    [As,Bs,Cs,Ds]=subid(u_s,y_s,i,n);
    G=ss(As,Bs,Cs,Ds, 0.1);
end