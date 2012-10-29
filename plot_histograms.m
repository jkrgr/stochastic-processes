function f = plot_histograms(gen_sizes, pop_sizes, largest_gens, N)

[n1, xout1] = hist(gen_sizes,25);
bar(xout1, n1/N);
figure(1);
print -depsc2 gen_sizes.eps;

[n2,xout2] = hist(pop_sizes, 25);
bar(xout2,n2/N);
figure(2);
print -depsc2 pop_sizes.eps;

[n3, xout3] = hist(largest_gens, 25);
bar(xout3,n3/N);
figure(3);
print -depsc2 largest_gens.eps;

end
