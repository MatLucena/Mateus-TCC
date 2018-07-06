% Function cca.m
% Section 10.6 CCA Algorithm B
% y = [y(1),y(2),...,y(Ndat)]; pNdat matrix
% u = [u(1),u(2),...,u(Ndat)]; mNdat matrix
% n = dim(x); k = number of block rows
% Written by H. Kawauchi; modified by T. Katayama
function [A,B,C,D,K] = cca(y,u,n,k)
[p,Ndat] = size(y); [m,Ndat] = size(u); N = Ndat-2*k;
ii = 0;
for i = 1:m:2*k*m-m+1
ii = ii+1; U(i:i+m-1,:) = u(:,ii:ii+N-1); % Data matrix
end
ii = 0;
for i = 1:p:2*k*p-p+1
ii = ii+1;
Y(i:i+p-1,:) = y(:,ii:ii+N-1); % Data matrix
end
Uf = U(k*m+1:2*k*m,:); Yf = Y(k*p+1:2*k*p,:);
Up = U(1:k*m,:); Yp = Y(1:k*p,:); Wp = [Up; Yp];
H = [Uf; Up; Yp; Yf];
[Q,L] = qr(H',0); L = L'; % LQ decomposition
L22 = L(k*m+1:k*(2*m+p),k*m+1:k*(2*m+p));
L32 = L(k*(2*m+p)+1:2*k*(m+p),k*m+1:k*(2*m+p));
L33 = L(k*(2*m+p)+1:2*k*(m+p),k*(2*m+p)+1:2*k*(m+p));
Rff = L32*L32'+L33*L33'; Rpp = L22*L22'; Rfp = L32*L22';
[Uf,Sf,Vf] = svd(Rff); [Up,Sp,Vp] = svd(Rpp);
Sf = sqrtm(Sf); Sfi = inv(Sf); Sp = sqrtm(Sp); Spi = inv(Sp);
Lfi = Vf*Sfi*Uf'; Lpi = Vp*Spi*Up'; % Lf = Uf*Sf*Vf'; Lp = Up*Sp*Vp'
OC = Lfi*Rfp*Lpi';
[UU,SS,VV] = svd(OC); % Normalized SVD
S1 = SS(1:n,1:n); U1 = UU(:,1:n); V1 = VV(:,1:n);
X = sqrtm(S1)*V1'*Lpi*Wp; XX = X(:,2:N); X = X(:,1:N-1);
U = Uf(1:m,1:N-1); Y = Yf(1:p,1:N-1);
ABCD = [XX;Y]/[X;U]; % System matrices
A = ABCD(1:n,1:n); B = ABCD(1:n,n+1:n+m);
C = ABCD(n+1:n+p,1:n); D = ABCD(n+1:n+p,n+1:n+m);
W = XX-A*X-B*U; E = Y-C*X-D*U;
SigWE = [W;E]*[W;E]'/(N-1);
QQ = SigWE(1:n,1:n); RR = SigWE(n+1:n+p,n+1:n+p);
SS = SigWE(1:n,n+1:n+p);
[P,L,G,Rept] = dare(A',C',QQ,RR,SS); % Kalman filter ARE
K = G'; % Kalman gain