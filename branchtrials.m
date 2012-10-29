function popu = branchtrials(N,init,dist)

% ----// branchtrials.m //---- 
%
% Simulates a branching process 
%
% 
%  Input:  
%    N    - int, Number of simulations to run
%    init - int, initial size of the population
%    dist - vector, offspring probability 
%           distribution [p0, ..., pn]  
%
%  Output:
%    popu - vector, population for each generation.
%
% ---------------------------- 

% Tenth, hundreth and thousandth generation
tht = zeros(2000,3);
% Sample set
trials = zeros(N, 2000);

for i=1:N
  [trials(i,:), gens(i), largest(i)] = branchsim(init,dist);
  tht(i,1) = trials(i,11);
  tht(i,2) = trials(i,101);
  tht(i,3) = trials(i,1001);
end

disp('Mean: \n10, 100, 1000:')
mean(tht(:,1)), mean(tht(:,2)), mean(tht(:,3))
disp('Standard deviation: \n10, 100, 1000:')
std(tht(1,:)), std(tht(2,:)), std(tht(3,:))

disp('No. of generations: ')
mean(gens)
std(gens)
end
