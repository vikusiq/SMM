%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Image Classification with SVD
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% classification problem with nr_of_classes classes. All the images must have the same size m × n)
% Divide all the images in n classes and order them in different nr_of_classes directories.
% Split all the nr_of_classes directories in training test and test set. (Tips: Training set of different classes
% must have the same dimension. Test set of different classes must have the same dimension).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% constructing the design tensor (3D-matrix) A for each of the nr_of_classes directories, 
% taking all the images from the training set.

clear;
clc;
np = 20; 
for k=1:np
    t=1;
    for image in training_set(k)
        [m,n]=size(image)
        A(:,t,k)=double(reshape(image,[m*n,1]));
        t=t+1;
    end
end
