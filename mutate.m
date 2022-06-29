
%% mutation

function mu = mutate(l)
[x1,y1] = size(l);

%%%%%%%%%%%%%%%% Thum rule layout %%%%%%%%%%%%%%%%%%%%%%%%%%%
l1 = zeros(x1,y1);
%tur = randperm((x*y),nt);
for i = 1:2:x1
    for j = 1:2:y1
       l1(i,j) = 1;
    end
 end
%%%%%%%%%%%%%%%%%%%% XXXXXXX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_tur = length(find(l1==1));
%f = (0.01 * x1* y1 );
f = int16(0.01* x1* y1 );
m1 = randperm((x1*y1),f);
%m2 = randi(y1,[f,1]);
for i = 1:f
         if l(m1(i)) == 0
           l(m1(i)) = 1;
         else
            l(m1(i)) = 0;
         end
end
l_rand = length(find(l==1));
    if l_rand ~= n_tur
           if l_rand > n_tur
               a =  find(l==1);
               x1 = randperm(length(a),(l_rand-n_tur));
               for i = 1:length(x1)
                    l(a(x1(i))) = 0;
               end
           elseif l_rand < n_tur
               a =  find(l==0);
               x1 = randperm(length(a),abs(l_rand-n_tur));
               for i = 1:length(x1)
                    l(a(x1(i))) = 1;
               end   
           end
    else
    end
mu = l;
return
end