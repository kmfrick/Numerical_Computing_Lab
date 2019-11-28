function [x_star, err, y] = Newton(f, df, x, x_sol, iter_max)
err = zeros(iter_max, 1);
y = zeros(iter_max, 1);
x_star = zeros(iter_max, 1);
for i = 1:iter_max
    y(i) = f(x);
    x = x - f(x) / df(x);
    x_star(i) = x;
    err(i) = abs(x - x_sol) / abs(x_sol);
end
end