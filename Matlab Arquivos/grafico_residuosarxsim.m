close all
figure('position', [50, 50, 1200, 500],'Color',[1 1 1])
y=lsim(G,u3t,t);

      figure
      [c,r,l,B]=myccf2(y3t'-y,40,1);
% set(H, 'Interpreter', 'latex', 'Fontsize', 22);
% xlabel('Altura (cm)', 'fontsize', 22)
% ylabel('Tempo (s)', 'fontsize', 22);
T=title('Autocorrela��o dos res�duos do modelo ARXsim');
set(T, 'Interpreter', 'latex', 'Fontsize', 22);
set(gca, 'fontsize', 20, 'Position',[0.08    0.16    0.9    0.75]);
% axis([0 t(end) min(y_prbs)-.05 max(y_prbs)+.4]);