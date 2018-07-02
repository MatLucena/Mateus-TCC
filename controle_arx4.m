A1=[1.55060903848634 -0.760133957710275 0.532127876964906 -0.485441178967822 0.0897121940756099;1 0 0 0 0;0 1 0 0 0;0 0 1 0 0;0 0 0 1 0];
B1=[1;0;0;0;0];
C1=[-0.00854754496452607 0.0165466900077137 0.00409300990441686 0.0739057849223118 -0.000263292527210828];
D1=[-0.00293485774062023];
Ts=0.05;
% -4 + 4.0012 i
% -4 - 4.0012 i
% -8
z=0.9;
wn=2.8;
r=roots([1 2*wn*z wn^2]);
z1=exp(r(1)*0.05);
s3=-15;s4=s3-1; s5=s4-1;
% s7=s6-5; s8=s7-6;s9=s8-7;

z1=exp(r(1)*0.05); z2=exp(r(2)*0.05); z3=exp(s3*Ts);
z4=exp(s4*Ts); z5=exp(s5*Ts);
F=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3, z4, z5);
kb=[1 1 1 1 1 ];
% rank(obsv(F,kb))

 t1=lyap(A1,-F, -B1*kb);
 k1=kb*inv(t1);
%  eig(A1-B1*k1)

Garx=ss(A1-B1*k1,B1,C1,D1,Ts);
stepinfo(Garx)
mul=8;
s1=real(r(1))*mul+imag(r(1))*j; s2=real(r(2))*mul +imag(r(2))*j; 
s3=s3*mul;
s4=s4*mul; s5=s5*mul;
z1=exp(s1*Ts); z2=exp(s2*Ts); z3=exp(s3*Ts);
z4=exp(s4*Ts); z5=exp(s5*Ts); 
F2=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3, z4, z5);
kb=[1 1 1 1 1 ];

lb=[1 1 1 1 1 ]';
r1=rank(ctrb(F2,lb))

t2=lyap(F2,-A1,lb*C1);

l1=inv(t2)*lb;
eig(F2)'
eig(A1-l1*C1)'
% % eig(A1-B1*k1)'
Garx2=ss(A1-l1*C1,B1,C1,D1,Ts);
