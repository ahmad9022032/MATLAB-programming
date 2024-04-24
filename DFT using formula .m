function Xk = DFTsum(x, N)
    n = 0 : 1 : N - 1;
    k = 0 : 1 : N - 1;

    Wn = exp(-1i * 2 * pi / N);
    
    nk = n' * k;

    Wn_nk = Wn .^ nk;

    Xk = x * Wn_nk;
end