function [nutrient_lim] = growth_rate_lim(bug,Q_C,Q_N,Q_P,num_org)
% to calculate growth rate for each organism according to N and P cell
% quota situation; 
u = ones(1,num_org);
u_C=ones(1,num_org);
u_N=ones(1,num_org);
u_P=ones(1,num_org);
% u_C = ones(1,num_org);
for i = 1:num_org
    if (Q_N(i) >= bug(i).qNmin && Q_N(i) < bug(i).qNmax)
        u_N(i) = 1-bug(i).qNmin/Q_N(i);
    elseif (Q_N(i) < bug(i).qNmin)
        u_N(i) = 0;
    end
    if (Q_P(i) >= bug(i).qPmin && Q_P(i) < bug(i).qPmax)
        u_P(i) = 1-bug(i).qPmin/Q_P(i);
    elseif (Q_P(i) < bug(i).qPmin)
        u_P(i) = 0;
    end
    if (Q_C(i) > bug(i).qCmin && Q_C(i) < bug(i).qCmax)
        u_C(i) = 1-bug(i).qCmin/Q_C(i);
    elseif (Q_C(i) < bug(i).qCmin)
        u_C(i) = 0;
    end
    u(i) = bug(i).growth*min(u_C(i), min(u_N(i), u_P(i)));
    % if (u_N(i) == 1) && (u_P(i) == 1) && (u_C(i) ==1)
    %     nutrient_lim(i) = 0;
    if u_C(i) < min(u_N(i), u_P(i))
        nutrient_lim(i) = 1;
    elseif u_N(i) < min(u_C(i), u_P(i))
        nutrient_lim(i) = 2;
    elseif u_P(i) < min(u_C(i), u_N(i))
        nutrient_lim(i) = 3;
    end
    if (nutrient_lim(i) == 2) && (Q_N(i) > 0.9*bug(i).qNmax)
        nutrient_lim(i) = 0; 
    end
    if (nutrient_lim(i) == 3) && (Q_P(i) > 0.9*bug(i).qPmax)
        nutrient_lim(i) = 0; 
    end
end 
    % record nutrient limitation situation, 
    % "0" means no limitation,
    % "1" means carbon limitation,
    % "2" means nitrogen limitation,
    % "3" means phosphorus limitation,