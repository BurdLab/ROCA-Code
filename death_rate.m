function [death_rt]=death_rate(bug_attr,Q_B)
Kp_B = 1e3; % plankton half death constant for each bug (cells/l)
% Kp_B is used to prevent from dying out of one species; 
death_rt = bug_attr(:,24)'.*(Q_B./(Q_B+Kp_B));
%