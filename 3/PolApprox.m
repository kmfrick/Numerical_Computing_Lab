function [alpha, alpha_svd] = PolApprox(pts)
n_max = 5;
alpha = cell(n_max, 1);
alpha_svd = cell(n_max, 1);
x = pts(1:end, 1);
y = pts(1:end, 2);
for n = 1:n_max
    alpha{n} = zeros(n + 1, 1);
    alpha_svd{n} = zeros(n + 1, 1);
    A = horzcat(ones(length(x), 1), x);
    for i = 2:n
        A = horzcat(A, x .^i);
    end
    
    alpha{n} = flip((A' * A) \ A' * y);
    
    [U, S, V] = svd(A);
    for i = 1:length(V)
        u = U(1:end, i);
        s = S(i, i);
        v = V(1:end, i);
        alpha_svd{n} = alpha_svd{n} + (u' * y * v / s);
    end
    
    alpha_svd{n} = flip(alpha_svd{n});
end

