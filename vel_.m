%% velocity at each turbine real-case

function u = vel_(lt,k,x)
%% velocity at each turbine 
% where lt = layout to be evalautaed
% k[value range is 1 to 4] is the wind speed direction :- 1 is NE, 2 is NW,
% 3 is SW & 4 is SE
% x is the wind speed bin (value range is 1 to 4); x = 1 => uo(1) = 5 m/s;
uo = [5,7,9,11] ;
%u_ac = u_ac.* inten ;
[m,n]=size(lt);
u1 = zeros(size(lt));

if k == 1
        for i = 1:m 
         for j = n:-1:1
            if lt(i,j) == 1
               u1(i,j) = speed(i,j,lt,uo(x),k,u1);
            else
               u1(i,j) = 0; 
            end
         end
        end
elseif k == 2
        for j = 1:n
        for i = 1:m
            if lt(i,j) == 1
               u1(i,j) = speed(i,j,lt,uo(x),k,u1);
            else
               u1(i,j) = 0; 
            end              
        end    
        end
elseif k == 3
    for i = 1:m         
        for j = 1:n     
            if lt(i,j) == 1
               u1(i,j) = speed(i,j,lt,uo(x),k,u1);
            else
               u1(i,j) = 0; 
            end             
        end
     end   
elseif k == 4
       for j = 1:n
        for i = m:-1:1
            if lt(i,j) == 1
               u1(i,j) = speed(i,j,lt,uo(x),k,u1);
            else
               u1(i,j) = 0; 
            end            
        end    
       end
end
u = u1;
return
end
