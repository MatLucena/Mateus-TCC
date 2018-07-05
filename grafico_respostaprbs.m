t=0:0.05:(length(y3t)-1)*0.05;
close all
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
plot(t,y3t,'k','LineWidth',2)
xlabel('Tempo (s)', 'fontsize', 22)
ylabel('Altura (cm)', 'fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.08    0.16    0.9    0.73]);
axis([0 t(end) min(y3t)-.05 max(y3t)+.4]);

T=title('Resposta ao sinal PRBS');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);