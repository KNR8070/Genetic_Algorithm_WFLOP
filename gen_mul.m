%% Master Genetic Algorithm code.
% Written by K Narender Reddy.
% Research Scholar at CAS, IIT Delhi.
%% Usage of the code %%
%Inputs to the model --> x - no.of rows (5D distance apart); D - turbine rotor Dia.
%                        y - no.of columns (3D distance apart);
%                        wf - refers to the wind farm case in the study
%                        conducted (refer to:- https://doi.org/10.5194/adgeo-54-79-2020)
%                        wf takes the values (1, 21, 22, 23, and 3);
% NOTE:- wf = 1 is not reflected in the above mentioned paper. It was
% considered to replicate a ~5 GW layout
%% multiple generations
function [lt,power,cos,n_t,eff,n] = gen_mul(x,y,wf)
tic
%% Initial Layouts (b1 and b2), gen - no.of generations/itterations,
% uo - speed bins considered in the study 5 m/s, 7 m/s ....
% A - swept area of the turbine, and rho - air density
b1 = layout(x,y);
b2 = layout(x,y);
n=0;
gen = 50;
uo = [5,7,9,11];
A = 17860;                % rotor area in m2
rho = 1.225;
%% Initializing the output variables
power = zeros(gen,1);  % power of the best layout will be stored to this variable
cos = zeros(gen,1);    % cost of the best performing layout
n_t = zeros(gen,1);    % no.of turbines in the best performing layout
eff = zeros(gen,1);    % efficiency of the ebst performing layout
comp_time_runs = zeros(gen,1);
f = zeros(gen,1);      % fitness (refer fitness.m) of the best performing layout
lt = zeros(gen,x,y);   % best performing layout at each generation
freq = frequency(wf);  % wind speed frequncies to calculate wake effects and power;
                       % 'frequency' takes the wind farm (1, 21, 22, 23, or 3) as input 
setGlobalfr(freq)
freq = getGlobalfr;
freq = freq./100;
%% Itterations to find the better performing layout starts here
while n <= gen
      [layout1,layout2] = ga_own(b1,b2); % calls the main genetic algorithm code (ga_own)
%      layout1 and layout2 are the two best performing layouts after one GA run                         
       n = n+1;
       b1 = layout1;
       b2 = layout2;

       lt(n,:,:) = b1;
       power(n) = pow_new(b1);      % units are Gw/yr
       [cos(n),n_t(n)] = cost(b1);  % units of cost is $/ 
       cos(n) = cos(n)/(8760*power(n));
       f(n) = fitness(b1);
       po = 0.5 * A * rho .* (uo.^3) * 0.2/10^9 ;  %GW
       powe = 0;
        for i = 1:4
            powe = powe + sum(po.*freq(i,:));
        end
        eff(n) = power(n)./(n_t(n)*powe);
        if eff(n)  >= 1
            eff(n) = 1.0;
        end
        power(n) = power(n) * 8760;  % units are million Kwh/yr
        comp_time_runs(n) = toc;
%% Printing out the iterration deatils after every 25 iterrations
        if (n-int16(n/25)*25) == 0
           p = pow_new(b1);
           p = p * 8760 ;   % units are million Kwh/yr
           [c,k] = cost(b1);
           c = c/(p); % $/Gwh
           disp(['The Generation is ' num2str(n)]);
           disp(['No.of Turbines are ' num2str(k)]);
           disp(['Installed capacity is ' num2str((k * 6)/1000),' Gw']);
           disp(['Power produced by this layout is ',num2str(p),' million Kwh/yr']);
           disp(['Cost incurred per year by layout is ',num2str(c),'  per Gwh']);
           disp(['Efficiency of layout is ',num2str(eff(n))]);
           disp(['Fitness of layout is ',num2str(f(n))]);
           disp(['Time elapsed is ',num2str(comp_time_runs(n))]);
           disp(' ');
        else
          
       end

end
%% Plotting the evalution of the output variables 
generation = (1:gen);
f1 = figure();
subplot(2,2,1)
plot(generation,n_t(1:gen),'Linewidth',2)
grid('on')
xlabel('Generation')
ylabel('No.of Turbines')

ax = gca;
ax.FontSize = 13;

subplot(2,2,2)
plot(generation,power(1:gen),'Linewidth',2)
grid('on')
xlabel('Generation')
ylabel('Power(million Kwh/yr)')
ax = gca;
ax.FontSize = 13;

subplot(2,2,3)
plot(generation,eff(1:gen),'Linewidth',2)
grid('on')
xlabel('Generation')
ylabel('Efficiency')
hold on
yyaxis right
plot(generation,cos(1:gen),'Linewidth',2)
ylabel('Cost Per Turbine($/Kwh)')
hold off

ax = gca;
ax.FontSize = 13;
%% Create textbox
annotation(f1,'textbox',...
    [0.565102564102564 0.0996784565916399 0.341383107088989 0.356913183279743],...
    'String',{'GE’s Haliade150-6MW','TURBINE RATED POWER - 6 MW','TURBINE ROTOR DIA - 150 m',...
    '','OPTIMAL LAYOUT SPECS','','NO.OF TURBINES - ' num2str(n_t(gen)),...
    'INSTALLED CAPACITY - ' num2str((n_t(gen) * 6 )/ 1000) ' GW',...
    'POWER GENERATED - ' num2str(power(gen)) ' million Kwh/yr',''},...
    'HorizontalAlignment','center',...
    'FontSize',10,...
    'FitBoxToText','on');
%% Plotting the best layout at the end of the GA run.
figure();
spy(squeeze(lt(gen,:,:)));
% saveas(f2,[pwd '/../../EGU_Figures/layout_08Aug_WF111_10000.fig']);
% save([pwd,'/matfiles/data_22Aug_WF1V_50k_OP_FIX.mat'])
return
end
