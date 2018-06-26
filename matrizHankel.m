function [Up, Uf, Yp, Yf]=  matrizHankel(U, Y, n)
    
    if ~(size(U)==size(Y))
        if size(U)>size(Y)
            U=U(0:size(Y));
        else
            Y=Y(0:size(U));
        end
    end
    
    i=n;
    [l,c]=size(U);
    j=size(U,2)-2*i-1;
    p=2*i;
    
    for k=1:2*i
        A((k-1)*l+1:k*l,:)=U(:,k:k+j-1);
        B((k-1)*l+1:k*l,:)=Y(:,k:k+j-1);
    end
    Up=A(1:size(A,1)/2,:);
    Uf=A(size(A,1)/2+1:size(A,1),:);
    Yp=B(1:size(B,1)/2,:);
    Yf=B(size(B,1)/2+1:size(B,1),:);
    
    
    
end