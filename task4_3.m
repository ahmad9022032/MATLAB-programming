syms n z
f = n*((0.5)^n*cos(9*pi*n/3));
F = ztrans(f, n, z);
disp(F)