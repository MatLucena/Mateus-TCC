function y= prepare_prbs(data, upper, lower)
    [i,j]=size(data);
    y=zeros(i,j);
    if(i<j)
        for count=1:1:j
            if data(1,count)==1
                y(1,count)=upper;
            else
                y(1,count)=lower;
            end
        end
    else
        for count=1:1:i
            if data(count,1)==1
                y(count,1)=upper;
            else
                y(count,1)=lower;
            end
        end
    end
end