function [x, err, y] = Bisection(f, a, b, x_sol, iter_max)


err = zeros(iter_max, 1);
y = zeros(iter_max, 1);
x = zeros(iter_max, 1);
for i = 1:iter_max
    c = (a + b) / 2;
    y(i) = f(c);
    x(i) = c;
    err(i) = abs(c - x_sol) / abs(x_sol);
    if (f(a) * f(c) < 0)
        b = c;
    else
        a = b;
        b = c;
    end
    
end
end