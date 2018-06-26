function [sys,theta,phi, Yo,Uo, num, den]= MQARX(U,Y,regu,regy)
%     regy=4; %n+1
%     regu=2;
%     U=u3t;
%     Y=y3t;
    U=U(:,2:end)';
    Y=Y(:,1:end-1)';
    Yo=[];
    regy=regy+1;
    c=regy+regu;
    for i=1:1:regy
        Yo = [Yo,Y(c+1-i:size(Y,1)-i)];
    end
    Uo=[];
    for i=1:1:regu
        Uo=[Uo,U(c-i:size(U,1)-i-1,1)];
    end
    phi=[];
    phi=[phi,Uo,Yo(:,2:end)];
    theta=inv(phi'*phi)*phi'*Yo(:,1);
    num=[];
    for i= 1:regu
        num=[num,theta(i)];
    end
    num=[num,0];
    den=[1];
    for i= regu+1:regu+regy-1
        den=[den,-theta(i)];
    end
    sys=tf(num, den,0.05);
    %Gt2=d2c(Gd2);
    %step(Gd2)
    i=c;
    h=figure;
    movegui(h,[50,220]);
    C=Y(i:size(phi*theta,1)+i-1)-(phi*theta);
    [c,r,l,B]=myccf2(C,40,1);
    title(sprintf('Auto correlação dos resíduos para %d polos %d zeros',regy-1,regu))
    h=figure;
    movegui(h,'center');
    plot(Y(i:size(phi*theta,1)+i-1))
    title(sprintf('polos %d zeros %d',regy-1,regu))
    hold on
    plot(phi*theta)
%     h=figure;
%     movegui(h,[-50,160])
%     t=0:0.05:0.05*(size(Uo,1)-1);
% %     y=dlsim(num,den,Uo(:,1));
%     %y=lsim(sys,Uo(:,1),[],'foh');
%     y=simARX(num,den,U);m
%     z=Y(i:size(phi*theta,1)+i-1);
%     %y=y(1:size(z,1),:);
% %     hist(C)
%     plot(y)
% %     hold on 
% %     plot(phi*theta);
% %     [c,r,l,B]=myccf2(z-y,40,1);
%     title(sprintf('polos %d zeros %d',regy-1,regu))
    
   % data=iddata(Yo(:,2:regy),Uo(1:size(Yo,1)),0.1);
%sys=arx(data,[3 2 1]);
    
    
    
end