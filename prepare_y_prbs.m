function y= prepare_y_prbs(x)
    [i,j]=size(x);
       a =       -9128;
       b =     -0.9853;
       c =       82.68;
       p1 =         0.1;
       p2 =          -3;

    if(i<j)
        y=zeros(i,j);
               
        for g=1:j
            z=a*x(1,g)^b+c;
            if z<=0 z=0; end
            y(1,g)=p1*z + p2;
        end
    else
        y=zeros(j,1);
    for g=1:i
            z=a*x(g,1)^b+c
            if z<=0 z=0; end
            y(g,1)=p1*z + p2;
    end
    
    end
end