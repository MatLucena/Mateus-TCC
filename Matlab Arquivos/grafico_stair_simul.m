if max(y)<20
    p1=0.1;
    p2=-3;
    y2=y;
    y=(y-p2)/p1;
    ye=0-ye;
    ye=(ye-p2)/p1;
    ref2=ref;
    ref=(ref-p2)/p1;
end
close all
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
plot(ye,'LineWidth',1.5)
hold on
plot(ref,'r','LineWidth',1.5)
plot(y,'k','LineWidth',1.5)
H=legend('$y_e$','$r$', '$y$', 'Location', 'northwest', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Resposta à escadaria do modelo ARXsim simulado');
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([0 40 min(min(y))-.1 max(max(y))+.1]);

figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
plot(y2-ref2,'k','LineWidth',1.5)
hold on
plot(u,'LineWidth',1.5)
H=legend('$e$','$u$', '$r$', 'Location', 'southeast', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
% ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Resposta à escadaria do modelo ARXsim simulado');
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([0 40 min(min(u))-.1 max(max(u))+.1]);



