% Function po moesp.m
function [A,B,C,D] = po_moesp(u,y,m,p,n,k);
% cf. Remark 9.3
% m=dim(u), p=dim(y), n=dim(x)
% k=number of block rows; U=2km x N matrix; Y=2kp x N matrix

i=k;
[l,ny] = size(y);if (ny < l);y = y';[l,ny] = size(y);end
[g,nu] = size(u);if (nu < g);u = u';[g,nu] = size(u);end
j = ny-2*i+1;
Y = blkhank(y/sqrt(j),2*i,j);
U = blkhank(u/sqrt(j),2*i,j); 
m=1;
p=1;
km=k*m;
kp=k*p;
% LQ decomposition
L = triu(qr([U;Y]'))';
L11 = L(1:km,1:km);
L21 = L(km+1:2*km,1:km);
L22 = L(km+1:2*km,km+1:2*km);
L31 = L(2*km+1:2*km+kp,1:km);
L32 = L(2*km+1:2*km+kp,km+1:2*km);
L41 = L(2*km+kp+1:2*km+2*kp,1:km);
L42 = L(2*km+kp+1:2*km+2*kp,km+1:2*km);
L43 = L(2*km+kp+1:2*km+2*kp,2*km+1:2*km+kp);
[UU,SS,VV]=svd([L42 L43]);
U1 = UU(:,1:n);
Ok = U1*sqrtm(SS(1:n,1:n));
C = Ok(1:p,1:n);
A = pinv(Ok(1:p*(k-1),1:n))*Ok(p+1:k*p,1:n);
% Matrices B and D
U2 = UU(:,n+1:size(UU',1));
Z = U2'*[L31 L32 L41]/[L21 L22 L11];
% The rest is the same as that of MOESP of Table D.2.
% The subsequent part is omitted
XX = []; RR = [];
for j = 1:k
XX = [XX; Z(:,m*(j-1)+1:m*j)];
Okj = Ok(1:p*(k-j),:);
Rj = [zeros(p*(j-1),p) zeros(p*(j-1),n);
eye(p) zeros(p,n); zeros(p*(k-j),p) Okj];
RR = [RR; U2'*Rj];
end
DB = pinv(RR)*XX; % Eq. (6.44)
D = DB(1:p,:);
B = DB(p+1:size(DB,1),:);