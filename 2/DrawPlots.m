function DrawPlots(label, time_lr, time_lrp, time_c, cond_num, err_vec, si, s)
% Tempi di risoluzione
figure;
plot(si:s, time_lr(si:s));
hold on;
plot(si:s, time_lrp(si:s));
plot(si:s, time_c(si:s));
title(strcat("Risoluzione - ", label));
xlabel("Dimensione della matrice A");
ylabel("Tempo di esecuzione (s)");
legend("Fattorizzazione LR", "Fattorizzazone LR con pivot", "Metodo di Cholensky");
hold off;

% Numeri di condizione
figure;
semilogy(si:s, cond_num(si:s));
hold on;
title(strcat("Numeri di condizione - ", label));
xlabel("Dimensione della matrice A");
ylabel("Numero di condizione");
hold off;

% Errore in norma 2
figure;
semilogy(si:s, err_vec(si:s));
hold on;
title(strcat("Errore in norma 2 - ", label));
xlabel("Dimensione della matrice A");
ylabel("Errore relativo");
hold off;

end

