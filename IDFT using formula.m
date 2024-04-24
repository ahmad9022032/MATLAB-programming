function xn = IDFTsum(X, N)
    n = 0 : 1 : N - 1;
    k = 0 : 1 : N - 1;

    e = exp(1i * 2 * pi / N);
    
    nk = n' * k;

    e_nk = e .^ nk;
    
    xn = (1/N) .* X * e_nk;
end