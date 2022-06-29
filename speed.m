%% speed ; real_case
% Actual jensen model is replicated in this module
function u = speed(m,n,l,uo,k,u1)
% m = row number
% n = column number
% l = layout
% uo = upwind uniform velocity
%u1 = velocity at each turbine
[ro,c] = size(l); 
d=150;
r = d/2;
Ct = 0.88;
dkc = 0.045;
%alpha = 0.1;
a = (1-sqrt(1-Ct))/2;
num = 2*a;
xd1 = 5*d;
xd2 = 10*d;
xd3 = 15*d;
xt1 = 3*d;
xt2 = 6*d;
xt3 = 9*d;
b = -0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%% k == 1 winds in northeast direction %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if k == 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% last column %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  if n == c 
    u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% second last column %%%%%%%%%%%%%%%%%%%%%%%%    
  elseif n == c-1 && l(m,n+1) == 1
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));  
  elseif n == c-1 && l(m,n+1) == 0 
    u = uo ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% third last column %%%%%%%%%%%%%%%%%%%%%%%%%%    
  elseif n == c-2 && (l(m,n+1) == 1) && l(m,n+2) == 1 
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d)))); 
  elseif n == c-2 && (l(m,n+1) == 1) && l(m,n+2) == 0
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif n == c-2 && (l(m,n+1) == 0) && l(m,n+2) == 1
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif n == c-2 && (l(m,n+1) == 0) && l(m,n+2) == 0
      u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%% remaining columns %%%%%%%%%%%%%%%%%%%%%%%%%%%%      
  elseif (l(m,n+1) == 1) && (l(m,n+2) == 1) && (l(m,n+3) == 1)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n+1) == 1) && (l(m,n+2) == 1) && (l(m,n+3) == 0)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n+1) == 1) && (l(m,n+2) == 0) && (l(m,n+3) == 1) 
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n+1) == 0) && (l(m,n+2) == 1) && (l(m,n+3) == 1)
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif (l(m,n+1) == 1) && (l(m,n+2) == 0) && (l(m,n+3) == 0)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n+1) == 0) && (l(m,n+2) == 1) && (l(m,n+3) == 0)
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif (l(m,n+1) == 0) && (l(m,n+2) == 0) && (l(m,n+3) == 1)
    den = (1+dkc*(xd3/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd3/d))));
  elseif (l(m,n+1) == 0) && (l(m,n+2) == 0) && (l(m,n+3) == 0)
    u = uo;
  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%% k = 2 winds in northwest direction %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif k == 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% first row %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  if m == 1 
    u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% second row %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
  elseif m == 2 && l(m-1,n) == 1
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif m == 2 && l(m-1,n) == 0 
    u = uo ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% third row %%%%%%%%%%%%%%%%%%%%%%%%%%    
  elseif m == 3 && (l(m-1,n) == 1) && l(m-2,n) == 1 
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif m == 3 && (l(m-1,n) == 1) && l(m-2,n) == 0
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif m == 3 && (l(m-1,n) == 0) && l(m-2,n) == 1
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif m == 3 && (l(m-1,n) == 0) && l(m-2,n) == 0
      u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rest %%%%%%%%%%%%%%%%%%%%%%%%%      
  elseif (l(m-1,n) == 1) && (l(m-2,n) == 1) && (l(m-3,n) == 1)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m-1,n) == 1) && (l(m-2,n) == 1) && (l(m-3,n) == 0)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m-1,n) == 1) && (l(m-2,n) == 0) && (l(m-3,n) == 1) 
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m-1,n) == 0) && (l(m-2,n) == 1) && (l(m-3,n) == 1)
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif (l(m-1,n) == 1) && (l(m-2,n) == 0) && (l(m-3,n) == 0)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m-1,n) == 0) && (l(m-2,n) == 1) && (l(m-3,n) == 0)
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif (l(m-1,n) == 0) && (l(m-2,n) == 0) && (l(m-3,n) == 1)
    den = (1+dkc*(xt3/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt3/d))));
  elseif (l(m-1,n) == 0) && (l(m-2,n) == 0) && (l(m-3,n) == 0)
    u = uo;
  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% k = 3 - winds in southwest direction %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif k == 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% first column %%%%%%%%%%%%%%%%%%%%%%%%%%  
  if n == 1 
    u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% second column %%%%%%%%%%%%%%%%%%%%%%%%%    
  elseif n == 2 && l(m,n-1) == 1
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d)))); 
  elseif n == 2 && l(m,n-1) == 0 
    u = uo ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% third column %%%%%%%%%%%%%%%%%%%%%%%%%%    
  elseif n == 3 && (l(m,n-1) == 1) && l(m,n-2) == 1 
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif n == 3 && (l(m,n-1) == 1) && l(m,n-2) == 0
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif n == 3 && (l(m,n-1) == 0) && l(m,n-2) == 1
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif n == 3 && (l(m,n-1) == 0) && l(m,n-2) == 0
      u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%% remaining columns %%%%%%%%%%%%%%%%%%%%%%%%%      
  elseif (l(m,n-1) == 1) && (l(m,n-2) == 1) && (l(m,n-3) == 1)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n-1) == 1) && (l(m,n-2) == 1) && (l(m,n-3) == 0)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n-1) == 1) && (l(m,n-2) == 0) && (l(m,n-3) == 1) 
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n-1) == 0) && (l(m,n-2) == 1) && (l(m,n-3) == 1)
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif (l(m,n-1) == 1) && (l(m,n-2) == 0) && (l(m,n-3) == 0)
    den = (1+dkc*(xd1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd1/d))));
  elseif (l(m,n-1) == 0) && (l(m,n-2) == 1) && (l(m,n-3) == 0)
    den = (1+dkc*(xd2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd2/d))));
  elseif (l(m,n-1) == 0) && (l(m,n-2) == 0) && (l(m,n-3) == 1)
    den = (1+dkc*(xd3/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xd3/d))));
  elseif (l(m,n-1) == 0) && (l(m,n-2) == 0) && (l(m,n-3) == 0)
    u = uo;
  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%% k = 4 winds im southeast directiom %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif k == 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% last row %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  if m == ro 
    u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% second last row %%%%%%%%%%%%%%%%%%%%%%%%    
  elseif m == ro-1 && l(m+1,n) == 1
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));  
  elseif m == ro-1 && l(m+1,n) == 0 
    u = uo ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% third last row %%%%%%%%%%%%%%%%%%%%%%%%%%    
  elseif m == ro-2 && (l(m+1,n) == 1) && l(m+2,n) == 1 
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif m == ro-2 && (l(m+1,n) == 1) && l(m+2,n) == 0
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif m == ro-2 && (l(m+1,n) == 0) && l(m+2,n) == 1
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif m == ro-2 && (l(m+1,n) == 0) && l(m+2,n) == 0
      u = uo;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rest %%%%%%%%%%%%%%%%%%%%%%%%%      
  elseif (l(m+1,n) == 1) && (l(m+2,n) == 1) && (l(m+3,n) == 1)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m+1,n) == 1) && (l(m+2,n) == 1) && (l(m+3,n) == 0)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m+1,n) == 1) && (l(m+2,n) == 0) && (l(m+3,n) == 1) 
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m+1,n) == 0) && (l(m+2,n) == 1) && (l(m+3,n) == 1)
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif (l(m+1,n) == 1) && (l(m+2,n) == 0) && (l(m+3,n) == 0)
    den = (1+dkc*(xt1/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt1/d))));
  elseif (l(m+1,n) == 0) && (l(m+2,n) == 1) && (l(m+3,n) == 0)
    den = (1+dkc*(xt2/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt2/d))));
  elseif (l(m+1,n) == 0) && (l(m+2,n) == 0) && (l(m+3,n) == 1)
    den = (1+dkc*(xt3/r))^2;
    u = uo * (1-(num/den)*(exp(b*(xt3/d))));
  elseif (l(m+1,n) == 0) && (l(m+2,n) == 0) && (l(m+3,n) == 0)
    u = uo;
  end
end
return
end