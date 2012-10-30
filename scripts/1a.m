% ----// 1a.m //---- 
%
% Comparing simulated and 
% analytical results in 1a.
%
% Outputs: matrix, lim_p.
%   Limiting probabilities containing analytical
%   values in row 1, estimated ones in row 2,
%   and the the confidence intervals in 3 and 4.
lim_p = zeros(4,10)

p=0.75;
N=1000;
x=0;


%%%% Analytical values %%%%

for i = 1:N
  v(i) = i+1;
  x=x+(p.^(0.5*i*(i+1)))./prod(1-p.^v);
end

lim_p(1,1) = 1/(1+x);
v=[];
for i=1:10
  v(i) = i+1;
  lim_p(1,i+1) = lim_p(1,1)*(p.^(0.5*i*(i+1)))./prod(1-p.^v);
end


%%%% Simulated values %%%%

Z=1.96;
for i=1:11
  % Do N simulations starting in state i
  Walks = simwalk(100,1000,i,0.90);
  % Calculate the mean an confidence interval
  % for each starting state.
  lim_p(2,i) = mean(Walks);
  lim_p(3,i) = lim_p(2,i)-Z*std(Walks)./sqrt(1000);
  lim_p(4,i) = lim_p(2,i)+Z*std(Walks)./sqrt(1000);
end
