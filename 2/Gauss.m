function [Linv, R] = Gauss(A)
n = length(A);
c = 1;
N = A;
Linv = eye(n);
while (c < n)
    Lk = eye(n);
    r = c + 1;
    while (r <= n)
        Lk(r, c) =  - N(r, c) / N(c, c);
        r = r + 1;
    end
    c = c + 1;
    N = Lk * N;
    Linv = Lk * Linv;
end
R = N;
end