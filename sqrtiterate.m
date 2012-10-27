function list = sqrtiterate(A,times)
    %Identity matrix
    Y = eye(length(A));
    %Solution of the root of A
    root = eigroot(A);
    %Creates an empty vector to store max norms
    list = zeros(times+1,1);
    maxnorm = max(max(abs(root-Y)));
    list(1) = maxnorm;
    for x = 1:times
        Y = 0.5*(Y+Y\A);                 %Calculates each iteration
        maxnorm = max(max(abs(root-Y))); %Calculates the error
        list(x+1) = maxnorm;             %Adds it to the vector
    end
end