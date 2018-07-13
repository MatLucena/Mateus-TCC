isesub1=[30.4980,25.8062,14.5989,11.2605,25.0942,41.6142];
isearx1=[18.4237, 14.1758, 6.8651, 7.8923, 12.4186, 31.0242];
isearx1=fliplr(isearx1);
isearx2=[22.9208, 65.0283, 9.6180, 11.5452, 16.7478, 23.8137];

t=[-1,-0.6,-0.2,0.2,0.6,1];

close all
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
plot(t,isesub1,'LineWidth',1.5)
hold on
plot(t,isearx1,'LineWidth',1.5)
plot(t,isearx2,'LineWidth',1.5)
% plot(t,isearxsim,'LineWidth',1.5)
H=legend('$SUB1$','$ARX1$', '$ARX2$','$ARXsim$', 'Location', 'northwest', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('ISE', 'fontsize', 22)
xlabel('Degrau testado', 'fontsize', 22);
T=title('Gráfico ISE dos 3 modelos aplicados no sistema');
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([t(1) t(end) min(min([isesub1 isearx1 isearx2]))-.1 max(max([isesub1 isearx1 isearx2]))+.1]);