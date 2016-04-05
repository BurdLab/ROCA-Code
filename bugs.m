function [bug] = bugs(num_org, bug_attr)
for i = 1:num_org
    bug(i).name = bug_attr(i,1);
    % index for each bug from 1 to 100; 
    bug(i).diameter = bug_attr(i,2);
    % diameter for each bug, (um);
    bug(i).area = bug_attr(i,3); 
    % surface area for each bug, (um2);
    bug(i).volume= bug_attr(i,4); 
    % volume for each bug, (um3); 
    bug(i).gr_rt = bug_attr(i,5); 
    % maximum growth rate for each bug (/day);
    bug(i).qCmin = bug_attr(i,6);
    % minimum of C cell quota (fmol C/cell); 
    bug(i).qCmax = bug_attr(i,7);
    % maximum of C cell quota (fmol C/cell); 
    bug(i).qNmin = bug_attr(i,8);
    % minimum of N cell quota (fmol N/cell); 
    bug(i).qNmax = bug_attr(i,9);
    % maximum of N cell quota (fmol N/cell); 
    bug(i).qPmin = bug_attr(i,10);
    % minimum of P cell quota (fmol P/cell);
    bug(i).qPmax = bug_attr(i,11);
    % maximum of P cell quota (fmol P/cell);
    bug(i).C_mid = bug_attr(i,12);
    % middle value of N quota (fmol C/cell); 
    bug(i).N_mid = bug_attr(i,13);
    % middle value of N quota (fmol N/cell); 
    bug(i).P_mid = bug_attr(i,14);
    % middle value of P quota (fmol P/cell); 
    bug(i).amt = bug_attr(i,15);
    % existence of amt gene; "yes"=1, otherwise, 0;
    bug(i).nr = bug_attr(i,16);
    % existence of nr gene; "yes"=1, otherwise, 0;
    bug(i).nif = bug_attr(i,17);
    % existence of nif gene; "yes"=1, otherwise, 0;
    bug(i).pst = bug_attr(i,18);
    % existence of pst gene; "yes"=1, otherwise, 0;
    bug(i).pho = bug_attr(i,19);
    % existence of pho gene; "yes"=1, otherwise, 0;
    bug(i).phn = bug_attr(i,20);
    % existence of phn gene; "yes"=1, otherwise, 0;
    bug(i).light = bug_attr(i,21);
    % light adaptation info: low light (LL) or high light (HL);
    bug(i).genome = bug_attr(i,22);
    % maximum growth rate reduction rate; 
    bug(i).growth = bug_attr(i,23);
    % adjusted growth rate according to genome size, (/day); 
    bug(i).death = bug_attr(i,24);
    % death rate according to their adjusted growth rate, (=10%, /day);
    bug(i).Ncritic=bug_attr(i,25); 
    % critical values for amt genetic switching on or off,   
    bug(i).Pcritic=bug_attr(i,26);
    % critical values for pst genetic switching on or off,
end