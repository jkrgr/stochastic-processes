lim_p = zeros(4,10)
p=0.75;
N=1000;
x=0;
v=[];
Z=1.96; % for 0.95 confidence intervals
for i = 1:N
  v(i) = i+1;
  x=x+(p.^(0.5*i*(i+1)))./prod(1-p.^v);
end

lim_p(1,1) = 1/(1+x);
v=[];
for i=1:10
  v(i) = i+1;
  lim_p(1,i+1) = lim_p(1,1)*(p.^(0.5*i*(i+1)))./prod(1-p.^v);
end

for i=1:11
  S = zeros(1,200);
  for t=1:N
    W = randwalk(1000,0,0.75);
    S(t) = sum(W==i-1)/length(W);
  end
  lim_p(2,i) = mean(S);
  lim_p(3,i) = lim_p(2,i)-Z*std(S)./sqrt(1000);
  lim_p(4,i) = lim_p(2,i)+Z*std(S)./sqrt(1000);
end
lim_p
