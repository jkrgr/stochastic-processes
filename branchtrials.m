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

tenth = hundreth = thousandth = zeros(1,N);
len=0;
biggest = init;
for i=1:N
  [trial, gens, biggest_pop] = branchsim(init,dist);
  tenth(i) = trial(11);
  hundreth(i) = trial(101);
  thousandth(i) = trial(1001);
  if biggest < biggest_pop
    biggest = biggest_pop;
  end
end
disp('Mean, 10, 100, 1000:')
mean(tenth)
mean(hundreth)
mean(thousandth)
disp('Standard deviation, 10, 100, 1000:')
std(tenth)
std(hundreth)
std(thousandth)

end
