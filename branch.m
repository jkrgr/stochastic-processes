% branch.m
% This MATLAB code simulates a single-type branching process
% and tracks the population size. You are prompted to supply
% the initial number in the population, the offspring 
% distribution as probabilities for producing
% 0, 1, 2, and 3 offspring (if this doesn't sum to 1 then 
% it is assumed that the reamining probability is assigned to 
% having 4 offspring), a time over which to
% run the process and the number of samples of the process 
% to make. 
%
% The output will be vectors: x contains a list of the
% final population size from each sample; xct1 contains
% a list of the final population size conditioned on
% non-extinction, that is for all samples which have not
% gone extinct. The extinction probability is also 
% produced, as well as a graph of all sample trajectories
%
n1=input('initial population size:    ')
p0=input('probability of 0 offspring:     ')
p1=input('probability of 1 offspring:     ')
p2=input('probability of 2 offspring:     ')
p3=input('probability of 3 offspring:     ')
n=input('Time period for process:     ')
q=input('how many simulations to run:     ')
p4=1-p0-p1-p2-p3;
%
% population size will be called pop
% and time will be ct. sumpop will contain 
% the pop size within each sample obtained by summing
% all the offspring. 
%
x=[ ];
etimes=[ ];
nt=[ ];
tvals=[ ];
for i=1:q
pop=n1;
et=n+1;
for ct=1:n
 sumpop=0;
  if pop==0
     sumpop=0;
     if et > ct 
          et=ct;
      else 
      end;    
  else for j=1:pop
      a=rand(1,1);
      if a >= p0+p1+p2+p3
        kids=4;
      elseif a >= p0+p1+p2
        kids=3;
      elseif a >= p0+p1
        kids=2;
      elseif a >= p0
        kids=1;
      else
        kids=0;
      end;
% end of the for j loop
     sumpop=sumpop+kids;
     end;
     pop=sumpop;
%
% store the results
%
        tvals=[tvals ct];
        nt=[nt pop];

   end;
end;
plot(tvals,nt),pause
hold on;
xlabel('Time'); ylabel('Population size'); title('Branching Process');
nt=[ ];
tvals=[ ];
etimes(i)=et;
x(i)=pop;
end;
hold off;
hist(x)
title('histogram for all samples at final time'),pause
hist(etimes)
title('histogram for extinction time'),pause
mean(etimes), std(etimes)


