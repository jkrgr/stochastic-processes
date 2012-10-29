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

trials = [];
len=0;
biggest = init;
for i=1:N
  [trial, gens, biggest_pop] = branchsim(init,dist);
  if biggest < biggest_pop
    biggest = biggest_pop;
  end
end
disp('maximum length: ')
disp(biggest);
end
