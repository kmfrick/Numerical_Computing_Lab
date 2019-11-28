%% Calcolo Numerico

% Esercitazione 1
% Kevin Michael Frick

%% Calcolo dei parametri L ed U

fprintf("Ex 1\n");
UFL = realmin;
OFL = realmax;
beta = 2;
t = 1 - log(eps) / log(beta);
L = log(UFL) / log(beta);
U = log (OFL / (beta - (beta .^ (-t + 1)))) / log(beta);
fprintf("t = %i; L = %i; U = %i\n", t, L, U);

%% Calcolo della precisione macchina

fprintf("Ex 2\n");
calc_eps = 1;
while (1 + calc_eps > 1)
    calc_eps = calc_eps / 2;
end
calc_eps = calc_eps * 2;
fprintf("Eps = %g\n", calc_eps);
fprintf("Relative error = %g\n", abs(eps - calc_eps) / eps);

%% Calcolo di pi

fprintf("Ex 3\n");
calc_pi = 0;
j = -1;
for i = 0:1200
    if (mod(i, 2) > 0) 
        j = j * (-1);
        calc_pi = calc_pi + j / i;
    end
end
calc_pi = calc_pi * 4;
fprintf("Calculated pi = %g\n", calc_pi);
fprintf("Relative error = %g\n", abs(pi - calc_pi) / pi);

%% Calcolo di e

fprintf("Ex 4\n");
n = power(10, 14);
while (n < power(10, 17))
    calc_e = (1 + 1 / n) .^ n;
    fprintf("Calculated e = %g with n = %i\n", calc_e, n);
    fprintf("Relative error = %g with n = %i\n", abs((calc_e - exp(1)) / exp(1)), n);
    n = n * 10;
end

%% Calcolo della derivata di exp(x)

fprintf("Ex 5\n");
func = @(x)(exp(x));
calc_der_aux = @(x, h, f)((f(x + h) - f(x)) / h);
calc_err = @(k) abs((calc_der_aux(1, power(10, -k), func) - func(1))/func(1));
calculated_error = arrayfun(calc_err, 1:16);
loglog(arrayfun(@(x) power(10, -x), 1:16), calculated_error);
hold on;
title("Errore relativo nel calcolo della derivata");
xlabel("Valore del differenziale dx");
ylabel("Errore relativo");

err_min = calc_err(8);
hold off;
fprintf("err_min = %g", err_min);

