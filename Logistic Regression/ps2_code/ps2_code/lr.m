addpath helper

binary_lr = true;                                                                    
[train,test] = load_train_test(binary_lr, 3, 8); % load only 3s and 8s

% Add row of 1s to the dataset to act as an intercept term.
train.X = [ones(1,size(train.X,2)); train.X];
test.X = [ones(1,size(test.X,2)); test.X];

% Initialize
w0 = rand(size(train.X,1),1) * 1e-3; % (d+1) x 1

% Train
w = optimize_lr(w0, train.X, train.y);

% Print out training accuracy.
accuracy = binary_accuracy(w, train.X, train.y);
fprintf('Training accuracy: %6.4f%%\n', 100*accuracy);

% Print out accuracy on the test set.
accuracy = binary_accuracy(w, test.X, test.y);
fprintf('Test accuracy: %6.4f%%\n', 100*accuracy);
