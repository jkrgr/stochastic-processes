function [popu, gens, biggest_pop] = branchsim(init, dist)

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
%
% ------------------------- 


% The population of the 1st generation
popu(1) = init;
% Accumulated probabilities to be used w. rand(1)
cumdist = cumsum(dist);
len = length(dist);
% Generation number n
n = 1;
biggest_pop = 0;
while popu(n) > 0
  popu(n+1) = 0;
  for j=1:popu(n)
    random = rand(1);
    for k=0:len-1
      if random < cumdist(k+1)
        % Update the population of generation n+1
        popu(n+1) += k;
        break;
      end
    end
  end
  if popu(n+1) > biggest_pop
    biggest_pop = popu(n+1);
  end
  ++n;
end
gens = n;
end
