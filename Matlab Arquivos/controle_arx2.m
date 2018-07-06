A1=[1.49897851716768 -0.658867228285944 0.452612718877348 -0.341574690861248 -0.155335749359606 0.126936388999114;1 0 0 0 0 0;0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0;0 0 0 0 1 0]
B1=[1;0;0;0;0;0]
C1=[-0.00935904114014577 0.0183508990918752 0.00773761149536270 0.0402641014305046 0.0383901175590003 -0.000489474738462096]
D1=[-0.00385606320080141];
Ts=0.05;
% -4 + 4.0012 i
% -4 - 4.0012 i
% -8
z=0.9;
wn=10;
r=roots([1 2*wn*z wn^2]);
z1=exp(r(1)*0.05);
s3=-15;s4=s3-0.1; s5=s4-0.1; s6=s5-0.1;
% s7=s6-5; s8=s7-6;s9=s8-7;

z1=exp(r(1)*0.05); z2=exp(r(2)*0.05); z3=exp(s3*Ts);
z4=exp(s4*Ts); z5=exp(s5*Ts); z6=exp(s6*Ts);
% z7=exp(s7*Ts); z8=exp(s8*Ts); z9=exp(s9*Ts);
F=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3, z4, z5, z6);
kb=[1 0 1 1 1 1];
% rank(obsv(F,kb))

 t1=lyap(A1,-F, -B1*kb);
 k1=kb*inv(t1);
%  eig(A1-B1*k1)

Garx=ss(A1-B1*k1,B1,C1,D1,Ts);
stepinfo(Garx);
mul=7;
s1=real(r(1))*mul+imag(r(1))*j; s2=real(r(2))*mul +imag(r(2))*j; s3=s3*mul;
s4=s4*mul; s5=s5*mul; s6=s6*mul; s7=s7*mul; s8=s8*mul;
s9=s9*mul;
z1=exp(s1*Ts); z2=exp(s2*Ts); z3=exp(s3*Ts);
z4=exp(s4*Ts); z5=exp(s5*Ts); z6=exp(s6*Ts);
z7=exp(s7*Ts); z8=exp(s8*Ts); z9=exp(s9*Ts);
F2=blkdiag([real(z1) imag(z1); imag(z2) real(z2)], z3, z4, z5, z6);
kb=[1 1 1 1 1 1];

lb=[1 1 1 1 1 1]';
r1=rank(ctrb(F2,lb))

t2=lyap(F2,-A1,lb*C1);

l1=inv(t2)*lb;
eig(A1-l1*C1)
Garx2=ss(A1-l1*C1,B1,C1,D1,Ts);
