function l = layout(x,y)
% %% random layout
% % x - no.of rows;
% % y - no.of columns;
%%%%%%%%%%%%%%%% Thum rule layout %%%%%%%%%%%%%%%%%%%%%%%%%%%
l1 = zeros(x,y);
for i = 1:2:x
    for j = 1:2:y
       l1(i,j) = 1;
    end
 end
%%%%%%%%%%%%%%%%%%%% XXXXXXX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%% Random Layout %%%%%%%%%%%%%%%%%%%%%%%%%
% l = rand(x,y);
% for i = 1:x
%     for j= 1:y
%         if l(i,j) >= 0.5
%             l(i,j)=0;
%         else
%             l(i,j)=1;
%         end
%     end
% end
% l_rand = length(find(l==1));
 l_thu = length(find(l1==1));
%     if l_rand ~= l_thu
%        a =  find(l==1);
%        x1 = randperm(length(a),abs(l_rand-l_thu));
%        for i = 1:length(x1)
%             l(a(x1(i))) = 0;
%        end
%     else
%     end
l_zeros = zeros(x,y);
l_ones_pos = randperm(x*y,l_thu);
l_zeros(l_ones_pos)=1;
l = l_zeros;
return
end