syms n z;
f = (1/2)^n * heaviside(n) - (1/3)^n * heaviside(n);
F = ztrans(f, n, z);
disp(F);