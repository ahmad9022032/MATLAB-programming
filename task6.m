syms n z;
f = (2*z) / ((z-1)*(z^2-1));
disp('x[n]=')
disp(f)
F = ztrans(f, n, z);
disp('X[z]=')
disp(F)