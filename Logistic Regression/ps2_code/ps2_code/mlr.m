addpath helper

binary_lr = false;
[train,test] = load_train_test(binary_lr);

% Add row of 1s to the dataset to act as an intercept term.
train.X = [ones(1,size(train.X,2)); train.X];
test.X = [ones(1,size(test.X,2)); test.X];

train.y = train.y + 1; % make labels 1-based.
test.y = test.y + 1; % make labels 1-based.
c = length(unique(train.y)); % number of classes
W = rand(size(train.X,1),c) * 1e-3;

% Train
W = optimize_mlr(W, train.X, train.y);

% Print out training accuracy.
accuracy = multiclass_accuracy(W, train.X, train.y);
fprintf('Training accuracy: %6.4f%%\n', 100*accuracy);

% Print out accuracy on the test set.
accuracy = multiclass_accuracy(W, test.X, test.y);
fprintf('Test accuracy: %6.4f%%\n', 100*accuracy);

% Display weights
display_network(W(2:end,:),true,true,5);
