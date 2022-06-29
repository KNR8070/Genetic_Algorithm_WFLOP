function ch_l = check_turbines(l)
[x1,y1] = size(l);
%%%%%%%%%%%%%%%% Thum rule layout %%%%%%%%%%%%%%%%%%%%%%%%%%%
l_th = zeros(x1,y1);
%tur = randperm((x*y),nt);
for i = 1:2:x1
    for j = 1:2:y1
       l_th(i,j) = 1;
    end
 end
%%%%%%%%%%%%%%%%%%%% XXXXXXX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_tur = length(find(l_th==1));
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
    ch_l = l;
    return
end