Cd=0.5; %coeficiente de atrito http://scienceworld.wolfram.com/physics/DragCoefficient.html
m=0.0085; %massa da bola
p=1.1455; %densidade do ar à 35 graus celsius https://en.wikipedia.org/wiki/Density_of_air
A=0.00113411; %area exposta ao movimento de ar em metros quadrados
g=9.81; %aceleração da gravidade
a=Cd*p*A/2;
u_prbsz=prbs(3000,7,7);
t=0:0.1:299.9;
plot(u_prbsz)
U_prbs=timeseries(u_prbs6,t);
%Y_prbs=timeseries(y2,t);
%[A2,B2,C2,D2]=subid(y,y2,8,4)
G8=ss(A2,B2,C2,D2, 0.1)
%step(G8)



