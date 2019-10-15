%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Image Classification with SVD
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% classification problem with np classes. All the images must have the same size m � n)
% Divide all the images in n classes and order them in different np directories.
% Split all the np directories in training test and test set. (Tips: Training set of different classes
% must have the same dimension. Test set of different classes must have the same dimension).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% designing tensor (3D-matrix) A for each of the np directories
% by taking all the images from the training set (50 of 72 ~> 70%)

clear;
clc;
np = 20;    % number of classes
images_per_class = 72; 
nr_train = 50;
nr_test = images_per_class - nr_train;

directory_path = "D:\SMM_repo\SMM\Homework3\Exercise3\coil20";
for class = 1 : np
    class_path = join([directory_path, int2str(class)], '\');
    training_img_counter=1;
    % building tensor A for training images
    for image = 1 : 50
        % reading image
        image_path = join([class_path, int2str(image)], '\');
        image_path = join([image_path,".png"], '');        
        img = imread(image_path);
        [m,n] = size(img);        
        A(:,training_img_counter,class)=double(reshape(img,[m*n,1]));        
        training_img_counter=training_img_counter+1;
    end
    % building tensor T for test images
    test_img_counter=1;
    for image = 51 : 72
        % reading image
        image_path = join([class_path, int2str(image)], '\');
        image_path = join([image_path,".png"], '');        
        img = imread(image_path);
        [m,n] = size(img);        
        T(:,test_img_counter,class)=double(reshape(img,[m*n,1]));        
        test_img_counter=test_img_counter+1;
    end
    
    % computing the SVD for each of the np matrices A(:, :, k) and store the matrices Uk
    [Uk, Sk, Vk] = svd(A(:,:,class), 0); % using "economy size"
    U(:,:,class) = Uk;
   
end

% For i = 1 . . . np construct the projections �zi of the previous vector over 
% the np vector spaces genereted by the column vectors of the np matrices Uk. 
% Classify z as a member of the class P where norm(z ? z�P ) is the minimum values. 
% (Tips: use the Orthogonal Decomposition Theorem to compute the projections).
results = zeros(nr_test, np);  % ou==
for class = 1 : np
    for test_image = 1 : nr_test
        z = T(:,test_image,class);              % retrieving the test image from Tensor T
        z_proj = U(:,:,1) * (U(:,:,1)' * z);    % assuming that that class has the minimum norm 
        min_norm = norm(z - z_proj);
        detected_class = 1;
        for u = 2 : np
            z_proj =  U(:,:,u) * (U(:,:,u)' * z);
            norm_z = norm(z - z_proj);
            if(norm_z < min_norm)
                min_norm = norm_z; 
                detected_class = u;
            end
        end
        results(test_image, class) = detected_class;
        
    end 
end
results











