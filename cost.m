function [c,k,ns] = cost(l)
%% cost calculation
k=0;
[m,n] = size(l); 
for i = 1:(m*n)
        if l(i) == 1
           k = k+1;            % no.of turbines
        else
           
        end
end
ct = 1; % considering cost of each turbine as unity ($ 750,000) 
cs = 10  ; % cost of each substation(connecting 30 grids) is 10 times the cost of turbine($ 8,000,000)
ns = round((k)/30); %(no.of substation)
% r =  0.03;    % interest rate of capital
% y =  20; %years
cOM = 0.025 ; % maintanence cost incurred per turbine per year is 2.5% of cost of turbine ($ 20,000)
% x = [1,500];
% y = [1,0.00005];
% [a,b] = costfn(x,y);
% xc = k*(2+(a*exp(b*k)))/3;

f1 = ((ct*k) + (cs*(ns)) + (cOM*k));  % cost per year in (units of cost)/yr
%f1d = abs(((1-((1-r)^(-y)))/r));
%f2  = (((ct*k) + (cs*(k/ns))*r) + (cOM*xc));  % cost per year in (units of cost)/yr
%c = (f2/f1d);  % in $/yr
c = f1;    
%   c = round(c,5);
 %disp(['no.of turbines =' num2str(k)]);
%disp(['cost per unit turbine in layout  = ',num2str(c)]);
end