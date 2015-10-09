addpath helper

%images = load_mnist_images('data/train-images-idx3-ubyte');
%labels = load_mnist_labels('data/train-labels-idx1-ubyte');
%display_network(images(:,1:100)); % print first 100 images

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Explore the data
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Number of pixels in a image (size of each image) --> 28*28 = 784
num_pixels = size(images, 1);


%% Show the range of labels. --> 0-9
range_labels = unique(labels);

%% Range of pixel values. --> [0,1]
range_pixel = range(images);

%% Maximum and minimum l2-norm of the images --> Max= 17.179; Min = 3.5698
max_l2 = max(sqrt(sum((images .* images),1)));
min_l2 = min(sqrt(sum((images .* images),1)));

%% Sparse or dense data  density = #nonzero/ total elements. 
% Density = 0.19, Which indicate that the data is sparse.
density = nnz(images)/numel(images);

%% whether the label distribution is skewed or uniform. 
% The distribution is uniform from the histogram.
hist(labels);


