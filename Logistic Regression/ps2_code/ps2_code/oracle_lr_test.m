addpath helper

binary_lr = true;                                                                    
[train,test] = load_train_test(binary_lr, 3, 8); % load only 3s and 8s

% Gradient check at 10 random points
num = 10;
err = zeros(num,1);
for i = 1:num
  w = rand(size(train.X,1),1) * 1e-3;
  err(i) = grad_check(@oracle_lr, w, train.X(:,1:1000), train.y(1:1000));
end

err
if mean(err) < 1e-6
  fprintf('Pass!\n');
else
  fprintf('Fail\n');
end
