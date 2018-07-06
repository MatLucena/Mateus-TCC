% Function ort pk.m
% Subsection 9.7.1
function [A,B,C,D] = ort_pk(U,Y,m,p,n,k);
% ORT method by Picci and Katayama
km = size(U,1)/2; kp = size(Y,1)/2;
% LQ decomposition % Eq. (9.48)
L = triu(qr([U;Y]'))';
L11 = L(1:km,1:km);
L41 = L(2*km+kp+1:2*km+2*kp,1:km);
L42 = L(2*km+kp+1:2*km+2*kp,km+1:2*km);
% SVD % Eq. (9.52)
[UU,SS,VV] = svd(L42);
U1 = UU(:,1:n);
Ok = U1*sqrtm(SS(1:n,1:n));
C = Ok(1:p,1:n);
A = pinv(Ok(1:p*(k-1),1:n))*Ok(p+1:k*p,1:n); % Eq. (9.53)
% Matrices B and D
U2 = UU(:,n+1:size(UU',1));
Z = U2'*L41/L11; % Eq. (9.54)
% The program for computing B and D is the same
% as that of MOESP of Table D.2.
XX = [];
RR = [];
for j = 1:k
XX = [XX; Z(:,m*(j-1)+1:m*j)];
Okj = Ok(1:p*(k-j),:);
Rj = [zeros(p*(j-1),p),zeros(p*(j-1),n);
eye(p), zeros(p,n);
zeros(p*(k-j),p),Okj];
RR = [RR;U2'*Rj];
end
DB = pinv(RR)*XX;
D = DB(1:p,:);
B = DB(p+1:size(DB,1),:);