function [l1,l2] = initial_parents(x,y)
 %l2 = ones(x,y);
 l1 = zeros(x,y);
%  l2 = layout_new(x,y);
%  l1 = layout_new(x,y);
%  for i = 1:4:x
%     for j = 1:4:y
%        l1(i,j) = 1;
%      
%     end
%  end
 for i = 1:2:x
    for j = 1:2:y
       l1(i,j) = 1;
    end
 end
end