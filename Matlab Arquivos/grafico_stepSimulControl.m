if max(y)<20
    p1=0.1;
    p2=-3;
    y2=y;
    y=(y-p2)/p1;
    ye=ye;
    ye=(ye-p2)/p1;
    ref2=ref;
    ref=(ref-p2)/p1;
end
close all
% G=ss(A1,B1,C1,D1,0.05);
t=0:0.05:(length(y)-1)*0.05;
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
% u_t1=ones(1,length(yr))*yr(end);
stairs(t,ref,':','LineWidth',2)
hold on
stairs(t,y,'k','LineWidth',2)
stairs(t,ye,'r','LineWidth',2)
% plot(t,u_t1,':k')
H=legend('$r$','$y$', '$y_{estimado}$', 'Location', 'southeast', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Simulação do estimador do modelo ARXsim');
T=title('Resposta ao degrau do modelo ARXsim com estimador');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([0 10 min(min(y))-.05 max(max(y))+.4]);