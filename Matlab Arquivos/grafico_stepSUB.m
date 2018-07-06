close all
% G=ss(A1,B1,C1,D1,0.05);
t=0:0.05:(100)*0.05;
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
u_t=ones(1,length(t));
y=lsim(G,u_t,t);
yr=(y-p2)/p1;
u_t1=ones(1,length(yr))*yr(end);
stairs(t,yr,'LineWidth',2)
hold on
plot(t,u_t1,':k')
% set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Resposta ao degrau unitário do modelo SUB1');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([0 t(end) min(yr)-.05 max(yr)+.4]);