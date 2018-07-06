% 
%   Deterministic subspace identification (Algorithm 1)
%
%           [A,B,C,D] = det_stat(y,u,i);
% 
%   Inputs:
%           y: matrix of measured outputs
%           u: matrix of measured inputs
%           i: number of block rows in Hankel matrices 
%              (i * #outputs) is the max. order that can be estimated 
%              Typically: i = 2 * (max order)/(#outputs)
%           
%   Outputs:
%           A,B,C,D: deterministic state space system
%           
%                  x_{k+1) = A x_k + B u_k        
%                    y_k   = C x_k + D u_k
%
%   Optional:
%
%           [A,B,C,D,AUX,ss] = det_stat(y,u,i,n,AUX,sil);
%   
%           n:    optional order estimate (default [])
%           AUX:  optional auxilary variable to increase speed (default [])
%           ss:   column vector with singular values
%           sil:  when equal to 1 no text output is generated
%           
%   Example:
%   
%           [A,B,C,D,AUX] = det_stat(y,u,10,2);
%           for k=3:6
%              [A,B,C,D] = det_stat(y,u,10,k,AUX);
%           end
%           
%   Reference:
%   
%           Subspace Identification for Linear Systems
%           Theory - Implementation - Applications
%           Peter Van Overschee / Bart De Moor
%           Kluwer Academic Publishers, 1996, Page 52
%           
%   Copyright:
%   
%           Peter Van Overschee, December 1995
%           peter.vanoverschee@esat.kuleuven.ac.be
%
%

function [A,B,C,D,AUX,ss] = subspaceIDet(y,u,i,n)

% Checagem de argumentos
if (nargin < 3);error('subspaceIDet precisa de 3 argumentos');end
if (nargin < 4);n = [];end


% checar o tamanho dos vetores
[l,ny] = size(y);if (ny < l);y = y';[l,ny] = size(y);end
[m,nu] = size(u);if (nu < m);u = u';[m,nu] = size(u);end
if (i < 0);error('O número de linhas deve ser positivo');end
if (l < 0);error('É necessário um vetor não vazio para saída');end
if (m < 0);error('É necessário um vetor não vazio de entrada');end
if (nu ~= ny);error('Tamanho do vetor U e Y não é a mesma');end
if ((nu-2*i+1) < (2*l*i));error('Amostra muito pequena');end

% determinar o tamanho da linha da matriz em bloco de Hankel
j = nu-2*i+1;
  
% Calcular o valor de R
  U = blkhank(u/sqrt(j),2*i,j);
  Y = blkhank(y/sqrt(j),2*i,j);
  disp('Calculando o fator R');
  R = triu(qr([U;Y]'))';
  R = R(1:2*i*(m+l),1:2*i*(m+l));
  clear U Y
  
% Passo 1

mi2 = 2*m*i;
% Criando matrizes
  Rf = R((2*m+l)*i+1:2*(m+l)*i,:); 	% saídas futuras
  Rp = [R(1:m*i,:);R(2*m*i+1:(2*m+l)*i,:)]; % entradas e saídas passadas
  Ru  = R(m*i+1:2*m*i,1:mi2); 		% entradas futuras
  % saídas futuras perpendiculares
  Rfp = [Rf(:,1:mi2) - (Rf(:,1:mi2)/Ru)*Ru,Rf(:,mi2+1:2*(m+l)*i)]; 
  % passado perpendicular
  Rpp = [Rp(:,1:mi2) - (Rp(:,1:mi2)/Ru)*Ru,Rp(:,mi2+1:2*(m+l)*i)]; 

% Projeção oblíqua:
% obl/Ufp = Yf/Ufp * pinv(Wp/Ufp) * (Wp/Ufp)
  if (norm(Rpp(:,(2*m+l)*i-2*l:(2*m+l)*i),'fro')) < 1e-10
    Ob  = (Rfp*pinv(Rpp')')*Rp; 	
  else
    Ob = (Rfp/Rpp)*Rp;
  end

% Passo 2

% Compute the SVD
  disp('Calculando SVD');
  [U,S,V] = svd(Ob);
  ss = diag(S);
  clear V S WOW

U1 = U(:,1:n);

% Passo 3

% Determine gam and gamm
gam  = U1*diag(sqrt(ss(1:n)));
gamm = gam(1:l*(i-1),:);
% pseudo inversas
gam_inv  = pinv(gam);
gamm_inv = pinv(gamm);
clear gam gamm

% Passo 4

% Projeção oblíqua
Rf = R((2*m+l)*i+l+1:2*(m+l)*i,:); 	% Saídas futuras
Rp = [R(1:m*(i+1),:);R(2*m*i+1:(2*m+l)*i+l,:)]; % entradas e saídas passadas
Ru  = R(m*i+m+1:2*m*i,1:mi2); 		% entradas futuras
% saídas futuras perpendiculares
Rfp = [Rf(:,1:mi2) - (Rf(:,1:mi2)/Ru)*Ru,Rf(:,mi2+1:2*(m+l)*i)]; 
% passado perpendicular
Rpp = [Rp(:,1:mi2) - (Rp(:,1:mi2)/Ru)*Ru,Rp(:,mi2+1:2*(m+l)*i)]; 
if (norm(Rpp(:,(2*m+l)*i-2*l:(2*m+l)*i),'fro')) < 1e-10
  Obm  = (Rfp*pinv(Rpp')')*Rp; 		% projeção oblíqua
else
  Obm = (Rfp/Rpp)*Rp;
end

% Determinar os estados Xi and Xip
Xi  = gam_inv  * Ob;
Xip = gamm_inv * Obm;
clear gam_inv gamm_inv Obm

% Passo 5

% determinar as matrizes de estado
disp(['      Calculando as matrizes do sistema A,B,C,D (Ordem ',num2str(n),')']); 
Rhs = [       Xi   ;  R(m*i+1:m*(i+1),:)]; % Right hand side
Lhs = [      Xip   ;  R((2*m+l)*i+1:(2*m+l)*i+l,:)]; % Left hand side

% Solve least squares
sol = Lhs/Rhs;

% Extract the system matrices
A = sol(1:n,1:n);
B = sol(1:n,n+1:n+m);
C = sol(n+1:n+l,1:n);
D = sol(n+1:n+l,n+1:n+m);

