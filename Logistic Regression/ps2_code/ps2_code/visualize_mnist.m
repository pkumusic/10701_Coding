addpath helper

images = load_mnist_images('data/train-images-idx3-ubyte');
labels = load_mnist_labels('data/train-labels-idx1-ubyte');
display_network(images(:,1:100)); % print first 100 images

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Explore the data
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
