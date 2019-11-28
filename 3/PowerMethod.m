function x = PowerMethod(A, x0, nmax)
x0 = x0 / norm ( x0 );
pro = A * x0;
iter = 0;
x = pro;
for i = 1:nmax
    x = pro;
    x = x / norm (x );
    pro = A * x;
end
end

