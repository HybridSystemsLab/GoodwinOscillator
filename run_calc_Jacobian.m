%------------------------------------------------------
% Description: Verify the Schur stability of Jacobian of Q(\xi) 
%              for the impulsive Goodwin's oscillator
%------------------------------------------------------
function run_calc_Jacobian
clc;clear all;

global k1 k2 k3 k4;

% choose different parameters of Hill functions
k1=60; k2=40; k3=3; k4=2;
% k1=60; k2=40; k3=3; k4=20;



% system parameters
g1=2;g2=0.5;
a1=0.03; a2=0.15; a3=0.2;
A=[-a1 0 0;
 g1 -a2 0;
 0  g2 -a3];
L=[0 0 1];
B=[1 0 0]';

z1=0.184;z2=3.066;z3=9.019; % fixed point

syms z;
difF=diff(chi(z),'z');
difP=diff(Phi(z),'z');
Qxi=expm(A*Phi(z))*([z1;z2;z]+chi(z)*B);
Qz1=expm(A*Phi(z))*(eye(3)+difF*B*L);
Qz2=difP*A*Qxi*L;
JQz=Qz1+Qz2;        
JQ=subs(JQz,z,z3)  % Jacobian of Q(\xi)

eig_JQ=abs(eig(JQ))

if sum(eig_JQ<1)==3
    disp('The Jacobian of Q is Schur stable.');
else
    disp('The Jacobian of Q is not Schur stable.');
end








%---------------------------------------
function f=e2(a,b)
f=(exp(a)-exp(b))/(a-b);

function f=e3(a,b,c)
f=(e2(c,b)-e2(a,b))/(c-a);

%---------------------------------------
% Hill function \Phi(z)
function f=Phi(z)
global k1 k2 k3 k4;
p_phi=2; h_phi=2.7;
f=k1+k2*((z/h_phi)^p_phi)/(1+(z/h_phi)^p_phi);

%---------------------------------------
% Hill function \chi(z)
function f=chi(z)
global k1 k2 k3 k4;
pF=2; hF=2.7; 
f=k3+k4/(1+(z/hF)^pF);
