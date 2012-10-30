% ----// 1b.m //---- 
%
% Comparing simulated and 
% analytical results in 1b.
%
% Outputs: matrix, ET.
%   Expected Time until the chain reaches state 10
%   for the first time. Row 1: mean, Row 2&3: C.I.

p=0.90;
N=10000;
Z=1.96;
ET = zeros(3,10);

% S holds the number of transitions needed to end
% up in state 10 for each run.
S = zeros(10,100);

for i=1:10
  Walks = simwalk(1000,100,i,0.90);
  for j=1:100
    m = find(Walks(j)==10,1);
    if m>10-i
      S(i,j) = m;
    end
  end
  % Calculate the mean and confidence interval
  % for each starting state i.
  ET(1,i) = mean(S(i));
  ET(2,i) = ET(1,i)-Z*std(S(i))./sqrt(length(S(i)));
  ET(3,i) = ET(1,i)+Z*std(S(i))./sqrt(length(S(i)));
end

ET
