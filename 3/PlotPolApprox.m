function PlotPolApprox(pts, alpha, alpha_svd)
x = pts(1:end, 1);
y = pts(1:end, 2);
x_int = min(x):0.1:max(x);
for i = 1:length(alpha)
    %y_calc = polyval(alpha{i}, x_int);
    %y_calc_svd = polyval(alpha_svd{i}, x_int);
    %e = polyval(alpha{i}, x) - y;
    %figure;
    %hold on;
    %title(strcat("Residuals vs x for n = ", num2str(i)));
    %scatter(x, e);
    %mse = e' * e / (length(x) - i)
    %sd = sqrt(mse);
    %line([min(x) max(x)], [sd sd]);
    %legend("Residuals", "Estimated standard deviation");
    %xlabel("x");
    %ylabel("Residuals");
    %hold off;
    
    figure;
    hold on;
    title(strcat("Least-squares fit for n = ", num2str(i)));
    scatter(x, y);
    plot(x_int, y_calc);
    plot(x_int, y_calc_svd);
    legend("Original set of points", "Solving normal equations", "SVD");
    hold off;
end
end

