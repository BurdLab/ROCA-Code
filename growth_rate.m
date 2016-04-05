function [u] = growth_rate(bug_attr,Q_C,Q_N,Q_P,u_T)
% to calculate growth rate for each organism according to C, N and P cell
% quota situation; 
u_C=1-bug_attr(:,6)'./Q_C;
u_N=1-bug_attr(:,8)'./Q_N;
u_P=1-bug_attr(:,10)'./Q_P;
% u = bug_attr(:,23)'.*min(u_C, min(u_N, u_P));
u = bug_attr(:,23)'.*min(u_C, min(u_N, u_P)).*u_T;
u = max(0, u);
%