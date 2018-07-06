close all
t=0:0.05:(length(y3t)-1)*0.05;
figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
plot(y_prbs,'k','LineWidth',2)
% set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Resposta ao sinal PRBS do simulador');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.08    0.16    0.9    0.73]);
axis([0 t(end) min(y_prbs)-.05 max(y_prbs)+.4]);