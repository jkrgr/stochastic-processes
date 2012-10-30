function W = randwalk(T,i,p)

% ----// randwalk.m //---- 
%
% Simulates a random walk 
%
% 
%  Input:  
%    T - int, number of transitions
%    i - int, initial state  
%    p - double, 0<p<1, probability.
%
%  Output:
%    w - vector, with transitions.
%
% ------------------------- 

W = zeros(1,T);
W(1) = i;
s = i; % current state s

for t=1:T
  r=rand(1);
  % Walk to the right
  if r <= p^(s+1)
    W(t) = s+1;
    s = s+1;
  % Walk to the left
  elseif s>0
    W(t) = s-1;
    s=s-1;
  % Return to state 0
  end
end
end


