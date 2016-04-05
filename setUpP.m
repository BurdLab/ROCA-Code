function p = setUpP

% set up initial nutrient concentration in the tank; 
p(1).N_in = 0;% 1e11;% NH4 concentration (fmol N/l);
p(2).N_in = 0; % 1e11;% NO3 concentration (fmol N/l);
p(3).N_in = 1.43e12; % N2 concentration at air-water interface (fmol N/l)
p(1).P_in = 0; % PO4 concentration (fmol P/l);
p(2).P_in = 0; % COP concentration (fmol P/l);
p(3).P_in = 0; % CP concentration (fmol P/l);

% set up nutrient concentration from inflowing water; 
% p(1).N_fl = 1.5e11;% NH4 concentration (fmol N/l);
% p(2).N_fl = 2e11;% NO3 concentration (fmol N/l);
% p(1).P_fl = 12e9; % PO4 concentration (fmol P/l);
% p(2).P_fl = 5e9; % COP concentration (fmol P/l);
% p(3).P_fl = 5e9; % CP concentration (fmol P/l);

% set up diffusion coefficients for each nutrient; 
p(1).DN = 1.61e-4; % NH4 diffusion coefficient (m2/day);
p(2).DN = 1.47e-4; % NO3 diffusion coefficient (m2/day);
p(3).DN = 1.73e-5; % N2 diffusion coefficient (m2/day); 
p(1).DP = 8.64e-5; % PO4 diffusion coefficient (m2/day); 
p(2).DP = 9.33e-5; % COP diffusion coefficient (m2/day); 
p(3).DP = 9.33e-5; % CP diffusion coefficient (m2/day); 

% set up parameters for each tank; 
p(1).tank = 1000; % surface light intensity (u Ein/m2/s)
p(2).tank = 10; % water colume depth (m)
p(3).tank = 1; % secchi depth (m)
p(4).tank = 0.1; % dilution rate of tank (=Q/V);