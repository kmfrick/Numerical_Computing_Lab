function sol = LowerSolve(A, B)
if (nargin < 2)
    fprintf("Usage: solve (A, B)\n");
end
A
B
if (ismatrix(A))
    sol = zeros(1, length(B));
    i = 1;
    while (i <= length(A))
        j = 1;
        result = 0;
        while (j < i)
            result = result + sol(j) * A(i,j);
            j = j + 1;
        end
        sol(i) = (B(i) - result) / A(i,j);
        i = i + 1;
    end
else
    error("Expected matrix and vector as arguments");
end
end
