function PrintSVD(image_largest, image_smallest, image_k, image_k_val)

figure;
hold on;
title("Largest singular value eigenimage");
imshow(image_largest);
hold off;

figure;
hold on;
title("Smallest singular value eigenimage");
imshow(image_smallest);
hold off;
    figure;
    hold on;
    title(strcat(num2str(image_k_val), "-th eigenimage"));
    imshow(image_k);
    hold off;
end

