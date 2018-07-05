close all
% G=ss(A1,B1,C1,D1,0.05);
t=0:0.05:(1400)*0.05;
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
u_t=ones(1,length(t));
y=simout.Data';
yr=(y-p2)/p1;
% u_t1=ones(1,length(yr))*yr(end);
stairs(simout.Time,yr(1,:),':','LineWidth',2)
hold on
stairs(simout.Time,yr(2,:),'k','LineWidth',2)
stairs(simout.Time,yr(3,:),'r','LineWidth',2)
% plot(t,u_t1,':k')
H=legend('$r$','$y$', '$y_{estimado}$', 'Location', 'southeast', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('Altura (cm)', 'fontsize', 22)
xlabel('Tempo (s)', 'fontsize', 22);
T=title('Simula��o do estimador do modelo ARX2');
T=title('Resposta ao degrau do modelo SUB1 com estimador');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([0 simout.Time(end) min(min(yr))-.05 max(max(yr))+.4]);