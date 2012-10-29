function S = simwalk(s,N,i,p)

% ----// simwalk.m //---- 
%
% Simulates several random walks
%
% 
%  Input:  
%    N - int, number of simulations to run
%    p - double, 0<p<1, probability.
%    s - int, number of steps
%    i - int, initial state
%
%  Output:
%    S - matrix whith a random walk in each row.
%
% ------------------------- 

S = zeros(N,s);
for i=1:N
  S(i,:) = randwalk(s,i,p);
end

