clear all 
load bug_attr
num_org = 96; % number of organisms included in this model;
B_0 = 10000; % initial cell abundance for all bugs (cells);
[q_ic, Q_IC] = cell_quota_ic(bug_attr, num_org, B_0);
% initial values of cell quota for each bug in the model;  
p = setUpP;
[bug] = bugs(num_org, bug_attr);
[diffusion]=diffu(num_org,p,bug);
IC = [Q_IC,p.N_in,p.P_in];
year_cycle = 360;
tspan = [1:1:10*year_cycle];
% options = odeset('RelTol',1e-1,'AbsTol',1e-2,'NonNegative',1:3*num_org+5);
options = odeset('NonNegative',1:4*num_org+6);
[t,y]=ode23(@(t, y) NPPZ(t,y,diffusion,bug,num_org,bug_attr,p),tspan,IC,options);