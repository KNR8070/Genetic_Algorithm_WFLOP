 function p1 = pow_new(l20)
%% total power calculation
p = zeros(4,4);           % power in W
A = 17860;                % rotor area in m2
rho = 1.225;              % density of air kg m-3
po = zeros(size(l20));
[m,n] = size(l20);
% wf = 1 or 2 or 3...... 1 = 5GW - 2 = Along coast - 3 = max.Area
% freq = frequency(wf);
freq = getGlobalfr;
freq = freq./100;
for k =1:4
for x = 1:4
    u1 = vel_(l20,k,x);
  for i = 1:m
    for j = 1:n
       if u1(i,j) == 0 || u1(i,j) < 3.0 || u1(i,j) > 25.0
           po(i,j) = 0; 
       elseif u1(i,j) >= 3.0 && u1(i,j) <= 14.0 
           po(i,j) = 0.5 * A * rho *(u1(i,j).^3)* 0.2/10^9 ;%(efficiency to convert wind to energy is 0.2) and units are Gw
%             po(i,j) = (6/10^3) .* ((u1(i,j)-ci)./(cr-ci))^3;
       elseif u1(i,j)> 14 && u1(i,j)<= 25
           po(i,j) = 6/10^3 ;  % units are Gw
       end
       p(k,x) = p(k,x) + sum(sum(po(i,j)));
     end
  end
end
end


power = p.*freq;

p1 = sum(sum(power));% GW/yr
%disp(['power produced by this layout anually is ',num2str(p1),' GW/yr'])
return
end