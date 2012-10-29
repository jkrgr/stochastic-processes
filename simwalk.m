function W = randwalk(N,i,p)

% ----// randwalk.m //---- 
%
% Simulates a random walk 
%
% 
%  Input:  
%    N - int, number of transitions
%    i - int, initial state  
%    p - double, 0<p<1, probability.
%
%  Output:
%    w - vector, with transtions.
%
% ------------------------- 

W = zeros(1,N+1);
W(1) = i;
for j=1:N
  r=rand(1);
  % Walk to the right
  if W(j) >= 0 && r < p^(W(j)+1)
    W(j+1) = W(j) + 1;
  % Walk to the left
  elseif W(j) > 0
    W(j+1) = W(j)-1;
  else
    W(j+1) = 0
  end
end
end

