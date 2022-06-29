
%sorting the layouts according to their fitnesses.
function b = srtg(f)
         
         b = zeros(6,1);
         f_s = sort(f);
         b1 = find(f == f_s(1));
         b2 = find(f == f_s(2));
         b3 = find(f == f_s(3));
         b4 = find(f == f_s(4));
         b5 = find(f == f_s(5));
         b6 = find(f == f_s(6));
         
       if b1(1) == b2(1)
           b(1) = b1(1);
           b(2) = b1(2);
           if b1(1) == b3(1)
               b(3) = b3(3);
           
               if b1(1) == b4(1)
                   b(4) = b4(4);
                   if b1(1) == b5(1)
                       b(5) = b5(5);
                       if b1(1) == b6(1)
                           b(6) = b6(6);
                       else
                           b(6) = b6(1);
                       end
                   else
                       b(5) = b5(1);
                       b(6) = b6(1);
                   end
               else
                   b(4) = b4(1);
                   b(5) = b5(1);
                   b(6) = b6(1);
               end
           else
               b(3) = b3(1);
               b(4) = b4(1);
               b(5) = b5(1);
               b(6) = b6(1);
           end
       elseif b2(1) == b3(1)
             b(1) = b1(1);
             b(2) = b2(1);
             b(3) = b2(2);
            
             if b2(1) == b4(1)
                 b(4) = b2(3);
                 if b2(1) == b5(1)
                     b(5) = b2(4);
                     if b2(1) == b6(1)
                         b(6) = b2(5);
                     else 
                         b(6) = b6(1);
                     end
                 else
                     b(5) = b5(1);
                 end
             else
                 b(4) = b4(1);
                 b(5) = b5(1);
                 b(6) = b6(1);
             end
       elseif b3(1) == b4(1)
             b(1) = b1(1);
             b(2) = b2(1);
             b(3) = b3(1);
             b(4) = b4(2);
             if b3(1) == b5(1)
                 b(5) = b5(3);
                 if b3(1) == b6(1)
                     b(6) = b6(4);
                 else
                     b(6) = b6(1);
                 end
             else
                 b(5) = b5(1);
                 b(6) = b6(1);
             end
       elseif b4(1) == b5(1)
           b(1) = b1(1);
           b(2) = b2(1);
           b(3) = b3(1);
           b(4) = b4(1);
           b(5) = b5(2);
           if b4(1) == b6(1)
               b(6) = b6(3);
           else
               b(6) = b6(1); 
           end
       elseif  b5(1) == b6(1)
           b(1) = b1(1);
           b(2) = b2(1);
           b(3) = b3(1);
           b(4) = b4(1);
           b(5) = b5(1);
           b(6) = b6(2);
       else
           b(1) = b1(1);
           b(2) = b2(1);
           b(3) = b3(1);
           b(4) = b4(1);
           b(5) = b5(1);
           b(6) = b6(1);
       end
       
       if b(6) == 0
           b(6) = max(b(1:5));
       end
       return
       
end

       
     