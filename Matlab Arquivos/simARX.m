function y= simARX(num, den, u)
    num=num(1:end-1);
    den=den(2:end);
    n=size(num,2);
    m=size(den,2);
    ur=zeros(1,size(num,2));
    y=zeros(1,size(den,2));
    
    for i=1:size(u,1)
        ur=[u(i),ur];
        urs=size(ur,2);
        ys=size(y,2);        
        z=0;
        z=z+num*ur(1:n)';
        z=z+den*y(1:m)';
        y=[z,y];
        plot(y);
    end
    y=fliplr(y);
end