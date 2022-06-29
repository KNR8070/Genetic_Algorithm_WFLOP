function [f] = fitness (l)
%% fitness real-case
uo=[5,7,9,11];
A = 17860;                % rotor area in m2
rho = 1.225;
po = pow_new(l); % units are GW/yr
[cos,n] = cost(l);
nn = size(num2str(n*n));
freq = getGlobalfr;
freq = freq./100;
power = 0.5 * A * rho *(uo.^3)* 0.2/10^9 ; % GW
powe = 0;
 for i = 1:4
    powe = powe + sum(power.* freq(i,:));   
 end
eff = po/(n*(powe));
po1 = po * 8760; % units are Mwh/yr
%exx = getGlobalex;
%f =  ((0.5*(cos)/po1))  + (0.4*(1/eff)) + (0.1*((10^3)/(n^2)));
f = (1/po1) + (1/eff);
end