function sol = UpperSolve(A, B)
if (nargin < 2)
    fprintf("Usage: solve (A, B)\n");
end
if (ismatrix(A))
    sol = zeros(1, length(B));
    n = length(A);
    i = n;
    while (i > 0)
        j = n;
        result = 0;
        while (j > i)
            result = result + sol(j) * A(i,j);
            j = j - 1;
        end
        sol(i) = (B(i) - result) / A(i,j);
        i = i - 1;
    end
else
    error("Expected matrix and vector as arguments");
end
end
