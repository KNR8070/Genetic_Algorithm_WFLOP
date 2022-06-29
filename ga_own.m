%% ga for wind farm optimisation
% inputs to the model are two best performing layouts (l1,l2) at each iterration
% b_1, b_2 are the two best performing layputs at the end of the current
% iterration
% along with the input layput two random layouts (ll,ff) are also produced.
 function [b_1,b_2] = ga_own(l1,l2)
% genetic algorithm has mainly three operations 
% 1) Cross-Over - reproduces new layouts from the input layouts (l1 and l2) and 
%                 the randomly craeted layouts (ll, and ff). here thirty cross 
%                 over layouts are created (refer cross.m)
% 2) Mutation - Introduces minute changes to the best performing layouts 
% 3) Objective/Fitness - Calcutae the fitness of the all the layouts
%                        created (34 in this case) and sorting them 
%                         from maximum fitness to lowest fitness
% At last, we select the two layouts from the 34 layouts craeted
% pop = 20 ; 
% mutation_rate = 0.1 ;
% selection_rate = 0.7 ;
    
l = l1;
f = l2;
[x,y] = size(l1);
ll = layout(x,y);
ff = layout(x,y);
%% cross-over
[c1,c2,c3,c4,c5,c6]=cross (l,f);

[c7,c8,c9,c10,c11,c12]=cross(l,ff);

[c19,c20,c21,c22,c23,c24]=cross(l,ll);

[c25,c26,c27,c28,c29,c30]=cross(ff,f);

[c13,c14,c15,c16,c17,c18]=cross(ll,f);
%% mutation 
m1 = mutate(l);
m2 = mutate(f);
%% objective
tot_lay = cat(3,l,f,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,...
              c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,m1,m2);
          
fit = [fitness(1),fitness(f),fitness(c1),fitness(c2),fitness(c3),fitness(c4),...
   fitness(c5),fitness(c6),fitness(c7),fitness(c8),fitness(c9),fitness(c10),fitness(c11),fitness(c12),...
   fitness(c13),fitness(c14),fitness(c15),fitness(c16),fitness(c17),fitness(c18),...
   fitness(c19),fitness(c20),fitness(c21),fitness(c22),fitness(c23),fitness(c24),...
   fitness(c25),fitness(c26),fitness(c27),fitness(c28),fitness(c29),fitness(c30),fitness(m1),fitness(m2)];
   
b = srtg(fit);
%% parent selection

b_1 = tot_lay(:,:,b(1));
b_2 = tot_lay(:,:,b(2));
 end