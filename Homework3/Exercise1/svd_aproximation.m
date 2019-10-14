%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      SVD for matrix approximation and image compression
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;

%reading a grayscale image
A = imread('cameraman.tif');
[M,N] = size(A);
A = im2double(A);

%displaying image
figure('Name','Original Image','NumberTitle','off');
imagesc(A);
colormap gray;

%computing the Singular Value Decomposition of the image matrix A 
[U, S, V] = svd(A);
S_vector = svd(A);

%ploting the singular values
figure(2);
plot(S_vector,'r:*')

%approximating the matrix A with the matrix Ak 
%obtained by summing the k components of
%rank one associated with the largest singular values
k = 15;
A_k = 0;
k_vector = zeros(k,1);
err_vector = zeros(k,1);
compression_factor_vector = zeros(k,1);
for i = 1 : k
    A_k = A_k + U(:,i) * V(:,i)' *  S_vector(i);
    k_vector(i,1) = i;
    err_vector(i,1) = norm(A-A_k, 'fro') / norm(A, 'fro');
    compression_factor_vector(i,1) = i * (1/M + 1/N);
end
 
%Displaying the matrix Ak
figure('Name','Aproximated matrix (using largest singural values)','NumberTitle','off');
imagesc(A_k);
colormap gray;

%approximating the matrix A with the matrix A˜k
%obtained by summing the k components of
%rank 1 associated to the k smallest singular values
k__vector = zeros(k,1);
err__vector = zeros(k,1);

A__k = 0;
format longe
for i = 1 : k
    A__k = A__k + U(:,M-i+1) * V(:,M-i+1)' *  S_vector(M-i+1);
    k__vector(i,1) = i;
    err__vector(i,1) = norm(A-A__k, 'fro') / norm(A, 'fro');
    
end

%displaying A__k
figure('Name','Aproximated matrix (using smallest singural values)','NumberTitle','off');
imagesc(A__k);
colormap gray;

%Computing the relative error in the Frobenius norm 
%bewteen the exact and the approximated image.
%plotting:
figure(5);
subplot(2,2,1);
plot(k_vector, err_vector);
title('relative error in descreased case');
subplot(2,2,2);
plot(k__vector, err__vector);
title('relative error in inscreased case');

%computing the compression factor for an image of size m × n:
%plotting:
subplot(2,2,3);
plot(k_vector, compression_factor_vector);
title('compression factor');



