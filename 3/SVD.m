function [image_largest, image_smallest, image_k, image_k_val, image_err, sigma, comp] = SVD(image)

% Get eigenimage corresponding to smallest singular value
[U, S, V] = svds(image, 1, 'smallest');
image_smallest = U * S * V';

% Get eigenimage corresponding to largest singular value
[U, S, V] = svds(image, 1);
image_largest =  U * S * V';


% Get another eigenimage
k_max = length(image);
k = round(k_max / 4);
[U, S, V] = svds(image, k);
image_k = U * S * V';
image_k_val = k;

% Calculate relative error
image_err = zeros(k_max / 5, 1);
i = 1;
for k = 1:5:k_max
    [U, S, V] = svds(image, k);
    image_k = U * S * V';
    image_err(i) = norm(image_k - image) / norm(image); 
    i = i + 1;
end

sigma = diag(S);

end