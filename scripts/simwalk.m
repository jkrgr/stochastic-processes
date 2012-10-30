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
%    S - matrix with a random walk in each row.
%
% ------------------------- 

S = zeros(N,s);
for j=1:N
  S(j,:) = randwalk(s,i,p);
end

