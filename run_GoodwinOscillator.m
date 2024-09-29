%------------------------------------------------------
% Description: Simulation of an impulsive Goodwin's oscillator
%------------------------------------------------------
function run_GoodwinOscillator
clear all;
close all;
clc;

global a1 a2 a3 g1 g2 k1 k2 k3 k4 hF pF h_phi p_phi;

% system parameters
g1=2;g2=0.5;
a1=0.03; a2=0.15; a3=0.2;

% parameters of Hill functions
k1=60; k2=40;
k3=3;k4=2;
p_phi=2; pF=2;
hF=2.7; h_phi=hF;

% initial conditions
s0 = [2.2; 25; 20; 50; 0];

% simulation horizon
TSPAN=[0 900];
JSPAN = [0 10];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 2;

options = odeset('RelTol',0.5, 'MaxStep', 0.5);
[t j s] = HyEQsolver( @f_h,@g_h,@C_h,@D_h,s0,TSPAN,JSPAN,rule,options);
x=s(:,1:4);

% plot phase plane
figure
modificator{1} = 'b';
modificator{2} = 'LineWidth';
modificator{3} = 1.5;
plotHarc(x(:,1),j,x(:,2),[],modificator);
xlabel('\xi_1','FontSize',18);ylabel('\xi_2','FontSize',18);grid on
text(3.3, 1.8, 'P','fontsize',16);
text(0.1, 1.8, 'M','fontsize',16); 
        
figure
modificator{1} = 'b';
modificator{2} = 'LineWidth';
modificator{3} = 1.5;
plotHarc(x(:,1),j,x(:,3),[],modificator);
xlabel('\xi_1','FontSize',18);ylabel('\xi_3','FontSize',18);grid on
text(3.3, 6, 'P','fontsize',16);
text(0.1, 6, 'M','fontsize',16); 

figure
modificator{1} = 'b';
modificator{2} = 'LineWidth';
modificator{3} = 1.5;
plotHarc(x(:,2),j,x(:,3),[],modificator);
xlabel('\xi_2','FontSize',18);ylabel('\xi_3','FontSize',18);grid on
text(2.5, 5.8, 'P(M)','fontsize',16);
