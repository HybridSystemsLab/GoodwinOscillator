%------------------------------------------------------
% Description: Jump map
%------------------------------------------------------
function splus = g_h(s)
% state
x1 = s(1);
x2 = s(2);
x3 = s(3);
tau = s(4);
tt=s(5);

B=[1;0;0];
L=[0 0 1];
xi=[x1;x2;x3];

xplus=xi+chi(L*xi)*B;
tplus=Phi(L*xi);
splus=[xplus; tplus; tt];

% Hill function \Phi(z)
function f=Phi(z)
global k1 k2 k3 k4 hF pF h_phi p_phi;
f=k1+k2*((z/h_phi)^p_phi)/(1+(z/h_phi)^p_phi);

% Hill function \chi(z)
function f=chi(z)
global k1 k2 k3 k4 hF pF h_phi p_phi;
f=k3+k4/(1+(z/hF)^pF);





