J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
zpk(P_motor)

Ts = 0.01;
dP_motor = c2d(P_motor, Ts, 'zoh');
zpk(dP_motor)

gm = minreal(dP_motor,Ts);
zpk(gm)
gm1 = feedback(gm,1);


u_prbs=prbs(1000,7,10);
u_prbs=prepare_prbs(u_prbs,1,-1);

y=dlsim(Gt.A, Gt.B,Gt.C,Gt.D,u3t);
%plot(y);
%[At,Bt,Ct,Dt]=subid(u3,y,16,3);
%Gd1=ss(A4,B4,C4,D4,Ts);
%plot(y)
%step(Gd1)
%data=iddata(y,u_prbs',Ts);
%sys=arx(data,[1, 1, 1]);




