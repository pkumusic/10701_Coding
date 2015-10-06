function [train, test] = load_data(binary_digits, varargin)
  % Load the training data
  X=load_mnist_images('data/train-images-idx3-ubyte');
  y=load_mnist_labels('data/train-labels-idx1-ubyte')';

  if (binary_digits)
    % Take only pos and neg
    pos = varargin{1};
    neg = varargin{2};
    X = [ X(:,y==pos), X(:,y==neg) ];
    y = [ y(y==pos), y(y==neg) ];
    y = (y == pos);
  end

  % Randomly shuffle the data
  I = randperm(length(y));
  y=y(I); % labels in range 1 to 10
  X=X(:,I);

  % We standardize the data so that each pixel will have roughly zero mean and unit variance.
  s=std(X,[],2);
  m=mean(X,2);
  X=bsxfun(@minus, X, m);
  X=bsxfun(@rdivide, X, s+.1);

  % Place these in the training set
  train.X = X;
  train.y = y;

  % Load the testing data
  X=load_mnist_images('data/t10k-images-idx3-ubyte');
  y=load_mnist_labels('data/t10k-labels-idx1-ubyte')';

  if (binary_digits)
    % Take only the pos and neg
    pos = varargin{1};
    neg = varargin{2};
    X = [ X(:,y==pos), X(:,y==neg) ];
    y = [ y(y==pos), y(y==neg) ];
    y = (y == pos);
  end

  % Randomly shuffle the data
  I = randperm(length(y));
  y=y(I); % labels in range 1 to 10
  X=X(:,I);

  % Standardize using the same mean and scale as the training data.
  X=bsxfun(@minus, X, m);
  X=bsxfun(@rdivide, X, s+.1);

  % Place these in the testing set
  test.X=X;
  test.y=y;

