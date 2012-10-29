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

disp('(ii)   Total population')
mean(pop_sizes)
std(pop_sizes)

disp('(iii)  Maximum number of individuals')
mean(largest_gens)
std(largest_gens)

%f=plot_histograms(gen_sizes, pop_sizes, largest_gens, N);

[n1, xout1] = hist(gen_sizes,40);
bar(xout1, n1/N);
figure(1);
print('-dpdf','gen.pdf');

[n2,xout2] = hist(pop_sizes, 40);
bar(xout2,n2/N);
figure(2);
print('-dpdf','pop.pdf');

[n3, xout3] = hist(largest_gens, 40);
bar(xout3,n3/N);
figure(3);
print('-dpdf','largest.pdf');

end
