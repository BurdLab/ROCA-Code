function [q_ic, Q_IC] = cell_quota_ic(bug_attr, num_org, B_0)
% this function calculating the initial values of cell quota for each bug; 
for i = 1:num_org
    q_ic(i, 1) = bug_attr(i, 12);% initial cell quota for C (fmolC/cell); 
    q_ic(i, 2) = bug_attr(i, 13);% initial cell quota for N (fmolN/cell);  
    q_ic(i, 3) = bug_attr(i, 14);% initial cell quota for P (fmolP/cell);
    q_ic(i, 4) = B_0; % initial cell abundance for all bugs (cells);  
end
m = 1;
for i = 1:num_org
   Q_IC(m) = q_ic(i,1);
   Q_IC(m+1)=q_ic(i,2);
   Q_IC(m+2)=q_ic(i,3);
   Q_IC(m+3)=q_ic(i,4);
   m = m+4;
end 
clear i m