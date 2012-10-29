function [popu, n, tot_people, largest_gen] = branchsim(init, dist)

% ----// branchsim.m //---- 
%
% Simulates a branching process 
%
% 
%  Input:  
%    init - int, initial size of the population
%    dist - vector, offspring probability 
%           distribution [p0, ..., pn]  
%
%  Output:
%    popu - vector, population for each generation.
%    n    - int, number of generations
%    tot_people  - int, total number of people lived.
%    largest_gen - int, size of the largest generation.
%
% ------------------------- 

popu = zeros(1,2000);
% The population of the 1st generation
popu(1) = 1;
% Accumulated probabilities to be used w. rand(1)
cumdist = cumsum(dist);
len = length(dist);
tot_people = init;
largest_gen = init;

% Generation number n
n = 1;
while popu(n) > 0
  popu(n+1) = 0;
  for j=1:popu(n)
    r = rand(1);
    if r < cumdist(1)
      popu(n+1) = popu(n+1) + 0;
    elseif r < cumdist(2)
      popu(n+1) = popu(n+1) + 1;
    elseif r < cumdist(3)
      popu(n+1) = popu(n+1) + 2;
    else
      popu(n+1) = popu(n+1) + 3;
    end
  end
  tot_people = tot_people + popu(n+1);
      if largest_gen < popu(n+1)
        largest_gen = popu(n+1);
      end
      n=n+1;
    end
    end
