isesub1=[9.8033, 7.9407, 6.2741, 4.8036, 3.5292, 2.4508, 1.5685, 0.8823, 0.3921,0.0980];
isesub1=[isesub1 fliplr(isesub1)];
isearx1=[5.1225,4.1493, 3.2784, 2.5100, 1.8441, 1.2806, 0.8196, 0.4610, 0.2049, 0.0512];
isearx1=[isearx1 fliplr(isearx1)];
isearx2=[8.5043, 6.8885, 5.4428, 4.1671, 3.0616, 2.1261, 1.3607, 0.7654, 0.3402, 0.0850];
isearx2=[isearx2 fliplr(isearx2)];
isearxsim=[c, 10.1695, 8.0352, 6.1519, 4.5198, 3.1387, 2.0088, 1.1299,  0.5022, 0.1255];
isearxsim=[isearxsim fliplr(isearxsim)];
t=[-1:0.1:-0.1, 0.1:0.1:1];

close all
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
plot(t,isesub1,'LineWidth',1.5)
hold on
plot(t,isearx1,'LineWidth',1.5)
plot(t,isearx2,'LineWidth',1.5)
plot(t,isearxsim,'LineWidth',1.5)
H=legend('$SUB1$','$ARX1$', '$ARX2$','$ARXsim$', 'Location', 'northwest', 'Orientation', 'vertical');
set(H, 'Interpreter', 'latex', 'Fontsize', 22);
ylabel('ISE', 'fontsize', 22)
xlabel('Degrau testado', 'fontsize', 22);
T=title('Gráfico ISE dos 4 modelos identificados');
set(gca, 'fontsize', 20, 'Position',[0.155    0.16    0.8    0.75]);
axis([t(1) t(end) min(min([isesub1 isearx1 isearx2]))-.1 max(max([isesub1 isearx1 isearx2]))+.1]);