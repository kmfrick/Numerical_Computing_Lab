function [time_lr, time_lrp, time_c, err_vec] = TimeSolve(A, b)
    n = length(b);
    x_star = zeros(n);
    % Eliminazione di Gauss senza pivot
    tic
    [Linv, R] = Gauss(A);
    x_star = x_star + UpperSolve(R, Linv * b);
    time_lr = toc;
    
    
    % Eliminazione di Gauss con pivot
    
    tic
    [L, R] = lu(A);
    x_star = x_star + UpperSolve(R, L \ b);
    time_lrp = toc ;
    
    % Metodo di Cholesky
    
    tic
    R = chol(A);
    x_star = x_star + UpperSolve(R, R \ b);
    time_c = toc ;
    
    x_star = x_star ./ 3;
    x = ones(n);
    err_vec = norm(x_star - x) / norm(x);
end

