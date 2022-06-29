%% cross over
function [c1,c2,c3,c4,c5,c6] = cross(x,y)
%% cross-over real-case
s1 = 0.1 ;   % selection rate 1
s2 = 0.2 ;   % selection rate 2
s3 = 0.3 ; % seelction rate 3
s4 = 0.6;
[m,n] = size (x);

c_1 = [x(:,1:int16((s1 * n))), y(:,((int16(s1 * n)+1):(int16((s1+s2) * n)))),x(:,((int16((s1+s2) * n)+1):(int16((s1+s2+s3) * n)))),y(:,((int16((s1+s2+s3) * n))+1):n)];   
c_2 = [y(:,1:int16((s1 * n))), x(:,((int16(s1 * n)+1):(int16((s1+s2) * n)))),y(:,((int16((s1+s2) * n)+1):(int16((s1+s2+s3) * n)))),x(:,((int16((s1+s2+s3) * n))+1):n)];
%c1 = [x(:,1:((s7 * n))), y(:,(((s7 * n)+1):n))];%((s2 * n)))),x(:,(((s2 * n)+1):((s3 * n)))),y(:,(((s3 * n))+1):n)];   
%c2 = [y(:,1:((s7 * n))), x(:,(((s7 * n)+1):n))];%((s2 * n)))),y(:,(((s2 * n)+1):((s3 * n)))),x(:,(((s3 * n))+1):n)];
c_3 = [x(:,1:(s4 * n)), y(:,((s4 * n)+1):n)];   
c_4 = [y(:,1:(s4 * n)), x(:,((s4 * n)+1):n)];
c_5 = [x(:,1:(s2 * n)), y(:,((s2 * n)+1):n)];   
c_6 = [y(:,1:(s2 * n)) , x(:,((s2 * n)+1):n)];
%%%%%%%%%%%%%%%%%%%%%%% 11/08/2020 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c1 = check_turbines(c_1);
c2 = check_turbines(c_2);
c3 = check_turbines(c_3);
c4 = check_turbines(c_4);
c5 = check_turbines(c_5);
c6 = check_turbines(c_6);

end