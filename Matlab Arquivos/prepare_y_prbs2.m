function y= prepare_y_prbs2(a)
    [i,j]=size(a);
    if(i<j)
        y=zeros(i,j);
                   p1 =   1.683e-06;
                   p2 =   -0.001828;
                   p3 =      0.7219;
                   p4 =      -47.38;
        for g=1:j
            z=p1*a(1,g)^3 + p2*a(1,g)^2 + p3*a(1,g)^1 + p4;
            if z<=0 z=0; end
            y(1,g)=z;
        end
    else
        y=zeros(j,1);
                   p1 =   1.683e-06;
                   p2 =   -0.001828;
                   p3 =      0.7219;
                   p4 =      -47.38;
    for g=1:i
        z=p1*a(g,1)^3 + p2*a(g,1)^2 + p3*a(g,1)^1 + p4;
        if z<=0 z=0;end
        y(g,1)=z;
    end
    
    end
    y=y(:,1:j-1);
    
end