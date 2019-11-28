%% Calcolo Numerico
% Esercitazione 2
% Kevin Michael Frick

%% Matrici casuali

si = 10;
s = 100;
cond_num = zeros(s);
time_lr = zeros(s);
time_lrp = zeros(s);
time_c = zeros(s);
err_vec = zeros(s);
for n = si:s
    x = ones(n, 1);
    Q = randn(n,n);
    A = Q' * diag(abs(randn(n,1))) * Q;
    b = A * x;
    cond_num(n) = rcond(A);
    [time_lr(n), time_lrp(n), time_c(n), err_vec(n)] = TimeSolve(A, b);
end

DrawPlots("Matrici casuali", time_lr, time_lrp, time_c, cond_num, err_vec, si, s);

%% Matrici di Hilbert

si = 2;
s = 14;
cond_num = zeros(s);
time_lr = zeros(s);
time_lrp = zeros(s);
time_c = zeros(s);
err_vec = zeros(s);
for n = si:s
    x = ones(n, 1);
    Q = randn(n,n);
    A = hilb(n);
    b = A * x;
    cond_num(n) = rcond(A);
    [time_lr(n), time_lrp(n), time_c(n), err_vec(n)] = TimeSolve(A, b);
end

DrawPlots("Matrici di Hilbert", time_lr, time_lrp, time_c, cond_num, err_vec, si, s);

%% Matrici particolari in forma piena

si = 50;
s = 350;
cond_num = zeros(s);
time_lr = zeros(s);
time_lrp = zeros(s);
time_c = zeros(s);
err_vec = zeros(s);
for n = si:s
    x = ones(n, 1);
    Q = randn(n,n);
    v = repelem(2.001, n);
    A = diag(v) + diag(ones(1, n - 1), 1) + diag(ones(1, n - 1), -1);
    b = A * x;
    cond_num(n) = rcond(A);
    [time_lr(n), time_lrp(n), time_c(n), err_vec(n)] = TimeSolve(A, b);
end

DrawPlots("Matrici particolari", time_lr, time_lrp, time_c, cond_num, err_vec, si, s);

%% Matrici particolari in forma sparsa

si = 50;
s = 350;
cond_num = zeros(s);
time_lr = zeros(s);
time_lrp = zeros(s);
time_c = zeros(s);
err_vec = zeros(s);
for n = si:s
    x = ones(n, 1);
    Q = randn(n,n);
    v = repelem(2.001, n);
    A = spdiags([x 2.001 * x x], -1:1, n, n);
    b = A * x;
    cond_num(n) = rcond(full(A));
    [time_lr(n), time_lrp(n), time_c(n), err_vec(n)] = TimeSolve(A, b);
end

DrawPlots("Matrici particolari (f. sp.)", time_lr, time_lrp, time_c, cond_num, err_vec, si, s);