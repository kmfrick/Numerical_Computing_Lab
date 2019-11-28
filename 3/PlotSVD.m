function PlotSVD(image, image_err, sigma)
    % Relative error
    figure;
    hold on;
    title("Relative error of eigenimages");
    ylabel("Relative error");
    xlabel("Number of singular values");
    k_max = length(image);
    semilogy(1:5:k_max, image_err);
    line([0, k_max], [0.01, 0.01], 'Color', [1, 0, 0]);
    line([0, k_max], [0.05, 0.05], 'Color', [0, 1, 0]);
    line([0, k_max], [0.1, 0.1], 'Color', [1, 1, 0]);
    err_1 = find(image_err < 0.01, 1)
    err_5 = find(image_err < 0.05, 1)
    err_10 = find(image_err < 0.10, 1)
    hold off;
    % Singular values
    figure;
    
    semilogy(sigma);
    hold on;
    title("Singular values");
    ylabel("Singular values");
    xlabel("Index");
    hold off;
    % Compression factor
    figure;
    hold on;
    title("Compression factor");
    ylabel("Compression factor");
    xlabel("Number of diades");
    v = 1:length(image);
    s = size(image);
    m = s(1);
    n = s(2);
    plot(v * (1 / m + 1 / n));
    hold off;
end

