%% Figures
close all
clc;
Cmean = mean(C);
Cmax = max(C);
disp(['AverageNoRules: ',num2str(mean(C))]);
disp(['RMSE: ',num2str(RMSE(h))]);

% WTBenchmark


figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
plot(Y,'k','LineWidth',2),hold on
plot(p,'r','LineWidth',2)
H=legend('$P_{g}$','$\hat{P}_{g}$', 'Location', 'northwest', 'Orientation', 'horizontal');
set(H, 'Interpreter', 'latex', 'Fontsize', 26);
xlabel('Altura (cm)', 'fontsize', 22)
ylabel('Velocidade do ar (m/s)', 'fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
axis([0 h+46 min(Y)-.05 max(Y)+.4]);
% plotfaltas2

% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(ref,'--r','LineWidth',2), hold on
% plot(y(:,12),'k','LineWidth',2)
% H=legend('$Q_{3,ref}$', '$Q_{3}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  CompressÃ£o', 'fontsize', 22);
% ylabel('Fluxo de saída Q_{3}', 'fontsize', 22);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% axis([0 h+46 min(ref)- 5 max(ref)+ 25]);
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% % plot(faults(:,1),'LineWidth',2),hold on
% % plot(faults(:,2),'LineWidth',2),hold on
% % plot(faults(:,5),'LineWidth',2),hold on
% plot(faults(:,6),'LineWidth',2),hold on
% % plot(p,'r','LineWidth',2)
% % H=legend('$F_{1}$', '$F_{2}$', '$F_{5}$', '$F_{6}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% H=legend('$F_{6}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  CompressÃ£o', 'fontsize', 22);
% ylabel('Falhas', 'fontsize', 22);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% axis([0 h+46 min(Y)-.05 max(Y)+.4]);



figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
plot(Y,'k','LineWidth',2),hold on
plot(PLB,'-r', 'LineWidth',1)
plot(PUB,'-r', 'LineWidth',1)
annotation('textarrow',[0.6 0.6],[0.55 0.46],'Interpreter', 'latex', 'String','$U$', 'fontsize', 24)
annotation('textarrow',[0.2 0.2],[0.25 0.35],'Interpreter', 'latex', 'String','$u$', 'fontsize', 24)
annotation('textarrow',[0.7 0.7],[0.4 0.28],'Interpreter', 'latex', 'String','$y$', 'fontsize', 24)
xlabel('Amostras', 'fontsize', 22)
% ylabel('Resistência à  Compressão', 'fontsize', 22);
ylabel('Fluxo Q_{3}', 'fontsize', 22);
% axis([7000 8420 min(Y)-.05 max(Y)+.05]);
set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);

% t = ones(h,1)*Cmean;
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(1:h,mdC,'k','LineWidth',2), hold on, grid off
% plot(1:h,t,'--k','LineWidth',2)
% % annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% % text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('Número de Regras', 'fontsize', 22);
% axis([0 h+46 min(mdC)-0.1 max(mdC)+0.1]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);

figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
plot(1:h,C,'k','LineWidth',2), hold on, grid off
plot(1:h,t,'--k','LineWidth',2)
% annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% title('Concrete Compressive Strength');
xlabel('Amostras', 'fontsize', 22),ylabel('Número de Regras', 'fontsize', 22);
axis([0 h+46 0 Cmax+5]);
set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
plotfaltas2

figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
stairs(gdim(:,1),log10(gdim(:,2)),'k','LineWidth',2),hold on, grid off
stairs(gnew(:,1),log10(gnew(:,2)),'--r','LineWidth',2)
% plot(1:h,C,'k','LineWidth',2), 
% plot(1:h,t,'--k','LineWidth',2)
% annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% title('Concrete Compressive Strength');
xlabel('Amostras', 'fontsize', 22),ylabel('Demografia', 'fontsize', 22);
H=legend('New','Finished', 'Location', 'northwest', 'Orientation', 'horizontal');
set(H, 'Interpreter', 'latex', 'Fontsize', 26);
axis([0 h 0 log(gnew(end,2))+1]);
set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
plotfaltas2


figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
plot(1:h,Rho/2,'k','LineWidth',2), hold on, grid off
% title('Concrete Compressive Strength');
xlabel('Amostras', 'fontsize', 22),ylabel('Granularidade', 'fontsize', 22);
axis([0 h+46 0 max(Rho)+.3]);
set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
plotfaltas2
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(100*rse,'k','LineWidth',2), hold on, grid off
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('RSE%', 'fontsize', 22);
% axis([0 h+46 0 100*max(rse(2:end))+ 2]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 




% %% Sim3Tanks
% 
% Y12 = normalize_data(y(:,12),0.02);

% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(Y,'k','LineWidth',2),hold on
% plot(p,'r','LineWidth',2)
% H=legend('$F_{6}$','$\hat{F}_{6}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  CompressÃ£o', 'fontsize', 22);
% % ylabel('Fluxo Q_{3}', 'fontsize', 22);
% ylabel('Falha 6', 'fontsize', 22);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% axis([0 h+46 min(Y)-.05 max(Y)+.05]);
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(ref,'--r','LineWidth',2), hold on
% plot(y(:,12),'k','LineWidth',2)
% H=legend('$Q_{3,ref}$', '$Q_{3}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  CompressÃ£o', 'fontsize', 22);
% ylabel('Fluxo de saída Q_{3}', 'fontsize', 22);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% axis([0 h+46 min(ref)- 5 max(ref)+ 25]);
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% % plot(faults(:,1),'LineWidth',2),hold on
% % plot(faults(:,2),'LineWidth',2),hold on
% % plot(faults(:,5),'LineWidth',2),hold on
% plot(faults(:,6),'LineWidth',2),hold on
% % plot(p,'r','LineWidth',2)
% % H=legend('$F_{1}$', '$F_{2}$', '$F_{5}$', '$F_{6}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% H=legend('$F_{6}$', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  CompressÃ£o', 'fontsize', 22);
% ylabel('Falhas', 'fontsize', 22);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% axis([0 h+46 min(Y)-.05 max(Y)+.4]);
% 
% 
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(Y,'k','LineWidth',2),hold on
% plot(PLB,'-r', 'LineWidth',1)
% plot(PUB,'-r', 'LineWidth',1)
% annotation('textarrow',[0.6 0.6],[0.55 0.46],'Interpreter', 'latex', 'String','$U$', 'fontsize', 24)
% annotation('textarrow',[0.2 0.2],[0.25 0.35],'Interpreter', 'latex', 'String','$u$', 'fontsize', 24)
% annotation('textarrow',[0.7 0.7],[0.4 0.28],'Interpreter', 'latex', 'String','$y$', 'fontsize', 24)
% xlabel('Amostras', 'fontsize', 22)
% % ylabel('Resistência à  Compressão', 'fontsize', 22);
% ylabel('Fluxo Q_{3}', 'fontsize', 22);
% % axis([7000 8420 min(Y)-.05 max(Y)+.05]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% % t = ones(h,1)*Cmean;
% % figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% % plot(1:h,mdC,'k','LineWidth',2), hold on, grid off
% % plot(1:h,t,'--k','LineWidth',2)
% % % annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% % % text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% % % title('Concrete Compressive Strength');
% % xlabel('Amostras', 'fontsize', 22),ylabel('Número de Regras', 'fontsize', 22);
% % axis([0 h+46 min(mdC)-0.1 max(mdC)+0.1]);
% % set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(1:h,C,'k','LineWidth',2), hold on, grid off
% plot(1:h,t,'--k','LineWidth',2)
% % annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% % text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('Número de Regras', 'fontsize', 22);
% axis([0 h+46 0 Cmax+2]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% stairs(gdim(:,1),log10(gdim(:,2)),'k','LineWidth',2),hold on, grid off
% stairs(gnew(:,1),log10(gnew(:,2)),'--r','LineWidth',2)
% % plot(1:h,C,'k','LineWidth',2), 
% % plot(1:h,t,'--k','LineWidth',2)
% % annotation('textarrow',[0.67 0.67],[0.65 0.40],'Interpreter', 'latex', 'String','$c$', 'fontsize', 22)
% % text(13000, 13.8,'médio = 6.03', 'fontsize', 18)
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('Demografia', 'fontsize', 22);
% H=legend('New','Finished', 'Location', 'northwest', 'Orientation', 'horizontal');
% set(H, 'Interpreter', 'latex', 'Fontsize', 26);
% axis([0 h 0 log(gnew(end,2))]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% 
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(1:h,Rho/2,'k','LineWidth',2), hold on, grid off
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('Granularidade', 'fontsize', 22);
% axis([0 h+46 0 max(Rho)+.2]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(100*rse,'k','LineWidth',2), hold on, grid off
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('RSE%', 'fontsize', 22);
% axis([0 h+46 0 100*max(rse(2:end))+ 2]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
% 
% vwind=normalize_data(datawindt{1}(:,1),0.02);
% figure('position', [50, 50, 1200, 450],'Color',[1 1 1])
% plot(vwind,'k','LineWidth',2), hold on, grid off
% % title('Concrete Compressive Strength');
% xlabel('Amostras', 'fontsize', 22),ylabel('Velocidade do Vento', 'fontsize', 22);
% axis([0 length(vwind) 0 max(vwind)+ .2]);
% set(gca, 'fontsize', 20, 'Position',[0.080    0.18    0.9    0.750]);
