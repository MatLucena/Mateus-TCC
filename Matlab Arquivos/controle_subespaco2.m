A=[0.976130161834507 0.193278632645524 -0.0437714173532699;-0.181710562635052 0.984060906761371 -0.148925860431169;0.0840316422522322 0.310702671920488 0.699442279329864];
B=[0.146607054851363;0.251489883468407;0.846034512455990];
C=[-1.01044391879506 -0.335405568261065 0.249594438654919];
D=[0.001018347083181];
K=[-0.5980;-0.4955;1.1330];
G=ss(A,B,C,D,0.05);

Ts=0.05;

z=0.9;
wn=4;

r=roots([1 2*wn*z wn^2]);

s1=r(1);
s2=r(2);
s3=-8;

z1=exp(s1*0.05);
z2=exp(s2*0.05);
z3=exp(s3*Ts);

G1=tf([wn^2],[1 2*wn*z wn^2]);
% step(G1)
% stepinfo(G1)

%[1 8 32.01]
% -4 + 4.0012 i
% -4 - 4.0012 i
% -8


F=blkdiag([real(z1) imag(z1); imag(z2) real(z2)],z3);
mul=10;
s1=real(s1)*mul+imag(s1)*j;
s2=real(s2)*mul+imag(s2)*j;
s3=s3*mul;

z1=exp(s1*Ts);
z2=exp(s2*Ts);
z3=exp(s3*Ts);

F2=blkdiag([real(z1) imag(z1); imag(z2) real(z2)],z3);
% F2=blkdiag([0.0024 0.0005; -0.0005 0.0024],6.1442e-06);
kb=[1 1 1];
rank(obsv(F,kb));

t=lyap(A,-F, -B*kb);
k=kb*inv(t);
eig(A-B*k);
G2=ss(A-B*k,B,C,D,0.05);
stepinfo(G2)
% step(G2)
lb=[1 1 1];
rank(ctrb(F2,lb'));

t2=lyap(F2,-A,lb'*C);
l=inv(t2)*lb';
eig(A-l*C);
% step(G2)
stepinfo(G2)
eig(F2)';
eig(A-l*C)';


