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
  [trials(i,:), gen_sizes(i), pop_sizes(i), largest_gens(i)] = branchsim(init,dist);
  tht(i,1) = trials(i,11);
  tht(i,2) = trials(i,101);
  tht(i,3) = trials(i,1001);
end

disp('Mean: 10, 100, 1000:')
mean(tht(:,1)), mean(tht(:,2)), mean(tht(:,3))
disp('Standard deviation: 10, 100, 1000:')
std(tht(:,1)), std(tht(:,2)), std(tht(:,3))

disp('(i)    No. of generations: ')
mean(gen_sizes)
std(gen_sizes)
a=hist(gen_sizes, N);
bar = a/N;
xlim([0,30]);

disp('(ii)   Total population')
mean(pop_sizes)
std(pop_sizes)

disp('(iii)  Maximum number of individuals')
mean(largest_gens)
std(largest_gens)
end
