function [y,u]= clean_prbs(yi,ui)
    y=[];
    u=[];
    for i=1:size(yi,2)
        
            y=[y,yi(1,i)];
            u=[u,ui(1,i)];
        
    end
end